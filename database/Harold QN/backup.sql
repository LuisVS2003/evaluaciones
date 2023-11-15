-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2023 a las 18:51:44
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `evaluaciones`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_pass` (IN `_correo` VARCHAR(90), IN `_token` VARCHAR(6), IN `_claveacceso` VARCHAR(90))   BEGIN
	UPDATE usuarios SET
    claveacceso = _claveacceso,
    token_estado = 'C',
    token = NULL
    WHERE correo = _correo AND token = _token;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alternativas_listar` ()   BEGIN
	SELECT 
		ALT.idalternativa,
        ALT.alternativa,
        PRE.pregunta,
        ALT.escorrecto
	FROM alternativas ALT
        INNER JOIN preguntas PRE ON PRE.idpregunta = ALT.idpregunta
	WHERE ALT.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alternativas_registrar` (IN `_idpregunta` INT, IN `_alternativa` TEXT, IN `_escorrecto` CHAR(1))   BEGIN
	INSERT INTO alternativas
		(idpregunta, alternativa, escorrecto)
    VALUES
		(_idpregunta, _alternativa, _escorrecto);
    SELECT @@last_insert_id 'idalternativa';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_correo` (IN `_correo` VARCHAR(90))   BEGIN
    SELECT *
    FROM usuarios
    WHERE correo = _correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_token` (IN `_correo` VARCHAR(90), IN `_token` VARCHAR(6))   BEGIN
    SELECT *
    FROM usuarios
    WHERE correo = _correo AND token = _token;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cursos_listar` ()   BEGIN
	SELECT
		idcurso, curso
    FROM cursos
    WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_cursos_registrar` (IN `_curso` VARCHAR(50))   BEGIN
	INSERT INTO cursos (curso)
    VALUES (_curso);
    SELECT @@last_insert_id 'idcurso';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_estudiantes_listar` ()   BEGIN
	SELECT
		USR.idusuario, INS.idevaluacion,
        CONCAT(USR.apellidos, ", ", USR.nombres) 'nombre_completo'
    FROM usuarios USR
	INNER JOIN inscritos INS ON INS.idusuario = USR.idusuario
    WHERE idrol = 2 AND USR.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_estudiante_listar` (IN `_idusuario` INT)   BEGIN
	SELECT
		INS.idinscrito, USR.idusuario, EVA.idevaluacion,
        EVA.nombre_evaluacion,
        INS.fechainicio, INS.fechafin
    FROM inscritos INS
    INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
    INNER JOIN evaluaciones EVA ON EVA.idevaluacion = INS.idevaluacion
    WHERE INS.idusuario = _idusuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_listar` ()   BEGIN
	SELECT 
		EVA.idevaluacion, CUR.curso,
        nombre_evaluacion
	FROM evaluaciones EVA
		INNER JOIN cursos CUR ON CUR.idcurso = EVA.idcurso
	WHERE EVA.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_preguntas_listar` (IN `_idevaluacion` INT)   BEGIN
	SELECT 
		EVA.idevaluacion,
        PRE.idpregunta, PRE.pregunta,
        ALT.idalternativa, ALT.alternativa, ALT.escorrecto
	FROM evaluaciones EVA
    INNER JOIN preguntas PRE ON PRE.idevaluacion = EVA.idevaluacion
    INNER JOIN alternativas ALT ON ALT.idpregunta = PRE.idpregunta
    WHERE EVA.idevaluacion = _idevaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_registrar` (IN `_idcurso` INT, IN `_nombre_evaluacion` VARCHAR(90), IN `_fechainicio` DATETIME, IN `_fechafin` DATETIME)   BEGIN
	INSERT INTO evaluaciones
		(idcurso, nombre_evaluacion, fechainicio, fechafin)
    VALUES
		(_idcurso, _nombre_evaluacion, _fechainicio, _fechafin);
    SELECT @@last_insert_id 'idevaluacion';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_informes_resumen` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inscritos_listar` ()   BEGIN
	SELECT 
		INS.idinscrito, INS.idevaluacion,
        EVA.nombre_evaluacion,
        CONCAT(USR.apellidos, ", ", USR.nombres) 'nombre_completo',
        INS.fechainicio, INS.fechafin
	FROM inscritos INS
        INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
        INNER JOIN evaluaciones EVA ON EVA.idevaluacion = INS.idevaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inscritos_registrar` (IN `_idusuario` INT, IN `_idevaluacion` INT, IN `_fechainicio` DATETIME, IN `_fechafin` DATETIME)   BEGIN
	INSERT INTO inscritos
		(idusuario, idevaluacion, fechainicio, fechafin)
    VALUES
		(_idusuario, _idevaluacion, _fechainicio, _fechafin);
    SELECT @@last_insert_id 'idinscrito';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_login` (IN `_correo` VARCHAR(90))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_preguntas_listar` ()   BEGIN
	SELECT 
		idpregunta, idevaluacion, pregunta
	FROM preguntas
	WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_preguntas_registrar` (IN `_idevaluacion` INT, IN `_pregunta` TEXT)   BEGIN
	INSERT INTO preguntas
		(idevaluacion, pregunta)
    VALUES
		(_idevaluacion,  _pregunta);
    SELECT @@last_insert_id 'idpregunta';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registra_token` (IN `_correo` VARCHAR(90), IN `_token` VARCHAR(6))   BEGIN
	UPDATE usuarios SET
    token_estado = 'P', 
    token = _token,
    fechatoken = NOW()
    WHERE _correo = correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_roles_listar` ()   BEGIN
	SELECT 
		idrol, rol
	FROM roles
	WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_listar` ()   BEGIN
	SELECT
		USU.idusuario,
		ROL.rol,
		USU.apellidos,
		USU.nombres,
		USU.correo
	FROM usuarios USU
		INNER JOIN roles ROL ON ROL.idrol = USU.idrol
	WHERE rol.rol = 'Estudiante';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_registrar` (IN `_idrol` INT, IN `_apellidos` VARCHAR(45), IN `_nombres` VARCHAR(45), IN `_correo` VARCHAR(90), IN `_claveacceso` VARCHAR(90))   BEGIN
	INSERT INTO usuarios
		(idrol, apellidos, nombres, correo, claveacceso)
    VALUES
		(_idrol, _apellidos, _nombres, _correo, _claveacceso);
    SELECT @@last_insert_id 'idusuario';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alternativas`
--

CREATE TABLE `alternativas` (
  `idalternativa` int(11) NOT NULL,
  `idpregunta` int(11) NOT NULL,
  `alternativa` text NOT NULL,
  `escorrecto` char(1) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alternativas`
