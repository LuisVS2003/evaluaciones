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

    case 'preguntasAlternativas':
      $datos = [
        'idevaluacion' => $_POST['idevaluacion']
      ];

      echo json_encode($evaluacion->preguntasAlternativas($datos));
      break;

    case 'asignarNota':
      $datos = [
        'idevaluacion' => $_POST['idevaluacion'],
        'nota' => $_POST['nota']
      ];

      echo json_encode($evaluacion->asignarNota($datos));
      break;
  }
}