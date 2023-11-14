<?php

require_once 'Conexion.php';

class Informe extends Conexion{
  private $informe;

  public function __CONSTRUCT(){
    $this->informe = parent::getConexion();
  }

  

  public function mostrarResumen(){
    try {
      $consulta = $this->informe->prepare("CALL spu_informes_resumen()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }


}

  