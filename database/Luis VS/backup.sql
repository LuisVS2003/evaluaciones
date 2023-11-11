-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2023 a las 17:01:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_pass` (IN `_correo` VARCHAR(100), IN `_token` VARCHAR(6), IN `_claveacceso` VARCHAR(90))   begin
	update usuarios set
    claveacceso = _claveacceso,
    token_estado = 'C',
    token = null
    where correo = _correo and token = _token;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alternativas_registrar` (IN `_idpregunta` INT, IN `_alternativa` TEXT, IN `_validacion` CHAR(1))   BEGIN
	INSERT INTO alternativas
    (idpregunta, alternativa, validacion)
    VALUES
    (_idpregunta, _alternativa, _validacion);
    
    SELECT @@last_insert_id 'idalternativa';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_correo` (IN `_correo` VARCHAR(100))   BEGIN
    SELECT *
    FROM usuarios
    WHERE correo = _correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_buscar_token` (IN `_correo` VARCHAR(100), IN `_token` VARCHAR(6))   BEGIN
    SELECT *
    FROM usuarios
    WHERE correo = _correo AND token = _token;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_preguntas_listar` (IN `_idevaluacion` INT)   BEGIN
	SELECT 
		EVA.idevaluacion, EVA.idusuario,
        PRE.idpregunta, PRE.pregunta,
        ALT.alternativa, ALT.validacion
	FROM evaluaciones EVA
    INNER JOIN preguntas PRE ON PRE.idevaluacion = EVA.idevaluacion
    INNER JOIN alternativas ALT ON ALT.idpregunta = PRE.idpregunta
    WHERE EVA.idevaluacion = _idevaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_registrar` (IN `_idusuario` INT, IN `_idinscrito` INT, IN `_nombre_evaluacion` VARCHAR(45), IN `_fechainicio` DATETIME, IN `_fechafin` DATETIME)   BEGIN
	INSERT INTO evaluaciones
    (idusuario, idinscrito, nombre_evaluacion, fechainicio, fechafin)
    VALUES
    (_idusuario, _idinscrito, _nombre_evaluacion, _fechainicio, _fechafin);
    
    SELECT @@last_insert_id 'idevaluacion';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_usuario_listar` (IN `_idusuario` INT)   BEGIN
	SELECT
		EVA.idevaluacion, USR.idusuario,
        CONCAT(USR.apellidos, " ", USR.nombres) 'nombre_completo',
        EVA.nombre_evaluacion,
        EVA.fechainicio, EVA.fechafin
        
    FROM evaluaciones EVA
    INNER JOIN usuarios USR ON USR.idusuario = EVA.idusuario
    WHERE USR.idusuario = _idusuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inscritos_registrar` (IN `_idusuario` INT)   BEGIN
	INSERT INTO inscritos (idusuario)
    VALUES
    (_idusuario);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_alternativas` ()   BEGIN
	SELECT 
		ALT.idalternativa,
        ALT.alternativa,
        PRE.pregunta,
        ALT.validacion
        FROM alternativas ALT
        INNER JOIN preguntas PRE ON PRE.idpregunta = ALT.idpregunta
        WHERE ALT.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_inscritos` ()   BEGIN
	SELECT 
		INS.idinscrito,
        USR.apellidos,
        USR.nombres
        FROM inscritos INS
        INNER JOIN usuarios USR ON USR.idusuario = INS.idusuario
        WHERE INS.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_preguntas` ()   BEGIN
	SELECT 
		idpregunta,
        pregunta
        FROM preguntas
        WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_usuario` ()   BEGIN
  SELECT
      USU.idusuario,
      ROL.rol,
      USU.apellidos,
      USU.nombres,
      USU.correo
      FROM usuarios USU
      INNER JOIN roles ROL ON ROL.idrol = USU.idrol
      WHERE USU.inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_login` (IN `_correo` VARCHAR(90))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_preguntas_registrar` (IN `_idevaluacion` INT, IN `_pregunta` TEXT)   BEGIN
	INSERT INTO preguntas
    (idevaluacion, pregunta)
    VALUES
    (_idevaluacion,  _pregunta);
    
    SELECT @@last_insert_id 'idpregunta';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registrar_usuario` (IN `_idrol` INT, IN `_apellidos` VARCHAR(45), IN `_nombres` VARCHAR(45), IN `_correo` VARCHAR(90), IN `_claveacceso` VARCHAR(90))   BEGIN
    INSERT INTO usuarios
		(idrol, apellidos, nombres, correo, claveacceso)
    VALUES
		(_idrol, _apellidos, _nombres, _correo, _claveacceso);
    
    SELECT @@last_insert_id 'idusuario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registra_token` (IN `_correo` VARCHAR(100), IN `_token` VARCHAR(6))   begin
	update usuarios set
    token_estado = 'P', 
    token = _token,
    fechatoken = now()
    where _correo = correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_roles_listar` ()   BEGIN
	SELECT 
		idrol,
		rol FROM roles
		WHERE inactive_at IS NULL;
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
  `validacion` char(1) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alternativas`
