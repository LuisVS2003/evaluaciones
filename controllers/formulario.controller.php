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

    case 'cursoCard':
      echo json_encode($evaluacion->cursoCard());
      break;

    case 'cursoEvaluacion':
      $datos = [
        'campo' => $_POST['campo']
      ];
      echo json_encode($evaluacion->cursoEvaluaciones($datos));
      break;

    case 'cursosListar':
      echo json_encode($evaluacion->cursosListar());
      break;

    // -------------------------------------------------------------------
    //Harold
    case 'evaluaciones_x_curso':
      $datos = [
        'idcurso' => $_POST['idcurso']
      ];
      echo json_encode($evaluacion->evalaucione_x_curso($datos));
      break;
    // -------------------------------------------------------------------
  }
}