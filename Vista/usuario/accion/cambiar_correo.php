<?php
include_once "../../../configuracion.php";
$data = data_submitted();
print_r($data);
$respuesta = false;
if (isset($data['idusuario'])){
    $objC = new ABMUsuario();
    $respuesta = $objC->modificacion($data);
    
    if (!$respuesta){

        $sms_error = " La accion  MODIFICACION No pudo concretarse";
        
    }else $respuesta =true;
    
}
$retorno['respuesta'] = $respuesta;
if (isset($mensaje)){
    
    $retorno['errorMsg']=$sms_error;
    
}
echo json_encode($retorno);
?>