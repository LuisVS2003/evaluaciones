-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 01:28:50
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_fecha_fin` (IN `_idinscrito` INT, IN `_idevaluacion` INT, IN `_fechafin` DATETIME)   BEGIN
    UPDATE inscritos
    SET fechafin = _fechafin
    WHERE idinscrito = _idinscrito and idevaluacion = _idevaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_fecha_inicio` (IN `_idinscrito` INT, IN `_idevaluacion` INT, IN `_fechainicio` DATETIME)   BEGIN
    UPDATE inscritos
    SET fechainicio = _fechainicio
    WHERE idinscrito = _idinscrito and idevaluacion = _idevaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_actualizar_pass` (IN `_correo` VARCHAR(90), IN `_token` VARCHAR(6), IN `_claveacceso` VARCHAR(90))   BEGIN
	UPDATE usuarios SET
    claveacceso = _claveacceso,
    token_estado = 'C',
    token = NULL
    WHERE correo = _correo AND token = _token;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alternativas_correctas` (IN `_idevaluacion` INT)   BEGIN
	SELECT
		ALT.idalternativa, PRG.idpregunta, EVA.idevaluacion,
        PRG.pregunta, ALT.alternativa, ALT.escorrecto
    FROM alternativas ALT
		INNER JOIN preguntas PRG ON PRG.idpregunta = ALT.idpregunta
        INNER JOIN evaluaciones EVA ON EVA.idevaluacion = PRG.idevaluacion
	WHERE ALT.escorrecto = 'S' AND EVA.idevaluacion = _idevaluacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_alternativas_listar` ()   BEGIN
	SELECT 
		ALT.idalternativa,
        ALT.alternativa,
        PRE.idpregunta,
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
    USR.idusuario,
    MIN(INS.idevaluacion) AS idevaluacion,
    CONCAT(USR.apellidos, ", ", USR.nombres) AS nombre_completo
	FROM usuarios USR
	INNER JOIN inscritos INS ON INS.idusuario = USR.idusuario
	WHERE USR.idrol = 2 AND USR.inactive_at IS NULL
	GROUP BY USR.idusuario, USR.apellidos, USR.nombres;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluaciones_registrar` (IN `_idcurso` INT, IN `_idusuario` INT, IN `_nombre_evaluacion` VARCHAR(90), IN `_fechainicio` DATETIME, IN `_fechafin` DATETIME)   BEGIN
	INSERT INTO evaluaciones
		(idcurso, idusuario, nombre_evaluacion, fechainicio, fechafin)
    VALUES
		(_idcurso, _idusuario, _nombre_evaluacion, NULLIF(_fechainicio, ''), NULLIF(_fechafin, ''));
    SELECT @@last_insert_id 'idevaluacion';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_evaluacion_preguntas` (IN `_idevaluacion` INT)   BEGIN
	SELECT 
		idpregunta, idevaluacion, pregunta, puntos
	FROM preguntas
	WHERE 	idevaluacion = _idevaluacion AND
			inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_fecha_mes` ()   BEGIN
