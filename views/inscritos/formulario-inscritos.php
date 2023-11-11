<!doctype html>
<html lang="es">

<head>
  <title>Registro</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>

<body>
  
<div class="container mt-3">
    <form action="" autocomplete="off" id="form-inscrito">
      <div class="card">
        <div class="card-header">
          <div>Registro de Inscritos</div>
        </div>
        <div class="card-body">
          <!-- CAMPO USUARIOS -->
          <div class="mb-3">
            <label for="usuario" class="form-label">Usuarios:</label>
            <select name="" id="usuario" class="form-select" required autofocus>
              <option value="">Seleccione:</option>
            </select>
          </div>
          
          
        </div> <!-- FIN DEL CARD - BODY-->
        <div class="card-footer text-end">
          <button class="btn btn-sm btn-primary" type="submit" id="guardar">Guardar registro</button>
        </div>
      </div> <!-- FIN DEL CARD -->
    </form> <!-- FIN DEL FORMULARIO-->
  </div> <!-- FIN DEL CONTAINER -->
  
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    document.addEventListener("DOMContentLoaded", () => {
      function $(id){
        return document.querySelector(id);
      }

      function getUser(){
        const parametros = new FormData();
        parametros.append("operacion", "listarUsuario");

        fetch(`../../controllers/formulario.controller.php`, {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            // console.log(datos)
            datos.forEach(element => {
              const etiqueta = document.createElement("option");
              etiqueta.value = element.idusuario;
              etiqueta.innerHTML = element.nombres;

              $("#usuario").appendChild(etiqueta);
            });
          })
          .catch(e => {
            console.error(e)
          });
      }

      
      function registrarInscrito(){
        const parametros = new FormData();
        parametros.append("operacion","registrarInscrito");
        parametros.append("idusuario",$("#usuario").value)

        fetch(`../../controllers/formulario.controller.php`, {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos =>{
            if(datos.idinscrito > 0){
              alert(`Usuario insrito registrado con el ID: ${datos.idinscrito}`)
              $("#form-inscrito").reset();
            }
          })
          .catch(e => {
            console.error(e)
          });
      }

      $("#form-inscrito").addEventListener("submit", (event) => {
        event.preventDefault();

        if(confirm("¿Está seguro de registrar?")){
          registrarInscrito();
        }
      });


      


      // Funciones de carga automática
      getUser();
    });
  </script>
</body>  

</html>