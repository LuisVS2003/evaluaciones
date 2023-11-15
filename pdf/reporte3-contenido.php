<?php
  //require_once 'reporte3.php'
?>


<page>


  <h1 class="fs-5 text-center text-bold mb-3" >Bienvenidos a SENATI</h1>
    <h3 class="mt-3 mb-3 text-center text-italic">Desarrolado por <?=$desarrollador?></h3>
  
    <p class="mb-3 text-justify">
    Este informe presenta una lista detallada de los estudiantes que se encuentran actualmente inscritos en los exámenes del sistema de evaluaciones. La información proporcionada incluye los nombres y apellidos de los estudiantes, así como detalles específicos sobre los exámenes en los que están participando.
    A continuación, se presenta un resumen de los estudiantes inscritos:
    </p>
  
    <table class="table">
      <colgroup>
        <col style="width: 35%;">
        <col style="width: 25%;">
        <col style="width: 20%;">
        <col style="width: 20%;">
      </colgroup>
      <thead>
        <tr class="bg-info">
          <th>Nombre de la evaluacion</th>
          <th>Nombre del Inscrito</th>
          <th>Fecha de Inicio</th>
          <th>Fecha de Cierre</th>
        </tr>
      </thead>
      <tbody class="text-center">
        <?php foreach($datos as $dato):?>
          <tr>
            <td><?=$dato['nombre_evaluacion']?></td>
            <td><?=$dato['nombre_completo']?></td>
            <td><?=$dato['fechainicio']?></td>
            <td><?=$dato['fechafin']?></td>
          </tr>
        <?php endforeach?>
      </tbody>
    </table>
</page>

<!--Por si queremos otra pagina-->
<!-- <page>
  <ul>
    <?php //foreach($carreras as $carrera):?>
      <li><?php //$carrera?></li>
    <?php //endforeach?>
  </ul>
</page> -->
