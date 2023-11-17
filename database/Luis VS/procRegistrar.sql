USE evaluaciones;

DELIMITER $$
CREATE PROCEDURE spu_alternativas_registrar(
	IN _idpregunta		INT,
    IN _alternativa		TEXT,
    IN _escorrecto		CHAR(1)
)
BEGIN
	INSERT INTO alternativas
		(idpregunta, alternativa, escorrecto)
    VALUES
		(_idpregunta, _alternativa, _escorrecto);
    SELECT @@last_insert_id 'idalternativa';
END $$

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_cursos_registrar(
	IN _curso	VARCHAR(50)
)
BEGIN
	INSERT INTO cursos (curso)
    VALUES (_curso);
    SELECT @@last_insert_id 'idcurso';
END $$

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_registrar(
    IN _idcurso			INT,
	IN _idusuario		INT,
    IN _nombre_evaluacion	VARCHAR(90),
    IN _fechainicio		DATETIME,
    IN _fechafin		DATETIME
)
BEGIN
	INSERT INTO evaluaciones
		(idcurso, idusuario, nombre_evaluacion, fechainicio, fechafin)
    VALUES
		(_idcurso, _idusuario, _nombre_evaluacion, NULLIF(_fechainicio, ''), NULLIF(_fechafin, ''));
    SELECT @@last_insert_id 'idevaluacion';
END $$

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_inscritos_registrar(
	IN _idusuario		INT,
    IN _idevaluacion	INT,
    IN _fechainicio		DATETIME,
    IN _fechafin		DATETIME
)
BEGIN
	INSERT INTO inscritos
		(idusuario, idevaluacion, fechainicio, fechafin)
    VALUES
		(_idusuario, _idevaluacion, _fechainicio, _fechafin);
    SELECT @@last_insert_id 'idinscrito';
END $$


-- ##########################################################################################################################
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

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_usuario_registrar(
	IN _idrol		INT,
	IN _apellidos	VARCHAR(45),
	IN _nombres		VARCHAR(45),
	IN _correo		VARCHAR(90),
	IN _claveacceso	VARCHAR(90)
)
BEGIN
	INSERT INTO usuarios
		(idrol, apellidos, nombres, correo, claveacceso)
    VALUES
		(_idrol, _apellidos, _nombres, _correo, _claveacceso);
    SELECT @@last_insert_id 'idusuario';
END $$

CALL spu_usuario_registrar('1', 'Villegas Salazar', 'Luis', 'villegasalazar08@gmail.com', '$2y$10$agTIMGR8DG68EJM9qzCxm.AefDUj4wEGJawA6JZB6w9LhUvrYqomm');

SELECT * FROM evaluaciones