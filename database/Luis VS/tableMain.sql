DROP DATABASE evaluaciones;
USE evaluaciones;

CREATE TABLE roles(
	idrol		INT PRIMARY KEY AUTO_INCREMENT,
    rol			VARCHAR(20)		NOT NULL,
	create_at		DATETIME	DEFAULT NOW(),
    update_at		DATETIME	NULL,
	inactive_at		DATETIME	NULL
)ENGINE = INNODB;


CREATE TABLE cursos(
	idcurso			INT PRIMARY KEY AUTO_INCREMENT,
    curso			VARCHAR(50)	NOT NULL,
	create_at		DATETIME	DEFAULT NOW(),
    update_at		DATETIME	NULL,
	inactive_at		DATETIME	NULL
)ENGINE = INNODB;


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
    fechatoken		DATETIME	NULL,
    CONSTRAINT	fk_idrol_user	FOREIGN KEY (idrol) REFERENCES roles (idrol)
)ENGINE = INNODB;


CREATE TABLE evaluaciones(
	idevaluacion	INT PRIMARY KEY AUTO_INCREMENT,
    idcurso			INT				NOT NULL,
    idusuario		INT				NOT NULL,
    nombre_evaluacion	VARCHAR(90)	NOT NULL,
    fechainicio		DATETIME		NULL,
    fechafin		DATETIME		NULL,
    create_at		DATETIME		DEFAULT NOW(),
    update_at		DATETIME		NULL,
    inactive_at		DATETIME		NULL,
    CONSTRAINT	fk_idcurso_eval	FOREIGN KEY (idcurso)	REFERENCES cursos(idcurso),
    CONSTRAINT	fk_iddocente_eval FOREIGN KEY (idusuario)	REFERENCES usuarios(idususario)
)ENGINE = INNODB;

-- alter table evaluaciones add column idusuario int not null;
-- update evaluaciones set idusuario = 1;
-- alter table evaluaciones add constraint fk_iddocente_eval FOREIGN KEY (idusuario) REFERENCES usuarios(idusuario);


CREATE TABLE inscritos(
    idinscrito      INT PRIMARY KEY AUTO_INCREMENT,
	idusuario		INT			NOT NULL,
    idevaluacion	INT			NOT NULL,
    fechainicio		DATETIME	NULL,
    fechafin		DATETIME	NULL,
	CONSTRAINT	fk_iduser_ins	FOREIGN KEY (idusuario) REFERENCES usuarios (idusuario),
    CONSTRAINT	fk_idevaluacion_ins	FOREIGN KEY	(idevaluacion) REFERENCES evaluaciones(idevaluacion)
)ENGINE = INNODB;


CREATE TABLE preguntas(
	idpregunta		INT PRIMARY KEY AUTO_INCREMENT,
    idevaluacion	INT				NOT NULL,
    pregunta		TEXT        	NOT NULL,
    puntos			TINYINT			NOT NULL,
    create_at		DATETIME	    DEFAULT NOW(),
    update_at		DATETIME	    NULL,
	inactive_at		DATETIME	    NULL,
    CONSTRAINT	fk_idevaluacion_preg	FOREIGN KEY (idevaluacion)	REFERENCES evaluaciones(idevaluacion)
)ENGINE = INNODB;

-- alter table preguntas add column puntos tinyint not null;
-- update preguntas set puntos = 4;
-- select * from preguntas;


CREATE TABLE alternativas(
	idalternativa	INT PRIMARY KEY AUTO_INCREMENT,
    idpregunta		INT				NOT NULL,
    alternativa		TEXT        	NOT NULL,
    escorrecto		CHAR(1)			NOT NULL,
	create_at		DATETIME	    DEFAULT NOW(),
    update_at		DATETIME	    NULL,
	inactive_at		DATETIME	    NULL,
    CONSTRAINT	fk_idpregunta_alte	FOREIGN KEY (idpregunta) REFERENCES preguntas(idpregunta)
)ENGINE = INNODB;


CREATE TABLE respuestas(
	idrespuesta		INT PRIMARY KEY AUTO_INCREMENT,
    idinscrito		INT				NOT NULL,
	idalternativa	INT				NOT NULL,
	create_at		DATETIME		DEFAULT NOW(),
	update_at		DATETIME		NULL,
	inactive_at		DATETIME		NULL,
    CONSTRAINT fk_idinscrito_resp FOREIGN KEY (idinscrito) REFERENCES inscritos (idinscrito),
	CONSTRAINT fk_idalternativa_resp FOREIGN KEY (idalternativa) REFERENCES alternativas (idalternativa)
)ENGINE = INNODB;

select * from usuarios;
