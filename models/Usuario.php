<?php

require_once 'Conexion.php';

class Usuario extends Conexion{
  public $conexion;

  public function __construct()
  {
    $this->conexion = parent::getConexion();
  }

  public function login($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_login(?)");
      $consulta->execute(
        array(
          $datos['correo']
        )
        );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }

  public function registrarUsuario($datos = []){
    try {
      $consulta = $this->conexion->prepare("CALL spu_registrar_usuario(?, ?, ?, ?, ?)");
      $consulta->execute(
        array(
          $datos['idrol'],
          $datos['apellidos'],
          $datos['nombres'],
          $datos['correo'],
          $datos['claveacceso']
        )
      );
      return $consulta->fetch(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
      die($e->getMessage());
    }
  }


}