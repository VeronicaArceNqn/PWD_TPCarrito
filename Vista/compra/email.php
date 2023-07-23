<?php
$dir="../";
$titulo = "Enviar correo";
include_once "../../configuracion.php";
include_once $dir."../Vista/estructura/headerSeguro.php";
  
$datos=data_submitted();

$idcompra = $datos['idcompra'];
$msj = $datos['mensaje'];
$objUsuario=new ABMUsuario(); 
$param['idusuario']=$datos['idusuario'];
$cliente = $objUsuario->buscar($param);

foreach($cliente as $uncliente){
    $nombre=$uncliente->getUsnombre();
    $email=$uncliente->getusmail();   
}
$objCompraitem=new ABMcompraitem();
$param['idcompra']=$datos['idcompra'];
$compra = $objCompraitem->buscar($param);

foreach($compra as $unacompra){
    $productocant = $unacompra->getCicantidad();
    $productoItem = $unacompra->getidcompraitem();
    $prodNombre = $unacompra->getobjProducto()->getpronombre();    
}
    ?>
 <div class="d-flex justify-content-center align-items-center">  
    <div class="row d-flex justify-content-center">
        <div class="container border border-secondary principal m-3 p-3">
            <h3 class="text-center">Notificación al cliente</h3>   
               
                    <form id="email" action="../email/configMail.php" method="POST">
                            <p><strong>Nombre del cliente </strong>
                                <input type="text" class="form-control" name="name" value="<?php echo $nombre; ?>" size="50" required readonly></p>
                            <p><strong>Correo electrónico </strong>
                                <input type="email" class="form-control" name="email" value="<?php echo $email ;?>" size="50" required readonly></p>
                            
                            <p><strong>Pedido N° </strong>
                                <input type="text"  name="idcompra" value="<?php echo $idcompra; ?>" required readonly></p>
                            <?php foreach($compra as $unacompra){ ?>
                                <p><strong>Producto</strong> 
                                    <input type="text" name="pronombre" value="<?php echo $unacompra->getobjProducto()->getpronombre(); ?>" size="40" required readonly></p>
                                <p><strong>Cantidad </strong>
                                    <input type="text" name="cantidad" value="<?php echo $unacompra->getCicantidad(); ?>" required readonly></p>
                            <?php } ?>
                            <p><strong>Novedades del pedido: </strong>
                                <textarea name="comment" class="form-control" id="" cols="60" rows="3" required><?php echo $msj.' Gracias por elegirnos' ;?></textarea></p>
                            <p class="p-2 text-center"><input type="submit" class="text-white border-primary border-rounded-3" style="background-color: #0d6efd;font-size: 16px;" value="Enviar correo"></p>
                    </form>
                
         
        </div>
    </div>
</div>
    
<?php
include ("../../Vista/estructura/footer.php");
?>

