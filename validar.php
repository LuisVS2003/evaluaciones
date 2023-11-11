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

</head>

<body>
    <div class="container">
        <div class="row justify-content-md-center" style="margin-top:15%;">
          <div class="container">

          </div>
          <form action="#" class="col-12" method="POST" id="form-rest">
              <h2>Verificar Correo - Token</h2>
              <div class="row">
                  <div class="col-md-6 mb-3">
                      <label for="correo" class="form-label">Email</label>
                      <input type="email" class="form-control" id="correo" name="correo" required>
                  </div>
                  <div class="col-md-6 mb-3">
                      <label for="token" class="form-label">Token</label>
                      <input type="text" class="form-control" id="token" name="email" placeholder="El token se le envio al correo" required>
                  </div>

                  <button type="submit" class="btn btn-success" id="submit">Validar</button>
                  
                </div>

          </form>
          <form action="" class="col-12" id="form-enviar">
            <div class="row" id="cambiarpass">
                
            </div>
          </form>
            
        </div>
    </div>
    

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

  <!--Fuciones de SweetAlert-->
  <script src="javascript/sweetalert.js"></script>


  <script>
    document.addEventListener("DOMContentLoaded",()=>{
      const div = document.querySelector("#cambiarpass")

      function $(id){
        return document.querySelector(id);
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
              console.log(data)
              notificar('success','Encontrado','Registro encontrado en la base de datos',2);

              //Bloqueo lo Input para que no los pueda cambiar
              $("#correo").setAttribute("readonly", "true");
              $("#token").setAttribute("readonly", "true");


              //Yo pense en hacer una renderizacion 
              nuevaContraseña = `
                <label for="cambiarpass">Nueva Contraseña:</label>
                <input type="text" class="form-control" id="claveacceso" placeholder="COLOCA UN PASSWORD SUPER SECRETO">
                <button type="click" class="btn btn-primary mt-3" id="cambiarpass">Cambair Contraseña</button>
                `;
              div.innerHTML += nuevaContraseña;

               // Ocultar el botón de "Validar"
               $("#submit").style.display = "none";

            }else{
              notificar('warning','No se encontro','No encontrado en la base de datos',2)
            }
          })
          .catch(e =>{
            console.error(e);
          })
        
      }

      function CambiarPass(){
        const parametros = new FormData();
        parametros.append("operacion","cambiarpass");
        parametros.append("correo",$("#correo").value);
        parametros.append("token",$("#token").value);
        parametros.append("claveacceso",$("#claveacceso").value);

        fetch("./controllers/reset.controller.php",{
          method: "POST",
          body: parametros
        })
          .then(respuesta =>respuesta.json())
          .then(data =>{
            console.log(data);
          })
          .catch(e =>{
            console.error(e);
          })
      }

      $("#form-rest").addEventListener("submit", (event) => {
        event.preventDefault();
        ValidarTokens();
      });

      $("#form-enviar").addEventListener("submit", (event) => {
        event.preventDefault();
        CambiarPass();
        notificar('info','Cambiaste tu contraseña','Ahora ya puedes hacer Login, !Existo¡',3);
        setTimeout(function(){
          window.location.href = 'index.php';
        },3000);
      });



      



    });

  </script>

</body>

</html>
