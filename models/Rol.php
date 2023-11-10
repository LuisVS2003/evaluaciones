<? 

require_once 'Conexion.php';

class Rol extends Conexion{
  private $conexion;

  // Instancia de la conexcion
  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listar(){
    try {
      $consulta = $this->conexion->prepare("Falta la base de datos");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } 
    catch (Exception $e) {
      die ($e->getMessage());
    }
  }
}