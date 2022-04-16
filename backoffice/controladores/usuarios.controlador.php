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

}