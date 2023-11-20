<?php

require_once 'Conexion.php';

class Inscritos extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }


  public function listarInscritosPDF(){
    try {
      $consulta = $this->conexion->prepare("CALL spu_inscritos_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function inscritosRegistrar($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_inscritos_registrar(?, ?)");
      $consulta->execute(
        array(
          $datos['idusuario'],
          $datos['idevaluacion']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function actualizar_fecha_inicio($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_actualizar_fecha_inicio(?,?,?)");
      $consulta->execute(
        array(
          $datos['idinscrito'],
          $datos['idevaluacion'],
          $datos['fechainicio']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function actualizar_fecha_fin($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_actualizar_fecha_fin(?,?,?)");
      $consulta->execute(
        array(
          $datos['idinscrito'],
          $datos['idevaluacion'],
          $datos['fechafin']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }
  //------------------------------------------------------------------------------------
  public function buscar_inscrito($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_buscar_inscrito(?,?)");
      $consulta->execute(
        array(
          $datos['idusuario'],
          $datos['idevaluacion']
        )
        );
        return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }
  
  //------------------------------------------------------------------------------------
}
