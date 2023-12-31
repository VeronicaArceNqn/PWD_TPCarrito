<?php 
$dir="../";
$titulo =" Asignar menuRol ";
include_once $dir."../Vista/estructura/headerSeguro.php";
include_once '../../configuracion.php';
$objAbmMenu = new AbmMenu();
$datos =data_submitted();
$obj = null;
//print_r ($datos);
//echo $datos['idusuario'];
$msj="";
if (isset($datos['idmenu'])){
    $listaMenu = $objAbmMenu->buscar($datos);
    //print_r($listaMenu);
    if (count($listaMenu)==1){
        $obj= $listaMenu[0];

        //print_r($obj);
    }
}else{
    $msj="No se envío ningún menu";
    echo("<script>location.href = 'permisosMenu.php';</script>");
}

?>
<script type="text/javascript" src="../js/menu/asignarMenu.js">
</script>
<div class="container mt-3 pt-3">
    <div class="card mb-3">
        <div class="row g-0 d-flex align-items-center">
            <div class="col-lg-12">
                <div class="card-body py-5 px-md-5">
                    <form class="needs-validation" id="form1" name="form1">
                        <div class="form-group mb-4">
                            <h5>Dar Men&uacute;</h5>
                            <?php echo $msj;?>
                                <input type="text" class="form-control" id="idmenu" name="idmenu" placeholder="" value="<?php echo $obj->getIdmenu()?>" readonly required hidden>
                            <label for="menombre">ID Men&uacute;</label>
                                <input type="text" class="form-control" id="menombre" name="menombre" placeholder="" value="<?php echo $obj->getMenombre()?>" readonly required>
                        </div>
                        <div class="form-group mb-4">
                            <label for="medescripcion">Descripci&oacute;n</label>
                                <input type="text" class="form-control" id="medescripcion" name="medescripcion" aria-describedby="emailHelp" placeholder="" value="<?php echo $obj->getMedescripcion()?>" readonly required>
                        </div>
                        <?php
                            $objr = new ABMRol();
                            $listaRol = $objr->buscar(null);
                        ?>
                            <div class="row float-right">
                                <div class="col-md-12 float-right">
                                    <?php 
                                        if( count($listaRol)>0){
                                            foreach ($listaRol as $obj) {
                                                ?>
                                                <a class="btn btn-success m-2" role="button" href="javascript:void(0)" onclick="darRol(<?php echo $obj->getidrol();?>,<?php echo $datos['idmenu'];?>)">Dar Rol <?php echo $obj->getrodescripcion();?></a>
                                            <?php
                                            }
                                        }
                                    ?>
                                </div>
                            </div>
                        <div class="form-group mb-4">
                            <?php
                                $listaTabla = $objAbmMenu->darRoles($datos);
                            ?>
                            <div class="table-responsive">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                <tbody>
                    
                                        <?php
                                if( count($listaTabla)>0){
                                    foreach ($listaTabla as $objTabla) {
                                        echo '<tr>
                                            <td>'.$objTabla->getobjrol()->getidrol().'</td>';
                                            echo '<td>'.$objTabla->getobjrol()->getrodescripcion().'</td>';
                                        ?>
                                            <td><a class="btn btn-danger" role="button" href="javascript:void(0)" onclick="eliminarRol(<?php echo $objTabla->getobjrol()->getidrol();?>,<?php echo $objTabla->getObjMenu()->getIdMenu();?>)">Quitar Rol </a></td>
                                        </tr>
                                <?php
                                   }
                                }

                                ?>
                                </tbody>
                                </table>                                
                            </div>                            
                        </div>
                        <a class="btn btn-secondary" role="button" href="permisosMenu.php" >Volver </a>    
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
include ("../../Vista/estructura/footer.php");
?>
</div>