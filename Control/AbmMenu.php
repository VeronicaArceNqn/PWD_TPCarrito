<?php
class AbmMenu{
 
 
    /**
     * Espera como parametro un arreglo asociativo donde las claves coinciden con los nombres de las variables instancias del objeto
     * @param array $param
     * @return Tabla
     */
    private function cargarObjeto($param){
        $obj = null;
           
        if( array_key_exists('idmenu',$param) and array_key_exists('menombre',$param)){
            $obj = new Menu();
            $objmenu = null;
            if (isset($param['idpadre'])){
                $objmenu = new Menu();
                $objmenu->setIdmenu($param['idpadre']);
                $objmenu->cargar();
                
            }
            if(!isset($param['medeshabilitado'])){
                $param['medeshabilitado']=null;
            }else{
                $param['medeshabilitado']= date("Y-m-d H:i:s");
            }
            $obj->setear($param['idmenu'], $param['menombre'],$param['medescripcion'],$objmenu,$param['medeshabilitado']); 
        }
        return $obj;
    }
    
    /**
     * Espera como parametro un arreglo asociativo donde las claves coinciden con los nombres de las variables instancias del objeto que son claves
     * @param array $param
     * @return Tabla
     */
    private function cargarObjetoConClave($param){
        $obj = null;
        
        if( isset($param['idmenu']) ){
            $obj = new Menu();
            $obj->setIdmenu($param['idmenu']);
        }
        return $obj;
    }
    
    
    /**
     * Corrobora que dentro del arreglo asociativo estan seteados los campos claves
     * @param array $param
     * @return boolean
     */
    
    private function seteadosCamposClaves($param){
        $resp = false;
        if (isset($param['idmenu']))
            $resp = true;
        return $resp;
    }
    
    /**
     * 
     * @param array $param
     */
    public function alta($param){
        $resp = false;
        $param['idmenu'] =null;
        $param['medeshabilitado'] = null;
        $elObjtTabla = $this->cargarObjeto($param);
//        verEstructura($elObjtTabla);
        if ($elObjtTabla!=null and $elObjtTabla->insertar()){
            $resp = true;
        }
      return $resp;
     
    }
    public function alta_rol($param){
        $resp = false;
        if(isset($param['idmenu']) && isset($param['idrol'])){
            $elObjtMenu = new MenuRol();
            $elObjtMenu->setearConClave($param['idmenu'],$param['idrol']);
            $resp = $elObjtMenu->insertar();
           

        }
       
        return $resp;
        
    }
    public function borrar_rol($param){
        $resp = false;
        if(isset($param['idmenu']) && isset($param['idrol'])){
            $elObjtMenu = new MenuRol();
            $elObjtMenu->setearConClave($param['idmenu'],$param['idrol']);
            $resp = $elObjtMenu->eliminar();
            
        }
       
        return $resp;
        
    }
          /**
     * permite eliminar un objeto 
     * @param array $param
     * @return boolean
     */
    
    public function bajaLogica($param){
        $resp = false;
        if ($this->seteadosCamposClaves($param)){
            $elObjUsuario = $this->cargarObjetoConClave($param);
            if($elObjUsuario!=null and $elObjUsuario->modificar("borradoLogico")){
                $resp = true;
            }
        }
        return $resp;
    }
    /**
     * permite eliminar un objeto 
     * @param array $param
     * @return boolean
     */
    public function baja($param){
        $resp = false;
      
        if ($this->seteadosCamposClaves($param)){
            $elObjtTabla = $this->cargarObjetoConClave($param);
            if ($elObjtTabla!=null and $elObjtTabla->eliminar()){
                $resp = true;
            }
        }
        
        return $resp;
    }
    
    /**
     * permite modificar un objeto
     * @param array $param
     * @return boolean
     */
    public function modificacion($param){
       
        $resp = false;
        if ($this->seteadosCamposClaves($param)){
            $elObjtMenu = $this->cargarObjeto($param);
            if($elObjtMenu!=null and $elObjtMenu->modificar("")){
                $resp = true;
            }
        }
        return $resp;
    }

    public function darRoles($param){
        $where = " true ";
        if ($param<>NULL){
            if  (isset($param['idmenu']))
                $where.=" and idmenu =".$param['idmenu'];
            if  (isset($param['idrol']))
                 $where.=" and idrol ='".$param['idrol']."'";
        }
        $obj = new MenuRol();
        $arreglo = $obj->listar($where);
        //echo "Van ".count($arreglo);
        return $arreglo;
    }
    
    /**
     * permite buscar un objeto
     * @param array $param
     * @return array
     */
    public function buscar($param){
        $where = " true ";
        if ($param<>NULL){
            if  (isset($param['idmenu']))
                $where.=" and idmenu =".$param['idmenu'];
            if  (isset($param['menombre']))
                 $where.=" and menombre ='".$param['menombre']."'";
            if  (isset($param['medescripcion']))
                 $where.=" and medescripcion ='".$param['medescripcion']."'";
            if  (isset($param['idpadre']))
                $where.=" and idpadre =".$param['idpadre'];
            if  (isset($param['medeshabilitado']))
                 $where.=" and medeshabilitado ='".$param['medeshabilitado']."'";
        }

        $arreglo = Menu::listar($where); 
      return $arreglo;
            
            
      
        
    }
   
}
?>