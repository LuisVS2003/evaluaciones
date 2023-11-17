
<!doctype html>
<html lang="es">

<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>

<body>
    <div class="container mt-3">
        <div class="card">
        <div class="card-header bg-dark text-light">
            <h1>
            Tus evaluaciones
            <a href="evaluacion-registrar.php" class="btn btn-success float-end">Agregar Evaluación</a>

            </h1>
        </div>
        <div class="card-body">
        <table class="table table-hover" id="form-evaluaciones">
          <thead>
            <tr>
              <th>N°</th>
              <th>Apellidos</th>
              <th>Nombres</th>
              <th>Estado de Evaluación</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>
        </div>
        </div> 
   </div>

   <!-- Modal para mostrar información adicional -->
    <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Evaluaciones inscritas </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" >
                    <!-- Aquí mostrarás la información adicional -->
                    <table class="table">
                      <thead>
                        <tr>
                          <th>N°</th>
                          <th>Evalaucion</th>
                          <th>Calificacion</th>
                          <th>Estado</th>

                        </tr>
                      </thead>
                      <tbody id="listarmodal">

                      </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


   <?php
    $idterminator = $_GET['id']; //Encapsulndo el id en una variable (URL)
    if(empty($idterminator)):   //Comprobamos si existe un id en la URL y si no existe mandamos "NO"
    ?>

  <p>Error en capturar el ID</p>

  <?php else: ?>
  
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

    


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

  <script>
        let idUsuarioGlobal;


        document.addEventListener("DOMContentLoaded", () => {

        function $(id){
        return document.querySelector(id);
        }

        const listar = $("#form-evaluaciones tbody");

        const tablaModal = $("#listarmodal");

        function listarEvaluaciones(){
            const parametros = new FormData();
            parametros.append('operacion', 'cursoEvaluacion');
            parametros.append('campo',<?= $idterminator?>);

            fetch('../controllers/formulario.controller.php', {
                method: 'POST',
                body: parametros
            })
                .then(respuesta => respuesta.json())
                .then(datos => {
                console.log(datos);
                listar.innerHTML = '';
                nFila = 1;

                datos.forEach(registro => {
                    let nuevaFila = '';
                    nuevaFila = `
                    <tr>
                        <td>${nFila}</td>
                        <td>${registro.apellidos}</td>
                        <td>${registro.nombres}</td>
                        <td>
                          <button type="button" class="btn btn-outline-primary"
                            href="#" class="ver-info" data-bs-toggle="modal" data-bs-target="#infoModal"
                            data-info="${registro.idusuario}">Ver Evaluaciones</button>
                        </td>

                        
                    </tr>
                    `;
                    listar.innerHTML += nuevaFila;
                    nFila++; 
                });

                if (datos.length == 0) {
                    $("#form-evaluaciones").innerHTML = '<h3>No has asignado evaluaciones</h3>';
                }

                if (datos.length > 0) {
                idUsuarioGlobal = datos[0].idusuario;
                }
                listarModal();

                })
                .catch(e => {
                console.error(e);
                });
        }

        function listarModal(){
          const parametros = new FormData();
          parametros.append('operacion', 'listar_evaluaciones_x_curso');
          parametros.append('idusuario', idUsuarioGlobal);
          parametros.append('idcurso',<?= $idterminator?>);


          fetch('../controllers/evaluaciones.controller.php',{
            method: 'POST',
            body: parametros
          })
            .then(respuesta => respuesta.json())
            .then(datos => {
              console.log(datos);

               tablaModal.innerHTML = '';
               nFila = 1;
               
               datos.forEach(element => {
                  let nuevoModal = '';
                  nuevoModal = `
                  <tr>
                        <td>${nFila}</td>
                        <td>${element.nombre_evaluacion}</td>
                        <td>Por definir</td>
                        <td>Activo</td>   
                    </tr>
                  `;
                  tablaModal.innerHTML += nuevoModal;
                  nFila ++;

               });
            })
            .catch(e =>{
              console.error(e);
            })
        }

        listarEvaluaciones();


        

        })
  </script>
  <?php endif; ?>

</body>

</html>