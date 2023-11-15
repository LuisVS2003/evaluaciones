<?php

require '../vendor/autoload.php';

require '../models/Inscritos.php';

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;


  try {

    $reporte = new Html2Pdf("P","A4","es", true, "UTF-8", array(25,15,15,15));
    $reporte->setDefaultFont("Arial");

      $desarrollador = "GRUPO - 05";

      $objeto = new Inscritos();
      $datos = $objeto->listarInscritosPDF();

    ob_start();
    include '../pdf/estilos.php';
    require_once '../pdf/reporte3-contenido.php';
    $contenido = ob_get_clean();

    $reporte->writeHTML($contenido);
    $reporte->output("lista-inscritos.pdf");


  } catch (Html2PdfException $e) {
    //Error => debemos realizar alguna accion
    $reporte->clean();
    $datosError = new ExceptionFormatter($e);
    echo $datosError->getHtmlMessage();
  }


