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
    <form action="" autocomplete="off" id="form-alternativa">
      <div class="card">
        <div class="card-header">
          <div>Registro de Alternativas</div>
        </div>
        <div class="card-body">
          <!-- CAMPO IDPREGUNTA -->
          <div class="mb-3">
            <label for="pregunta" class="form-label">Preguntas:</label>
            <select name="" id="pregunta" class="form-select" required autofocus>
              <option value="">Seleccione:</option>
            </select>
          </div>
          <!-- CAMPO ALTERNATIVA -->
          <div class="mb-3">
              <label for="alternativa" class="form-label">Alternativas:</label>
              <input type="text" class="form-control" id="alternativa" required>
          </div>
          <!-- CAMPO VALIDACION -->
          <div class="mb-3">
              <label for="validacion" class="form-label">Validació:</label>
              <input type="text" class="form-control" id="validacion" required>
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

      

      function getPreguntas(){
        const parametros = new FormData();
        parametros.append("operacion", "listarPregunta");

        fetch(`../../controllers/formulario.controller.php`, {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            // console.log(datos)
            datos.forEach(element => {
              const etiqueta = document.createElement("option");
              etiqueta.value = element.idpregunta;
              etiqueta.innerHTML = element.pregunta;

              $("#pregunta").appendChild(etiqueta);
            });
          })
          .catch(e => {
            console.error(e)
          });
      }

      function registrarAlternativa(){
        const parametros = new FormData();
        parametros.append("operacion","registrarAlternativa");
        parametros.append("idpregunta",$("#pregunta").value);
        parametros.append("alternativa",$("#alternativa").value);
        parametros.append("validacion",$("#validacion").value)

        fetch(`../../controllers/formulario.controller.php`, {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos =>{
            if(datos.idalternativa > 0){
              alert(`Alternativa registrado con el ID: ${datos.idalternativa}`)
              $("#form-alternativa").reset();
            }
          })
          .catch(e => {
            console.error(e)
          });
      }

      $("#form-alternativa").addEventListener("submit", (event) => {
        event.preventDefault();

        if(confirm("¿Está seguro de registrar?")){
          registrarAlternativa();
        }
      });

      
      // Funciones de carga automática
      getPreguntas();
    });
  </script>
</body>  

</html>