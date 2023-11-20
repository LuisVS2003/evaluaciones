<?php

require_once '../models/Rol.php';

if (isset($_POST['operacion'])) {
  $rol = new Rol();

  switch ($_POST['operacion']) {
    case 'listarRoles':
      echo json_encode($rol->listarRoles());
      break;
  }
}