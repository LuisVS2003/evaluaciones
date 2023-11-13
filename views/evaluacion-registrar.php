<?php
  require_once './navbar.php'
?>

<link rel="stylesheet" href="./css/evaluacion-registrar.css">
  
<main class="contenedor centrar-flex">
  <form action="crear-examen.php" class="form_examen" method="post">
      <p class="intrucciones-examen">Asigna un nombre al examen.</p>
      <hr class="separador">
      
      <div class="form_grupo">
          <label for="titulo_examen">Nombre</label>
          <input class="form_title" type="text" name="titulo_examen" id="titulo_examen">
      </div>


      <!-- Inicio Pregunta examen -->
      <div class="form_grupo form_grupo-pregunta">
          <div class="fila">
            <div class="pregunta-group">
              <label for="preg1" class="numero-pregunta">Redacta las preguntas y sus respuestas.</label>
              <input class="pregunta" type="text" name="preg1" id="preg1">
            </div>
            <div class="alt-correcta">
              <label for="preg1_correcta" class="opcion-correcta">Opción correcta</label>
              <select name="preg1_correcta" id="preg1_correcta">
                  <option value="A">A</option>
                  <option value="B">B</option>
                  <option value="C">C</option>
              </select>
            </div>
              <!-- Seleccionar opcion correcta -->
          </div>
          <div class="input-opciones">
              <div class="opcion">
                  <label>A</label>
                  <input type="text" name="preg1_opcion_a">
              </div>

              <div class="opcion">
                  <label>B</label>
                  <input type="text" name="preg1_opcion_b">
              </div>

              <div class="opcion">
                  <label>C</label>
                  <input type="text" name="preg1_opcion_c">
              </div>
          </div>
      </div>


      <button class="btn btn-primary" type="submit">Guardar</button>
  </form>
</main>


  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>
</html>