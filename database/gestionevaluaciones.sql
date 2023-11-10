DELIMITER $$
CREATE PROCEDURE spu_listar_usuario()
BEGIN
  SELECT
      USU.idusuario,
      ROL.rol,
      USU.apellidos,
      USU.nombres,
      USU.correo
      FROM usuarios USU
      INNER JOIN roles ROL ON ROL.idrol = USU.rol
      WHERE USU.inactive_at IS NULL;
END $$

DELIMITER $$
CREATE PROCEDURE spu_registrar_usuario(
  IN _idrol  INT,
  IN _idinscrito INT,
  IN _idevaluacion INT,
  IN _apellidos VARCHAR(45),
  IN _nombres VARCHAR(45),
  IN _correo VARCHAR(90),
  IN _claveacceso VARCHAR(90)
)
BEGIN
    INSERT INTO usuarios
      (idrol, idinscrito, idevaluacion, apellidos, nombres, correo, claveacceso)
    VALUES
    (_idrol, _idinscrito, _idevaluacion, _apellidos, _nombres, _correo, _claveacceso);
    
    SELECT @@last_insert_id 'idusuario';
END $$
-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_roles_listar()
BEGIN
	SELECT 
		idrol,
		rol FROM roles
		WHERE inactive_at IS NULL;
END $$

-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_evaluacioes_registrar(
	IN _idusuario INT,
    IN _nombreevaluacion VARCHAR(45),
    IN _fechainicio DATETIME,
    IN _fechafin	DATETIME
)
BEGIN
	INSERT INTO evaluaciones
    (idusuario, nombreevaluacion, fechainicio, fechafin)
    VALUES
    (_idusuario, _nombreevaluacion, _fechainicio, _fechafin);
    
    SELECT @@last_insert_id 'idevaluacion';
END $$

-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_listar_preguntas()
BEGIN
	SELECT 
		idpregunta,
        pregunta
        FROM preguntas
        WHERE inactive_at IS NULL;
END $$

DELIMITER $$
CREATE PROCEDURE spu_preguntas_registrar(
	IN _idevaluacion INT,
	IN _pregunta TEXT
)
BEGIN
	INSERT INTO preguntas
    (idevaluacion, pregunta)
    VALUES
    (_idevaluacion, _pregunta);
    
    SELECT @@last_insert_id 'idpregunta';
END $$

-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_listar_alternativas()
BEGIN
	SELECT 
		idalternativa,
        alternativa
        FROM alternativas
        WHERE inactive_at IS NULL;
END $$

DELIMITER $$
CREATE PROCEDURE spu_alternativas_registrar(
	IN _idpregunta INT,
    IN _alternativa TEXT,
    IN _validacion CHAR(1)
)
BEGIN
	INSERT INTO alternativas
    (idpregunta, alternativa, validacion)
    VALUES
    (idpregunta, alternativa, validacion);
    
    SELECT @@last_insert_id 'idalternativa';
END $$

-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_listar_inscritos()
BEGIN
	SELECT 
		INS.idinscrito,
        INS.fecharesolucion,
        USR.idusuario
        FROM inscritos INS
        INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
        WHERE USU.inactive_at IS NULL;
END $$



