<?php require_once "./navbar.php";

$url = $_SERVER['REQUEST_URI'];
$arregloURL = explode("=", $url);
$id = $arregloURL[1];

?>

  <div class="container mt-4">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <h2 class="text-center mb-4">Evaluación de Preguntas</h2>

        <form action="#" id="form-evaluacion">
          <ol>

          </ol>
          <button type="submit" class="btn btn-primary">Enviar Respuestas</button>
        </form>
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

      const formPA = $('#form-evaluacion ol');

      function preguntasAlternativas(){
        const parametros = new FormData();
        parametros.append('operacion', 'preguntasAlternativas');
        parametros.append('idevaluacion', '<?= $id ?>');

        fetch('../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            formPA.innerHTML = '';
            nPregunta = 1;
            almacenarPreguntas(datos);
          })
          .catch(e => {
            console.error(e);
          });
      }

      function almacenarPreguntas(data){        
        const preguntasAgrupadas = {};

        data.forEach((dato) => {
          const { pregunta, alternativa } = dato;

          if (!preguntasAgrupadas[pregunta]) {
            preguntasAgrupadas[pregunta] = [];
          }
          preguntasAgrupadas[pregunta].push(alternativa);
        });

        for (const pregunta in preguntasAgrupadas) {
          const alternativas = preguntasAgrupadas[pregunta];

          const preguntaHTML = `<div>
                        <li>${pregunta}</li>`;
          const alternativasHTML = alternativas.map((alternativa, index) => {
            const opcionId = `opcion${index + 1}`;
            const opcionValue = `opcion${index + 1}`;
            return `<div class="form-check">
                      <input class="form-check-input" type="radio" name="${pregunta}" value="${opcionValue}" id="${opcionId}">
                      <label class="form-check-label" for="${opcionId}">${alternativa}</label>
                    </div>`;
          }).join('\n');

          const divCierreHTML = '</div>';
          formPA.innerHTML += preguntaHTML + alternativasHTML + divCierreHTML;
        }
      }


      preguntasAlternativas();
    })

  </script>
</body>

</html>