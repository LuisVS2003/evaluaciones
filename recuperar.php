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
            <form action="#" class="col-3" method="POST" id="form-rest">
                <h2>Enviar codigo - Email</h2>
                <div class="mb-3">
                    <label for="correo" class="form-label">Email</label>
                    <input type="email" class="form-control" id="correo" name="correo">
                </div>

                <button type="submit" class="btn btn-primary" id="submit">Restablecer</button>
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
      function $(id){
        return document.querySelector(id);
      }
  
      function buscarCorreo(){
        const correo = $("#correo").value; // Obtener el valor del campo de correo

        const parametros = new FormData();
        parametros.append("operacion","buscarCorreo");
        parametros.append("correo",correo)

        fetch("./controllers/reset.controller.php",{
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(data =>{
            //console.log(data);
            /**
             *  data.usuario = 1 si se encontro el correo
             *  dara.usuario = 0 si no se encontro
             */
            if(data.idusuario > 0) {
              notificar('success','Se encontro el Correo',`Porfavor verificar el token en su  correo:${data.correo}`,3)
              registraTokens();
              $("#form-rest").reset()

            }else{
              notificar('error','No encontrado','El correo no se encuentra registrado',2);
              $("#form-rest").reset()
            }

          })
          .catch(e =>{
            console.error(e);
          });
      }
      
      function registraTokens(){
        const correo = $("#correo").value; // Obtener el valor del campo de correo electrónico

        const parametros = new FormData();
        parametros.append("operacion","registrartoken");
        parametros.append("correo",correo); // Enviar el valor del campo de correo

        fetch("./include/EnviarTokens.php", {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(data =>{
            /**
            console.log(`Status: Enviado<=Verificar Correo ${correo}`);
             * 
             */

            })
          .catch(e =>{
            console.error(e);
          });
      }

      //buscarCorreo();
      $("#form-rest").addEventListener("submit", (event) => {
          event.preventDefault();
          buscarCorreo();
          // mostrarPregunta("Recuperacion", "¿Está seguro de enviar el token de recuperacion?").then((result) => { 
          //   if (result.isConfirmed) {
          //     //notificar("success","Recuperacion", "Verificar su Correo", 3);
          //     $("#form-rest").reset()
          //   }
          // });
        });



    });

  </script>

</body>

</html>
