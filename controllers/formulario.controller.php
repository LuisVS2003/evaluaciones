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


    case 'registrarEvaluacion':
    $datosEnviar = [
        'idcurso'              => $_POST['idcurso'],
        'nombre_evaluacion'    => $_POST['nombre_evaluacion'],
        'fechainicio'         => $_POST['fechainicio'],
        'fechafin'            => $_POST['fechafin']
    ];
  
        echo json_encode($evaluacion->registrarEvaluacion($datosEnviar));
        break;

    case 'listarEvaluacion':
        echo json_encode($evaluacion->listarEvaluacion());
        break;

    case 'registrarPregunta':
        $datosEnviar = [
            'idevaluacion'           => $_POST['idevaluacion'],
            'pregunta'               => $_POST['pregunta']
        ];
        
            echo json_encode($evaluacion->registrarPregunta($datosEnviar));
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

    case 'registrarAlternativa':
        $datosEnviar = [
            'idpregunta'            => $_POST['idpregunta'],
            'alternativa'           => $_POST['alternativa'],
            'escorrecto'            => $_POST['escorrecto']
        ];
        
            echo json_encode($evaluacion->registrarAlternativa($datosEnviar));
            break;
  }

}