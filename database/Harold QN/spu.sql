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

