<?php /*require_once "./navbar.php";

$url = $_SERVER['REQUEST_URI'];
$arregloURL = explode("=", $url);
$id = $arregloURL[1];*/

?>
  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

<!doctype html>
<html lang="es">

<head>
  <title>Examen</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>



  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <h2 class="text-center mb-4">Evaluación de Preguntas</h2>

        <form id="form-evaluacion">
          <ol>

          </ol>
          <button type="submit" class="btn btn-primary" id="enviar-examen">Enviar Respuestas</button>
        </form>
      </div>
    </div>
  </div>

  <?php
    $idterminator = $_GET['id']; //Encapsulndo el id en una variable (URL)
    if(empty($idterminator)):   //Comprobamos si existe un id en la URL y si no existe mandamos "NO"
    ?>

  <p>Error en capturar el ID</p>

  <?php else: ?>

  <!-- SweetAlert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script src='../javascript/sweetalert.js'></script>

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

      const formPA = $('#form-evaluacion ol');
      let altCorrecto = [];
      let altMarcadas = [];

      function preguntasAlternativas(){
        const parametros = new FormData();
        parametros.append('operacion', 'preguntasAlternativas');
        parametros.append('idevaluacion', '<?= $idterminator; ?>');

        fetch('../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            console.log(datos);
            datos.forEach(registro => {
              if (registro.escorrecto == 'S') {
                altCorrecto.push(registro.idalternativa);                
              }
            });
            almacenarPreguntas(datos);
          })
          .catch(e => {
            console.error(e);
          });
      }

      function almacenarPreguntas(data) {
        const preguntasAgrupadas = {};
        data.forEach((dato) => {
          const { pregunta, alternativa, idalternativa } = dato;
          if (!preguntasAgrupadas[pregunta]) {
            preguntasAgrupadas[pregunta] = [];
          }
          preguntasAgrupadas[pregunta].push({ alternativa, idalternativa });
        });
        console.log(preguntasAgrupadas);
        for (const pregunta in preguntasAgrupadas) {
          const alternativas = preguntasAgrupadas[pregunta];
          const preguntaHTML = `<div>
                                  <li>${pregunta}</li>`;
          const alternativasHTML = alternativas.map((opcion, idalternativa) => {
            const { alternativa, idalternativa: opcionId } = opcion;
            
            return `<div class="form-check">
                      <input data-idalternativa="${opcionId}" class="form-check-input" type="radio" name="${pregunta}" id="${opcionId}" required>
                      <label  class="form-check-label" for="${opcionId}">${alternativa}</label>
                    </div>`;
          }).join('\n');
          const divCierreHTML = '</div>';
          formPA.innerHTML += preguntaHTML + alternativasHTML + divCierreHTML;
        }
      }

      function examenRevisar() {
        let datas = document.querySelectorAll(".form-check-input:checked");
        datas.forEach((data) => {
          altMarcadas.push(data.dataset.idalternativa);
        });

        contador = 0;
        altCorrecto.forEach((correcta) => {
          altMarcadas.forEach((marcada) => {
            if (correcta == marcada) {
              contador++;
            }
          })
        })
        contador *= 4
        //alert("Tu puntaje es: " + contador);
      }

      // console.log(preguntasAgrupadas);



      $("#form-evaluacion").addEventListener('submit', (event) => {
        event.preventDefault();
        // if (confirm('¿Desea enviar el examen?')) {
        //   examenRevisar();
        // }
        mostrarPregunta("Examen", "¿Está seguro de enviar el examen?").then((result) => { 
            if (result.isConfirmed) {
              examenRevisar();
              notificar("info","Envio entregado", `El resultado de tu examen es : ${contador}`, 3);
              $("#form-evaluacion").reset()
              setTimeout(function(){
                window.location.href = 'evaluaciones.php';
              },3000);

            }

          });
        
        
      })
      preguntasAlternativas();
      //Por terminar - window.addEventListener('beforeunload', notificar('info','a','b',3));
    })

  </script>
  <?php endif; ?>
</body>

</html>