<!doctype html>
<html lang="es">

<head>
  <title>Registro de Evaluaciones</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>

<body>
  <div class="container mt-3">
    <div class="alert alert-info" role="alert">
      <strong>Evaluación - </strong> <br>LISTA DE PREGUNTAS
    </div>
    
    <table class="table table-sm table-striped" id="tabla-categorias">
      <colgroup>
        <col width="5%">
        <col width="35%">
        <col width="40%">
        <col width="20%">
      </colgroup>
      <thead>
        <tr>
          <th>#</th>
          <th>Alternativas</th>
          <th>Preguntas</th>   
          <th>Validación</th>        
        </tr>
      </thead>
      <tbody>
          <!-- DATOS CARGADOS DE FORMA ASINCRONA -->
      </tbody>
    </table>


  </div>


  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
  <script>
    // VanillaJS (JS Puro)
    document.addEventListener("DOMContentLoaded", () => {

      // Objeto que referencie a nuestra tabla HTML
      const tabla = document.querySelector("#tabla-categorias tbody");

      // Comunicación Controlador
      // Renderizar los datos en la Tabla > tbody
      function listarAlternativa(){
        // Preparar los parametros a enviar
        const parametros = new FormData();
        parametros.append("operacion", "listar")

        fetch(`../../controllers/evaluacion.controller.php`, {
          method: 'POST', 
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datosRecibidos => {
            // Recorrer cada fila del arreglo
            let numFila = 1;
            datosRecibidos.forEach(registro => {
              let nuevafila = ``;

              // Enviar los valores obtenidos en celdas <td></td>
              nuevafila = `
              <tr>
                <td>${numFila}</td>
                <td>${registro.alternativa}</td>
                <td>${registro.pregunta}</td>
                <td>${registro.validacion}</td>
                <td>
                  
                </td>
              </tr>
              `;

              tabla.innerHTML += nuevafila;
              numFila++;
            });
          })
          .catch(e => {
            console.error(e)
          })
      }

      listarAlternativa();w

    });



  </script>

</body>

</html>
