<?php

require_once 'Conexion.php';

class Preguntas extends Conexion{
  private $conexion;

  public function __construct(){
    $this->conexion = parent::getConexion();
  }

  public function evaluacionPreguntas($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_evaluacion_preguntas(?)");
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

  public function evaluacionAlternativas($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_preguntas_alternativas(?)");
      $consulta->execute(
        array(
          $datos['idpregunta']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function alternativasCorrecta($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_alternativas_correctas(?)");
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

  public function respuestasRegistrar($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_respuestas_registrar(?,?)");
      $consulta->execute(
        array(
          $datos['idinscrito'],
          $datos['idalternativa']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function respuestasMarcdas($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_respuestas_marcadas(?)");
      $consulta->execute(
        array(
          $datos['idinscrito']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

}