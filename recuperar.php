<!DOCTYPE html>
<html lang="es">

<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <link rel="stylesheet" href="./css/styles.css">

</head>

<body>

  <div class="login-container">
    <div class="login-form-container">
      <div class="login-form-header">
        <h2>Recuperar Contraseña</h2>
      </div>
      <form id="form-rest">
        <div class="input-group">
          <label for="correo">Correo Electrónico</label>
          <input type="email" id="correo" name="email" placeholder="Ingresa tu correo electrónico" required>
        </div>
        <button type="submit" id="submit">Enviar Verificación</button>
      </form>
      <form id="form-cambiar">
        <div class="input-group" id="ingresartoken">
          <!--Hacemos una renderización-->
        </div>
      </form>
      <form action="" id="form-cambiarpass">
        <div class="input-group" id="cambiarpass">
          <!--Haremos la renderización para cambiar la contraseña-->
        </div>
      </form>
      <div class="additional-options">
        <a href="index.php">Volver al inicio de sesión</a>
      </div>
    </div>
    <div class="login-image-container">
      <div class="login-image-text">
        <h1>Recuperar Cuenta</h1>
        <p>Recuperar tu cuenta con unos simples pasos, verifica tu correo.</p>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

  <!-- Funciones de SweetAlert -->
  <script src="javascript/sweetalert.js"></script>

  <script>
    document.addEventListener("DOMContentLoaded", () => {

      const div = document.querySelector("#ingresartoken");
      const div2 = document.querySelector("#cambiarpass");
      const boton = document.querySelector("#submit");

      function $(id) {
        return document.querySelector(id);
      }

      function buscarCorreo() {
        const correo = $("#correo").value;

        const parametros = new FormData();
        parametros.append("operacion", "buscarCorreo");
        parametros.append("correo", correo)

        fetch("./controllers/reset.controller.php", {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(data => {
            if (data.idusuario > 0) {
              notificar('success', 'Se encontro el Correo', `Por favor verificar el token en su correo: ${data.correo}`, 3);
              registraTokens();
              $("#correo").setAttribute("readonly", "true");

              ingresarToken = `
                <label for="token">Clave de Verificacion</label>
                <input type="text" id="token" name="token" placeholder="Ingresa tu token" maxlength="6">
                <div class="button-container">
                  <button type="button" id="validartoken" class="mt-3">Validar Token</button>
                  <button type="button" id="reenviartoken" class="mt-3">Reenviar Token</button>
                </div>
              `;
              div.innerHTML = ingresarToken;
              boton.innerHTML = "Validar Token";

              $("#submit").style.display = "none";

              // Agregar evento click al botón "Reenviar Token"
              $("#reenviartoken").addEventListener("click", () => {
                notificar('info', 'Reenviando Token', 'Se ha reenviado el token al correo', 2);
                registraTokens(); // Vuelve a enviar el token
              });

              // Agregar evento click al botón "Validar Token"
              $("#validartoken").addEventListener("click", (event) => {
                event.preventDefault();
                ValidarTokens();
              });

            } else {
              notificar('error', 'No encontrado', 'El correo no se encuentra registrado', 2);
              $("#form-rest").reset();
            }

          })
          .catch(e => {
            console.error(e);
          });
      }

      function registraTokens() {
        const correo = $("#correo").value;

        const parametros = new FormData();
        parametros.append("operacion", "registrartoken");
        parametros.append("correo", correo);

        fetch("./include/EnviarTokens.php", {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(data => {

          })
          .catch(e => {
            console.error(e);
          });
      }

      function ValidarTokens(){

            const parametros = new FormData();
            parametros.append("operacion","buscarToken");
            parametros.append("correo",$("#correo").value);
            parametros.append("token",$("#token").value);

            fetch("./controllers/reset.controller.php",{
            method: "POST",
            body: parametros
            })
            .then(respuesta =>respuesta.json())
            .then(data =>{
                if(data.length > 0){

                // Verificar la expiración del token
                const fechaTokenString = data[0].fechatoken;
                const fechaToken = new Date(fechaTokenString);
                const ahora = new Date();
                const tiempoExpiracion = 3 * 60 * 1000; // 1 minuto en milisegundos

                    // Calcular la diferencia en milisegundos
                const diferenciaTiempo = ahora - fechaToken;

                if(diferenciaTiempo > tiempoExpiracion){
                    // El token ha expirado
                    notificar('warning','Token expirado','El token ha expirado',2);
                }else{
                    $("#token").setAttribute("readonly", "true");
                    //console.log(data)
                    notificar('success','Encontrado','Registro encontrado en la base de datos',2);

                    //Yo pense en hacer una renderizacion 
                    nuevaContraseña = `
                    <label for="claveacceso">Nueva Contraseña</label>
                    <input type="password" id="claveacceso" name="claveacceso" placeholder="Ingrese su nueva clave" required>
                    <button type="submit" id="cambiarpass" class="mt-3">Cambiar Contraseña</button>
                    `;
                    div2.innerHTML += nuevaContraseña;

                    // Ocultar el botón de "Validar"
                    $("#validartoken").style.display = "none";
                    $("#reenviartoken").style.display = "none";

                }
                }else{
                notificar('warning','No se encontro','No encontrado en la base de datos',2)
                }
            })
            .catch(e =>{
                console.error(e);
            })
      }

      function CambiarPass() {
        const parametros = new FormData();
        parametros.append("operacion", "cambiarpass");
        parametros.append("correo", $("#correo").value);
        parametros.append("token", $("#token").value);
        parametros.append("claveacceso", $("#claveacceso").value);

        fetch("./controllers/reset.controller.php", {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(data => {
            //console.log(data);
          })
          .catch(e => {
            console.error(e);
          })
      }

      $("#form-rest").addEventListener("submit", (event) => {
        event.preventDefault();
        buscarCorreo();
      });
      $("#form-cambiarpass").addEventListener("submit", (event) => {
          event.preventDefault();
          CambiarPass();
          notificar('info','Cambiaste tu contraseña','Ahora ya puedes hacer Login',3);
          setTimeout(function(){
            window.location.href = 'index.php';
          },3000);
      });

    });

  </script>

</body>

</html>
