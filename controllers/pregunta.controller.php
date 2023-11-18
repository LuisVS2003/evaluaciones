<?php

require_once '../models/Preguntas.php';

if(isset($_POST['operacion'])){
  $pregunta = new Preguntas();

  switch ($_POST['operacion']) {

    case 'preguntasListar':
      $datos = [
        'idevaluacion' => $_POST['idevaluacion']
      ];
      echo json_encode($pregunta->evaluacionPreguntas($datos));
      break;

    case 'alternativasListar':
      $datos = [
        'idpregunta' => $_POST['idpregunta']
      ];
      echo json_encode($pregunta->evaluacionAlternativas($datos));
      break;

    case 'alternativasCorrectas':
      $datos = [
        'idevaluacion' => $_POST['idevaluacion']
      ];
      echo json_encode($pregunta->alternativasCorrecta($datos));
      break;

    case 'respuestasRegistrar':
      $datos = [
        'idinscrito' => $_POST['idinscrito'],
        'idalternativa' => $_POST['idalternativa']
      ];
      echo json_encode($pregunta->respuestasRegistrar($datos));
      break;

    case 'respuestasMarcadas':
      $datos = [
        'idinscrito' => $_POST['idinscrito']
      ];
      echo json_encode($pregunta->respuestasMarcdas($datos));
      break;

  }
}