USE evaluaciones;

DELIMITER $$
CREATE PROCEDURE spu_evaluaciones_usuario_listar(IN _idusuario INT)
BEGIN
	SELECT
		EVA.idevaluacion, USR.idusuario,
        CONCAT(USR.apellidos, " ", USR.nombres) 'nombre_completo',
        EVA.nombre_evaluacion,
        EVA.fechainicio, EVA.fechafin
        
    FROM evaluaciones EVA
    INNER JOIN usuarios USR ON USR.idusuario = EVA.idusuario
    WHERE USR.idusuario = _idusuario;
END $$

SELECT * FROM evaluaciones;
CALL spu_evaluaciones_usuario_listar(2)