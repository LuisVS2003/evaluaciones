<?php

require_once '../models/Restablecer.php';
/**
 * $tokens = Hay que crear esta variable fuera del if para ques 
 * pueda ser leida por el email.php'PHPMailer' y tambien pueda ser leida por el 
 * case:registratoken,si lo creamos dentro del 'switch' lo lo leere el PHPMailer y generara otro. 
 */

//ESE ES UN ARCHIVO DE ESCAPE PORQUE NO ME SALE EL OTRO XD
//Generamos un numero aleatorio.
$tokens = random_int(100000, 999999);

require_once 'PHPMailer.php';

  

// Controlador
if (isset($_POST['operacion'])) {
  $restablecer = new Restablecer(); // Crear una instancia del modelo

  switch ($_POST['operacion']) {
      case 'registrartoken':
          $correo = $_POST['correo'];

          $datosEnviar = [
              'correo' => $correo,
              'token' => $tokens
          ];

          $result = $restablecer->registrarToken($datosEnviar);
          //$resultado = enviarEmail($correo,$tokens);
          //echo json_encode($restablecer->registrarToken($datosEnviar));
          break;

  }
}


