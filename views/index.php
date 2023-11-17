<?php 
 require_once "./navbar.php";



// Verifica si el usuario ha iniciado sesión y tiene un idusuario
if (isset($_SESSION['idusuario'])) {
    $idUsuarioSesion = $_SESSION['idusuario'];
} else {
    // Si no hay un idusuario en la sesión, redirige al usuario al inicio de sesión
    header("Location:borra.php");
    exit();
}
?>

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

  <script src="../javascript/sweetalert.js"></script>


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

      function listarEvaluaciones(){
        const parametros = new FormData();
        parametros.append("operacion","listarCurso");
        parametros.append("idusuario",<?php echo $idUsuarioSesion; ?>)

        fetch(`../controllers/formulario.controller.php`,{
          method: "POST",
          body: parametros
        })
          .then(respuesta =>respuesta.json())
          .then(datosRecibidos =>{
            //para verufucar si los datos llegaron
            console.log(datosRecibidos);
            if(datosRecibidos.length == 0){
              $("#card-evaluaciones").innerHTML = `<h1>Pronto tendremos más novedades</h1>`; 
              
            }else{
              $("#card-evaluaciones").innerHTML = ``;
              datosRecibidos.forEach(element => {
                const p = Math.floor(Math.random() * (999 - 100 + 1)) + 100;

                const numeroAleatorio = Math.floor(Math.random() * 5 )+ 1;
                const rutaImagen = `../images/cursos/${numeroAleatorio}.jpg`;
                //Renderizado
                const nuevoItem = `
                  <div class="col-4 mb-3">
                    <div class="card" style="width: 100%;" heigh="100%">
                      <img src="${rutaImagen}" class="card-img-top" alt="" width="100%" height="300px">
                      <div class="card-body">
                        <p>2023-PIAD-${p}-TEC-NRC_...</p>
                        <h5 class="card-title">${element.curso}</h5>
                        <p>Abrir</p>
                        <hr>
                        <div class="d-grid">
                          <a href="./listar-evaluaciones.php?id=${element.idcurso}&idu=${element.idusuario}" class="btn btn-sm btn-primary">Ver evaluaciones</a>
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

      listarEvaluaciones();


    })
  </script>
</body>
</html>