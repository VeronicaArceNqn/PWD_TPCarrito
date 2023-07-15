<?php 
include_once "../../../configuracion.php";
$data = data_submitted();
$respuesta = false;
if ($data['usnombre']!="null" && $data['usmail']!="null"){
  if (isset($data['usnombre'])){
          $objC = new ABMUsuario();
          $objUsuario = $objC->buscar(['usnombre'=>$data['usnombre']]);
          
          print_r($data);
          print_r(count($objUsuario));
          if (count($objUsuario)>0){
          
              $mensaje = " La accion  ALTA No pudo concretarse";              
          }
          else{
            $objUsuario = $objC->alta($data);
              $datos["idusuario"]=$objUsuario->getidusuario();
              //le asignamos rol de cliente
              $datos["idrol"]=2;
              $okRol = $objC->alta_rol($datos); 
              print_r($okRol);
              if($okRol)
                {
                  $respuesta=$okRol;
                  $mensaje = " Datos ingresados correctamente";
                }        
          }
  }  
}else{
  $mensaje = " Complete los datos en el formulario";
}
$retorno['respuesta'] = $respuesta;
if (isset($mensaje)){
    
    $retorno['errorMsg']=$mensaje;
   
}
 echo json_encode($retorno);
?>