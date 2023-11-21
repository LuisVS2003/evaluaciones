USE evaluaciones;

DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_usuario_listar(IN _idusuario INT)
BEGIN
	SELECT
		EVA.idevaluacion, USR.idusuario,
        CONCAT(USR.apellidos, " ", USR.nombres) 'nombre_completo',
        EVA.nombre_evaluacion, EVA.nota,
        EVA.fechainicio, EVA.fechafin
    FROM evaluaciones EVA
    INNER JOIN usuarios USR ON USR.idusuario = EVA.idusuario
    WHERE USR.idusuario = _idusuario;
END $$

CALL spu_evaluaciones_usuario_listar(3);
select * from evaluaciones


DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_preguntas_listar(IN _idevaluacion INT)
BEGIN
	SELECT 
		EVA.idevaluacion, EVA.idusuario,
        PRE.idpregunta, PRE.pregunta,
        ALT.idalternativa, ALT.alternativa, ALT.validacion
	FROM evaluaciones EVA
    INNER JOIN preguntas PRE ON PRE.idevaluacion = EVA.idevaluacion
    INNER JOIN alternativas ALT ON ALT.idpregunta = PRE.idpregunta
    WHERE EVA.idevaluacion = _idevaluacion;
END $$

CALL spu_evaluaciones_preguntas_listar(15);




