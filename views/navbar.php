<?php

session_start();

$permisos = [
  "1" => ["matriculados", "evaluaciones", "formulario-inscrito",
          "formulario-evaluacion", "formulario-pregunta", "formulario-alternativa"], // DOCENTE
  "2" => ["evaluaciones", "listapreguntas"], // ESTUDIANTE
];



if (!isset($_SESSION["status"]) || !$_SESSION["status"]) {
  header("Location: ../index.php");
  echo "<h1>ACCESO NO AUTORIZADO</h1>";
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

  <link rel="icon" type="image/png"  href="../images/icon-web.png">

  <style>
    .nav-item{
      text-transform: uppercase;
    }
  </style>

</head>
<body>
  
<nav class="navbar navbar-expand-sm navbar-dark bg-secondary mb-3 fijado">
  <div class="container">
    <a class="navbar-brand" href="../catalogo/">APPSTORE</a>
    <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
      <ul class="navbar-nav me-auto mt-2 mt-lg-0">
        <?php
            foreach($permisos[$_SESSION["idrol"]] as $permiso){
                echo "
                  <li class='nav-item'>
                    <a class='nav-link' href='./{$permiso}.php'>$permiso</a>
                  </li>
                ";
              }
        ?>
      </ul>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <?= $_SESSION["apellidos"] ?>
            (<?= $_SESSION["idrol"] ?>)
          </a>
          <div class="dropdown-menu" aria-labelledby="dropdownId">
            <a class="dropdown-item" href="../controllers/usuario.controller.php?operacion=destroy">Cerrar Sessión</a>
            <a class="dropdown-item" href="#">Cambiar contraseña</a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</nav>
