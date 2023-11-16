<?php

session_start();

$permisos = [
  "1" => ["matriculados", "evaluaciones", "inscritos",
          "evaluacion-registrar","informe","indexdocente"], // DOCENTE
  "2" => ["evaluaciones","index"] // ESTUDIANTE
];



if (!isset($_SESSION["status"]) || !$_SESSION["status"]) {
  header("Location: ../index.php");
  exit();

  
}

?>

<!doctype html>
<html lang="es">

<head>
  <title>EVALUACIONES</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

  <link rel="icon" type="image/png"  href="../images/icon-web.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

  <style>
    .nav-item{
      text-transform: uppercase;
    }
  </style>

</head>
<body>
  
<nav class="navbar navbar-expand-sm navbar-dark bg-secondary mb-3 fijado">
  <div class="container">
    <?php
      // Determina el índice correspondiente al rol
      $index = ($_SESSION["idrol"] == 1) ? "indexdocente.php" : "index.php";
    ?>
    <a class="navbar-brand" href="./<?= $index ?>">EVALUACIONES</a>
    <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
      <ul class="navbar-nav me-auto mt-2 mt-lg-0">
        <?php
          // Iterar sobre los permisos y mostrar elementos según el rol
          foreach ($permisos[$_SESSION["idrol"]] as $permiso) {
            // Agregar clases a los enlaces que deseas ocultar
            $hiddenClass = ($permiso == "index" || $permiso == "indexdocente") ? "hidden-link" : "";
            echo "
              <li class='nav-item'>
                <a class='nav-link {$hiddenClass}' href='./{$permiso}.php'>$permiso</a>
              </li>
            ";
          }
        ?>
      </ul>
      <ul class="navbar-nav">
        <a class="nav-link" href="#" id="dropdownId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <?= $_SESSION["nombres"] ?>
          <?= $_SESSION["apellidos"] ?>
          - <?= $_SESSION["rol"] ?>
        </a>
        <a href="../controllers/usuario.controller.php?operacion=destroy"><button class="btn btn-warning">Salir <i class="bi bi-box-arrow-right"></i></button></a>
      </ul>
    </div>
  </div>
</nav>

<script>
document.addEventListener("DOMContentLoaded", function() {
  // Obtener el enlace de Evaluaciones
  var evaluacionesLink = document.querySelector('.navbar-brand');

  // Manejar el clic en Evaluaciones
  evaluacionesLink.addEventListener('click', function() {
    // Mostrar dinámicamente los enlaces ocultos
    document.querySelectorAll('.hidden-link').forEach(function(link) {
      link.style.display = 'block';
    });
  });
});
</script>


<?php

  $url = $_SERVER['REQUEST_URI'];
  $arregloURL = explode("/", $url);
  $vistaActual = $arregloURL[count($arregloURL)-1];

  $permitido = false;
  foreach ($permisos[$_SESSION["idrol"]] as $opcion) {
      if ($opcion . ".php" == $vistaActual)  {
          $permitido = true;
      }
  }

  if (!$permitido) {
      echo '
          <div class="container">
          <h3>Acceso no permitido</h3>
          </div>
        ';
      exit();
  }


?>

</body>
</html>
