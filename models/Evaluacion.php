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
      $consulta = $this->conexion->prepare("CALL spu_evaluaciones_estudiante_listar(?)");
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

  public function evaluacionRegistrar($datos = []){
    try {
      //code...
      $consulta = $this->conexion->prepare("CALL spu_evaluaciones_registrar(?,?,?,?,?)");
      $consulta->execute(
        array(
          $datos['idcurso'],
          $datos['idusuario'],
          $datos['nombre_evaluacion'],
          $datos['fechainicio'],
          $datos['fechafin']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function preguntasRegistrar($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_preguntas_registrar(?,?,?)");
      $consulta->execute(
        array(
          $datos['idevaluacion'],
          $datos['pregunta'],
          $datos['puntos']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function alternativasRegistrar($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_alternativas_registrar(?, ?, ?)");
      $consulta->execute(
        array(
          $datos['idpregunta'],
          $datos['alternativa'],
          $datos['escorrecto']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  function evaluacionesDocente($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_evaluaciones_docente_listar(?,?)");
      $consulta->execute(
        array(
          $datos['iddocente'],
          $datos['idcurso']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }



  // ---------------------------------------------------------
  //Harold
  public function listar_evaluaciones_x_curso($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_listar_evaluaciones_x_curso(?,?)");
      $consulta->execute(
        array(
          $datos['idusuario'],
          $datos['idcurso']
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }
  //---------------------------------------------------------

}

