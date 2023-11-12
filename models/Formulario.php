<?php

require_once 'Conexion.php';

class Evaluacion extends Conexion{
  private $evaluacion;

  public function __CONSTRUCT(){
    $this->evaluacion = parent::getConexion();
  }

  public function listarUsuario(){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_usuario_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage()); //Desarrollo > Producción
    }
  }

  public function listarInscritos(){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_inscritos_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage()); //Desarrollo > Producción
    }
  }

  public function registrarEvaluacion($datos = []){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_evaluaciones_registrar(?,?)");
      $consulta->execute(
        array(
          $datos['idcurso'],
          $datos['nombre_evaluacion']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } 
    catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function listarEvaluacion(){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_evaluaciones_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage()); //Desarrollo > Producción
    }
  }

  public function registrarPregunta($datos = []){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_preguntas_registrar(?,?)");
      $consulta->execute(
        array(
          $datos['idevaluacion'],
          $datos['pregunta']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } 
    catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function registrarInscrito($datos = []){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_inscritos_registrar(?,?,?,?)");
      $consulta->execute(
        array(
          $datos['idusuario'],
          $datos['idevaluacion'],
          $datos['fechainicio'],
          $datos['fechafin']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } 
    catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function listarPregunta(){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_preguntas_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage()); //Desarrollo > Producción
    }
  }

  public function registrarAlternativa($datos = []){
    try {
      $consulta = $this->evaluacion->prepare("CALL spu_alternativas_registrar(?,?,?)");
      $consulta->execute(
        array(
          $datos['idpregunta'],
          $datos['alternativa'],
          $datos['escorrecto']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } 
    catch (Exception $e) {
      die($e->getMessage());
    }
  }


}

