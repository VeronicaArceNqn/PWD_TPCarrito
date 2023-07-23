<?php
$dir="";
$titulo = "Lista Roles";
include_once $dir."../estructura/headerSeguro.php";
include_once '../../configuracion.php';

?>
<div class="container border border-secondary principal mt-3 pt-3">
   <h3 class="text-center">Listado de Roles</h3>
    <div class="row text-muted m-0">
        <?php         
        
        $objAbmRol = new ABMrol();

        $listaRol = $objAbmRol->buscar(null);
       
        if(count($listaRol)>0){
            ?>
            <table class="table table-light table-striped text-center table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th scope="col">ID Rol</th>
                        <th scope="col">Descripción</th>
                        <th scope="col"></th>
                       
                    </tr>
                </thead>
                <tbody>
                <?php
                    
                    foreach ($listaRol as $objRol) {                         
                        echo '<tr>
                        <th scope="row">'.$objRol->getIdrol().'</th>';
                        echo '
                        <td>'.$objRol->getRodescripcion().'</td>';
                        echo '<td><a href="accionBorradoLogico.php?accion=borradoLogico&idrol='.$objRol->getIdrol().'" class="btn btn-dark">Deshabilitar</a></td>';
                       
                        echo'</tr>';
                  
                     }
                    //fin foreach
                    echo '    </tbody>
                    </table>';
                }
                else{

                    echo "<h3>No hay roles registrados </h3>";
                }
                
                ?>
    </div>
    <a href="formRol.php" class="btn btn-primary mb-4">Ingresar nuevo rol</a>

</div>

<?php
include ("../../Vista/estructura/footer.php");
?>
