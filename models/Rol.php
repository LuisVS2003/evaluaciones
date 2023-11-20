<?php

require_once 'Conexion.php';

class Rol extends Conexion{
  private $rol;

  public function __CONSTRUCT(){
    $this->rol = parent::getConexion();
  }

  

  public function listarRoles(){
    try {
      $consulta = $this->rol->prepare("CALL spu_roles_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }


}

  