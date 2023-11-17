USE evaluaciones;

DELIMITER $$
CREATE PROCEDURE spu_alternativas_listar()
BEGIN
	SELECT 
		ALT.idalternativa,
        ALT.alternativa,
        PRE.pregunta,
        ALT.escorrecto
	FROM alternativas ALT
        INNER JOIN preguntas PRE ON PRE.idpregunta = ALT.idpregunta
	WHERE ALT.inactive_at IS NULL;
END $$

-- CALL spu_listar_alternativas();

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_cursos_listar()
BEGIN
	SELECT
		idcurso, curso
    FROM cursos
    WHERE inactive_at IS NULL;
END $$

-- CALL spu_cursos_listar();
select * from evaluaciones;
select * from preguntas;
select * from alternativas;
-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_listar()
BEGIN
	SELECT 
		EVA.idevaluacion, CUR.curso,
        nombre_evaluacion,
        CONCAT(USR.apellidos, ', ', USR.nombres )'docente'
	FROM evaluaciones EVA
		INNER JOIN cursos CUR ON CUR.idcurso = EVA.idcurso
        INNER JOIN usuarios USR ON USR.idusuario = EVA.idusuario
	WHERE EVA.inactive_at IS NULL;
END $$

-- CALL spu_evaluaciones_listar();

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_inscritos_listar()
BEGIN
	SELECT 
		INS.idinscrito, INS.idevaluacion,
        EVA.nombre_evaluacion,
        CONCAT(USR.apellidos, ", ", USR.nombres) 'nombre_completo',
        INS.fechainicio, INS.fechafin
	FROM inscritos INS
        INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
        INNER JOIN evaluaciones EVA ON EVA.idevaluacion = INS.idevaluacion;
END $$

-- CALL spu_inscritos_listar();

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_preguntas_listar()
BEGIN
	SELECT 
		idpregunta, idevaluacion, pregunta
	FROM preguntas
	WHERE inactive_at IS NULL;
END $$

-- CALL spu_preguntas_listar();

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_roles_listar()
BEGIN
	SELECT 
		idrol, rol
	FROM roles
	WHERE inactive_at IS NULL;
END $$

-- CALL spu_roles_listar();

-- ##########################################################################################################################
DELIMITER $$
CREATE PROCEDURE spu_usuario_listar()
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

-- CALL spu_usuario_listar();

select * from usuarios
