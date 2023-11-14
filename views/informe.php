<?php
  require_once "./navbar.php";
?>
<!doctype html>
<html lang="es">

<head>
  <title>Resumen de Alumnos</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>

<body>

  <div class="container mt-3">
    <div class="row">
      <div class="col-md-12">
        <canvas id="grafico"></canvas>
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


  <!-- ChartJs -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  

  <script>
    const contexto = document.querySelector("#grafico");
    let grafico; //Variable, puede cambiar durante la ejecucion 

    //Obtiene los datos que requiere ChartJS
    function getData(){
      const parametros = new FormData();
      parametros.append("operacion", "mostrarResumen");

      fetch(`../controllers/informe.controller.php`,{
        method: "POST",
        body: parametros
      })
      .then(respuesta => respuesta.json())
      .then(datos => {
        renderChart(datos);
      })
      .catch(e => {
        console.error(e)
      });
    }

    function renderChart(data) {
      grafico = new Chart(contexto, {
          type: 'bar',
          data: {
              labels: data.map(valor => valor.curso),
              datasets: [{
                      label: "Evaluaciones Realizadas",
                      data: data.map(valor => valor.evaluaciones_realizadas),
                      backgroundColor: 'rgba(75, 192, 192, 0.5)', // Color para el primer conjunto de datos
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1
                  },
                  {
                      label: "Evaluaciones Pendientes",
                      data: data.map(valor => valor.evaluaciones_pendientes),
                      backgroundColor: 'rgba(255, 99, 132, 0.5)', // Color para el segundo conjunto de datos
                      borderColor: 'rgba(255, 99, 132, 1)',
                      borderWidth: 1
                  }
              ]
          },
          options: {
              scales: {
                  x: {
                      stacked: true
                  },
                  y: {
                      stacked: true
                  }
              }
          }
      });
    }


    getData();

  </script>

</body>

</html>