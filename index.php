<?php
  session_start();

  if(isset($_SESSION["status"]) && $_SESSION["status"]){
    header("Location: ./views/index.php");
  }
?>

<!doctype html>
<html lang="es">

<head>
  <title>Iniciar Sesión</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Icono de la página -->
  <link rel="icon" type="image/png" href="./images/icon-web.png">

  <!-- SweetAlert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

  <link rel="stylesheet" href="./css/styles.css">



    <div class="login-container">
      <div class="login-form-container">
        <div class="login-form-header">
          <h2>Iniciar Sesión</h2>
        </div>
        <form id="frm-login">
          <div class="input-group">
            <label for="email">Correo</label>
            <input type="email" id="email" name="username" placeholder="Ingresa tu correo" required>
          </div>
          <div class="input-group">
            <label for="claveacceso">Contraseña</label>
            <input type="password" id="claveacceso" name="claveacceso" placeholder="Ingresa tu contraseña" required>
          </div>
          <button type="submit">Iniciar Sesión</button>
        </form>
        <div class="additional-options">
          <a href="recuperar.php">¿Olvidaste tu contraseña?</a>
          <span>|</span>
          <!--Por si queremos hacer que el usuarios se registres solo-->
          <!-- <a href="#">Registrarse</a> -->
        </div>
      </div>
      <div class="login-image-container">
          <div class="login-image-text">
            <h1>Sistema de Evaluaciones</h1>
            <p>¡Bienvenido al sistema de evaluaciones! Inicia sesión para continuar.</p>
          </div>
      </div>
  </div>

    <!--Alerta de bienvenida-->
    <script src="javascript/sweetalert.js"></script>

    <script>
      document.addEventListener("DOMContentLoaded",()=>{
        function $(id){
          return document.querySelector(id);
        }

        $("#frm-login").addEventListener("submit",(event)=>{
          event.preventDefault();
          login();
        });

        function login(){
          const parametros = new FormData();
          parametros.append("operacion","login");
          parametros.append("correo",$("#email").value);
          parametros.append("claveacceso",$("#claveacceso").value);

          fetch(`./controllers/usuario.controller.php`,{
            method: "POST",
            body: parametros
          })
            .then(respuesta => respuesta.json())
            .then(data =>{
              console.log(data)
              if(data.acceso == true){
                bienvenida(`¡Inicio de Sesión Exitoso!`);
                setTimeout(function(){
                  window.location.href = './views/index.php'
                },2000);               
              }else{
                //alert("Acceso denegado");
                notificar('error','Acceso denegado','Vuelva a intentarlo',2);
              }
              
            })
            .catch(e =>{
              console.error(e)
            });
        }


        



      });

    </script>
  



  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>