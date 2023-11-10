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

CALL spu_login("alonsomunoz263@gamil.com")