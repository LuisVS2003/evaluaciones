use evaluaciones;
DELIMITER $$

-- Con esto recuperamos los datos del usuario para mostrarlos en en navbar 
CREATE PROCEDURE spu_login (IN _correo VARCHAR(90))
BEGIN
	SELECT 
		usu.idusuario,
        usu.idrol,
        r.rol,
		usu.apellidos,
        usu.nombres,
        usu.correo,
        usu.claveacceso
	FROM usuarios usu INNER JOIN roles r ON usu.idrol = r.idrol
    WHERE correo = _correo AND usu.inactive_at IS NULL;
END $$

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_estudiante_listar(IN _idusuario INT)
BEGIN
	SELECT
		INS.idinscrito, USR.idusuario,
        EVA.nombre_evaluacion,
        INS.fechainicio, INS.fechafin
    FROM inscritos INS
    INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
    INNER JOIN evaluaciones EVA ON EVA.idevaluacion = INS.idevaluacion
    WHERE INS.idusuario = _idusuario;
END $$

-- CALL spu_evaluaciones_estudiante_listar(2)

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_preguntas_listar(IN _idevaluacion INT)
BEGIN
	SELECT 
		EVA.idevaluacion,
        PRE.idpregunta, PRE.pregunta,
        ALT.idalternativa, ALT.alternativa, ALT.escorrecto
	FROM evaluaciones EVA
    INNER JOIN preguntas PRE ON PRE.idevaluacion = EVA.idevaluacion
    INNER JOIN alternativas ALT ON ALT.idpregunta = PRE.idpregunta
    WHERE EVA.idevaluacion = _idevaluacion;
END $$

SELECT * FROM usuarios;
SELECT * FROM evaluaciones;
select * from preguntas;
select * from alternativas
-- CALL spu_evaluaciones_preguntas_listar(3)

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_estudiantes_listar()
BEGIN
	SELECT
		USR.idusuario, INS.idevaluacion,
        CONCAT(USR.apellidos, ", ", USR.nombres) 'nombre_completo'
    FROM usuarios USR
	INNER JOIN inscritos INS ON INS.idusuario = USR.idusuario
    WHERE idrol = 2 AND USR.inactive_at IS NULL;
END $$

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_alternativas_correctas(IN _idevaluacion INT)
BEGIN
	SELECT
		ALT.idalternativa, PRG.idpregunta, EVA.idevaluacion,
        PRG.pregunta, ALT.alternativa, ALT.escorrecto
    FROM alternativas ALT
		INNER JOIN preguntas PRG ON PRG.idpregunta = ALT.idpregunta
        INNER JOIN evaluaciones EVA ON EVA.idevaluacion = PRG.idevaluacion
	WHERE ALT.escorrecto = 'S' AND EVA.idevaluacion = _idevaluacion;
END $$

-- CALL spu_alternativas_correctas(1)

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_respuestas_marcadas(IN _idinscrito INT)
BEGIN
	SELECT
		INS.idinscrito,
		SUM(CASE WHEN ALT.escorrecto = 'S' THEN PRG.puntos ELSE 0 END) AS 'puntos_correctos',
		SUM(CASE WHEN (ALT.escorrecto = 'N' OR ALT.escorrecto = 'S') THEN PRG.puntos ELSE 0 END) AS 'puntos_totales'
	FROM respuestas RPT
		INNER JOIN inscritos INS ON INS.idinscrito = RPT.idinscrito
		INNER JOIN alternativas ALT ON ALT.idalternativa = RPT.idalternativa
		INNER JOIN preguntas PRG ON PRG.idpregunta = ALT.idpregunta
	WHERE
		RPT.idinscrito = _idinscrito
	GROUP BY INS.idinscrito;
END $$

-- CALL spu_respuestas_marcadas(1);

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_evaluacion_preguntas(IN _idevaluacion INT)
BEGIN
	SELECT 
		idpregunta, idevaluacion, pregunta, puntos
	FROM preguntas
	WHERE 	idevaluacion = _idevaluacion AND
			inactive_at IS NULL;
END $$
select * from evaluaciones
-- CALL spu_evaluacion_preguntas(1);


-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_preguntas_alternativas(IN _idpregunta INT)
BEGIN
	SELECT 
		idalternativa,
        alternativa,
        idpregunta,
        escorrecto
	FROM alternativas
	WHERE	idpregunta = _idpregunta AND
			inactive_at IS NULL;
END $$

-- CALL spu_preguntas_alternativas(2);

-- ##########################################################################################################################
select * from alternativas;
select * from inscritos;



-- ##########################################################################################################################
-- Testeo - Luis
DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_docente_listar(
	IN _iddocente	INT,
    IN _idcurso		INT
)
BEGIN
	SELECT
		EVA.idevaluacion, EVA.idcurso, EVA.idusuario 'iddocente',
        EVA.nombre_evaluacion, EVA.fechainicio, EVA.fechafin
    FROM evaluaciones EVA
    INNER JOIN usuarios USR ON USR.idusuario = EVA.idusuario
    INNER JOIN cursos CUR ON CUR.idcurso = EVA.idcurso
    WHERE EVA.idusuario = _iddocente AND EVA.idcurso = _idcurso;
END $$

-- CALL spu_evaluaciones_docente_listar(1,4);