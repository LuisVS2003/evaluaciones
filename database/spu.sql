USE evaluaciones;

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
      INNER JOIN roles ROL ON ROL.idrol = USU.idrol
      WHERE USU.inactive_at IS NULL;
END $$

CALL spu_listar_usuario();

DELIMITER $$
CREATE PROCEDURE spu_registrar_usuario(
  IN _idrol  INT,
  IN _apellidos VARCHAR(45),
  IN _nombres VARCHAR(45),
  IN _correo VARCHAR(90),
  IN _claveacceso VARCHAR(90)
)
BEGIN
    INSERT INTO usuarios
      (idrol, apellidos, nombres, correo, claveacceso)
    VALUES
    (_idrol, _apellidos, _nombres, _correo, _claveacceso);
    
    SELECT @@last_insert_id 'idusuario';
END $$

CALL spu_registrar_usuario(1, 'Muñoz', 'Alonso', 'alonsomunoz263@gamil.com', '12345');
CALL spu_registrar_usuario(2, 'Martinez', 'Alfonso', 'alonsomredick@gmail.com', '12345');

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

CALL spu_roles_listar();

-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_inscritos_registrar(
	IN _idusuario INT
)
BEGIN
	INSERT INTO inscritos (idusuario)
    VALUES
    (_idusuario);
END $$

CALL spu_inscritos_registrar (2);





-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_registrar(
	IN _idusuario INT,
    IN _idinscrito INT,
    IN _nombre_evaluacion VARCHAR(45),
    IN _fechainicio DATETIME,
    IN _fechafin	DATETIME
)
BEGIN
	INSERT INTO evaluaciones
    (idusuario, idinscrito, nombre_evaluacion, fechainicio, fechafin)
    VALUES
    (_idusuario, _idinscrito, _nombre_evaluacion, _fechainicio, _fechafin);
    
    SELECT @@last_insert_id 'idevaluacion';
END $$

CALL spu_evaluaciones_registrar(2, 1, 'Inglés','2023-11-9','2023-11-10');

SELECT * FROM usuarios;
SELECT * FROM inscritos
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

CALL spu_listar_preguntas();





DELIMITER $$
CREATE PROCEDURE spu_preguntas_registrar(
	IN _idevaluacion INT,
	IN _pregunta TEXT
)
BEGIN
	INSERT INTO preguntas
    (idevaluacion, pregunta)
    VALUES
    (_idevaluacion,  _pregunta);
    
    SELECT @@last_insert_id 'idpregunta';
END $$

CALL spu_preguntas_registrar(3, '¿Qué significa HTMl?');


-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_listar_alternativas()
BEGIN
	SELECT 
		ALT.idalternativa,
        ALT.alternativa,
        PRE.pregunta,
        ALT.validacion
        FROM alternativas ALT
        INNER JOIN preguntas PRE ON PRE.idpregunta = ALT.idpregunta
        WHERE ALT.inactive_at IS NULL;
END $$


call spu_listar_alternativas();

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
    (_idpregunta, _alternativa, _validacion);
    
    SELECT @@last_insert_id 'idalternativa';
END $$

CALL spu_alternativas_registrar(2,'HyperText Markup Language','1');

-- -------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE spu_listar_inscritos()
BEGIN
	SELECT 
		INS.idinscrito,
        USR.apellidos,
        USR.nombres
        FROM inscritos INS
        INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
        WHERE INS.inactive_at IS NULL;
END $$

CALL spu_listar_inscritos();




