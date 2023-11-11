<!doctype html>
<html lang="es">

<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- SweetAlert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <form action="" id="frm-login">
            <input type="email" class="form-control mt-3" id="email" placeholder="Email">
            <input type="password" class="form-control mt-3" id="claveacceso" placeholder="Contraseña">
            <button class="btn btn-primary mt-3" type="submit">Login</button>
            <!--Para mas estilos hacer un evento click-->
            <a href="recuperar.php">Ingresar para recuperar</a>
          </form>
        </div>
      </div>
    </div>

    <!--Alerta de bienvenida-->
    <script>
      function bienvenida(mensaje){
      const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 2000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.addEventListener('mouseenter', Swal.stopTimer)
          toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
      })

      Toast.fire({
        icon: 'success',
        title: mensaje
          })
        }
    </script>

    <script>
      document.addEventListener("DOMContentLoaded",()=>{
        function $(id){
          return document.querySelector(id);
        }

        $("#frm-login").addEventListener("submit",(event)=>{
          event.preventDefault();
          login();
        });

        function login(){
          const parametros = new FormData();
          parametros.append("operacion","login");
          parametros.append("correo",$("#email").value);
          parametros.append("claveacceso",$("#claveacceso").value);

          fetch(`./controllers/usuario.controller.php`,{
            method: "POST",
            body: parametros
          })
            .then(respuesta => respuesta.json())
            .then(data =>{
              console.log(data)
              if(data.acceso == true){
                bienvenida(`¡Inicio de session Exitoso!`);
                setTimeout(function(){
                  window.location.href = './views/index.php'
                },2000);               
              }
              
            })
            .catch(e =>{
              console.error(e)
            });
        }


        



      });

    </script>
  



  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>