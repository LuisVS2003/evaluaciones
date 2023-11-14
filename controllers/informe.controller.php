<?php

require_once '../models/Informe.php';

if (isset($_POST['operacion'])){

  $categoria = new Informe();

  switch ($_POST['operacion']) {

    case 'mostrarResumen':
      echo json_encode($categoria->mostrarResumen());
      break;
    
  }

}