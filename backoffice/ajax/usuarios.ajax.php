<?php

require_once "../controladores/general.controlador.php";
require_once "../controladores/usuarios.controlador.php";
require_once "../modelos/usuarios.modelo.php";

class AjaxUsuarios{

	/*=============================================
	Validar email existente
	=============================================*/

	public $validarEmail;
	
	public function ajaxValidarEmail(){

		$item = "email";
		$valor = $this->validarEmail;

		$respuesta = ControladorUsuarios::ctrMostrarUsuarios($item, $valor);

		echo json_encode($respuesta);

	}

	/*=============================================
	Suscripcion con PayPal
	=============================================*/

	public $suscripcion;

	public function ajaxSuscripcion(){

		$ruta = ControladorGeneral::ctrRuta();

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
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => 'POST',
		  CURLOPT_POSTFIELDS => 'grant_type=client_credentials',
		  CURLOPT_HTTPHEADER => array(
		    'Authorization: Basic QVlVU2U1SEN0NUk2dV9DOGhFaU4ydThPWmRTMHp0bndiMjItcWs4MXFmNWVYOWNCdjlJNFlYSzBMMkdkc3ZqcklTY1dnMURTNHgybE9wZjA6RUdPcDBlVzN5THYxNUxFeC10NllxZkFqU2FpR0xOZjVBZ2hBdjdGT2VXNkxuazc1WUdVcEJtS3ZMMUFtWXAwRFQyd182bl8tcnRpaTR0V0Q=',
		    'cache-control: no-cache',
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

			/*=============================================
			CREAR EL PRODUCTO CON LA API DE PAYPAL
			=============================================*/
			
			$curl2 = curl_init();

			curl_setopt_array($curl2, array(
			  CURLOPT_URL => 'https://api-m.sandbox.paypal.com/v1/catalogs/products',
			  CURLOPT_RETURNTRANSFER => true,
			  CURLOPT_ENCODING => '',
			  CURLOPT_MAXREDIRS => 10,
			  CURLOPT_TIMEOUT => 30,
			  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			  CURLOPT_CUSTOMREQUEST => 'POST',
			  CURLOPT_POSTFIELDS =>'{
			  "name": "Cashtrap",
			  "description": "Educación en línea",
			  "type": "DIGITAL",
			  "category": "EDUCATIONAL_AND_TEXTBOOKS",
			  "image_url": "'.$ruta.'backoffice/vistas/img/plantilla/icono.png",
			  "home_url": "'.$ruta.'"
			}',
			  CURLOPT_HTTPHEADER => array(
			    'Authorization: Bearer '.$token,
			    'cache-control: no-cache',
			    'Content-Type: application/json',
			  ),
			));

			$response = curl_exec($curl2);
			$err = curl_error($curl2);

			curl_close($curl2);

			if ($err){
				echo "cURL Error #:" . $err;
			} else {

				$respuesta2 = json_decode($response, true);

				$idProducto = $respuesta2["id"];

				echo $idProducto;
			}

		}

	}

}

/*=============================================
Validar email existente
=============================================*/

if(isset($_POST["validarEmail"])){

	$valEmail = new AjaxUsuarios();
	$valEmail -> validarEmail = $_POST["validarEmail"];
	$valEmail -> ajaxValidarEmail();

}

/*=============================================
	Suscripcion con PayPal
=============================================*/

if(isset($_POST["suscripcion"]) && $_POST["suscripcion"] == "ok"){

	$paypal = new AjaxUsuarios();
	$paypal -> ajaxSuscripcion();

}

