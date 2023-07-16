<?php
$dir="../";
$titulo = "Listar Men&uacute;";
include_once $dir."../Vista/estructura/headerSeguro.php";
include_once '../../configuracion.php';

?>

<div class="container border border-secondary principal mt-3 pt-3">
   <h3 class="text-center">Listado de Men&uacute; y roles</h3>
    <div class="row text-muted m-0">
        <?php        
        
        $objAbmmenu = new ABMmenu();

        $listaMenu = $objAbmmenu->buscar(null);
        //print_r($listaMenu);
        if(count($listaMenu)>0){
            ?>
            <table class="table table-light table-striped text-center table-hover" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th scope="col">ID Men&uacute;</th>
                        <th scope="col">Nombre</th>                        
                        <th scope="col">Descripción de URL</th>
                        <th scope="col">Hab/Deshabilitado</th>                      
                        <th scope="col"></th>
                                    
                    </tr>
                </thead>
            <tbody>
            <?php
                    
            foreach ($listaMenu as $objMenu) {                         
                echo '<tr>
                        <th scope="row">'.$objMenu->getIdmenu().'</th>';
                        echo '<td>'.$objMenu->getMenombre().'</td>';
                        echo '<td>'.$objMenu->getMedescripcion().'</td>';
                        echo '<td>'.$objMenu->getMedeshabilitado().'</td>';
                        if($objMenu->getMedeshabilitado()==null){
                            echo '<td><a href="asignarMenu.php?idmenu='.$objMenu->getIdmenu().'" class="btn btn-success">Dar rol</a></td>';
                        }else{
                            echo '<td></td>';
                        }
                echo'</tr>';                  
                     }
                    //fin foreach
            echo '</tbody>
            </table>';
            }
            else{
                echo "<h3>No hay menú registrado </h3>";
                }                
            ?>   
        
</div>

</div>
<div>
<?php
include ("../../Vista/estructura/footer.php");
?>
</div>