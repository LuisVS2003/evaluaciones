<?php
session_start();
// require_once '../models/Email.php';
require_once '../models/Usuario.php';

if(isset($_POST['operacion'])){
  $usuario = new Usuario();

  switch ($_POST['operacion']) {
    case 'buscarUsuario':
      echo json_encode($usuario->login($_POST));
      break;

    case 'login':
      $datosEnviar = ["correo" => $_POST["correo"]];
      $registro = $usuario->login($datosEnviar);
      $statusLogin = [
        "acceso"    => false,
        "mensaje"   => ""
      ];
      if ($registro == false) {
        $_SESSION["status"] = false;
        $statusLogin["mensaje"] = "El correo no existe";
      }else{
        $claveEncriptada = $registro["claveacceso"];
        $_SESSION["idusuario"] = $registro["idusuario"];
        $_SESSION["apellidos"] = $registro["apellidos"];
        $_SESSION["idrol"] = $registro["idrol"];

        if (password_verify($_POST["claveacceso"], $claveEncriptada)) {
          $_SESSION["status"] = true;
          $statusLogin["acceso"] = true;
          $statusLogin["mensaje"] = "La clave y el acceso son correctos";

        }else{
          $_SESSION["status"] = true;
          $statusLogin["mensaje"] = "Error en la clave";
        }
      }
      echo json_encode($statusLogin);
      break;

    case 'registrar':
      $datosEnviar = [
        'idrol' => $_POST['idrol'],
        'apellidos' => $_POST['apellidos'],
        'nombres' => $_POST['nombres'],
        'correo' => $_POST['correo'],
        'claveacceso' => $_POST['claveacceso']
      ];
      $datosEnviar['claveacceso'] = password_hash($datosEnviar['claveacceso'], PASSWORD_BCRYPT);

      echo json_encode($usuario->registrarUsuario($datosEnviar));
      break;

    case 'enviarCorreo':
      $codigo = random_int(100000, 999999);
      $mensaje = "Su código para cambiar su contraseña es: " . $codigo;

      $datosEnviar = [
        'idusuario' => $_POST['idusuario'],
        'correo'    => $_POST['correo'],
        'codigo'    => $codigo
      ];

      enviarMail($_POST['correo'], "Código de recuperación", $mensaje);
      break;


  }


}




if (isset($_GET['operacion'])){
  if ($_GET['operacion'] == 'destroy') {
    session_destroy();
    session_unset();
    header("Location:../index.php");
  }
}