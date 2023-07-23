<?php
$dir="../";
$titulo = "Gestión Usuarios";
include_once $dir."../Vista/estructura/headerSeguro.php";
include_once '../../configuracion.php';

?>

  <div class="container border border-secondary principal mt-3 pt-3">
    <h3 class="text-center">Listado de Usuarios</h3>
      <div id="listarUsuario" class="row text-muted m-0">
    // aquí se carga el listado de usuario para dar rol o deshabilitar
      </div>    
  </div>

       
</div>
   
    <script type="text/javascript" src="../js/usuario/listarUsuario.js">
  </script>
<?php
include ("../../Vista/estructura/footer.php");
?>