SELECT
        u.idusuario,
        u.apellidos,
        u.nombres,
        c.curso,
        e.nombre_evaluacion,
        i.fechainicio,
        i.fechafin
    FROM
        cursos c
    LEFT JOIN
        evaluaciones e ON c.idcurso = e.idcurso
    LEFT JOIN
        inscritos i ON e.idevaluacion = i.idevaluacion
    LEFT JOIN
        usuarios u ON i.idusuario = u.idusuario
    WHERE
        e.fechainicio <= CURDATE() AND (e.fechafin IS NULL OR e.fechafin >= CURDATE())
    ORDER BY
        c.curso, e.nombre_evaluacion, u.apellidos, u.nombres;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_inscritos_registrar` (IN `_idusuario` INT, IN `_idevaluacion` INT)   BEGIN
	INSERT INTO inscritos
		(idusuario, idevaluacion)
    VALUES
		(_idusuario, _idevaluacion);
    SELECT @@last_insert_id 'idinscrito';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_cursos` ()   BEGIN
	SELECT 
    u.nombres,
    u.apellidos,
    c.curso,
    e.fechainicio,
    e.fechafin
	FROM usuarios u
	JOIN roles r ON u.idrol = r.idrol
	JOIN inscritos i ON u.idusuario = i.idusuario
	JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
	JOIN cursos c ON e.idcurso = c.idcurso
	WHERE r.idrol = 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_listar_evaluaciones_x_curso` (IN `p_idusuario` INT, IN `p_idcurso` INT)   BEGIN
    SELECT 
        c.curso,
        e.nombre_evaluacion,
        e.fechainicio,
        e.fechafin,
        i.idevaluacion,
        i.idusuario,
        i.idinscrito
    FROM usuarios u
    JOIN roles r ON u.idrol = r.idrol
    LEFT JOIN inscritos i ON u.idusuario = i.idusuario
    LEFT JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
    LEFT JOIN cursos c ON e.idcurso = c.idcurso
    WHERE r.idrol = 2 AND u.idusuario = p_idusuario AND c.idcurso = p_idcurso;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_obtener_evaluaciones_curso` (IN `_campo` INT)   BEGIN
    SELECT DISTINCT u.nombres, u.apellidos, u.idusuario
        FROM usuarios u
        JOIN inscritos i ON u.idusuario = i.idusuario
        JOIN evaluaciones e ON i.idevaluacion = e.idevaluacion
        WHERE e.idcurso = _campo AND u.idrol = 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_preguntas_alternativas` (IN `_idpregunta` INT)   BEGIN
	SELECT 
		idalternativa,
        alternativa,
        idpregunta,
        escorrecto
	FROM alternativas
	WHERE	idpregunta = _idpregunta AND
			inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_preguntas_listar` ()   BEGIN
	SELECT 
		idpregunta, idevaluacion, pregunta, puntos
	FROM preguntas
	WHERE inactive_at IS NULL;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_preguntas_registrar` (IN `_idevaluacion` INT, IN `_pregunta` TEXT, IN `_puntos` TINYINT)   BEGIN
	INSERT INTO preguntas
		(idevaluacion, pregunta, puntos)
    VALUES
		(_idevaluacion,  _pregunta, _puntos);
    SELECT @@last_insert_id 'idpregunta';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_registra_token` (IN `_correo` VARCHAR(90), IN `_token` VARCHAR(6))   BEGIN
	UPDATE usuarios SET
    token_estado = 'P', 
    token = _token,
    fechatoken = NOW()
    WHERE _correo = correo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_rendir_poruser` (IN `p_idusuario` INT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_respuestas_marcadas` (IN `_idinscrito` INT)   BEGIN
	SELECT
		INS.idinscrito,
		SUM(CASE WHEN ALT.escorrecto = 'S' THEN PRG.puntos ELSE 0 END) AS 'marcados',
		SUM(CASE WHEN (ALT.escorrecto = 'N' OR ALT.escorrecto = 'S') THEN PRG.puntos ELSE 0 END) AS 'puntos_totales'
	FROM respuestas RPT
		INNER JOIN inscritos INS ON INS.idinscrito = RPT.idinscrito
		INNER JOIN alternativas ALT ON ALT.idalternativa = RPT.idalternativa
		INNER JOIN preguntas PRG ON PRG.idpregunta = ALT.idpregunta
	WHERE
		RPT.idinscrito = _idinscrito
	GROUP BY INS.idinscrito;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_respuestas_registrar` (IN `_idinscrito` INT, IN `_idalternativa` INT)   BEGIN
	INSERT INTO respuestas
		(idinscrito, idalternativa)
	VALUES
		(_idinscrito, _idalternativa);
	SELECT @@last_insert_id 'idrespuesta';
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_listar_evalauciones_x_curso` (IN `idcurso` VARCHAR(20))   BEGIN
	SELECT
		c.idcurso,
        c.curso,
        e.idevalaucion,
        e.nombre_evaluacion
	FROM cursos c
		INNER JOIN evaluaciones e ON e.idevaluacion = c.evaluacion
	WHERE rol.rol = 'Estudiante';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spu_usuario_listar_evaluaciones_x_curso` (IN `_idcurso` VARCHAR(20))   BEGIN
    SELECT
        c.idcurso,
        c.curso,
        e.idevaluacion,
        e.nombre_evaluacion
    FROM cursos c
        INNER JOIN evaluaciones e ON e.idcurso = c.idcurso
    WHERE c.idcurso = _idcurso;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alternativas`
--

