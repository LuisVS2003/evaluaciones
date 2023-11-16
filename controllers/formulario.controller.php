<?php

require_once '../models/Formulario.php';

if (isset($_POST['operacion'])){

  $evaluacion = new Evaluacion();

  switch ($_POST['operacion']) {
    case 'listarUsuario':
        echo json_encode($evaluacion->listarUsuario());
      break;
  
    case 'listarInscritos':
        echo json_encode($evaluacion->listarInscritos());
      break;

    case 'listarEvaluacion':
        echo json_encode($evaluacion->listarEvaluacion());
        break;

    case 'registrarInscrito':
        $datosEnviar = [
            'idusuario'           => $_POST['idusuario'],
            'idevaluacion'        => $_POST['idevaluacion'],
            'fechainicio'         => $_POST['fechainicio'],
            'fechafin'            => $_POST['fechafin']
        ];
        
            echo json_encode($evaluacion->registrarInscrito($datosEnviar));
            break;

    case 'listarPregunta':
        echo json_encode($evaluacion->listarPregunta());
        break;

    case 'listarCurso':
      $datos = [
        'idusuario' => $_POST['idusuario']
      ];
      echo json_encode($evaluacion->listarCurso($datos));
      break;
  }
}