<div class="row">
    <div class="col-md-12 col-lg-12">
        <div class="items">
<?php
include_once "../../../configuracion.php";
$datos = data_submitted();
$objCntrlCI = new ABMcompraitem();
$suma = 0;
$objSesion = new Session();
$idusuario =$objSesion->getUsuario()->getIdusuario();
$param["idusuario"] = $idusuario;
$param["idcompraestadotipo"] = 0;
$param["cefechafin"] = "null";
$objCntrlCE = new ABMcompraestado();
//verificamos si hay una compra con estado en confección
$objEstado = $objCntrlCE->verificarEstado($param);
$idcompra=-1;
$idcompraestado=-1;
$items=[];
if($objEstado!=null)
{
  
  $idcompra=$objEstado->getObjCompra()->getIdcompra();
  $datos["idcompra"]=$idcompra;
  $idcompraestado=$objEstado->getIdcompraestado();
  $items = $objCntrlCI->buscar($datos);
}

if (count($items) > 0) {
    foreach ($items as $item) {
        ?>    
        <div class="product" style="background-color:beige;">
            <div class="row">
                <div class="col-md-2 col-sm-5 d-flex">
                                <img src="<?php echo $item->getObjProducto()->getUrlimagen(); ?>" class="img-fluid mx-auto d-flex image">
                </div>
                <div class="col-md-10 col-sm-7">
                    <div class="info">
                        <div class="row">
                            <div class="col-md-3 product-name">
                                <div class="product-name">
                                    <a href="#"><?php echo $item->getObjProducto()->getProdetalle(); ?></a>
                                    <div class="product-info">
                                        <div>Marca: 
                                            <span class="value"><?php echo $item->getObjProducto()->getPronombre(); ?></span>
                                        </div>
                                        <div>Disponibles: 
                                            <span class="value"><?php echo $item->getObjProducto()->getProcantstock() ?></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 quantity">
                                <label for="quantity">Cantidad:</label>
                                    <input id="quantity" type="number" value="<?php echo $item->getCicantidad(); ?>" class="form-control quantity-input"  onchange="cambiarCantidad(<?php echo  $item->getIdcompraitem(); ?>,this.value);" min="1" max="<?php echo $item->getObjProducto()->getProcantstock()+$item->getCicantidad(); ?>"
                                             required>
                            </div>
                            <div class="col-md-2 price">
                                $<span><?php echo $item->getObjProducto()->getPrecio(); ?></span>
                            </div>
                            <div class="col-md-2 pl-2">
                                <button class="btn btn-danger" onclick="eliminarItem(<?php echo  $item->getObjProducto()->getIdproducto(); ?>,<?php echo  $item->getIdcompraitem(); ?>,<?php echo $item->getCicantidad(); ?>)">Eliminar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
    <?php
            $suma = $suma + $item->getObjProducto()->getPrecio()*$item->getCicantidad();
        }
    } ?>
        <div class="summary">
            <h2 class="text-start fs-4" class="">Resumen</h2>
                <!--<label>ID Compra:</label>-->
            <p class="text-start fs-6">ID Compra:&nbsp;<?php echo $idcompra; ?><br>
            ID Estado compra:&nbsp;<?php echo $idcompraestado; ?></p>
            <div class="summary-item">
                <p class="text-start fs-4">Total: <span class="text-start text-success fs-4">$<?php echo $suma; ?></span></p>
            </div>
            
            <button type="button" onclick="comprar('La compra se realizo correctamente!',1)" class="btn btn-primary btn-lg btn-block">Comprar</button><br>
            
                
              
              <a class="btn btn-warning mt-4" role="button" href="../home/paginaSegura.php" >Continuar con la compra </a>
            
        </div>
        
        </div>
    </div>
</div>
