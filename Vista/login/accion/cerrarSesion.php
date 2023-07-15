<?php

include_once '../../../configuracion.php';

$datos = data_submitted();


$objSession = new Session();
$resp = $objSession->cerrar();
$respuesta=false;
if ($resp) {
    $respuesta=true;
    $mensaje = "Vuelva... lo estaremos esperando...";
 //   echo ("<script>location.href = '../home/index.php?msg=" . $mensaje . "';</script>");
}
else{
    $retorno['errorMsg'] ="No se pudo cerrar sesión";
}
$retorno['respuesta'] = $respuesta; //true o false
if (isset($mensaje)) {

    $retorno['Msg'] = $mensaje;
}
echo json_encode($retorno);
         
