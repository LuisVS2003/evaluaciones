<?php

require_once '../models/Conexion.php';

class Restablecer extends Conexion{
    private $conexion;
  
    public function __CONSTRUCT(){
      $this->conexion = parent::getConexion();
    }
  
    public function registrarToken($datos = []){
      try {
        $consulta = $this->conexion->prepare("CALL spu_registra_token(?,?)");
        $consulta->execute(
            array(
                $datos['correo'],
                $datos['token']
            )
        );
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
      }
      catch(Exception $e){
        die($e->getMessage());
      }
    }

    public function buscarToken($datos = []){
      try {
        $consulta = $this->conexion->prepare("CALL spu_buscar_token(?,?)");
        $consulta->execute(
          array(
            $datos['correo'],
            $datos['token']
          )
        );
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
      } catch (Exception $e) {
        die($e->getMessage());
      }
    }

    public function cambiarpass($datos = []){
      try {
        $consulta = $this->conexion->prepare("CALL spu_actualizar_pass(?,?,?)");
        $consulta->execute(
          array(
            $datos['correo'],
            $datos['token'],
            $datos['claveacceso']
          )
        );
        return $consulta->fetchAll(PDO::FETCH_ASSOC);
      } catch (Exception $e) {
        die($e->getMessage());
      }
    }
  }