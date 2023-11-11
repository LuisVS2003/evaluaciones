<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    foreach ($_POST as $idpregunta => $respuesta) {
        // Accede a los datos adicionales usando los atributos de datos (data-)
        $idalternativa = $_POST[$idpregunta];
        $nombreAlternativa = $_POST[$opcionId . '_alternativa'];
        $nombrePregunta = $_POST[$idpregunta . '_pregunta'];

        // Aquí puedes procesar los datos como desees
        echo "ID Pregunta: $idpregunta, ID Alternativa: $idalternativa, Nombre Pregunta: $nombrePregunta, Nombre Alternativa: $nombreAlternativa <br>";
        // Puedes almacenarlos en la base de datos, compararlos con las respuestas correctas, etc.
    }
} else {
    header("Location: tu_pagina_de_inicio.php");
    exit();
}
?>