INSERT INTO `alternativas` (`idalternativa`, `idpregunta`, `alternativa`, `escorrecto`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 'Principio de Arquímedes', 'S', '2023-11-19 19:09:35', NULL, NULL),
(2, 2, 'Generadores solares', 'N', '2023-11-19 19:09:35', NULL, NULL),
(3, 1, 'Ley de Newton', 'N', '2023-11-19 19:09:35', NULL, NULL),
(4, 2, 'Centrales eléctricas', 'S', '2023-11-19 19:09:35', NULL, NULL),
(5, 4, 'Relación entre masa y energía', 'S', '2023-11-19 19:09:35', NULL, NULL),
(6, 4, 'Relación entre masa y efolio', 'N', '2023-11-19 19:09:35', NULL, NULL),
(7, 4, 'Principio de conservación de la carga', 'N', '2023-11-19 19:09:35', NULL, NULL),
(8, 3, 'Conectores USB', 'N', '2023-11-19 19:09:35', NULL, NULL),
(9, 2, 'Centrales nucleares', 'N', '2023-11-19 19:09:35', NULL, NULL),
(10, 1, 'Ley de Ohm', 'N', '2023-11-19 19:09:35', NULL, NULL),
(11, 5, 'Potencia = Corriente × Voltaje', 'S', '2023-11-19 19:09:35', NULL, NULL),
(12, 3, 'Relés térmicos', 'S', '2023-11-19 19:09:35', NULL, NULL),
(13, 5, 'Potencia = Masa × Aceleración', 'N', '2023-11-19 19:09:35', NULL, NULL),
(14, 3, 'Tubos de vacío', 'N', '2023-11-19 19:09:35', NULL, NULL),
(15, 5, 'Potencia = Tensión × Resistencia', 'N', '2023-11-19 19:09:35', NULL, NULL),
(16, 8, 'Sistema de escape', 'N', '2023-11-19 19:13:05', NULL, NULL),
(17, 8, 'Frenos de disco y pastillas de freno', 'S', '2023-11-19 19:13:05', NULL, NULL),
(18, 8, 'Cinturones de seguridad', 'N', '2023-11-19 19:13:05', NULL, NULL),
(19, 7, 'Proceso de combustión en el motor', 'S', '2023-11-19 19:13:05', NULL, NULL),
(20, 7, 'Ciclo lunar', 'N', '2023-11-19 19:13:05', NULL, NULL),
(21, 6, 'Lectura de hoja de vida del vehículo', 'N', '2023-11-19 19:13:05', NULL, NULL),
(22, 7, 'Mecanismos de dirección', 'N', '2023-11-19 19:13:05', NULL, NULL),
(23, 9, 'Drenaje de aceite usado y reemplazo de filtro', 'S', '2023-11-19 19:13:05', NULL, NULL),
(24, 9, 'Cambio de neumáticos', 'N', '2023-11-19 19:13:05', NULL, NULL),
(25, 10, 'Equipos de alineación láser', 'S', '2023-11-19 19:13:05', NULL, NULL),
(26, 10, 'Martillo y destornillador', 'N', '2023-11-19 19:13:05', NULL, NULL),
(27, 6, 'Pruebas de velocidad máxima', 'N', '2023-11-19 19:13:05', NULL, NULL),
(28, 6, 'Análisis de vibraciones', 'S', '2023-11-19 19:13:05', NULL, NULL),
(29, 10, 'Herramientas de jardín', 'N', '2023-11-19 19:13:05', NULL, NULL),
(30, 9, 'Pintura exterior', 'N', '2023-11-19 19:13:05', NULL, NULL),
(31, 11, 'Diseño gráfico', 'N', '2023-11-19 19:18:36', NULL, NULL),
(32, 11, 'Gestión de recursos humanos', 'N', '2023-11-19 19:18:36', NULL, NULL),
(33, 11, 'Automatización de tareas de desarrollo', 'S', '2023-11-19 19:18:36', NULL, NULL),
(34, 12, 'Proceso de enseñanza-aprendizaje automático', 'S', '2023-11-19 19:18:36', NULL, NULL),
(35, 13, 'Ética en el uso de datos de usuario', 'S', '2023-11-19 19:18:36', NULL, NULL),
(36, 13, 'Publicidad agresiva', 'N', '2023-11-19 19:18:36', NULL, NULL),
(37, 12, 'Estudio de mercado', 'N', '2023-11-19 19:18:36', NULL, NULL),
(38, 15, 'Experiencia en tecnologías específicas', 'S', '2023-11-19 19:18:36', NULL, NULL),
(39, 12, 'Reclutamiento de personal', 'N', '2023-11-19 19:18:36', NULL, NULL),
(40, 15, 'Habilidades culinarias', 'N', '2023-11-19 19:18:36', NULL, NULL),
(41, 15, 'Conocimiento de pintura abstracta', 'N', '2023-11-19 19:18:36', NULL, NULL),
(42, 14, 'Fases de iniciación, planificación, ejecución, monitoreo y cierre', 'S', '2023-11-19 19:18:36', NULL, NULL),
(43, 14, 'Ciclo de vida de una mariposa', 'N', '2023-11-19 19:18:36', NULL, NULL),
(44, 13, 'Desarrollo de productos de belleza', 'N', '2023-11-19 19:18:36', NULL, NULL),
(45, 14, 'Pasos para hacer un pastel', 'N', '2023-11-19 19:18:36', NULL, NULL),
(46, 16, 'Soldadura MIG y TIG', 'S', '2023-11-19 19:22:42', NULL, NULL),
(47, 18, 'Principio de arco eléctrico', 'S', '2023-11-19 19:22:42', NULL, NULL),
(48, 16, 'Soldadura de plástico', 'N', '2023-11-19 19:22:42', NULL, NULL),
(49, 16, 'Soldadura por puntos', 'N', '2023-11-19 19:22:42', NULL, NULL),
(50, 18, 'Principio de gravedad', 'N', '2023-11-19 19:22:42', NULL, NULL),
(51, 18, 'Principio de levitación magnética', 'N', '2023-11-19 19:22:42', NULL, NULL),
(52, 19, 'Industria automotriz', 'S', '2023-11-19 19:22:42', NULL, NULL),
(53, 20, 'Inspección radiográfica', 'S', '2023-11-19 19:22:42', NULL, NULL),
(54, 19, 'Industria textil', 'N', '2023-11-19 19:22:42', NULL, NULL),
(55, 20, 'Inspección visual con ojos cerrados', 'N', '2023-11-19 19:22:42', NULL, NULL),
(56, 20, 'Inspección por olfato', 'N', '2023-11-19 19:22:42', NULL, NULL),
(57, 17, 'Realizar la soldadura sin protección', 'N', '2023-11-19 19:22:42', NULL, NULL),
(58, 17, 'Uso de equipo de protección personal', 'S', '2023-11-19 19:22:42', NULL, NULL),
(59, 17, 'Cargar materiales sin precauciones', 'N', '2023-11-19 19:22:42', NULL, NULL),
(60, 19, 'Industria alimentaria', 'N', '2023-11-19 19:22:42', NULL, NULL),
(61, 21, 'Exclusión de objetivos', 'N', '2023-11-19 19:26:35', NULL, NULL),
(62, 21, 'Definición clara de objetivos', 'S', '2023-11-19 19:26:35', NULL, NULL),
(63, 21, 'Inclusión de objetivos ambiguos', 'N', '2023-11-19 19:26:35', NULL, NULL),
(64, 22, 'Identificación y clasificación de riesgos', 'S', '2023-11-19 19:26:35', NULL, NULL),
(65, 22, 'Celebrar riesgos', 'N', '2023-11-19 19:26:35', NULL, NULL),
(66, 22, 'Ignorar la identificación de riesgos', 'N', '2023-11-19 19:26:35', NULL, NULL),
(67, 25, 'Adaptabilidad y flexibilidad', 'N', '2023-11-19 19:26:35', NULL, NULL),
(68, 25, 'Resistencia al cambio\'', 'S', '2023-11-19 19:26:35', NULL, NULL),
(69, 24, 'Pruebas A/B en desarrollo de software', 'S', '2023-11-19 19:26:35', NULL, NULL),
(70, 25, 'Igualdad de enfoque', 'N', '2023-11-19 19:26:35', NULL, NULL),
(71, 24, 'Pruebas de velocidad de carrera', 'N', '2023-11-19 19:26:35', NULL, NULL),
(72, 24, 'Pruebas de resistencia física', 'N', '2023-11-19 19:26:35', NULL, NULL),
(73, 23, 'Evaluación continua del rendimiento', 'N', '2023-11-19 19:26:35', NULL, NULL),
(74, 23, 'Ignorar el rendimiento del equipo', 'S', '2023-11-19 19:26:35', NULL, NULL),
(75, 23, 'Recompensas aleatorias', 'N', '2023-11-19 19:26:35', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idcurso`, `curso`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Electricidad Industrial', '2023-11-19 18:57:01', NULL, NULL),
(2, 'Mecánica Automotriz', '2023-11-19 18:57:01', NULL, NULL),
(3, 'Ing. de Software con IA', '2023-11-19 18:57:01', NULL, NULL),
(4, 'Soldadura Avanzada', '2023-11-19 18:57:01', NULL, NULL),
(5, 'Gestión de Empresas', '2023-11-19 18:57:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `idevaluacion` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `nombre_evaluacion` varchar(90) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evaluaciones`
--

INSERT INTO `evaluaciones` (`idevaluacion`, `idcurso`, `idusuario`, `nombre_evaluacion`, `create_at`, `update_at`, `inactive_at`, `fechainicio`, `fechafin`) VALUES
(1, 1, 1, 'Fundamentos Eléctricos Industriales', '2023-11-19 19:09:34', NULL, NULL, '2023-11-19 19:06:00', '2023-11-22 19:06:00'),
(2, 2, 1, 'Mantenimiento Automotriz', '2023-11-19 19:13:04', NULL, NULL, '2023-11-20 19:10:00', '2023-11-21 19:10:00'),
(3, 3, 1, 'Desarrollo de Software con Inteligencia Artificial', '2023-11-19 19:18:35', NULL, NULL, '2023-11-21 19:13:00', '2023-11-22 19:13:00'),
(4, 4, 1, 'Técnicas Avanzadas de Soldadura', '2023-11-19 19:22:41', NULL, NULL, '2023-11-20 19:19:00', '2023-11-23 19:19:00'),
(5, 5, 1, 'Gestión Avanzada de Proyectos', '2023-11-19 19:26:35', NULL, NULL, '2023-11-20 19:23:00', '2023-11-24 19:23:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscritos`
--

INSERT INTO `inscritos` (`idinscrito`, `idusuario`, `idevaluacion`, `fechainicio`, `fechafin`) VALUES
(1, 2, 1, '2023-11-19 19:27:21', '2023-11-19 19:27:33');

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
  `inactive_at` datetime DEFAULT NULL,
  `puntos` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`idpregunta`, `idevaluacion`, `pregunta`, `create_at`, `update_at`, `inactive_at`, `puntos`) VALUES
(1, 1, '¿Cómo se generan y distribuyen energía en entornos industriales?', '2023-11-19 19:09:35', NULL, NULL, 4),
(2, 1, '¿Cuáles son los principales componentes de un panel eléctrico industrial?', '2023-11-19 19:09:35', NULL, NULL, 4),
(3, 1, '¿Cómo se calcula la potencia en un sistema eléctrico industrial?', '2023-11-19 19:09:35', NULL, NULL, 4),
(4, 1, 'Explique la ley de Ohm y su aplicación en sistemas eléctricos industriales.', '2023-11-19 19:09:35', NULL, NULL, 4),
(5, 1, '¿Cuáles son los principios fundamentales de la electricidad industrial?', '2023-11-19 19:09:35', NULL, NULL, 4),
(6, 2, '¿Cuáles son los componentes clave de un sistema de frenos automotrices?', '2023-11-19 19:13:05', NULL, NULL, 4),
(7, 2, '¿Cuáles son los métodos de diagnóstico de fallas en sistemas de suspensión automotriz?', '2023-11-19 19:13:05', NULL, NULL, 4),
(8, 2, 'Explique el ciclo de trabajo de un motor de combustión interna.', '2023-11-19 19:13:05', NULL, NULL, 4),
(9, 2, '¿Cómo se realiza la alineación de ruedas en vehículos?', '2023-11-19 19:13:05', NULL, NULL, 4),
(10, 2, 'Describa el proceso de cambio de aceite y su importancia en el mantenimiento automotriz.', '2023-11-19 19:13:05', NULL, NULL, 4),
(11, 3, 'Explique el concepto de aprendizaje automático y su aplicación en la ingeniería de software.', '2023-11-19 19:18:36', NULL, NULL, 4),
(12, 3, '¿Qué papel juega la inteligencia artificial en el desarrollo de software?', '2023-11-19 19:18:36', NULL, NULL, 4),
(13, 3, '¿Cómo se implementan los algoritmos de inteligencia artificial en aplicaciones de software?', '2023-11-19 19:18:36', NULL, NULL, 4),
(14, 3, '¿Cuáles son los desafíos éticos asociados con el uso de la inteligencia artificial en el desarrollo de software?', '2023-11-19 19:18:36', NULL, NULL, 4),
(15, 3, 'Describa el ciclo de vida típico de un proyecto de desarrollo de software.', '2023-11-19 19:18:36', NULL, NULL, 4),
(16, 4, '¿Cuáles son los diferentes tipos de soldadura utilizados en aplicaciones industriales avanzadas?', '2023-11-19 19:22:42', NULL, NULL, 4),
(17, 4, '¿Cuáles son las precauciones de seguridad clave en el proceso de soldadura?', '2023-11-19 19:22:42', NULL, NULL, 4),
(18, 4, '¿Cómo se realiza la inspección de soldaduras para garantizar la calidad?', '2023-11-19 19:22:42', NULL, NULL, 4),
(19, 4, 'Describa las aplicaciones de la soldadura láser en la industria.', '2023-11-19 19:22:42', NULL, NULL, 4),
(20, 4, 'Explique los principios detrás de la soldadura por arco eléctrico.', '2023-11-19 19:22:42', NULL, NULL, 4),
(21, 5, '¿Cuáles son las fases clave en el ciclo de vida de un proyecto?', '2023-11-19 19:26:35', NULL, NULL, 4),
(22, 5, 'Explique la importancia de la identificación y gestión de riesgos en la gestión de proyectos.', '2023-11-19 19:26:35', NULL, NULL, 4),
(23, 5, 'Describa las características de un buen líder de proyecto.', '2023-11-19 19:26:35', NULL, NULL, 4),
(24, 5, '¿Cómo se determina el camino crítico en un diagrama de Gantt?', '2023-11-19 19:26:35', NULL, NULL, 4),
(25, 5, '¿Cuál es la diferencia entre gestión de proyectos tradicional y ágil?', '2023-11-19 19:26:35', NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `idrespuesta` int(11) NOT NULL,
  `idinscrito` int(11) NOT NULL,
  `idalternativa` int(11) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`idrespuesta`, `idinscrito`, `idalternativa`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 1, 11, '2023-11-19 19:27:33', NULL, NULL),
(2, 1, 1, '2023-11-19 19:27:33', NULL, NULL),
(3, 1, 2, '2023-11-19 19:27:33', NULL, NULL),
(4, 1, 7, '2023-11-19 19:27:33', NULL, NULL),
(5, 1, 8, '2023-11-19 19:27:33', NULL, NULL);

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
(1, 'Docente', '2023-11-19 18:56:07', NULL, NULL),
(2, 'Estudiante', '2023-11-19 18:56:07', NULL, NULL);

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
(1, 1, 'González', 'Juan', 'juan.gonzalez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK', NULL, NULL, '2023-11-19 18:57:08', NULL, NULL, NULL),
(2, 2, 'Martínez', 'Ana', 'ana.martinez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK', NULL, NULL, '2023-11-19 18:57:08', NULL, NULL, NULL),
(3, 2, 'Rodríguez', 'Pedro', 'pedro.rodriguez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK', NULL, NULL, '2023-11-19 18:57:08', NULL, NULL, NULL),
(4, 2, 'Sánchez', 'Laura', 'laura.sanchez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK', NULL, NULL, '2023-11-19 18:57:08', NULL, NULL, NULL),
(5, 2, 'Díaz', 'Carlos', 'carlos.diaz@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK', NULL, NULL, '2023-11-19 18:57:08', NULL, NULL, NULL);

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
  ADD KEY `fk_idcurso_eval` (`idcurso`),
  ADD KEY `fk_iddocente_eval` (`idusuario`);

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
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`idrespuesta`),
  ADD KEY `fk_idinscrito_resp` (`idinscrito`),
  ADD KEY `fk_idalternativa_resp` (`idalternativa`);

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
  MODIFY `idalternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `idevaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  MODIFY `idinscrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `idrespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `fk_idcurso_eval` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`),
  ADD CONSTRAINT `fk_iddocente_eval` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

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
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `fk_idalternativa_resp` FOREIGN KEY (`idalternativa`) REFERENCES `alternativas` (`idalternativa`),
  ADD CONSTRAINT `fk_idinscrito_resp` FOREIGN KEY (`idinscrito`) REFERENCES `inscritos` (`idinscrito`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_idrol_user` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
