<?php
  require_once './navbar.php';
?>

  <div class="container">
    <h1>EVALUACIONES</h1>

    <div class="row">
      <div class="col-12">
        <table class="table table-hover" id="form-evaluaciones">
          <thead>
            <tr>
              <th>N°</th>
              <th>Evaluación</th>
              <th>Fecha Inicio</th>
              <th>Fecha Fin</th>
              <th>Rendir Examen</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
      </div>
    </div>


  </div>


  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js" integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

  <script>
    document.addEventListener("DOMContentLoaded", () => {

      function $(id){
        return document.querySelector(id);
      }

      const listar = $("#form-evaluaciones tbody");

      function listarEvaluaciones(){
        const parametros = new FormData();
        parametros.append('operacion', 'listarEvaluaciones');
        parametros.append('idusuario', '<?= $_SESSION["idusuario"] ?>');

        fetch('../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            listar.innerHTML = '';
            nFila = 1;

            datos.forEach(registro => {
              let nuevaFila = '';
              nuevaFila = `
                <tr>
                  <td>${nFila}</td>
                  <td>${registro.nombre_evaluacion}</td>
                  <td>${registro.fechainicio}</td>
                  <td>${registro.fechafin}</td>
                  <td>
                    <a href="./listapreguntas.php?id=${registro.idevaluacion}" class="btn btn-primary">Rendir</a>
                  </td>
                </tr>
              `;
              listar.innerHTML += nuevaFila;
              nFila++; 
            });
          })
          .catch(e => {
            console.error(e);
          });
      }

      listarEvaluaciones();

    })
  </script>

</body>

</html>