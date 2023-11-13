<?php
  require_once "./navbar.php";
?>

<div class="container">
  <div class="row">
    <div class="col-6">
      <h3>Listado de Matriculados</h3>
    </div>
    <div class="col-6">
      <a href="./evaluacion-registrar.php" class="btn btn-success">Agregar nueva Evaluación</a>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <table class="table table-hover" id="matriculados">
        <colgroup>
          <col width="10%">
          <col width="40%">
          <col width="50%">
        </colgroup>
        <thead>
          <tr>
            <th>N°</th>
            <th>Nombre</th>
            <th>Comandos</th>
          </tr>
        </thead>
        <tbody>

        </tbody>
      </table>
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

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      function $(id){
        return document.querySelector(id);
      }

      let matriculados = $("#matriculados tbody");

      function estudiantesListar(){
        const parametros = new FormData();
        parametros.append("operacion", "estudiantesListar")

        fetch('../controllers/usuario.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            matriculados.innerHTML = "";
            let nFila = 1;

            datos.forEach(registro => {
              let nEstudiante = '';
              nEstudiante = `
                <td>${nFila}</td>
                <td>${registro.nombre_completo}</td>
                <td>
                  <button data-idevaluacion="${registro.idevaluacion}" type="button" class="btn btn-primary">Ver Evaluaciones</button>
                  <button data-idevaluacion="${registro.idevaluacion}" type="button" class="btn btn-warning">Asignar Evaluación</button>
                </td>
              `;
              matriculados.innerHTML += nEstudiante;
              nFila++;
            });
          })
          .catch(e => {
            console.error(e);
          });
      }

      estudiantesListar();
    })
  </script>
  
</body>
</html>