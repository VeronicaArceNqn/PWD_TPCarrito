<?php 
$dir="";
$titulo =" Registro Rol ";
include_once $dir."../estructura/headerSeguro.php";

?>

<div class="container mt-3 pt-3">
 <div class="card mb-3">
 <div class="row g-0 d-flex align-items-center">
    <div class="col-lg-6">
    <div class="card-body py-5 px-md-5">

       
        <form class="needs-validation" id="form1" name="form1" method="post" action="accion/alta_rol.php">
            <div class="form-group mb-4">
                <h5>Ingrese nuevo rol</h5>
                <label for="rodescripcion">Descripción del Rol</label>
                <input type="text" class="form-control mt-1" id="rodescripcion" name="rodescripcion" placeholder="" required>
            </div>
            
            
            <input id="accion" name="accion" value="nuevo" type="hidden">
            <button type="submit" class="btn btn-primary mb-4">Registrar</button>

            
        </form>
       
    </div>
    </div>
 </div>
 
 </div>
 <a href="../rol/ListarRol.php" class="easyui-linkbutton" style="padding:5px; background-color:#0d6efd;color:white;" data-options="plain:true">Volver</a>
</div>

 <?php
include_once $dir."../estructura/footer.php";
?>
</div>