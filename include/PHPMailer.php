<?php
require '../include/EnviarTokens.php';



// function enviarMail($emailDestino = "", $asunto = "", $mensaje = ""){

// }
//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

//Load Composer's autoloader
require '../vendor/autoload.php';

//Create an instance; passing `true` enables exceptions

//Requerimiento:


//$tokens = random_int(100000,999999);


function enviarEmail($correo,$tokens){
  $mail = new PHPMailer(true);
  $estado = ["enviado" => false];

  try {
      //Server settings
      //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
      $mail->isSMTP();                                            //Send using SMTP
      $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through => SOPORTE
      $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
      $mail->Username   = 'senati.appstore@gmail.com';                     //SMTP username
      $mail->Password   = 'phofceqvbyvlyjdd';                               //SMTP password
      $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
      $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
  
      //Recipients => RECEPTORES
      $mail->setFrom('sistema@gmail.com', 'APP-STORE');       // MUESTRA EN JMAIL
      //$mail->addAddress('1392696@senati.pe', 'Joe User');     //Add a recipient
      $mail->addAddress($correo);               //Name is optional => A quien se envía
      //$mail->addReplyTo('info@example.com', 'Information'); // RESPUESTA
      // $mail->addCC('cc@example.com');                       // AGREGAR COPIA
      // $mail->addBCC('bcc@example.com');                     // AGREGAR COPIA OCULTA
  
      //Attachments => ARCHIVOS ADJUNTOS
      //$mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
      //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name
  
      //Content
      $mail->isHTML(true);                                  //Set email format to HTML
      $mail->Subject = 'CLAVE DE RECUPERACION';
      $mail->Body    = "
        <h1><strong>Token</strong></h1> 
        <p>Este es tu codigo para restablecer tu cuenta:</p> 
        <h2>$tokens</h2>
        <a href='http://localhost/evaluaciones/validar.php'>!Verificar su Token aqui¡</a>
        <h3>Si no solicito esta operacion porfavor ignorar este correo</h3>";
      $mail->AltBody = 'Tu correo no soporta formato HTML, por favor comunicarse... ';
  
      $mail->send();
      $estado["enviado"] = true;
      //echo 'Message has been sent';
  } catch (Exception $e) {
    $estado["enviado"] = false;
      //echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
  }
  echo json_encode($estado);
  //echo $tokens;
  
}

$resultado = enviarEmail($correo,$tokens);


