<?php
  session_start();

  if(isset($_SESSION["status"]) && $_SESSION["status"]){
    header("Location: ./views/index.php");
  }
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="./css/login.css">
    <!-- Icono de la página -->
    <link rel="icon" type="image/png" href="./images/icon-web.png">

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body>

  <section>
    <div class="signin">
      <div class="content">
        <h2>Iniciar Sesión</h2>
        <form class="form" id="frm-login" autocomplete="off">
          <div class="inputBx">
            <input type="email" id="email" name="username" placeholder="Ingresa tu correo" required>
          </div>
          <div class="inputBx">
            <input type="password" id="claveacceso" name="claveacceso" placeholder="Ingresa tu contraseña" required>
          </div>
          <div class="links">
              <a href="./recuperar.php">¿Olvido su contraseña?</a>
          </div> 
          <div class="inputBx">
            <input type="submit" value= "Iniciar Sesión">
          </div>
        </form>
      </div>
    </div>
  </section>

  <!--Alerta de bienvenida-->
  <script src="javascript/sweetalert.js"></script>

  <script>
      document.addEventListener("DOMContentLoaded",()=>{
        const $ = id => document.querySelector(id);
        // Crea 200 SPAN
        for(let i = 0 ; i < 200 ; i++){
          let caja = document.createElement('span');
          $("section").appendChild(caja);
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
                notificar('error','Acceso denegado','Vuelva a intentarlo',2);
              }
            })
            .catch(e => console.error(e));
        }
      });
    </script>
</body>

</html>