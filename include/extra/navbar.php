<?php
session_start();

$permisos = [
  "1" => ["indexdocente", "inscritos", "evaluacion-registrar","informe"], // DOCENTE
  "2" => ["index"], // ESTUDIANTE
];

if (!isset($_SESSION["status"]) || !$_SESSION["status"]) {
  header("Location: ../index.php");
  exit();
}

$url = $_SERVER['REQUEST_URI'];
$urlCut = explode("/", $url);
$urlCut = explode(".", $urlCut[4]);
$archivo = ($urlCut[0]);

$permitido = false;

foreach ($permisos[$_SESSION["idrol"]] as $opcion) {
  if ($opcion == $archivo){
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
$indice = ($_SESSION["idrol"] == 1) ? "indexdocente" : "index";
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
   
    <a class="navbar-brand" href="./<?= $indice ?>.php">EVALUACIONES</a>
    <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
      <ul class="navbar-nav me-auto mt-2 mt-lg-0">
      <?php
          foreach($permisos[$_SESSION["idrol"]] as $permiso){
              if($permiso != "index" && $permiso != "indexdocente" ){
                echo "
                <li class='nav-item'>
                  <a class='nav-link' href='./{$permiso}.php'>$permiso</a>
                </li>
              ";
            }
          }
      ?>
      </ul>
      </ul>
      <ul class="navbar-nav">
        <a class="nav-link" href="#" id="dropdownId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <?= $_SESSION["nombres"] ?>
          <?= $_SESSION["apellidos"] ?>
          - <?= $_SESSION["rol"] ?>
        </a>
        <!-- <li class="nav-item dropdown">
          <div class="dropdown-menu" aria-labelledby="dropdownId">
            <a class="dropdown-item" href="../controllers/usuario.controller.php?operacion=destroy">Cerrar Sessión</a> -->
            <!-- <a class="dropdown-item" href="cambiar-pass.php">Cambiar contraseña</a> -->
            <!-- <a class="dropdown-item" href="reporte3.php">Reporte</a> -->
          <!-- </div>
        </li>-->
        <a href="../../controllers/usuario.controller.php?operacion=destroy"><button class="btn btn-warning">Salir <i class="bi bi-box-arrow-right"></i></button></a>
      </ul>
    </div>
  </div>
</nav>


<?php

  $url = $_SERVER['REQUEST_URI'];
  $arregloURL = explode("/", $url);
  $vistaActual = $arregloURL[count($arregloURL)-1];









?>

</body>
</html>