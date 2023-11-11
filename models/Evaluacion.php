<?php

require_once 'Conexion.php';

class Evaluacion extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listar(){
    try {
      $consulta = $this->conexion->prepare("CALL spu_listar_alternativas()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage()); //Desarrollo > Producción
    }
  }

  public function listarEvaluaciones($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_evaluaciones_usuario_listar(?)");
      $consulta->execute(
        array(
          $datos['idusuario']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function preguntasAlternativas($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_evaluaciones_preguntas_listar(?)");
      $consulta->execute(
        array(
          $datos['idevaluacion']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function asignarNota($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_nota_actualizar(?,?)");
      $consulta->execute(
        array(
          $datos['idevaluacion'],
          $datos['nota']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

}

