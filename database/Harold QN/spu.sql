use evaluaciones;

DELIMITER $$
create procedure spu_usuario_listar()
BEGIN
	SELECT
		USU.idusuario,
		ROL.rol,
		USU.apellidos,
		USU.nombres,
		USU.correo
	FROM usuarios USU
		INNER JOIN roles ROL ON ROL.idrol = USU.idrol
	WHERE rol.rol = 'Estudiante';
END $$

call spu_listar_usuario_estudinate()

DELIMITER $$
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

call spu_login('juan.gonzalez@example.com')





DELIMITER $$
CREATE PROCEDURE spu_informes_resumen()
BEGIN
	SELECT
		c.curso,
		COUNT(DISTINCT CASE WHEN i.fechafin IS NOT NULL THEN e.idevaluacion END) AS evaluaciones_realizadas,
		COUNT(DISTINCT CASE WHEN i.fechafin IS NULL THEN i.idinscrito END) AS evaluaciones_pendientes
	FROM
		cursos c
	LEFT JOIN
		evaluaciones e ON c.idcurso = e.idcurso
	LEFT JOIN
		inscritos i ON e.idevaluacion = i.idevaluacion
	GROUP BY
		c.curso;
END $$

select * from alternativas;

use evaluaciones;
-- --------------------------------------------
SELECT u.nombres, u.apellidos, c.curso, e.fechainicio, e.fechafin
FROM usuarios u
JOIN roles r ON u.idrol = r.idrol
JOIN inscritos i ON u.idusuario = i.idusuario
JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
JOIN cursos c ON e.idcurso = c.idcurso
WHERE r.idrol = 2;
-------------------------------------------------------
CALL spu_evaluaciones_estudiante_listar(2);

select * from evaluaciones;


DELIMITER $$
create PROCEDURE spu_rendir_poruser(IN p_idusuario INT)
BEGIN
    SELECT 
        u.nombres,
        c.idcurso,
        c.curso,
        e.fechainicio,
        u.idusuario
    FROM usuarios u
    JOIN roles r ON u.idrol = r.idrol
    LEFT JOIN inscritos i ON u.idusuario = i.idusuario
    LEFT JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
    LEFT JOIN cursos c ON e.idcurso = c.idcurso
    WHERE r.idrol = 2 AND u.idusuario = p_idusuario
    GROUP BY u.nombres, c.curso;
END $$

call spu_rendir_poruser(2);

-- --------------------------------------------------------------------------------------
-- PROCEDIMIENTO PARA LISTAR EVALAUCIONES POR EL CURSO Y EL USUARIO
DELIMITER $$
create PROCEDURE spu_listar_evaluaciones_x_curso(IN p_idusuario INT, IN p_idcurso INT)
BEGIN
    SELECT 
        c.curso,
        e.nombre_evaluacion,
        e.fechainicio,
        e.fechafin,
        i.idevaluacion,
        i.idusuario
    FROM usuarios u
    JOIN roles r ON u.idrol = r.idrol
    LEFT JOIN inscritos i ON u.idusuario = i.idusuario
    LEFT JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
    LEFT JOIN cursos c ON e.idcurso = c.idcurso
    WHERE r.idrol = 2 AND u.idusuario = p_idusuario AND c.idcurso = p_idcurso;
END $$
select * from cursos;
call spu_listar_evaluaciones_x_curso(2,3)

select * from  evaluaciones;
-- ----------------------------------------------------------------------
-- 16/11 09:00


DELIMITER $$
CREATE PROCEDURE spu_obtener_evaluaciones_curso(IN _campo INT)
BEGIN
    SELECT DISTINCT u.nombres, u.apellidos,u.idusuario
        FROM usuarios u
        JOIN inscritos i ON u.idusuario = i.idusuario
        JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
        WHERE e.idcurso = _campo AND u.idrol = 2;
END $$
CALL spu_obtener_evaluaciones_curso(1);

select * from inscritos;

select * from evaluaciones;
-- --------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE spu_usuario_listar_evaluaciones_x_curso(IN _idcurso VARCHAR(20))
BEGIN
    SELECT
        c.idcurso,
        c.curso,
        e.idevaluacion,
        e.nombre_evaluacion
    FROM cursos c
        INNER JOIN evaluaciones e ON e.idcurso = c.idcurso
    WHERE c.idcurso = _idcurso;
END$$
call spu_usuario_listar_evaluaciones_x_curso(1);

select * from cursos;
select * from evaluaciones;