--

INSERT INTO `alternativas` (`idalternativa`, `idpregunta`, `alternativa`, `validacion`, `create_at`, `update_at`, `inactive_at`) VALUES
(2, 2, 'HyperText Markup Language', '1', '2023-11-10 14:57:58', NULL, NULL),
(3, 2, 'París', 'V', '2023-11-10 15:15:53', NULL, NULL),
(4, 3, 'Londres', 'F', '2023-11-10 15:15:53', NULL, NULL),
(5, 4, 'Madrid', 'F', '2023-11-10 15:15:53', NULL, NULL),
(6, 5, 'Berlín', 'F', '2023-11-10 15:15:53', NULL, NULL),
(7, 5, '1914', 'V', '2023-11-10 15:15:53', NULL, NULL),
(8, 6, '1918', 'F', '2023-11-10 15:15:53', NULL, NULL),
(9, 7, '1939', 'F', '2023-11-10 15:15:53', NULL, NULL),
(10, 8, '1945', 'F', '2023-11-10 15:15:53', NULL, NULL),
(11, 13, 'París', '1', '2023-11-11 09:40:51', NULL, NULL),
(12, 13, 'Londres', '0', '2023-11-11 09:40:51', NULL, NULL),
(13, 13, 'Madrid', '0', '2023-11-11 09:40:51', NULL, NULL),
(14, 14, 'George Orwell', '1', '2023-11-11 09:40:51', NULL, NULL),
(15, 14, 'J.K. Rowling', '0', '2023-11-11 09:40:51', NULL, NULL),
(16, 14, 'Stephen King', '0', '2023-11-11 09:40:51', NULL, NULL),
(17, 15, '1492', '1', '2023-11-11 09:40:51', NULL, NULL),
(18, 15, '1776', '0', '2023-11-11 09:40:51', NULL, NULL),
(19, 15, '1812', '0', '2023-11-11 09:40:51', NULL, NULL),
(20, 16, 'Au', '1', '2023-11-11 09:40:51', NULL, NULL),
(21, 16, 'Ag', '0', '2023-11-11 09:40:51', NULL, NULL),
(22, 16, 'Fe', '0', '2023-11-11 09:40:51', NULL, NULL),
(23, 17, 'Océano Pacífico', '1', '2023-11-11 09:40:51', NULL, NULL),
(24, 17, 'Océano Atlántico', '0', '2023-11-11 09:40:51', NULL, NULL),
(25, 17, 'Océano Índico', '0', '2023-11-11 09:40:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `idevaluacion` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idinscrito` int(11) NOT NULL,
  `nombre_evaluacion` varchar(45) NOT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`idevaluacion`, `idusuario`, `idinscrito`, `nombre_evaluacion`, `fechainicio`, `fechafin`, `create_at`, `update_at`, `inactive_at`) VALUES
