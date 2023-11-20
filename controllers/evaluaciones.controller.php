<?php

require_once '../models/Evaluacion.php';

require_once 'filtro.php';

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


    case 'evaluacionRegistrar':
      $datos = [
        'idcurso'           => $_POST['idcurso'],
        'idusuario'         => $_POST['idusuario'],
        'nombre_evaluacion' => filtrarMejorado($_POST['nombre_evaluacion']),
        'fechainicio'       => $_POST['fechainicio'],
        'fechafin'          => $_POST['fechafin']
      ];

      echo json_encode($evaluacion->evaluacionRegistrar($datos));
      break;

    case 'preguntasRegistrar':
      $datos = [
        'idevaluacion'  => $_POST['idevaluacion'],
        'pregunta'      => filtrarMejorado($_POST['pregunta']),
        'puntos'        => filtrarMejorado($_POST['puntos'])
      ];

      echo json_encode($evaluacion->preguntasRegistrar($datos));
      break;
    
    case 'alternativasRegistrar':
      $datos = [
        'idpregunta' => $_POST['idpregunta'],
        'alternativa' => filtrarMejorado($_POST['alternativa']),
        'escorrecto' => $_POST['escorrecto']
      ];

      echo json_encode($evaluacion->alternativasRegistrar($datos));
      break;

    case 'evaluacionesDocente':
      $datos = [
        'iddocente' => $_POST['iddocente'],
        'idcurso'   => $_POST['idcurso']
      ];
      echo json_encode($evaluacion->evaluacionesDocente($datos));
      break;

      // --------------------------------------------------------------
      //Harold
    case 'listar_evaluaciones_x_curso':
      $datos = [
        'idusuario' => $_POST['idusuario'],
        'idcurso' => $_POST['idcurso']
      ];
      echo json_encode($evaluacion->listar_evaluaciones_x_curso($datos));
      break;
      //------------------------------------------------------------------
  }
}