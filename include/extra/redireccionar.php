<?php

session_start();
echo $_SESSION['idrol'];

if ($_SESSION['idrol'] == 1) {
  header("Location: ../../views/docente/indexdocente.php");
} elseif ($_SESSION['idrol'] == 2) {
  header("Location: ../../views/estudiante/index.php");
} else {
  echo "<h1>ERROR</h1>";
}