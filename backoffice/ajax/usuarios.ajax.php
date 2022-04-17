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
		$valorSuscripcion = ControladorGeneral::ctrValorSuscripcion();

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

				/*=============================================
				CREAR EL PLAN DE PAGOS CON LA API DE PAYPAL
				=============================================*/

				$curl3 = curl_init();

				curl_setopt_array($curl3, array(
				  CURLOPT_URL => 'https://api-m.sandbox.paypal.com/v1/billing/plans',
				  CURLOPT_RETURNTRANSFER => true,
				  CURLOPT_ENCODING => '',
				  CURLOPT_MAXREDIRS => 10,
				  CURLOPT_TIMEOUT => 30,
				  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
				  CURLOPT_CUSTOMREQUEST => 'POST',
				  CURLOPT_POSTFIELDS =>'{
				  "product_id": "'.$idProducto.'",
				  "name": "Suscripción mensual a Cashtrap",
				  "description": "Plan de pago mensual a Cashtrap",
				  "status": "ACTIVE",
				  "billing_cycles": [
				    {
				      "frequency": {
				        "interval_unit": "MONTH",
				        "interval_count": 1
				      },
				      "tenure_type": "REGULAR",
				      "sequence": 1,
				      "total_cycles": 99,
				      "pricing_scheme": {
				        "fixed_price": {
				          "value": "'.$valorSuscripcion.'",
				          "currency_code": "USD"
				        }
				      }
				    }
				  ],
				  "payment_preferences": {
				    "auto_bill_outstanding": true,
				    "setup_fee": {
				      "value": "'.$valorSuscripcion.'",
				      "currency_code": "USD"
				    },
				    "setup_fee_failure_action": "CONTINUE",
				    "payment_failure_threshold": 3
				  },
				  "taxes": {
				    "percentage": "0",
				    "inclusive": false
				  }
				}',
				  CURLOPT_HTTPHEADER => array(
				    'Authorization: Bearer '.$token,
				    'cache-control: no-cache',
				    'Content-Type: application/json'
				  ),
				));

				$response = curl_exec($curl3);
				$err = curl_error($curl3);

				curl_close($curl3);

				if ($err){
					echo "cURL Error #:" . $err;
				} else {

					$respuesta3 = json_decode($response, true);

					$idPlan = $respuesta3["id"];

					echo $idPlan;

				}
				
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

