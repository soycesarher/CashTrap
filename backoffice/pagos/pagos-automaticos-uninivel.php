<?php 

/*=============================================
VISTAS
=============================================*/

date_default_timezone_set('America/Mexico_City');

$usuarios = ControladorPagos::ctrMostrarusuarios(null, null);

$fechaActual = date('Y-m-d');

foreach ($usuarios as $key => $value) {

	$fechaDiaDespues = strtotime( '+1 day', strtotime ($value["vencimiento"]));
	$fechaDiaDespues = date ( 'Y-m-d', $fechaDiaDespues);
	
	if($fechaDiaDespues == $fechaActual){

		pagarUsuario($value["id_usuario"], $value["enlace_afiliado"], $value["paypal"], $value["vencimiento"], $fechaActual, $value["id_suscripcion"], $value["patrocinador"]);

	}

}

/*=============================================
FUNCIÓN PARA PAGAR A CADA USUARIO POR SEPARADO
=============================================*/

function pagarUsuario($id_usuario, $enlace_afiliado, $paypal, $vencimiento, $fechaActual, $id_suscripcion, $patrocinador){
	
	$red = ControladorPagos::ctrMostrarUsuarioRed("red_uninivel", "patrocinador_red", $enlace_afiliado);
	
	$periodo_comision = 0;
	$periodo_venta = 0;

	foreach ($red as $key => $value) {

		$periodo_comision += $value["periodo_comision"];
		$periodo_venta += $value["periodo_venta"];
		
	}
	
	if($enlace_afiliado != "cashtrap-afiliado" && $periodo_comision != 0){

		/*=============================================
		CREAR EL ACCESS TOKEN CON EL API DE PAYPAL
		=============================================*/

		$curl1 = curl_init();

		curl_setopt_array($curl1, array(
		  CURLOPT_URL => 'https://api-m.sandbox.paypal.com/v1/oauth2/token',
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => '',
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 300,
		  CURLOPT_FOLLOWLOCATION => true,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => 'POST',
		  CURLOPT_POSTFIELDS => 'grant_type=client_credentials',
		  CURLOPT_HTTPHEADER => array(
		    'Authorization: Basic QVlVU2U1SEN0NUk2dV9DOGhFaU4ydThPWmRTMHp0bndiMjItcWs4MXFmNWVYOWNCdjlJNFlYSzBMMkdkc3ZqcklTY1dnMURTNHgybE9wZjA6RUdPcDBlVzN5THYxNUxFeC10NllxZkFqU2FpR0xOZjVBZ2hBdjdGT2VXNkxuazc1WUdVcEJtS3ZMMUFtWXAwRFQyd182bl8tcnRpaTR0V0Q=',
		    'content-Type: application/x-www-form-urlencoded'
		  ),
		));

		$response = curl_exec($curl1);
		$err = curl_error($curl1);

		curl_close($curl1);

		if ($err){

			echo "cURL Error #:" . $err;

		} else {

			$respuesta1 = json_decode($response, true);

			$token = $respuesta1["access_token"];
			//echo '<pre>'; print_r($token); echo '</pre>';

			$curl2 = curl_init();

			$aleatorio = rand(0, 9999);

			curl_setopt_array($curl2, array(
			  CURLOPT_URL => 'https://api-m.sandbox.paypal.com/v1/payments/payouts',
			  CURLOPT_RETURNTRANSFER => true,
			  CURLOPT_ENCODING => '',
			  CURLOPT_MAXREDIRS => 10,
			  CURLOPT_TIMEOUT => 300,
			  CURLOPT_FOLLOWLOCATION => true,
			  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			  CURLOPT_CUSTOMREQUEST => 'POST',
			  CURLOPT_POSTFIELDS =>'{
			  "sender_batch_header": {
			    "sender_batch_id": "Payouts_'.$aleatorio.'_'.$enlace_afiliado.'_'.$fechaActual.'",
			    "email_subject": "Tienes un pago de CashTrap!",
			    "email_message": "Has recibido un pago de CashTrap! Gracias por usar nuestros servicios!"
			  },
			  "items": [
			    {
			      "recipient_type": "EMAIL",
			      "amount": {
			        "value": "'.$periodo_comision.'",
			        "currency": "USD"
			      },
			      "note": "POSPYO001",
			      "sender_item_id": "Payouts_'.$aleatorio.'_'.$enlace_afiliado.'_'.$fechaActual.'",
			      "receiver": "'.$paypal.'"
			    }
			  ]
			}',
			  CURLOPT_HTTPHEADER => array(
			    'Content-Type: application/json',
			    'Authorization: Bearer '.$token
			  ),
			));

			$response = curl_exec($curl2);
			$err = curl_error($curl2);

			curl_close($curl2);

			if ($err){

				echo "cURL Error #:" . $err;

			} else {

				$respuesta2 = json_decode($response, true);

				$idPayout = $respuesta2["batch_header"]["payout_batch_id"];

				$tabla = "pagos_uninivel";

				$fechaInicial = strtotime('-1 month', strtotime($vencimiento)); 
				$fechaInicial = date( 'Y-m-d', $fechaInicial);

				$datos = array("id_pago_paypal" => $idPayout,
							   "usuario_pago" => $id_usuario,
							   "periodo" => $fechaInicial." a ".$vencimiento,
							   "periodo_comision" => $periodo_comision,
							   "periodo_venta" => $periodo_venta);	
				
				$pagos = ControladorPagos::ctrIngresarPagos($tabla, $datos);
				echo '<pre>'; print_r($pagos); echo '</pre>';
			}
			
		}

	}

}


