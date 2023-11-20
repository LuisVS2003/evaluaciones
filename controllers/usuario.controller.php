<?php
session_start();
// require_once '../models/Email.php';
require_once '../models/Usuario.php';

require_once 'filtro.php';

if(isset($_POST['operacion'])){
  $usuario = new Usuario();

  switch ($_POST['operacion']) {
    case 'buscarUsuario':
      echo json_encode($usuario->login($_POST));
      break;

      case 'login':
        $datosEnviar = ["correo" => $_POST["correo"]];
        $registro = $usuario->login($datosEnviar);
  
        $statusLogin =[
        "acceso" => false,
        "mensaje" => ""
        ];
  
      if($registro == false){
        $_SESSION["status"] = false;
        $statusLogin["mensaje"] = "No existe el correo";
      }else{
  
        $claveEncriptada = $registro["claveacceso"];
        $_SESSION["idusuario"] = $registro["idusuario"];    
        $_SESSION["nombres"] = $registro["nombres"];    
        $_SESSION["apellidos"] = $registro["apellidos"];    
        $_SESSION["idrol"] = $registro["idrol"]; 
        $_SESSION["rol"] = $registro["rol"]; 
  
        if(password_verify($_POST['claveacceso'],$claveEncriptada)){
          $_SESSION["status"]= TRUE;
          $statusLogin["acceso"] = true;
          $statusLogin["mensaje"] = "Acceso correcto";
        }else{
          $_SESSION["status"]= FALSE;
          $statusLogin["mensaje"] = "Error en la contraseña";
        }
      }
      echo json_encode($statusLogin);
        break;

    case 'registrar':
      $datosEnviar = [
        'idrol' => $_POST['idrol'],
        'apellidos' => filtroPremium($_POST['apellidos']),
        'nombres' => filtroPremium($_POST['nombres']),
        'correo' => filtroPremium($_POST['correo']),
        'claveacceso' => password_hash($_POST['claveacceso'], PASSWORD_BCRYPT)
      ];
       

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

    case 'estudiantesListar':
      echo json_encode($usuario->estudiantesListar());
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