<?php

//Import PHPMailer classes into the global namespace
//These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/PhpMailer/src/Exception.php';
require 'phpmailer/PhpMailer/src/PHPMailer.php';
require 'phpmailer/PhpMailer/src/SMTP.php';

enviarEmail();
//Load Composer's autoloader
//require 'vendor/autoload.php';
function enviarEmail(){
    if(isset($_POST['name'])&& isset($_POST['email'])&& isset($_POST['comment'])){
        $name=$_POST['name'];
        $email=$_POST['email'];
        $idcompra=$_POST['idcompra'];
        $comment=$_POST['comment']; 
//Create an instance; passing `true` enables exceptions
        $mail = new PHPMailer(true);

        try {
            //Server settings
            $mail->SMTPDebug = 0;                      //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'sonoiovero.bis@gmail.com';                     //SMTP username
            $mail->Password   = 'dztnyfbjezukqzne';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('sonoiovero.bis@gmail.com', 'SISnovedades');
            $mail->addAddress($email, '');     //Add a recipient
            //$mail->addAddress('ellen@example.com');               //Name is optional
            //$mail->addReplyTo('info@example.com', 'Information');
            //$mail->addCC('cc@example.com');
            //$mail->addBCC('bcc@example.com');

            //Attachments
            //$mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments
            //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Movimientos de su compra';
            $mail->Body    = 'Hola '.$name.'!'.'</br>Correo: '.$email.'</br>Novedades de su pedido registrado con el Nro: '.$idcompra.'</br>'.$comment;
            //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

            $mail->send();
            echo 'El mensaje fue enviado con exito';
            header("Location: ../compra/listaCompras.php");
            exit;
        } catch (Exception $e) {
            echo "El mensaje no pudo ser enviado. Mailer Error: {$mail->ErrorInfo}";
        }
    }
} 
// function volver(){
//     header("Location: ../compra/listaCompras.php");
//     exit;
// }   