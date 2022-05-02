<div class="ladoUsuarios">

	<div class="container-fluid">
		
		<div class="row">
			
			<div class="col-12 col-lg-4 formulario">

				<figure class="p-2 p-sm-5 p-lg-4 p-xl-5 text-center">
				
					<a href="<?php echo $ruta; ?>inicio"><img src="img/logo-positivo.png" class="img-fluid"></a>

					<div class="d-flex justify-content-center">
					
						<h4>Ingreso al sistema</h4>

					</div>

					<form method="post" class="mt-3 px-4">

						<p class="text-center py-3">El futuro pertenece a aquellos que creen en la belleza de sus sueños.</p>

						<input type="email" class="form-control my-3 py-3" placeholder="Correo Electrónico" name="ingresoEmail" required>

						<input type="password" class="form-control my-3 py-3" placeholder="Contraseña" name="ingresoPassword" required>

						<?php 

							$ingreso = new ControladorUsuarios();
							$ingreso -> ctrIngresoUsuario();

						?>

						<input type="submit" class="form-control my-3 py-3 btn btn-info" value="Ingresar">

						<p class="text-center pt-1">¿Aún no tienes una cuenta? <a href="<?php echo $ruta; ?>registro">Regístrate</a></p>

						<p class="text-center pt-1"><a href="<?php echo $ruta; ?>ingreso">¿Olvidó su contraseña?</a></p>

					</form>

				</figure>

			</div>

			<div class="col-12 col-lg-8 fotoIngreso text-center">		

				<a href="<?php echo $ruta; ?>inicio"><button class="d-none d-lg-block text-center btn btn-default btn-lg my-3 text-white btnRegresar">Regresar</button></a>

				<a href="<?php echo $ruta; ?>inicio"><button class="d-block d-lg-none text-center btn btn-default btn-lg btn-block my-3 text-white btnRegresarMovil">Regresar</button></a>

				<ul class="p-0 m-0 py-4 d-flex justify-content-center redesSociales">

					<li>
						<a href="https://youtu.be/DgjCGq3S_is" target="_blank"><i class="fab fa-youtube lead text-white mx-4"></i></a>
					</li>

					<li>
						<a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f lead text-white mx-4"></i></a>
					</li>

					<li>
						<a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram lead text-white mx-4"></i></a>
					</li>	

					
					<li>
						<a href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin lead text-white mx-4"></i></a>
					</li>

					<li>
						<a href="https://www.twitter.com/" target="_blank"><i class="fab fa-twitter lead text-white mx-4"></i></a>
					</li>

				</ul>

			</div>

		</div>

	</div>

</div>

<!--=====================================
VENTANA MODAL RECUPERAR CONTRASEÑA
======================================-->

<div class="modal" id="modalRecuperarPassword">
	
	<div class="modal-dialog">

	    <div class="modal-content">

	    	<div class="modal-header bg-info text-white">

		        <h4 class="modal-title">Recuperar contraseña</h4>

		        <button type="button" class="close text-white" data-dismiss="modal">&times;</button>

		    </div>

			 <div class="modal-body">
			 	
				<form method="post">

					<p class="text-muted">Escriba su correo electrónico con el que está registrado y allí le enviaremos una nueva contraseña:</p>

					<div class="input-group mb-3">
						
						<div class="input-group-prepend">

					      <span class="input-group-text">
					      	
					      	<i class="far fa-envelope"></i>

					      </span>

					    </div>

					    <input type="email" class="form-control" placeholder="Email" name="emailRecuperarPassword" required>

					</div>

					<input type="submit" class="btn btn-dark btn-block" value="Enviar">

					<?php

						$recuperarPassword = new ControladorUsuarios();
						$recuperarPassword -> ctrRecuperarPassword();

					?>

				</form>

			 </div>

	    </div>

    </div>

</div>