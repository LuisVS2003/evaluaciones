<?php

require_once '../models/Inscritos.php';

if (isset($_POST['operacion'])){

  $inscritos = new Inscritos();

  switch ($_POST['operacion']) {

    case 'listar':
      echo json_encode($inscritos->listarInscritosPDF());
      break;
    
    case 'registrar':
      $datos = [
        'idusuario'     => $_POST['idusuario'],
        'idevaluacion'  => $_POST['idevaluacion'],
        'fechainicio'   => $_POST['fechainicio'],
        'fechafin'      => $_POST['fechafin'],
      ];
      echo json_encode($inscritos->inscritosRegistrar($datos));
      break;
  }

}