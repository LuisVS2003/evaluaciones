<?php
//require_once '../models/prueba.php';

//require_once '../models/Conexion.php';

date_default_timezone_set("America/Lima");

require_once '../models/Restablecer.php';
/**
 * $tokens = Hay que crear esta variable fuera del if para ques 
 * pueda ser leida por el email.php'PHPMailer' y tambien pueda ser leida por el 
 * case:registratoken,si lo creamos dentro del 'switch' lo lo leere el PHPMailer y generara otro. 
 */


//Generamos un numero aleatorio.
$tokens = random_int(100000, 999999);

//require_once '../test/email.php';

  

// Controlador
if (isset($_POST['operacion'])) {
  $restablecer = new Restablecer(); // Crear una instancia del modelo

  switch ($_POST['operacion']) {
      case 'buscarCorreo':
        $datosEnviar =[
          'correo' => $_POST['correo']
        ];
          echo json_encode($restablecer->buscarCorreo($datosEnviar));
        break;

      case 'buscarToken':
          $datosEnviar =[
            'correo' => $_POST['correo'],
            'token' => $_POST['token']

          ];

          echo json_encode($restablecer->buscarToken($datosEnviar));
          
          break;
      case 'cambiarpass':
        $ahora = date('dmYhis');
        $nombreEncriptado = sha1($ahora);

        // Encriptar la contraseña antes de guardarla en la base de datos
        $claveEncriptada = password_hash($_POST['claveacceso'], PASSWORD_BCRYPT);

        $datosEnviar = [
          'correo' => $_POST['correo'],
          'token' => $_POST['token'],
          'claveacceso' => $claveEncriptada

        ];
        echo json_encode($restablecer->cambiarpass($datosEnviar));
  }
}

