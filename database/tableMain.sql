CREATE DATABASE evaluaciones;
USE evaluaciones;

CREATE TABLE roles(
	idrol		INT PRIMARY KEY AUTO_INCREMENT,
    rol			VARCHAR(20)		NOT NULL,
	create_at		DATETIME	DEFAULT NOW(),
    update_at		DATETIME	NULL,
	inactive_at		DATETIME	NULL
)ENGINE = INNODB;

insert into roles (rol) values('Docente'),('Estudiante');


CREATE TABLE usuarios(
	idusuario		INT PRIMARY KEY AUTO_INCREMENT,
    idrol			INT			NOT NULL,
    apellidos		VARCHAR(45)	NOT NULL,
    nombres			VARCHAR(45)	NOT NULL,
    correo			VARCHAR(90)	NOT NULL,
    claveacceso		VARCHAR(90)	NOT NULL,
    token			CHAR(6)		NULL,
    token_estado	CHAR(1)		NULL,
    create_at		DATETIME	DEFAULT NOW(),
    update_at		DATETIME	NULL,
	inactive_at		DATETIME	NULL,
    CONSTRAINT	fk_idrol_user	FOREIGN KEY (idrol) REFERENCES roles (idrol)
)ENGINE = INNODB;


CREATE TABLE inscritos(
    idinscrito      INT PRIMARY KEY AUTO_INCREMENT,
	idusuario		INT			NOT NULL,
    create_at		DATETIME	DEFAULT NOW(),
    update_at		DATETIME	NULL,
	inactive_at		DATETIME	NULL,
	CONSTRAINT	fk_iduser_ins	FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario),
    CONSTRAINT	un_iduser_ins	UNIQUE (idusuario)
)ENGINE = INNODB;


CREATE TABLE evaluaciones(
	idevaluacion	INT PRIMARY KEY AUTO_INCREMENT,
    idusuario		INT				NOT NULL,
    idinscrito		INT				NOT NULL,
    nombre_evaluacion	VARCHAR(45)	NOT NULL,
    fechainicio		DATETIME		NULL,
    fechafin		DATETIME		NULL,
    create_at		DATETIME		DEFAULT NOW(),
    update_at		DATETIME		NULL,
    inactive_at		DATETIME		NULL,
    nota			TINYINT			NULL,
    CONSTRAINT	fk_idusuario_eval	FOREIGN KEY (idusuario)	REFERENCES usuarios(idusuario),
    CONSTRAINT	fk_idinscrito_eval	FOREIGN KEY	(idinscrito) REFERENCES inscritos(idinscrito)
)ENGINE = INNODB;




CREATE TABLE preguntas(
	idpregunta		INT PRIMARY KEY AUTO_INCREMENT,
    idevaluacion	INT				NOT NULL,
    pregunta		TEXT        	NOT NULL,
    create_at		DATETIME	    DEFAULT NOW(),
    update_at		DATETIME	    NULL,
	inactive_at		DATETIME	    NULL,
    CONSTRAINT	fk_idevaluacion_preg	FOREIGN KEY (idevaluacion)	REFERENCES evaluaciones(idevaluacion)
)ENGINE = INNODB;


CREATE TABLE alternativas(
	idalternativa	INT PRIMARY KEY AUTO_INCREMENT,
    idpregunta		INT				NOT NULL,
    alternativa		TEXT        	NOT NULL,
    validacion		CHAR(1)			NOT NULL,
	create_at		DATETIME	    DEFAULT NOW(),
    update_at		DATETIME	    NULL,
	inactive_at		DATETIME	    NULL,
    CONSTRAINT	fk_idpregunta_alte	FOREIGN KEY (idpregunta) REFERENCES preguntas(idpregunta)
)ENGINE = INNODB;