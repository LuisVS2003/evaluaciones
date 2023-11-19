<?php
  $idEvaluacion = $_GET['id'];
  $idinscrito = $_GET['inscrito'];
  $idusuario = $_GET['idu'];
?>

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
        <form method="POST" id="form-evaluacion">
          <ol>

          </ol>
          <button type="submit" class="btn btn-primary" id="enviar-examen">Enviar Respuestas</button>
        </form>
      </div>
    </div>
  </div>



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
      const $ = id => document.querySelector(id);
      const evaluacion = $("#form-evaluacion ol");

      function obtenerFechaActual() {
          const ahora = new Date();
          const año = ahora.getFullYear();
          const mes = agregarCero(ahora.getMonth() + 1);
          const dia = agregarCero(ahora.getDate());
          const horas = agregarCero(ahora.getHours());
          const minutos = agregarCero(ahora.getMinutes());
          const segundos = agregarCero(ahora.getSeconds());

          return `${año}-${mes}-${dia} ${horas}:${minutos}:${segundos}`;
        }
        function agregarCero(numero) {
            return numero < 10 ? '0' + numero : numero;
        }
        
        //console.log(fechaActual);
      // -------------------------------------------------------------------

      function EvaluacionEmpieza(){
        const parametros = new FormData();
        const fechaActual = obtenerFechaActual();
        
        parametros.append('operacion','actualizar_fecha_inicio_evaluacion');
        parametros.append('idinscrito',<?= $idinscrito ?>);
        parametros.append('idevaluacion',<?= $idEvaluacion ?>);
        parametros.append('fechainicio', fechaActual);

        fetch('../controllers/inscritos.controller.php',{
          method: 'POST',
          body:parametros
        })
          .then(respuesta =>respuesta.json())
          .then( data => {
            console.log("hola");           
          })
          .catch(e =>{
            console.error(e);
          });

      }

      function EvaluacionTermina(){
        const parametros = new FormData();
        const fechaActual = obtenerFechaActual();
        
        parametros.append('operacion','actualizar_fecha_fin_evaluacion');
        parametros.append('idinscrito',<?= $idinscrito ?>);
        parametros.append('idevaluacion',<?= $idEvaluacion ?>);
        parametros.append('fechafin', fechaActual);

        fetch('../controllers/inscritos.controller.php',{
          method: 'POST',
          body:parametros
        })
          .then(respuesta =>respuesta.json())
          .then( data => {
            console.log("hola");           
          })
          .catch(e =>{
            console.error(e);
          });

      }


      function preguntasListar(){
        const parametros = new FormData();
        parametros.append('operacion', 'preguntasListar');
        parametros.append('idevaluacion', <?= $idEvaluacion ?>)

        fetch('../controllers/pregunta.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            evaluacion.innerHTML = '';
            datos.forEach(registro => {
              let pregunta = '';
              pregunta = `
                <section class="mb-4">
                  <div class="row">
                    <div class="col-md-10">
                      <li>${registro.pregunta}</li>
                      </div>
                      <div class="col-md-2">
                        <strong>${registro.puntos} PUNTOS</strong>
                    </div>
                  </div>
                  <div id="pregunta-${registro.idpregunta}"></div>
                </section>
              `;
              evaluacion.innerHTML += pregunta;
              alternativasListar(registro.idpregunta);
            });
            
          })
          .catch(e => console.error(e));
      }

      function alternativasListar(idPregunta){
        const parametros = new FormData();
        parametros.append('operacion', 'alternativasListar');
        parametros.append('idpregunta', idPregunta)

        fetch('../controllers/pregunta.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            const preguntaDiv = $(`#pregunta-${idPregunta}`);
            datos.forEach(registro => {
              let alternativa = '';
              alternativa = `
                <div class="form-check">
                  <input data-idalternativa="${registro.idalternativa}" class="form-check-input" type="radio" id="alternativa-${registro.idalternativa}" name="alternativa-${idPregunta}">
                  <label class="form-check-label" for="alternativa-${registro.idalternativa}">${registro.alternativa}</label>
                </div>
              `;
              preguntaDiv.innerHTML += alternativa;
            });
          })
          .catch(e => console.error(e));
      }

      function respuestasRegistrar(marcado){
        const parametros = new FormData();
        parametros.append('operacion', 'respuestasRegistrar');
        parametros.append('idinscrito', <?= $idinscrito ?>)
        parametros.append('idalternativa', marcado)

        fetch('../controllers/pregunta.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            console.log(datos);
          })
          .catch();
      }      
      
      $("#form-evaluacion").addEventListener('submit', event => {
        event.preventDefault();

        mostrarPregunta("Evalucion", "¿Está seguro de enviar su evaluación?").then((result) => { 
            if (result.isConfirmed) {
              
              EvaluacionTermina();
              let marcado = document.querySelectorAll('input[type="radio"]:checked');
              marcado.forEach(boton => {
                respuestasRegistrar(boton.dataset.idalternativa);
              });
              notificar('info','Evaluacion enviada','Ahora ya puedes ver tu nota',3);
              setTimeout(function(){
                window.location.href = './listar-evaluaciones.php?id=<?= $idEvaluacion ?>&idu=<?= $idusuario?>';
              },3000);

            }

          });
        
      });

      // Mostrar advertencia si quiere ir a la pagina anterior con la flecha del navegador, solo funciona si ha marcado al menos 1
      // window.onbeforeunload = () => {
      //   return '¿Estás seguro de que deseas salir de esta página? Los cambios que realizaste podrían no guardarse.';
      // };
      
      
      preguntasListar();
      EvaluacionEmpieza();
    })
  </script>
</body>

</html>