<?php 
 require_once "../../include/extra/navbar.php";

?>

<style>
  .zoom-image {
    transform: scale(1.1);
    transition: transform 0.3s ease;
  }
</style>
  <div class="container mt-3">
    <div class="card">
      <div class="card-header bg-dark text-light">
        <h1>
          Evaluaciones 2023
        </h1>
      </div>
      <div class="card-body">
        <div class="row mt-4" id="card-evaluaciones">
          <!--Aca hacemo el render para los cursos-->      
        </div>

      </div>
    </div>
    
  </div>

  <script src="../../javascript/sweetalert.js"></script>


  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>

  <script>
    document.addEventListener("DOMContentLoaded",()=>{
      const card = document.querySelector("#card-evaluaciones");

      function $(id){
        return document.querySelector(id)
      }

      function listarCursos(){
        const parametros = new FormData();
        parametros.append("operacion","cursoCard");

        fetch(`../../controllers/formulario.controller.php`,{
          method: "POST",
          body: parametros
        })
          .then(respuesta =>respuesta.json())
          .then(datosRecibidos =>{
            //para verufucar si los datos llegaron
            // console.log(datosRecibidos);
            if(datosRecibidos.length == 0){
              $("#card-evaluaciones").innerHTML = `<h1>Pronto tendremos más novedades</h1>`; 
            }else{
              $("#card-evaluaciones").innerHTML = ``;
              datosRecibidos.forEach(element => {
                // console.log(element);
                const p = Math.floor(Math.random() * (999 - 100 + 1)) + 100;

                const rutaImagen = `../../images/cursos/${element.curso}.jpg`;
                // console.log(rutaImagen);
                const nuevoItem = `
                  <div class="col-4 mb-3">
                    <div class="card" style="width: 100%;" heigh="100%">
                      <img src="${rutaImagen}" class="card-img-top" alt="" width="100%" height="300px">
                      <div class="card-body">
                        <p>2023-PIAD-${p}-TEC-NRC_${p}</p>
                        <h5 class="card-title">${element.curso}</h5>
                        <hr>
                        <div class="d-grid">
                          <a href="./evaluaciones-card.php?id=${element.idcurso}" class="btn btn-sm btn-primary">Lista de inscritos</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  `;
                  $("#card-evaluaciones").innerHTML += nuevoItem;
              });
            }
          })
          .catch(e=>{
            console.error(e)
          })
      }

      listarCursos();


    })
  </script>
</body>
</html>