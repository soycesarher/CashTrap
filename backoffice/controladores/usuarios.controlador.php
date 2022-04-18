<?php

Class ControladorUsuarios{

	/*=============================================
	Registro de usuarios
	=============================================*/

	public function ctrRegistroUsuario(){

		if(isset($_POST["registroNombre"])){

			$ruta = ControladorRuta::ctrRuta();

			if(preg_match('/^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/', $_POST["registroNombre"]) &&
			   preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["registroEmail"]) &&
			    preg_match('/^[a-zA-Z0-9]+$/', $_POST["registroPassword"])){

				$encriptarEmail = md5($_POST["registroEmail"]);

				$tabla = "usuarios";
				$datos = array("perfil" => "usuario",
							   "nombre" => $_POST["registroNombre"],
							   "email" => $_POST["registroEmail"],
							   "password" => $_POST["registroPassword"],
							   "suscripcion" => 0,
							   "verificacion" => 0,
							   "email_encriptado" => $encriptarEmail,
							   "patrocinador" => $_POST["patrocinador"]); 

				$respuesta = ModeloUsuarios::mdlRegistroUsuario($tabla, $datos);

				if ($respuesta == "ok") {

					echo '<script>

						swal({
							    type:"success",
							    title: "¡SU CUENTA HA SIDO CREADA CORRECTAMENTE!",
							    text: "¡Por favor revise la bandeja de entrada o la carpeta de spam de su correo electrónico para verificar la cuenta!",
							    showConfirmButton: true,
							    confirmButtonText: "Cerrar"

							}).then(function(result){
							    
							    if(result.value){
							        
							        window.location = "'.$ruta.'ingreso"
							    
							    }
								
							});

					</script>';

				}

			}else{

				echo '<script>

						swal({
							    type:"error",
							    title: "¡Corregir!",
							    text: "¡No se permiten caracteres especiales en ninguno de los campos!",
							    showConfirmButton: true,
							    confirmButtonText: "Cerrar"

							}).then(function(result){
							    
							    if(result.value){
							        
							        history.back();
							    
							    }
								
							});

					</script>';

			}
		}
	}

	/*=============================================
	Ingreso Usuario
	=============================================*/

	public function ctrIngresoUsuario(){

		if(isset($_POST["ingresoEmail"])){

			 if(preg_match('/^[^0-9][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["ingresoEmail"]) && preg_match('/^[a-zA-Z0-9]+$/', $_POST["ingresoPassword"])){

			 	$tabla = "usuarios";
			 	$item = "email";
			 	$valor = $_POST["ingresoEmail"];
			 	$contrasena = $_POST["ingresoPassword"];

			 	$respuesta = ModeloUsuarios::mdlMostrarUsuarios($tabla, $item, $valor);

			 	if($respuesta["email"] == $_POST["ingresoEmail"] && $respuesta["password"] == $contrasena){

			 		if($respuesta["verificacion"] == 0){

			 			echo'<script>

							swal({
									type:"error",
								  	title: "¡ERROR!",
								  	text: "¡El correo electrónico aún no ha sido verificado, por favor revise la bandeja de entrada o la carpeta SPAM de su correo electrónico para verificar la cuenta, o contáctese con nuestro soporte a info@cashtrap.com!",
								  	showConfirmButton: true,
									confirmButtonText: "Cerrar"
								  
							}).then(function(result){

									if(result.value){   
									    history.back();
									  } 
							});

						</script>';

						return;

			 		}else{

			 			$_SESSION["validarSesion"] = "ok";
			 			$_SESSION["id"] = $respuesta["id_usuario"];

			 			$ruta = ControladorRuta::ctrRuta();

			 			echo '<script>
					
							window.location = "'.$ruta.'backoffice";				

						</script>';

			 		}

			 	}else{

			 		echo'<script>

						swal({
								type:"error",
							  	title: "¡ERROR!",
							  	text: "¡El email o contraseña no coinciden!",
							  	showConfirmButton: true,
								confirmButtonText: "Cerrar"
							  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';

			 	}


			 }else{

			 	echo '<script>

					swal({

						type:"error",
						title: "¡CORREGIR!",
						text: "¡No se permiten caracteres especiales en ninguno de los campos!",
						showConfirmButton: true,
						confirmButtonText: "Cerrar"

					}).then(function(result){

						if(result.value){

							history.back();

						}

					});	

				</script>';

			 }

		}

	}

	/*=============================================
	Mostrar Usuarios
	=============================================*/

	static public function ctrMostrarUsuarios($item, $valor){
	
		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlMostrarUsuarios($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	Actualizar Usuario
	=============================================*/

	static public function ctrActualizarUsuario($id, $item, $valor){

		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	Cambiar foto perfil
	=============================================*/

	public function ctrCambiarFotoPerfil(){

		if(isset($_POST["idUsuarioFoto"])){

			$ruta = $_POST["fotoActual"];

			if(isset($_FILES["cambiarImagen"]["tmp_name"]) && !empty($_FILES["cambiarImagen"]["tmp_name"])){

				list($ancho, $alto) = getimagesize($_FILES["cambiarImagen"]["tmp_name"]);

				$nuevoAncho = 500;
				$nuevoAlto = 500;

				/*=============================================
				CREAMOS EL DIRECTORIO DONDE VAMOS A GUARDAR LA FOTO DEL USUARIO
				=============================================*/

				$directorio = "vistas/img/usuarios/".$_POST["idUsuarioFoto"];

				/*=============================================
				PRIMERO PREGUNTAMOS SI EXISTE OTRA IMAGEN EN LA BD Y EL CARPETA
				=============================================*/

				if($ruta != ""){

					unlink($ruta);

				}else{

					if(!file_exists($directorio)){	

						mkdir($directorio, 0755);

					}

				}

				/*=============================================
				DE ACUERDO AL TIPO DE IMAGEN APLICAMOS LAS FUNCIONES POR DEFECTO DE PHP
				=============================================*/

				if($_FILES["cambiarImagen"]["type"] == "image/jpeg"){

					$aleatorio = mt_rand(100,999);

					$ruta = $directorio."/".$aleatorio.".jpg";

					$origen = imagecreatefromjpeg($_FILES["cambiarImagen"]["tmp_name"]);

					$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);

					imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);

					imagejpeg($destino, $ruta);	


				}else if($_FILES["cambiarImagen"]["type"] == "image/png"){

					$aleatorio = mt_rand(100,999);

					$ruta = $directorio."/".$aleatorio.".png";

					$origen = imagecreatefrompng($_FILES["cambiarImagen"]["tmp_name"]);	

					$destino = imagecreatetruecolor($nuevoAncho, $nuevoAlto);	

					imagealphablending($destino, FALSE);
		
					imagesavealpha($destino, TRUE);		

					imagecopyresized($destino, $origen, 0, 0, 0, 0, $nuevoAncho, $nuevoAlto, $ancho, $alto);		

					imagepng($destino, $ruta);

				}else{

					echo'<script>

						swal({
								type:"error",
							  	title: "¡CORREGIR!",
							  	text: "¡No se permiten formatos diferentes a JPG y/o PNG!",
							  	showConfirmButton: true,
								confirmButtonText: "Cerrar"
							  
						}).then(function(result){

								if(result.value){   
								    history.back();
								  } 
						});

					</script>';

				}
			
			}

			// final condicion

			$tabla = "usuarios";
			$id = $_POST["idUsuarioFoto"];
			$item = "foto";
			$valor = $ruta;

			$respuesta = ModeloUsuarios::mdlActualizarUsuario($tabla, $id, $item, $valor);

			if($respuesta == "ok"){

				echo '<script>

					swal({
						type:"success",
					  	title: "¡CORRECTO!",
					  	text: "¡La foto de perfil ha sido actualizada!",
					  	showConfirmButton: true,
						confirmButtonText: "Cerrar"
					  
					}).then(function(result){

							if(result.value){   
							    history.back();
							  } 
					});

				</script>';


			}

		}

	}

	/*=============================================
	Iniciar Suscripción
	=============================================*/

	static public function ctrIniciarSuscripcion($datos){

		$tabla = "usuarios";

		$respuesta = ModeloUsuarios::mdlIniciarSuscripcion($tabla, $datos);

		return $respuesta;

	}

	/*=============================================
	Cancelar Suscripción
	=============================================*/

	static public function ctrCancelarSuscripcion($valor){

		$tabla = "usuarios";

		$datos = array(	"id_usuario" => $valor,
						"suscripcion" => 0,
						"ciclo_pago" => null,
						"firma" => null,
						"fecha_contrato" => null);


		$respuesta = ModeloUsuarios::mdlCancelarSuscripcion($tabla, $datos);

		return $respuesta;

	}
	
	

}