/*=============================================
CONTROLADORES
=============================================*/
Class ControladorPagos{

	/*=============================================
	Mostrar Usuarios
	=============================================*/

	static public function ctrMostrarUsuarios($item, $valor){

		$tabla = "usuarios";

		$respuesta = ModeloPagos::mdlMostrarUsuarios($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	MOSTRAR USUARIO RED
	=============================================*/

	static public function ctrMostrarUsuarioRed($tabla, $item, $valor){

		$respuesta = ModeloPagos::mdlMostrarUsuarioRed($tabla, $item, $valor);

		return $respuesta;

	}

	/*=============================================
	REGISTRO PAGOS RED
	=============================================*/

	static public function ctrIngresarPagos($tabla, $datos){

		$respuesta = ModeloPagos::mdlIngresarPagos($tabla, $datos);

		return $respuesta;

	}

}


/*=============================================
MODELOS
=============================================*/
class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=localhost;dbname=cashtrap",
			            "root",
			            "");

		$link->exec("set names utf8");

		return $link;

	}

}

class ModeloPagos{

	/*=============================================
	MOSTRAR USUARIO
	=============================================*/

	static public function mdlMostrarUsuarios($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	MOSTRAR USUARIO RED
	=============================================*/

	static public function mdlMostrarUsuarioRed($tabla, $item, $valor){

		if($item != null && $valor != null){

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla WHERE $item = :$item");

			$stmt -> bindParam(":".$item, $valor, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();

		}else{

			$stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt-> close();

		$stmt = null;

	}

	/*=============================================
	INGRESAR PAGO
	=============================================*/

	static public function mdlIngresarPagos($tabla, $datos){

		$stmt = Conexion::conectar()->prepare("INSERT INTO $tabla (id_pago_paypal, usuario_pago, periodo, periodo_comision,  periodo_venta) VALUES (:id_pago_paypal, :usuario_pago, :periodo,  :periodo_comision, :periodo_venta)");

		$stmt -> bindParam(":id_pago_paypal", $datos["id_pago_paypal"], PDO::PARAM_STR);
		$stmt -> bindParam(":usuario_pago", $datos["usuario_pago"], PDO::PARAM_STR);
		$stmt -> bindParam(":periodo", $datos["periodo"], PDO::PARAM_STR);
		$stmt -> bindParam(":periodo_comision", $datos["periodo_comision"], PDO::PARAM_STR);
		$stmt -> bindParam(":periodo_venta", $datos["periodo_venta"], PDO::PARAM_STR);

		if($stmt -> execute()){

			return "ok";

		}else{

			echo "\nPDO::errorInfo():\n";
    		print_r(Conexion::conectar()->errorInfo());

		}

		$stmt-> close();

		$stmt = null;

	}

}

	//echo '<pre>'; print_r($value["nombre"]); echo '</pre>';