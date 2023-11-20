<?php
 require_once "../../include/extra/navbar.php";

?>



<!-- Estilos de Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">

<style>

  #guardar{
    position: fixed;
    bottom: 19vh;
    left: 20px;
    z-index: 3;
    width: 10vw;
  }

  #agregar-prg{
    position: fixed;
    bottom: 12vh;
    left: 20px;
    z-index: 2;
    width: 10vw;
  }

  #quitar-prg{
    position: fixed;
    bottom: 5vh;
    left: 20px;
    z-index: 2;
    width: 10vw;
  }

</style>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-10">
      <h3 class="my-3">Registrar Evaluación</h3>
      <form action="" id="form-examen">
        <div class="row">
          <div class="col-12">
            <div class="input-group mb-3">
              <label for="nom-evaluacion" class="input-group-text">Nombre de la Evaluación</label>
              <input type="text" class="form-control" id="nom-evaluacion" required>
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
                <option value="">Seleccione</option>
              </select>
            </div>
          </div>
        </div>
        <!-- Preguntas -->
        <div id="pregunta-render">

        </div>
        <div class="row">
          <button class="btn btn-success" type="submit" id="guardar">Guardar Evaluación</button>
          <!-- <button class="col-3 btn btn-success" type="reset">Reiniciar Datos</button> -->
        </div>
      </form>
      <div id="config">
        <button class="btn btn-primary agregar" id="agregar-prg">Agregar Pregunta</button>
        <button class="btn btn-danger quitar" id="quitar-prg">Quitar Pregunta</button>
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

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      let contador = 1;
      let contadorRegistro = 1;

      function $(id) {
        return document.querySelector(id)
      }

      function getCursos(){
        const parametros = new FormData();
        parametros.append('operacion', 'cursosListar');

        fetch('../../controllers/formulario.controller.php', {
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

      /**
       * Renderiza las preguntas
       * @param {number} i - Identificador - Index - N° Pregunta
       */
      function preguntasRenderEntrada(i) {
        const pregunta = document.createElement('section');
        pregunta.id = `pregunta-${i}`;
        pregunta.dataset.idpregunta = `${i}`;
        pregunta.innerHTML = `
          <div class="row mb-3">
            <div class="col-10">
              <div class="input-group mb-3">
                <label for="nom-pregunta-${i}" class="input-group-text">Pregunta N° ${i}</label>
                <input type="text" class="form-control" id="nom-pregunta-${i}" required>
              </div>
            </div>
            <div class="col-2">
              <div class="input-group mb-3">
                <label for="puntos-${i}" class="input-group-text">Puntos</label>
                <input type="number" class="form-control" id="puntos-${i}" min="1" max="10" required>
              </div>
            </div>
            <div class="row mx-5" id="alternativas-render-${i}"></div>
            <div class="row justify-content-center">
              <button data-addalternativa="${i}" class="col-3 btn btn-warning agregar-alt me-3" type="button "><i class="bi bi-plus-circle"></i> Agregar Alternativa</button>
              <button data-dropalternativa="${i}" class="col-3 btn btn-danger quitar-alt me-3" type="button "><i class="bi bi-dash-circle"></i> Quitar Alternativa</button>
            </div>
            <hr class="mt-3">
          </div>
        `;

        $("#pregunta-render").appendChild(pregunta);

        alternativasRenderEntrada(i, 1);
        alternativasRenderEntrada(i, 2);
      }

      function quitarUltimaPregunta() {
        const ultimaPregunta = $("#pregunta-render").lastElementChild;
        $("#pregunta-render").removeChild(ultimaPregunta);
      }

      $("#config").addEventListener('click', (event) => {
        const objetivo = event.target.classList;
        if (objetivo.contains('agregar')) {
          preguntasRenderEntrada(contador);
          contador++;
        } else if (objetivo.contains('quitar') && contador > 2) {
          quitarUltimaPregunta();
          contador--;
        }
      });


      /**
       * Renderiza las alternativas para cada Pregunta
       * @param {number} numPregunta    - Identificador del N° Pregunta
       * @param {number} numAlternativa - Identificador del N° Alternativa - Cantidad de Alternativas
       */
      function alternativasRenderEntrada(numPregunta, numAlternativa) {
        const section = document.createElement('div');
        section.id = `alternativa-${numPregunta}-${numAlternativa}`;
        section.innerHTML = `
          <div class="row">
            <div class="input-group mb-3">
              <div class="input-group-text">
                <input class="form-check-input mt-0" type="checkbox" data-escorrecto="nom-alternativa-${numPregunta}-${numAlternativa}" id="check-${numPregunta}-${numAlternativa}">
              </div>
              <input type="text" class="form-control" id="nom-alternativa-${numPregunta}-${numAlternativa}" required>
            </div>
          </div>
        `;

        const alternativasContainer = $(`#alternativas-render-${numPregunta}`);
        alternativasContainer.appendChild(section);
      }

      function quitarUltimaAlternativa(i) {
        const ultimaAlternativa = $(`#alternativas-render-${i}`).lastElementChild;
        $(`#alternativas-render-${i}`).removeChild(ultimaAlternativa);
      }

      function quitarUltimaAlternativa(i) {
        const nAlternativas = $(`#alternativas-render-${i}`);

        if (nAlternativas.children.length > 2) {
          const ultimaAlternativa = nAlternativas.lastElementChild;
          nAlternativas.removeChild(ultimaAlternativa);
        }
      }


      // Evento para las alterantivas - agregar y quitar
      $("#pregunta-render").addEventListener('click', (event) => {
        const objetivo = event.target;
        const id = objetivo.dataset;
        
        if (objetivo.classList.contains('agregar-alt')) {
          const nAlternativas = $(`#alternativas-render-${id.addalternativa}`).children.length + 1;
          alternativasRenderEntrada(id.addalternativa, nAlternativas);
        }
        else if (objetivo.classList.contains('quitar-alt')) {
          quitarUltimaAlternativa(id.dropalternativa);
        }

      });


      function evaluacionRegistrar(){
        const parametros = new FormData();
        parametros.append('operacion', 'evaluacionRegistrar');
        parametros.append('idcurso', $('#list-curso').value);
        parametros.append('idusuario', <?= $_SESSION['idrol']?>);
        parametros.append('nombre_evaluacion', $('#nom-evaluacion').value);
        parametros.append('fechainicio', $('#inicio-evaluacion').value);
        parametros.append('fechafin', $('#fin-evaluacion').value);

        fetch('../../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            const idEvaluacion = datos.idevaluacion;
            alert("Se creo la evaluacion con el ID: " + idEvaluacion);
            
            let cantidadPreguntas = $("#pregunta-render").children.length;
            
            for(let i = 1; i <= cantidadPreguntas; i++){
              preguntasRegistrar(idEvaluacion, i);
              console.log(idEvaluacion, i);
            }
          })
          .catch(e => {
            console.error(e);
          });
      }

      
      function preguntasRegistrar(idevaluacion, numeroPregunta){
        const nomPregunta = $(`#nom-pregunta-${numeroPregunta}`).value;
        const puntos = $(`#puntos-${numeroPregunta}`).value;
        const parametros = new FormData();
        parametros.append('operacion', 'preguntasRegistrar');
        parametros.append('idevaluacion', idevaluacion);
        parametros.append('pregunta', nomPregunta);
        parametros.append('puntos', puntos);

        fetch('../../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
          .then(respuesta => respuesta.json())
          .then(datos => {
            // console.log(datos);
            let numeroAlternativa = $(`#alternativas-render-${numeroPregunta}`).children.length;
            for(let i = 1; i <= numeroAlternativa; i++){
              const altCorrecta = ($(`#check-${numeroPregunta}-${i}`).checked) ? 'S' : 'N';
              alternativasRegistrar(datos.idpregunta, i, altCorrecta, contadorRegistro);
            }
            
            contadorRegistro++;
          })
          .catch(e => {
            console.error(e);
          });
      }

      function alternativasRegistrar(idPregunta, idAlt, escorrecto, nPregunta){
        const alternativa = $(`#nom-alternativa-${nPregunta}-${idAlt}`).value;
        // console.log(alternativa);

        const parametros = new FormData();
        parametros.append('operacion', 'alternativasRegistrar');
        parametros.append('idpregunta', idPregunta);
        parametros.append('alternativa', alternativa);
        parametros.append('escorrecto', escorrecto);

        fetch('../../controllers/evaluaciones.controller.php', {
          method: 'POST',
          body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
          // console.log(datos);
        })
        .catch(e => {
          console.error(e);
        });
      }

/*       $("#form-examen").addEventListener('click', (event) => {
        const objetivo = event.target;
        const tipo = objetivo.type;
        const marcado = objetivo.checked;

        if (tipo === 'checkbox' && marcado) {
          const pregunta = objetivo.closest('.row.mb-3');
          const checkboxes = pregunta.querySelectorAll('input[type="checkbox"]');
          // Remover el atributo "required" de los checkboxes del grupo de esa pregunta
          checkboxes.forEach(checkbox => {
            if (checkbox !== objetivo) {
              checkbox.removeAttribute('required');
            }
          });
        } else if (tipo === 'checkbox' && !marcado) {
          const pregunta = objetivo.closest('.row.mb-3');
          const checkboxes = pregunta.querySelectorAll('input[type="checkbox"]');
          // Volver a agregar el atributo "required" a los checkboxes del grupo de esa pregunta
          checkboxes.forEach(checkbox => {
            if (checkbox !== objetivo) {
              checkbox.setAttribute('required', '');
            }
          });
        }
      }); */

      function fechaValidar() {
        var inicio = $("#inicio-evaluacion").value;
        var fin = $("#fin-evaluacion").value;
        console.log(inicio, fin);
        if (inicio >= fin) {
          $("#fin-evaluacion").setCustomValidity('La fecha de fin debe ser mayor que la fecha de inicio');
        } else {
          $("#fin-evaluacion").setCustomValidity('');
        }
      }

      // Llamar a la función cuando se cambie el valor de los campos de fecha
      $("#inicio-evaluacion").addEventListener('change', fechaValidar);
      $("#fin-evaluacion").addEventListener('change', fechaValidar);

      $("#form-examen").addEventListener('submit', (event) => {
        event.preventDefault();
        if (confirm("¿Desea registrar la evaluación?")) {
          evaluacionRegistrar();
          // $("#form-examen").reset(); //NO PONER ESTO - NO FUNCIONARA EL REGISTRO
        }
      });

      getCursos();
      preguntasRenderEntrada(contador);
      contador++;
      fechaValidar();

      

        /* PARAMETROS SOLO TEXT */
        var solotext = ["nom-evaluacion"];
        for (var i = 0; i < solotext.length; i++) {
            document.getElementById(solotext[i]).setAttribute("onkeypress", "return /[a-z A-ZñÑ]/g.test(event.key)")
        }
    })
  </script>

</body>
</html>