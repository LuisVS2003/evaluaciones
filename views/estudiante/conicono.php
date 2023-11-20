<?php
session_start();

$idterminator = $_GET['id'];

if (empty($idterminator)) :
?>
    <p>Error en capturar el ID</p>
<?php else : ?>
    <?php
    $idcurso = $_GET['id']; // Almacena el valor de 'id' en la variable $idcurso
    $idusuario = isset($_GET['idu']) ? $_GET['idu'] : null; // Almacena el valor de 'idu' en la variable $idusuario
    ?>

    <!DOCTYPE html>
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
                    <h1>Tus evaluaciones</h1>
                </div>
                <div class="card-body" id="form-evaluaciones">

                </div>
            </div>
        </div>

        <?php
        if (isset($idusuario) && isset($idcurso)) :
        ?>
            <!-- Bootstrap JavaScript Libraries -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous">
            </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
                crossorigin="anonymous">
            </script>

            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    function $(id) {
                        return document.querySelector(id);
                    }

                    const listar = $("#form-evaluaciones");

                    function listarEvaluaciones() {
                        const parametros = new FormData();
                        parametros.append('operacion', 'listar_evaluaciones_x_curso');
                        parametros.append('idusuario', <?= $idusuario ?>);
                        parametros.append('idcurso', <?= $idcurso ?>);

                        fetch('../../controllers/evaluaciones.controller.php', {
                                method: 'POST',
                                body: parametros
                            })
                            .then(respuesta => respuesta.json())
                            .then(datos => {
                                console.log(datos);
                                listar.innerHTML = '';
                                nFila = 1;

                                datos.forEach(registro => {
                                    let fechaInicio = registro.fechainicio == null ? "Fecha no Definida" : registro.fechainicio;
                                    let fechaFin = registro.fechafin == null ? "Fecha no Definida" : registro.fechafin;

                                    let nuevaFila = '';
                                    nuevaFila = `
                                        <div class="card mt-3">
                                            <div class="row">
                                                <div class="col-10">
                                                    <h5 class="card-header">${registro.nombre_evaluacion}</h5>
                                                    <div class="card-body">
                                                        <h5 class="card-title">${fechaInicio} - ${fechaFin}</h5>
                                                        <p class="card-text">Antes de revisar los materiales de la Tarea ${nFila}, revisa el contenido del Manual del Curso, para poder desarrollar las actividades.</p>
                                                        <a id="link-${registro.idinscrito}" href="./listapreguntas.php?id=${registro.idevaluacion}&inscrito=${registro.idinscrito}&idu=<?= $idusuario ?>" class="btn btn-primary">Rendir</a>
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <h3 id="inscrito-${registro.idinscrito}"></h3>
                                                </div>

                                            </div>
                                        </div>
                                    `;
                                    listar.innerHTML += nuevaFila;
                                    nFila++;
                                    notaContar(registro.idinscrito);
                                });

                                if (datos.length == 0) {
                                    listar.innerHTML = '<h3>No tienes evaluaciones asignadas</h3>';
                                }
                            })
                            .catch(e => {
                                console.error(e);
                            });
                    }


                    function notaContar(idInscrito) {
                        const parametros = new FormData();
                        parametros.append('operacion', 'respuestasMarcadas');
                        parametros.append('idinscrito', idInscrito);

                        fetch('../../controllers/pregunta.controller.php', {
                            method: 'POST',
                            body: parametros
                        })
                        .then(respuesta => respuesta.json())
                        .then(datos => {
                            console.log(datos);
                            const inscritoElement = $(`#inscrito-${idInscrito}`);
                            const linkElement = $(`#link-${idInscrito}`);

                            inscritoElement.innerHTML = '';

                            if (datos.length === 0) {
                                inscritoElement.innerHTML = 'No has realizado esta evaluación';
                            } else {
                                datos.forEach(registro => {
                                    inscritoElement.innerHTML = `Nota: ${registro.marcados} / ${registro.puntos_totales}`;
                                    
                                    // Cambiar el estilo del botón
                                    linkElement.classList.add('btn-secondary', 'disabled');  // Añadir la clase 'btn-secondary' (gris oscuro) y 'disabled'
                                    linkElement.innerHTML = 'Evaluación Realizada ';

                                    // Agregar emoji de check verde
                                    linkElement.innerHTML += '✅';
                                });
                            }
                        })
                        .catch(e => console.error(e));
                    }

                    listarEvaluaciones();
                })
            </script>
        <?php endif; ?>

    </body>

    </html>
<?php endif; ?>
