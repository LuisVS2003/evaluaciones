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
        'idevaluacion'  => $_POST['idevaluacion'],
        'nota'          => $_POST['nota']
      ];

      //echo json_encode($evaluacion->asignarNota($datos));
      break;

    case 'evaluacionRegistrar':
      $datos = [
        'idcurso'           => $_POST['idcurso'],
        'nombre_evaluacion' => $_POST['nombre_evaluacion'],
        'fechainicio'       => $_POST['fechainicio'],
        'fechafin'          => $_POST['fechafin']
      ];

      echo json_encode($evaluacion->evaluacionRegistrar($datos));
      break;

    case 'preguntasRegistrar':
      $datos = [
        'idevaluacion' => $_POST['idevaluacion'],
        'pregunta'     => $_POST['pregunta']
      ];

      echo json_encode($evaluacion->preguntasRegistrar($datos));
      break;
    
    case 'alternativasRegistrar':
      $datos = [
        'idpregunta' => $_POST['idpregunta'],
        'alternativa' => $_POST['alternativa'],
        'escorrecto' => $_POST['escorrecto']
      ];

      echo json_encode($evaluacion->alternativasRegistrar($datos));
      break;
  }
}