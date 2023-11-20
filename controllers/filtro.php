<?php	

  $texto = "<script>while(true){alert('Has sido hackeado')}</script>";

    

  function filtrarMejorado($cadenaEntrada){
    $caracteresProhibidos = array("<",">","*","/","{","}","[","]",";",",",".","(",")","\"","'");
    $caracteresReemplazar= array("");
    return str_replace($caracteresProhibidos, $caracteresReemplazar, $cadenaEntrada);
  }

  // FILTRO 2.0 
  function filtroPremium($cadenaEntrada) {
    return htmlspecialchars($cadenaEntrada, ENT_QUOTES, 'UTF-8');
  }

  $textoFiltrado = filtroPremium($texto);
  echo $textoFiltrado;

  
?>