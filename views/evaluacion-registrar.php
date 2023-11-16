<?php
  require_once './navbar.php';
?>

<!-- Estilos de Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">


<div class="container">
  <div class="row justify-content-center">
    <div class="col-10">
      <h3 class="my-3">Registrar Evaluación</h3>
      <form action="" id="form-examen">
        <div class="row">
          <div class="col-9">
            <div class="input-group mb-3">
              <label for="nom-evaluacion" class="input-group-text">Nombre de la Evaluación</label>
              <input type="text" class="form-control" id="nom-evaluacion" required>
            </div>
          </div>
          <div class="col-3">
            <div class="input-group mb-3">
              <label class="input-group-text" for="npreguntas">Cantidad de Preguntas</label>
              <select class="form-select" id="npreguntas" required>
                <option value="4">4</option>
                <option value="5">5</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-4">
            <div class="input-group mb-3">
              <label for="inicio-evaluacion" class="input-group-text">Inicio</label>
              <input type="datetime-local" class="form-control" id="inicio-evaluacion" required>
            </div>
          </div>
          <div class="col-4">
            <div class="input-group mb-3">
              <label for="fin-evaluacion" class="input-group-text">Fin</label>
              <input type="datetime-local" class="form-control" id="fin-evaluacion" required>
            </div>
          </div>
          <div class="col-4">
            <div class="input-group mb-3">
              <label class="input-group-text" for="list-curso">Curso</label>
              <select class="form-select" id="list-curso" required>
                <!-- <option value="1">1</option> -->
              </select>
            </div>
          </div>
        </div>
        <!-- Pregunta -->
        <div id="pregunta-render">

        </div>
        <button class="btn btn-primary" type="submit">Guardar Examen</button>
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
      function $(id) {
        return document.querySelector(id)
      }

      function getCursos(){
        const parametros = new FormData();
        parametros.append('operacion', 'cursosListar');

        fetch('../controllers/formulario.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            datos.forEach(registro => {
              const option = document.createElement('option');
              option.value = registro.idcurso;
              option.innerText = registro.curso;
              $('#list-curso').appendChild(option);
            });
          })
          .catch(e => {
            console.error(e);
          });
      }

      function preguntasRenderEntrada(nPreguntas) {
        $("#pregunta-render").innerHTML = '';

        for(let i = 1; i <= nPreguntas; i++){
          $("#pregunta-render").innerHTML += `
          <div class="row">
            <div class="col-9">
              <div class="input-group mb-3">
                <label for="nom-pregunta-${i}" class="input-group-text">Pregunta N° ${i}</label>
                <input type="text" class="form-control" id="nom-pregunta-${i}" required>
              </div>
            </div>
            <div class="col-3">
              <div class="input-group mb-3">
                <label class="input-group-text" for="alt-correcta-${i}">Opción Correcta</label>
                <select class="form-select" id="alt-correcta-${i}" required>
                  <option value="a">A</option>
                  <option value="b">B</option>
                  <option value="c">C</option>
                </select>
              </div>
            </div>
          </div>
          <div class="row mx-5" id="alternativas-render-${i}"></div>
          `;
          alternativasRenderEntrada(i);
        }
      }

      function alternativasRenderEntrada(idAlt){
        $(`#alternativas-render-${idAlt}`).innerHTML += `
            <div class="input-group mb-3">
              <label for="alt-a-${idAlt}" class="input-group-text">Alternativa: A</label>
              <input type="text" class="form-control" id="alt-a-${idAlt}" required>
            </div>
            <div class="input-group mb-3">
              <label for="alt-b-${idAlt}" class="input-group-text">Alternativa: B</label>
              <input type="text" class="form-control" id="alt-b-${idAlt}" required>
            </div>
            <div class="input-group mb-3">
              <label for="alt-c-${idAlt}" class="input-group-text">Alternativa: C</label>
              <input type="text" class="form-control" id="alt-c-${idAlt}" required>
            </div>
        `;
      }

      function evaluacionRegistrar(){
        const parametros = new FormData();
        parametros.append('operacion', 'evaluacionRegistrar');
        parametros.append('idcurso', $('#list-curso').value);
        parametros.append('nombre_evaluacion', $('#nom-evaluacion').value);
        parametros.append('fechainicio', $('#inicio-evaluacion').value);
        parametros.append('fechafin', $('#fin-evaluacion').value);

        fetch('../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            const idEvaluacion = datos.idevaluacion;
            console.log(datos);
            
            for(let i = 1; i <= $('#npreguntas').value; i++){
              preguntasRegistrar(idEvaluacion, i);
            }
          })
          .catch(e => {
            console.error(e);
          });
      }


      function preguntasRegistrar(idevaluacion, altNum){
        const nomPregunta = $(`#nom-pregunta-${altNum}`).value;
        console.log(nomPregunta);
        const parametros = new FormData();
        parametros.append('operacion', 'preguntasRegistrar');
        parametros.append('idevaluacion', idevaluacion);
        parametros.append('pregunta', nomPregunta);

        fetch('../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            const altLetras = ['a', 'b', 'c'];
            const altCorrecta = $(`#alt-correcta-${altNum}`).value;

            for(let i = 1; i <= 3; i++){
              if (altCorrecta == altLetras[i-1]){
                alternativasRegistrar(datos.idpregunta, altLetras[i-1], altNum, 'S');
                console.log(altLetras[i-1], i);

              }
              else{
                alternativasRegistrar(datos.idpregunta, altLetras[i-1], altNum, 'N');
                console.log(altLetras[i-1], i);

              }
            }

            console.log(datos.idpregunta);
          })
          .catch(e => {
            console.error(e);
          });
      }

      // idPregunta, letra, idAlt, escorrecta
      function alternativasRegistrar(idPregunta, letra, idAlt, escorrecto){
        const alternativa = $(`#alt-${letra}-${idAlt}`).value;
        console.log(alternativa);

        const parametros = new FormData();
        parametros.append('operacion', 'alternativasRegistrar');
        parametros.append('idpregunta', idPregunta);
        parametros.append('alternativa', alternativa);
        parametros.append('escorrecto', escorrecto);

        fetch('../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
          console.log(datos);
        })
        .catch(e => {
          console.error(e);
        });
      }



      $("#form-examen").addEventListener('submit', (event) => {
        event.preventDefault();
        if (confirm("¿Estás seguro de registrar esta evaluación?")) {
          evaluacionRegistrar();
          $("#form-examen").reset();
        } else {
          alert("Evaluación no registrada");
        }
      });

      $("#npreguntas").addEventListener('change', (event) => {
        let nPreguntas = event.target.value;
        preguntasRenderEntrada(nPreguntas);
      });
      
      
      getCursos();
      preguntasRenderEntrada($("#npreguntas").value);
    })
  </script>

</body>
</html>