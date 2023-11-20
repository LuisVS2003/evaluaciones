<?php

require_once '../models/Inscritos.php';

if (isset($_POST['operacion'])){

  $inscritos = new Inscritos();

  switch ($_POST['operacion']) {

      case 'listar':
        echo json_encode($inscritos->listarInscritosPDF());
        break;
      
      case 'registrar':
        $datos = [
          'idusuario'     => $_POST['idusuario'],
          'idevaluacion'  => $_POST['idevaluacion']
        ];
        echo json_encode($inscritos->inscritosRegistrar($datos));
      break;
      case 'actualizar_fecha_inicio_evaluacion':
        $datos = [
          'idinscrito'      => $_POST['idinscrito'],
          'idevaluacion'    => $_POST['idevaluacion'],
          'fechainicio'     => $_POST['fechainicio']
        ];
        echo json_encode($inscritos->actualizar_fecha_inicio($datos));
        break;
      case 'actualizar_fecha_fin_evaluacion':
        $datos = [
          'idinscrito'      => $_POST['idinscrito'],
          'idevaluacion'    => $_POST['idevaluacion'],
          'fechafin'        => $_POST['fechafin']
        ];
        echo json_encode($inscritos->actualizar_fecha_fin($datos));
        break;
        //------------------------------------------------------------------------------------
      case 'buscar_inscrito':
        $datos = [
          'idusuario'     => $_POST['idusuario'],
          'idevaluacion'  => $_POST['idevaluacion']
        ];
        echo json_encode($inscritos->buscar_inscrito($datos));
        break;
        //------------------------------------------------------------------------------------
      }

}