(3, 2, 1, 'Inglés', '2023-11-09 00:00:00', '2023-11-10 00:00:00', '2023-11-10 14:53:14', NULL, NULL),
(5, 2, 1, 'Evaluación 1', '2023-11-09 00:00:00', '2023-11-10 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(6, 2, 1, 'Evaluación 2', '2023-11-10 00:00:00', '2023-11-11 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(7, 2, 1, 'Evaluación 3', '2023-11-11 00:00:00', '2023-11-12 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(8, 2, 1, 'Evaluación 4', '2023-11-12 00:00:00', '2023-11-13 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(9, 2, 1, 'Evaluación 5', '2023-11-13 00:00:00', '2023-11-14 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(10, 2, 1, 'Evaluación 6', '2023-11-14 00:00:00', '2023-11-15 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(11, 2, 1, 'Evaluación 7', '2023-11-15 00:00:00', '2023-11-16 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(12, 2, 1, 'Evaluación 8', '2023-11-16 00:00:00', '2023-11-17 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(13, 2, 1, 'Evaluación 9', '2023-11-17 00:00:00', '2023-11-18 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(14, 2, 1, 'Evaluación 10', '2023-11-18 00:00:00', '2023-11-19 00:00:00', '2023-11-10 15:13:04', NULL, NULL),
(15, 3, 1, 'Evaluación 1', '2023-11-09 00:00:00', '2023-11-10 00:00:00', '2023-11-10 20:36:24', NULL, NULL),
(16, 3, 1, 'Evaluación 2', '2023-11-10 00:00:00', '2023-11-11 00:00:00', '2023-11-10 20:36:24', NULL, NULL),
(17, 3, 1, 'Evaluación 3', '2023-11-11 00:00:00', '2023-11-12 00:00:00', '2023-11-10 20:36:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscritos`
--

CREATE TABLE `inscritos` (
  `idinscrito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscritos`
--

INSERT INTO `inscritos` (`idinscrito`, `idusuario`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 2, '2023-11-10 14:51:28', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idpregunta`, `idevaluacion`, `pregunta`, `create_at`, `update_at`, `inactive_at`) VALUES
(2, 3, '¿Qué significa HTMl?', '2023-11-10 14:54:33', NULL, NULL),
(3, 3, '¿Cuál es la capital de Francia?', '2023-11-10 15:14:18', NULL, NULL),
(4, 3, '¿Qué año comenzó la Primera Guerra Mundial?', '2023-11-10 15:14:18', NULL, NULL),
(5, 3, '¿Quién pintó la Mona Lisa?', '2023-11-10 15:14:18', NULL, NULL),
(6, 3, '¿En qué año se descubrió América?', '2023-11-10 15:14:18', NULL, NULL),
(7, 3, '¿Cuál es el río más largo del mundo?', '2023-11-10 15:14:18', NULL, NULL),
(8, 3, '¿Qué científico formuló la teoría de la relatividad?', '2023-11-10 15:14:18', NULL, NULL),
(9, 3, '¿Quién escribió \"El Quijote\"?', '2023-11-10 15:14:18', NULL, NULL),
(10, 3, '¿Cuál es el metal más abundante en la corteza terrestre?', '2023-11-10 15:14:18', NULL, NULL),
(11, 3, '¿Cuál es la montaña más alta del mundo?', '2023-11-10 15:14:18', NULL, NULL),
(12, 3, '¿Quién fue el primer presidente de los Estados Unidos?', '2023-11-10 15:14:18', NULL, NULL),
(13, 15, '¿Cuál es la capital de Francia?', '2023-11-11 09:33:00', NULL, NULL),
(14, 15, '¿Quién escribió el libro \"1984\"?', '2023-11-11 09:33:00', NULL, NULL),
(15, 15, '¿En qué año se descubrió América?', '2023-11-11 09:33:00', NULL, NULL),
(16, 15, '¿Cuál es el símbolo químico del oro?', '2023-11-11 09:33:00', NULL, NULL),
(17, 15, '¿Cuál es el océano más grande del mundo?', '2023-11-11 09:33:00', NULL, NULL),
(18, 16, '¿Cuál es el autor de la pintura \"La última cena\"?', '2023-11-11 09:33:00', NULL, NULL),
(19, 16, '¿En qué año se fundó la ciudad de Roma?', '2023-11-11 09:33:00', NULL, NULL),
(20, 16, '¿Cuál es el río más largo del mundo?', '2023-11-11 09:33:00', NULL, NULL),
(21, 16, '¿Quién escribió el libro \"Don Quijote de la Mancha\"?', '2023-11-11 09:33:00', NULL, NULL),
(22, 16, '¿Cuál es el país más poblado del mundo?', '2023-11-11 09:33:00', NULL, NULL),
(23, 17, '¿En qué año se firmó la Declaración de Independencia de Estados Unidos?', '2023-11-11 09:33:00', NULL, NULL),
(24, 17, '¿Cuál es el lago más profundo del mundo?', '2023-11-11 09:33:00', NULL, NULL),
(25, 17, '¿Quién pintó la obra \"La Noche Estrellada\"?', '2023-11-11 09:33:00', NULL, NULL),
(26, 17, '¿Cuál es el planeta más grande del sistema solar?', '2023-11-11 09:33:00', NULL, NULL),
(27, 17, '¿Cuál es el autor de la canción \"Imagine\"?', '2023-11-11 09:33:00', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `rol`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'DOCENTE', '2023-11-09 14:57:38', NULL, NULL),
(2, 'ESTUDIANTE', '2023-11-09 14:57:38', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `idrol`, `apellidos`, `nombres`, `correo`, `claveacceso`, `token`, `token_estado`, `create_at`, `update_at`, `inactive_at`, `fechatoken`) VALUES
(2, 1, 'Muñoz', 'Alonso', 'alonsomunoz263@gamil.com', '$2y$10$JrWpvfajT/tVlC6C4f3q7eYYHVaOcG1MK/sIc0mqGPBGJ5dHM/P12', NULL, NULL, '2023-11-09 14:57:42', NULL, NULL, NULL),
(3, 2, 'Villegas Salazar', 'Luis', 'villegasalazar08@gmail.com', '$2y$10$wmuTazpPzTLuIzuxwpIdjON3uUIEIT/cN3E.XJcA6wiix0dpzMJD6', '498554', 'P', '2023-11-09 15:23:18', NULL, NULL, '2023-11-11 08:34:42'),
(4, 2, 'Martinez', 'Alfonso', 'alonsomredick@gmail.com', '$2y$10$JrWpvfajT/tVlC6C4f3q7eYYHVaOcG1MK/sIc0mqGPBGJ5dHM/P12', NULL, NULL, '2023-11-10 14:50:32', NULL, NULL, NULL),
(5, 2, 'Quispe Napa', 'Harold', 'efrainqn16@gmail.com', '$2y$10$JrWpvfajT/tVlC6C4f3q7eYYHVaOcG1MK/sIc0mqGPBGJ5dHM/P12', '581667', 'P', '2023-11-10 22:57:47', NULL, NULL, '2023-11-11 00:29:32');

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
-- Indices de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`idevaluacion`),
  ADD KEY `fk_idusuario_eval` (`idusuario`),
  ADD KEY `fk_idinscrito_eval` (`idinscrito`);

--
-- Indices de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  ADD PRIMARY KEY (`idinscrito`),
  ADD UNIQUE KEY `un_iduser_ins` (`idusuario`);

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
  MODIFY `idalternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `idevaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  MODIFY `idinscrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  ADD CONSTRAINT `fk_idinscrito_eval` FOREIGN KEY (`idinscrito`) REFERENCES `inscritos` (`idinscrito`),
  ADD CONSTRAINT `fk_idusuario_eval` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Filtros para la tabla `inscritos`
--
ALTER TABLE `inscritos`
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
