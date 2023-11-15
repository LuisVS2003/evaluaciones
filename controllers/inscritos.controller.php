<?php

require_once '../models/Inscritos.php';

if (isset($_POST['operacion'])){

  $inscritosL = new Inscritos();

  switch ($_POST['operacion']) {

    case 'listar':
      echo json_encode($inscritosL->listarInscritosPDF());
      break;
    
  }

}