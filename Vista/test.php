<?php
include_once "../configuracion.php";

$test['idusuario']=24;
$test['usnombre']="prueba123";
$test['usmail']="prueba@correo.com";
$test['uspass']="12345";
$test['usdeshabilitado']="null";
$test['accion']="editar";
$objTest= new ABMUsuario();
$Rta = $objTest->abm($test);

//print_r($test);
?>