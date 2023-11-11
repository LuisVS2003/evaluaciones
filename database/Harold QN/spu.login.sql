USE evaluaciones;
SELECT * FROM usuarios;

DESCRIBE usuarios;

ALTER TABLE usuarios ADD fechatoken DATETIME NULL;

/*
	PROCEDIMIENTO PARA BUSCAR EL CORREO ANTES DE ENVIARLO;
	
*/
DELIMITER $$
CREATE PROCEDURE spu_buscar_correo(
    IN _correo VARCHAR(100)
)
BEGIN
    SELECT *
    FROM usuarios
    WHERE correo = _correo;
END $$
CALL spu_buscar_correo('efrainqn16@gmail.com')
SELECT * FROM usuarios;
-- ------------------------------------------------------------------------------------------
/**
	INSERTO MI USUARIO PARA HACER LAS 
	PRUEBAS.
*/
CALL spu_registrar_usuario(2, 'Quispe Napa', 'Harold', 'efrainqn16@gmail.com', '123456');

-- ---------------------------------------------------------------------------------------------
/*
	PROCEDIMIENTO PARA REGISTRAR EL TOKEN DEL USUARIO
	`FUNCIONAL`
*/
DELIMITER $$
CREATE PROCEDURE spu_registra_token(
	IN _correo VARCHAR(100),
    IN _token VARCHAR(6)
)
BEGIN
	UPDATE usuarios SET
    token_estado = 'P', 
    token = _token,
    fechatoken = NOW()
    WHERE _correo = correo;
END$$

CALL spu_registra_token('efrainqn16@gmail.com',999999);
-- -----------------------------------------------------------------------------------------------
/**
	PROCEDIMIENTO PARA BUSCAR AL USUARIO , SI EXISTE EN LA BD:evaluaciones
	`Funcional`
	
*/

DELIMITER $$
CREATE PROCEDURE spu_buscar_token(
    IN _correo VARCHAR(100),
    IN _token VARCHAR(6)
)
BEGIN
    SELECT *
    FROM usuarios
    WHERE correo = _correo AND token = _token;
END $$
SELECT * FROM usuarios;
CALL spu_buscar_token('efrainqn16@gmail.com','999999')
-- ------------------------------------------------------------------------------------------------

/*
	PROCEDIMIENTO PARA CAMBIAR EL ESTADO DEL TOKEN Y LA CONTRASEÑA DEL USUARIO}
	`Funcional`
*/
DELIMITER $$
CREATE PROCEDURE spu_actualizar_pass(
	IN _correo VARCHAR(100),
	IN _token VARCHAR(6),
	IN _claveacceso VARCHAR(90)
)
BEGIN
	UPDATE usuarios SET
    claveacceso = _claveacceso,
    token_estado = 'C',
    token = NULL
    WHERE correo = _correo AND token = _token;
END $$

CALL spu_actualizar_pass('efrainqn16@gmail.com','999999','chamo');
SELECT  * FROM usuarios;

-- --------------------------------------------------------------------------------------
-- Clave = prueba
UPDATE usuarios SET
	claveacceso = '$2y$10$JrWpvfajT/tVlC6C4f3q7eYYHVaOcG1MK/sIc0mqGPBGJ5dHM/P12';
	
SELECT * FROM usuarios;

-- --------------------------------------------------------------------------------------

















