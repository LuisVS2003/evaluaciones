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
        <!-------------------------------------------------------->
        <div class="row container">
          <div class="col-md-3 mb-3 mt-3">
            <label for="get-curso" class="form-label">Seleccione el curso:</label>
            <select name="" id="get-curso" class="form-select">
              <option value="">Todos:</option>
            </select>
          </div>
        </div>
        <!-------------------------------------------------------->
        <form action="" id="form-inscrito">
          <div class="row container">  
                <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="get-evaluacion" class="form-label">Selecione la evaluacion:</label>
                  <select name="" id="get-evaluacion" class="form-select" required>
                    <option value="">Seleccione:</option>
                  </select>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="get-usuario" class="form-label">Seleccione el Usuario:</label>
                  <select name="" id="get-usuario" class="form-select" required>
                    <option value="">Seleccione:</option>
                  </select>
                </div>     
              </div>
          </div>
          <div class="row container">
            <div class="col-md-12 text-end">
              <button type="submit" class="btn btn-primary mb-3">Registrar Inscrito</button>
            </div>
          </div> 
        </form>
        <!-------------------------------------------------------->
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

      function listarCursos(){
        const parametros = new FormData();
        parametros.append("operacion", "cursosListar");

        fetch(`../controllers/formulario.controller.php`,{
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos =>{
            console.log(datos)
            datos.forEach(element => {
              const etiqueta = document.createElement("option");
              etiqueta.value = element.idcurso;
              etiqueta.innerHTML = element.curso;

              $("#get-curso").appendChild(etiqueta);
            });
          })
          .catch(e =>{
            console.log(e)
          });

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

      function getEvaluacion() {
          const idCursoSeleccionado = $("#get-curso").value;

          // Limpiar las opciones actuales en el select de evaluaciones
          $("#get-evaluacion").innerHTML = '';

          // Añadir la opción predeterminada si el curso seleccionado es 'Todos'
          if (idCursoSeleccionado === '') {
              const defaultOption = document.createElement("option");
              defaultOption.value = "";
              defaultOption.innerHTML = "Seleccione un curso";
              $("#get-evaluacion").appendChild(defaultOption);
          }

          if (idCursoSeleccionado) {
              const parametros = new FormData();
              parametros.append("operacion", "evaluaciones_x_curso");
              parametros.append("idcurso", idCursoSeleccionado);

              fetch('../controllers/formulario.controller.php', {
                  method: 'POST',
                  body: parametros
              })
                  .then(respuesta => respuesta.json())
                  .then(datos => {
                      if (datos.length > 0) {
                          datos.forEach(registro => {
                              const tagOption = document.createElement("option");
                              tagOption.value = registro.idevaluacion;
                              tagOption.innerHTML = registro.nombre_evaluacion;
                              $("#get-evaluacion").appendChild(tagOption);
                          });
                      } else {
                          // No hay evaluaciones para el curso seleccionado
                          const noEvaluacionesOption = document.createElement("option");
                          noEvaluacionesOption.value = "";
                          noEvaluacionesOption.innerHTML = "No hay evaluaciones";
                          $("#get-evaluacion").appendChild(noEvaluacionesOption);
                      }
                  })
                  .catch(e => console.error(e));
          }
      }


      function inscritoRegistrar() {
        // Obtener valores de los selects
        const idUsuario = $("#get-usuario").value;
        const idEvaluacion = $("#get-evaluacion").value;

        // Validar que ambos campos estén seleccionados
        if (!idUsuario || !idEvaluacion) {
            // Mostrar mensaje de error
            alert("Falta seleccionar Usuario o Evaluación. Por favor, complete los campos obligatorios.");
            return; // Detener la ejecución si falta algún valor
        }

        // Resto del código para registrar al inscrito
        const parametros = new FormData();
        parametros.append("operacion", "registrar");
        parametros.append("idusuario", idUsuario);
        parametros.append("idevaluacion", idEvaluacion);
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

        // Mostrar mensaje de éxito
        alert('Inscrito registrado correctamente.');

        // Limpiar el formulario después de registrar
        $("#form-inscrito").reset();
      }

        // Funciones de carga automática
        getUser();
        listarCursos();

        // Evento para detectar cambios en el select de cursos
        $("#get-curso").addEventListener('change', getEvaluacion);

        $("#form-inscrito").addEventListener("submit", (event) => {
            // Evitar que la página se recargue
            event.preventDefault();
            inscritoRegistrar();
        });

      });

  </script>
</body>  

</html>