--

INSERT INTO `alternativas` (`idalternativa`, `idpregunta`, `alternativa`, `escorrecto`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'Corriente', 'N', '2023-11-12 09:07:26', NULL, NULL),
(2, 1, 'Resistencia', 'N', '2023-11-12 09:07:26', NULL, NULL),
(3, 1, 'Voltaje', 'S', '2023-11-12 09:07:26', NULL, NULL),
(4, 2, 'Condensador', 'N', '2023-11-12 09:07:26', NULL, NULL),
(5, 2, 'Resistor', 'S', '2023-11-12 09:07:26', NULL, NULL),
(6, 2, 'Inductor', 'N', '2023-11-12 09:07:26', NULL, NULL),
(7, 3, 'Amperio', 'S', '2023-11-12 09:07:26', NULL, NULL),
(8, 3, 'Ohmio', 'N', '2023-11-12 09:07:26', NULL, NULL),
(9, 3, 'Voltio', 'N', '2023-11-12 09:07:26', NULL, NULL),
(10, 4, 'Gasolina', 'N', '2023-11-12 09:07:26', NULL, NULL),
(11, 4, 'Diesel', 'S', '2023-11-12 09:07:26', NULL, NULL),
(12, 4, 'Etanol', 'N', '2023-11-12 09:07:26', NULL, NULL),
(13, 5, 'Propulsor', 'N', '2023-11-12 09:07:26', NULL, NULL),
(14, 5, 'Frenos', 'N', '2023-11-12 09:07:26', NULL, NULL),
(15, 5, 'Escape', 'S', '2023-11-12 09:07:26', NULL, NULL),
(16, 6, 'Herencia', 'S', '2023-11-12 09:07:26', NULL, NULL),
(17, 6, 'Polimorfismo', 'N', '2023-11-12 09:07:26', NULL, NULL),
(18, 6, 'Encapsulamiento', 'N', '2023-11-12 09:07:26', NULL, NULL),
(19, 7, 'Java Virtual Machine', 'S', '2023-11-12 09:07:26', NULL, NULL),
(20, 7, 'Java Virtual Memory', 'N', '2023-11-12 09:07:26', NULL, NULL),
(21, 7, 'Java Variable Method', 'N', '2023-11-12 09:07:26', NULL, NULL),
(22, 8, 'int x = 10;', 'S', '2023-11-12 09:07:26', NULL, NULL),
(23, 8, 'String name = \"John\";', 'N', '2023-11-12 09:07:26', NULL, NULL),
(24, 8, 'boolean flag = true;', 'N', '2023-11-12 09:07:26', NULL, NULL),
(25, 9, 'True', 'N', '2023-11-12 09:07:26', NULL, NULL),
(26, 9, 'False', 'S', '2023-11-12 09:07:26', NULL, NULL),
(27, 9, 'Null', 'N', '2023-11-12 09:07:26', NULL, NULL),
(28, 10, 'A Test Thunder', 'N', '2023-11-13 09:30:08', NULL, NULL),
(29, 10, 'B Test Thunder', 'S', '2023-11-13 09:30:19', NULL, NULL),
(30, 11, 'p', 'S', '2023-11-15 12:51:00', NULL, NULL),
(31, 11, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(32, 11, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(33, 12, 'p', 'S', '2023-11-15 12:51:00', NULL, NULL),
(34, 12, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(35, 13, 'p', 'S', '2023-11-15 12:51:00', NULL, NULL),
(36, 13, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(37, 13, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(38, 14, 'p', 'S', '2023-11-15 12:51:00', NULL, NULL),
(39, 14, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(40, 14, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(41, 12, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL,
  `curso` varchar(50) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idcurso`, `curso`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Electricidad Industrial', '2023-11-12 08:48:46', NULL, NULL),
(2, 'Mecánica Automotriz', '2023-11-12 08:48:46', NULL, NULL),
(3, 'Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL),
(4, 'Soldadura Avanzada', '2023-11-12 08:48:46', NULL, NULL),
(5, 'Gestión de Proyectos', '2023-11-12 08:48:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `idevaluacion` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `nombre_evaluacion` varchar(90) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`idevaluacion`, `idcurso`, `nombre_evaluacion`, `create_at`, `update_at`, `inactive_at`, `fechainicio`, `fechafin`) VALUES
(1, 1, 'Evaluación 1 Electricidad Industrial', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(2, 1, 'Evaluación 2 Electricidad Industrial', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(3, 3, 'Evaluación 1 Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(4, 3, 'Evaluación 2 Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(5, 3, 'Evaluación 3 Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(7, 1, 'Test Thunder', '2023-11-13 09:26:57', NULL, NULL, '2023-11-12 10:00:00', '2023-11-22 10:00:00'),
(8, 1, 'Nuevo Examen', '2023-11-15 12:51:00', NULL, NULL, '2023-11-15 12:50:00', '2023-11-16 12:50:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscritos`
--

CREATE TABLE `inscritos` (
  `idinscrito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idevaluacion` int(11) NOT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inscritos`
--

INSERT INTO `inscritos` (`idinscrito`, `idusuario`, `idevaluacion`, `fechainicio`, `fechafin`) VALUES
(1, 1, 1, '2023-11-12 10:00:00', '2023-11-15 18:00:00'),
(2, 2, 1, '2023-11-13 11:30:00', '2023-11-16 20:30:00'),
(3, 3, 2, '2023-11-14 09:45:00', '2023-11-17 17:45:00'),
(4, 1, 3, '2023-11-15 13:15:00', '2023-11-18 22:15:00'),
(5, 2, 3, '2023-11-16 14:45:00', '2023-11-19 23:45:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `idpregunta` int(11) NOT NULL,
  `idevaluacion` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idpregunta`, `idevaluacion`, `pregunta`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, '¿Cuál es el concepto clave en Electricidad Industrial?', '2023-11-12 08:59:09', NULL, NULL),
(2, 1, '¿Cómo se llama el componente que almacena energía en un circuito eléctrico?', '2023-11-12 08:59:09', NULL, NULL),
(3, 1, '¿Cuál es la unidad de medida de la corriente eléctrica?', '2023-11-12 08:59:09', NULL, NULL),
(4, 2, '¿Cuáles son los componentes esenciales de un sistema de escape en un automóvil?', '2023-11-12 08:59:09', NULL, NULL),
(5, 2, '¿Qué tipo de combustible utiliza un motor diésel?', '2023-11-12 08:59:09', NULL, NULL),
(6, 2, '¿Cuál es la función principal del sistema de frenos en un automóvil?', '2023-11-12 08:59:09', NULL, NULL),
(7, 3, '¿Cuáles son los principios de la programación orientada a objetos?', '2023-11-12 08:59:09', NULL, NULL),
(8, 3, '¿Qué significa JVM en el contexto de Java?', '2023-11-12 08:59:09', NULL, NULL),
(9, 3, '¿Cómo se declara una variable en Java?', '2023-11-12 08:59:09', NULL, NULL),
(10, 7, 'Pregunta Test Thunder', '2023-11-13 09:28:49', NULL, NULL),
(11, 8, 'p', '2023-11-15 12:51:00', NULL, NULL),
(12, 8, 'p', '2023-11-15 12:51:00', NULL, NULL),
(13, 8, 'p', '2023-11-15 12:51:00', NULL, NULL),
(14, 8, 'p', '2023-11-15 12:51:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `rol`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Docente', '2023-11-12 08:48:46', NULL, NULL),
(2, 'Estudiante', '2023-11-12 08:48:46', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `correo` varchar(90) NOT NULL,
  `claveacceso` varchar(90) NOT NULL,
  `token` char(6) DEFAULT NULL,
  `token_estado` char(1) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  `fechatoken` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `idrol`, `apellidos`, `nombres`, `correo`, `claveacceso`, `token`, `token_estado`, `create_at`, `update_at`, `inactive_at`, `fechatoken`) VALUES
(1, 1, 'González', 'Juan', 'juan.gonzalez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(2, 2, 'Martínez', 'Ana', 'ana.martinez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(3, 2, 'Rodríguez', 'Pedro', 'pedro.rodriguez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(4, 2, 'Sánchez', 'Laura', 'laura.sanchez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(5, 2, 'Díaz', 'Carlos', 'carlos.diaz@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`idalternativa`),
  ADD KEY `fk_idpregunta_alte` (`idpregunta`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`idevaluacion`),
  ADD KEY `fk_idcurso_eval` (`idcurso`);

--
-- Indices de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  ADD PRIMARY KEY (`idinscrito`),
  ADD KEY `fk_iduser_ins` (`idusuario`),
  ADD KEY `fk_idevaluacion_ins` (`idevaluacion`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`idpregunta`),
  ADD KEY `fk_idevaluacion_preg` (`idevaluacion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_idrol_user` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `idalternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `idevaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  MODIFY `idinscrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alternativas`
--
ALTER TABLE `alternativas`
  ADD CONSTRAINT `fk_idpregunta_alte` FOREIGN KEY (`idpregunta`) REFERENCES `preguntas` (`idpregunta`);

--
-- Filtros para la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD CONSTRAINT `fk_idcurso_eval` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`);

--
-- Filtros para la tabla `inscritos`
--
ALTER TABLE `inscritos`
  ADD CONSTRAINT `fk_idevaluacion_ins` FOREIGN KEY (`idevaluacion`) REFERENCES `evaluaciones` (`idevaluacion`),
  ADD CONSTRAINT `fk_iduser_ins` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `fk_idevaluacion_preg` FOREIGN KEY (`idevaluacion`) REFERENCES `evaluaciones` (`idevaluacion`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_idrol_user` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
