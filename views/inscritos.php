<?php
  require_once "./navbar.php";
?>

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
      <div class="card">
        <div class="card-header bg-dark text-light">
            <h1>
            Formulario de Inscripción - Evaluaciones
            </h1>
        </div>
            <div class="row container">  
                  <div class="col-md-3 mb-3 mt-3">
                    <label for="get-curso" class="form-label">Seleccione el curso:</label>
                    <select name="" id="get-curso" class="form-select">
                      <option value="">Todos:</option>
                    </select>
                  </div>
                  <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="get-evaluacion" class="form-label">Selecione la evaluacion:</label>
                    <select name="" id="get-evaluacion" class="form-select" required>
                      <option value="">Seleccione Categoria:</option>
                    </select>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="get-usuario" class="form-label">Seleccione el Usuario:</label>
                    <select name="" id="get-usuario" class="form-select" required>
                      <option value="">Seleccione Categoria:</option>
                    </select>
                  </div>     
                </div>
            </div> 
      </div>
    </div>
  
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
        fetch(`../controllers/formulario.controller.php`, {
          method: "POST",
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            datos.forEach(element => {
              const etiqueta = document.createElement("option");
              etiqueta.value = element.idusuario;
              etiqueta.innerHTML = element.nombres;

              $("#get-usuario").appendChild(etiqueta);
            });
          })
          .catch(e => {
            console.error(e)
          });
      }

      function getEvaluacion(){
        const parametros = new FormData();
        parametros.append("operacion", "listarEvaluacion");

        fetch('../controllers/formulario.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            datos.forEach(registro => {
              const tagOption = document.createElement("option");
              tagOption.value = registro.idevaluacion;
              tagOption.innerHTML = registro.nombre_evaluacion;

              $("#get-evaluacion").appendChild(tagOption);
            });
          })
          .catch(e => console.error(e));
      }

      function inscritoRegistrar(){
        const parametros = new FormData();
        parametros.append("operacion", "registrar");
        parametros.append("idusuario", $("#get-usuario").value);
        parametros.append("idevaluacion", $("#get-evaluacion").value);
        parametros.append("fechainicio", '');
        parametros.append("fechafin", '');

        fetch('../controllers/inscritos.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            console.log(datos);
          })
          .catch(e => console.error(e));
      }
      
      // $("#form-inscrito").addEventListener("submit", (event) => {
      //   event.preventDefault();

      //   if (confirm("¿Desea registrar al Usuario a esta Evaluación?")) {
      //     inscritoRegistrar();
      //   }
      // })


      // Funciones de carga automática
      getUser();
      getEvaluacion();
    });
  </script>
</body>  

</html>