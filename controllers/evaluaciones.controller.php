<?php

require_once '../models/Evaluacion.php';

if (isset($_POST['operacion'])) {
  $evaluacion = new Evaluacion();

  switch ($_POST['operacion']) {
    case 'listarEvaluaciones':
      $datos = [
        'idusuario' => $_POST['idusuario']
      ];

      echo json_encode($evaluacion->listarEvaluaciones($datos));
      break;
  }
}