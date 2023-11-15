<?php

require_once 'Conexion.php';

class Inscritos extends Conexion{
  private $inscritos;

  public function __CONSTRUCT(){
    $this->inscritos = parent::getConexion();
  }


  public function listarInscritosPDF(){
    try {
      $consulta = $this->inscritos->prepare("CALL spu_inscritos_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }


}
