use evaluaciones;
DELIMITER $$
CREATE PROCEDURE spu_login (IN _correo VARCHAR(90))
BEGIN
	SELECT 
		idusuario,
        idrol,
		apellidos,
        nombres,
        correo,
        claveacceso
	FROM usuarios
    WHERE correo = _correo AND
		inactive_at IS NULL;
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
SELECT * FROM inscritos;
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

SELECT * FROM evaluaciones;
SELECT * FROM preguntas;
SELECT * FROM alternativas;
