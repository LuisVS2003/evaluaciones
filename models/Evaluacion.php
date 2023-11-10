<?php

require_once 'Conexion.php';

class Evaluacion extends Conexion{
  private $evaluacion;

  public function __CONSTRUCT(){
    $this->evaluacion = parent::getConexion();
  }

  public function listar(){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_listar_alternativas()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage()); //Desarrollo > Producción
    }
  }

}

