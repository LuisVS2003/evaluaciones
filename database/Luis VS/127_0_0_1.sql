-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2023 a las 15:56:39
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

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
CREATE DATABASE IF NOT EXISTS `evaluaciones` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `evaluaciones`;

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
(41, 12, 'p', 'N', '2023-11-15 12:51:00', NULL, NULL),
(42, 28, 'Alter 1', 'N', '2023-11-16 19:13:06', NULL, NULL),
(43, 28, 'Alter 2', 'S', '2023-11-16 19:13:06', NULL, NULL),
(44, 28, 'Alter 3', 'N', '2023-11-16 19:13:06', NULL, NULL),
(45, 29, 'Hidrogeno', 'S', '2023-11-16 19:13:06', NULL, NULL),
(46, 29, 'No se q poner', 'N', '2023-11-16 19:13:06', NULL, NULL),
(47, 30, 'Europa', 'N', '2023-11-17 16:40:42', NULL, NULL),
(48, 30, 'Paris', 'S', '2023-11-17 16:40:42', NULL, NULL),
(49, 31, 'Solar ', 'S', '2023-11-18 09:45:43', NULL, NULL),
(50, 31, 'Eólica ', 'S', '2023-11-18 09:45:43', NULL, NULL),
(51, 31, 'Nuclear', 'N', '2023-11-18 09:45:43', NULL, NULL),
(52, 32, 'Júpiter', 'N', '2023-11-18 09:45:43', NULL, NULL),
(53, 31, 'Petróleo', 'N', '2023-11-18 09:45:43', NULL, NULL),
(54, 32, 'Saturno ', 'S', '2023-11-18 09:45:43', NULL, NULL),
(55, 33, 'Madrid', 'N', '2023-11-18 09:45:43', NULL, NULL),
(56, 32, 'Neptuno ', 'N', '2023-11-18 09:45:43', NULL, NULL),
(57, 33, 'París ', 'S', '2023-11-18 09:45:43', NULL, NULL),
(58, 33, 'Roma', 'N', '2023-11-18 09:45:43', NULL, NULL),
(59, 35, '', 'N', '2023-11-18 17:28:18', NULL, NULL),
(60, 35, '', 'N', '2023-11-18 17:28:18', NULL, NULL),
(61, 36, '', 'N', '2023-11-18 17:29:58', NULL, NULL),
(62, 36, '', 'N', '2023-11-18 17:29:58', NULL, NULL),
(63, 37, '', 'N', '2023-11-18 17:32:41', NULL, NULL),
(64, 37, '', 'N', '2023-11-18 17:32:41', NULL, NULL),
(65, 38, '', 'N', '2023-11-18 17:35:23', NULL, NULL),
(66, 38, '', 'N', '2023-11-18 17:35:23', NULL, NULL),
(67, 40, '', 'N', '2023-11-18 17:45:41', NULL, NULL),
(68, 40, '', 'N', '2023-11-18 17:45:41', NULL, NULL),
(69, 41, '', 'N', '2023-11-18 17:46:42', NULL, NULL),
(70, 41, '', 'N', '2023-11-18 17:46:42', NULL, NULL),
(71, 42, '', 'N', '2023-11-18 17:47:30', NULL, NULL),
(72, 42, '', 'N', '2023-11-18 17:47:30', NULL, NULL),
(73, 43, '', 'N', '2023-11-18 17:49:40', NULL, NULL),
(74, 43, '', 'N', '2023-11-18 17:49:40', NULL, NULL),
(75, 44, '', 'N', '2023-11-18 17:50:38', NULL, NULL),
(76, 44, '', 'N', '2023-11-18 17:50:38', NULL, NULL),
(77, 45, '', 'N', '2023-11-18 17:51:09', NULL, NULL),
(78, 45, '', 'N', '2023-11-18 17:51:09', NULL, NULL),
(79, 46, 'Alter 1', 'N', '2023-11-18 17:52:27', NULL, NULL),
(80, 46, 'Alter 2', 'S', '2023-11-18 17:52:27', NULL, NULL),
(81, 47, 'Alter 2', 'S', '2023-11-18 17:58:53', NULL, NULL),
(82, 47, 'Alter 1', 'N', '2023-11-18 17:58:53', NULL, NULL),
(83, 48, 'Hidrogeno', 'S', '2023-11-18 17:58:53', NULL, NULL),
(84, 48, 'No se q poner', 'N', '2023-11-18 17:58:53', NULL, NULL),
(85, 49, 'Alter 1', 'N', '2023-11-18 18:05:58', NULL, NULL),
(86, 49, 'Alter 2', 'S', '2023-11-18 18:05:58', NULL, NULL);

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
(1, 1, 1, 'Evaluación 1 Electricidad Industrial', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(2, 1, 1, 'Evaluación 2 Electricidad Industrial', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(3, 3, 1, 'Evaluación 1 Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(4, 3, 1, 'Evaluación 2 Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(5, 3, 1, 'Evaluación 3 Ing. de Software con IA', '2023-11-12 08:48:46', NULL, NULL, NULL, NULL),
(7, 1, 1, 'Test Thunder', '2023-11-13 09:26:57', NULL, NULL, '2023-11-12 10:00:00', '2023-11-22 10:00:00'),
(8, 1, 1, 'Nuevo Examen', '2023-11-15 12:51:00', NULL, NULL, '2023-11-15 12:50:00', '2023-11-16 12:50:00'),
(9, 3, 1, 'Examen de Luis', '2023-11-16 18:44:22', NULL, NULL, '2023-11-16 18:43:00', '2023-11-16 18:43:00'),
(10, 3, 1, 'Examen de Luis', '2023-11-16 18:48:51', NULL, NULL, '2023-11-16 18:48:00', '2023-11-30 18:48:00'),
(11, 3, 1, 'Examen de Luis 2', '2023-11-16 18:50:24', NULL, NULL, '2023-11-16 18:50:00', '2023-11-16 18:50:00'),
(12, 3, 1, 'Test Alternativas', '2023-11-16 19:00:22', NULL, NULL, '2023-11-16 18:59:00', '2023-11-29 18:59:00'),
(13, 3, 1, 'Test Alternativas 2', '2023-11-16 19:01:20', NULL, NULL, '2023-11-16 19:01:00', '2023-11-16 19:01:00'),
(14, 3, 1, 'Test Alternativas 3', '2023-11-16 19:02:09', NULL, NULL, '2023-11-16 19:01:00', '2023-11-16 19:01:00'),
(15, 3, 1, 'Test Alternativas 2', '2023-11-16 19:04:38', NULL, NULL, '2023-11-16 19:04:00', '2023-11-30 19:04:00'),
(16, 3, 1, 'Examen de Luis', '2023-11-16 19:05:38', NULL, NULL, '2023-11-16 19:05:00', '2023-11-16 19:05:00'),
(17, 3, 1, 'Test Alternativas 3', '2023-11-16 19:06:35', NULL, NULL, '2023-11-30 19:06:00', '2023-12-09 19:06:00'),
(18, 3, 1, 'Examen de Luis', '2023-11-16 19:07:44', NULL, NULL, '2023-11-16 19:07:00', '2023-11-30 19:07:00'),
(19, 3, 1, 'Examen de Luis 2', '2023-11-16 19:10:15', NULL, NULL, '2023-11-16 19:09:00', '2023-11-16 19:09:00'),
(20, 3, 1, 'Examen de Luis', '2023-11-16 19:11:08', NULL, NULL, '2023-11-16 19:10:00', '2023-11-16 19:10:00'),
(21, 4, 1, 'Examen Premium', '2023-11-16 19:13:05', NULL, NULL, '2023-11-16 19:12:00', '2023-11-30 19:12:00'),
(22, 1, 1, 'Evaluacion V2', '2023-11-17 16:29:35', NULL, NULL, NULL, NULL),
(23, 1, 1, 'Evaluacion Thunder V2', '2023-11-17 16:35:06', NULL, NULL, NULL, NULL),
(24, 3, 1, 'Evaluación Vista V2', '2023-11-17 16:40:40', NULL, NULL, '2023-11-17 16:40:00', '2023-11-17 16:40:00'),
(25, 3, 1, 'Testeo para las Respuestas', '2023-11-18 09:45:41', NULL, NULL, '2023-11-18 09:44:00', '2023-11-30 09:44:00'),
(26, 3, 1, 'Testeo para las Respuestas', '2023-11-18 17:28:16', NULL, NULL, '2023-11-18 17:25:00', '2023-11-18 17:25:00'),
(27, 3, 1, 'Testeo para los puntos', '2023-11-18 17:29:56', NULL, NULL, '2023-11-18 17:29:00', '2023-11-18 17:29:00'),
(28, 3, 1, 'Examen de Luis', '2023-11-18 17:32:40', NULL, NULL, '2023-11-18 17:31:00', '2023-11-18 17:31:00'),
(29, 3, 1, 'Checkeo', '2023-11-18 17:33:54', NULL, NULL, '2023-11-18 17:33:00', '2023-11-18 17:33:00'),
(30, 3, 1, 'Examen de Luis', '2023-11-18 17:35:22', NULL, NULL, '2023-11-18 17:35:00', '2023-11-18 17:35:00'),
(31, 3, 1, 'Examen de Luis', '2023-11-18 17:45:40', NULL, NULL, '2023-11-18 17:45:00', '2023-11-18 17:45:00'),
(32, 2, 1, 'Examen de Luis', '2023-11-18 17:46:41', NULL, NULL, '2023-11-18 17:46:00', '2023-11-18 17:46:00'),
(33, 3, 1, 'Examen de Luis', '2023-11-18 17:47:29', NULL, NULL, '2023-11-18 17:47:00', '2023-11-18 17:47:00'),
(34, 3, 1, 'Examen de Luis', '2023-11-18 17:49:39', NULL, NULL, '2023-11-18 17:49:00', '2023-11-18 17:49:00'),
(35, 3, 1, 'Examen de Luis 2', '2023-11-18 17:50:37', NULL, NULL, '2023-11-18 17:50:00', '2023-11-18 17:50:00'),
(36, 3, 1, 'Examen de Luis', '2023-11-18 17:51:08', NULL, NULL, '2023-11-18 17:50:00', '2023-11-18 17:50:00'),
(37, 3, 1, 'Testeo para las Respuestas', '2023-11-18 17:52:26', NULL, NULL, '2023-11-18 17:52:00', '2023-11-18 17:52:00'),
(38, 3, 1, 'Testeo Definitivo de Puntos', '2023-11-18 17:58:52', NULL, NULL, '2023-11-18 17:58:00', '2023-11-18 17:58:00'),
(39, 3, 1, 'Ver fecha', '2023-11-18 18:05:55', NULL, NULL, '2023-11-30 18:05:00', '2023-11-18 18:05:00');

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
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 2, NULL, NULL),
(4, 1, 3, NULL, NULL),
(5, 2, 3, NULL, NULL),
(6, 2, 3, NULL, NULL),
(7, 2, 4, NULL, NULL),
(8, 2, 4, NULL, NULL),
(9, 2, 7, NULL, NULL),
(10, 2, 8, NULL, NULL),
(11, 2, 21, NULL, NULL),
(12, 2, 5, NULL, NULL),
(13, 3, 21, '2023-11-19 00:26:21', '2023-11-19 00:26:50');

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
(1, 1, '¿Cuál es el concepto clave en Electricidad Industrial?', '2023-11-12 08:59:09', NULL, NULL, 4),
(2, 1, '¿Cómo se llama el componente que almacena energía en un circuito eléctrico?', '2023-11-12 08:59:09', NULL, NULL, 4),
(3, 1, '¿Cuál es la unidad de medida de la corriente eléctrica?', '2023-11-12 08:59:09', NULL, NULL, 4),
(4, 2, '¿Cuáles son los componentes esenciales de un sistema de escape en un automóvil?', '2023-11-12 08:59:09', NULL, NULL, 4),
(5, 2, '¿Qué tipo de combustible utiliza un motor diésel?', '2023-11-12 08:59:09', NULL, NULL, 4),
(6, 2, '¿Cuál es la función principal del sistema de frenos en un automóvil?', '2023-11-12 08:59:09', NULL, NULL, 4),
(7, 3, '¿Cuáles son los principios de la programación orientada a objetos?', '2023-11-12 08:59:09', NULL, NULL, 4),
(8, 3, '¿Qué significa JVM en el contexto de Java?', '2023-11-12 08:59:09', NULL, NULL, 4),
(9, 3, '¿Cómo se declara una variable en Java?', '2023-11-12 08:59:09', NULL, NULL, 4),
(10, 7, 'Pregunta Test Thunder', '2023-11-13 09:28:49', NULL, NULL, 4),
(11, 8, 'p', '2023-11-15 12:51:00', NULL, NULL, 4),
(12, 8, 'p', '2023-11-15 12:51:00', NULL, NULL, 4),
(13, 8, 'p', '2023-11-15 12:51:00', NULL, NULL, 4),
(14, 8, 'p', '2023-11-15 12:51:00', NULL, NULL, 4),
(15, 9, '¿Cuál es el capital de Francia?', '2023-11-16 18:44:24', NULL, NULL, 4),
(16, 9, '¿Cuál es el elemento químico representado por el símbolo \"H\"?', '2023-11-16 18:44:24', NULL, NULL, 4),
(17, 11, '¿Cuál es el capital de Francia?', '2023-11-16 18:50:26', NULL, NULL, 4),
(18, 12, '¿Cuál es el capital de Francia?', '2023-11-16 19:00:24', NULL, NULL, 4),
(19, 13, '¿Cuál es el capital de Francia?', '2023-11-16 19:01:21', NULL, NULL, 4),
(20, 14, '¿Cuál es el capital de Francia?', '2023-11-16 19:02:11', NULL, NULL, 4),
(21, 14, '¿Cuál es el elemento químico representado por el símbolo \"H\"?', '2023-11-16 19:02:11', NULL, NULL, 4),
(22, 15, '¿Cuál es el capital de Francia?', '2023-11-16 19:04:39', NULL, NULL, 4),
(23, 16, '¿Cuál es el capital de Francia?', '2023-11-16 19:05:39', NULL, NULL, 4),
(24, 17, '¿Cuál es el capital de Francia?', '2023-11-16 19:06:37', NULL, NULL, 4),
(25, 18, '¿Cuál es el capital de Francia?', '2023-11-16 19:07:45', NULL, NULL, 4),
(26, 19, '¿Cuál es el capital de Francia?', '2023-11-16 19:10:16', NULL, NULL, 4),
(27, 20, '¿Cuál es el capital de Francia?', '2023-11-16 19:11:09', NULL, NULL, 4),
(28, 21, '¿Cuál es el capital de Francia?', '2023-11-16 19:13:06', NULL, NULL, 4),
(29, 21, '¿Cuál es el elemento químico representado por el símbolo \"H\"?', '2023-11-16 19:13:06', NULL, NULL, 4),
(30, 24, '¿Cuál es el capital de Francia?', '2023-11-17 16:40:42', NULL, NULL, 4),
(31, 25, '¿Cuáles son los dos tipos principales de energía renovable?', '2023-11-18 09:45:43', NULL, NULL, 0),
(32, 25, '¿Cuál es la capital de Francia?', '2023-11-18 09:45:43', NULL, NULL, 0),
(33, 25, '¿Cuáles son dos de los planetas del sistema solar con anillos?', '2023-11-18 09:45:43', NULL, NULL, 0),
(34, 1, 'Testeo de Puntos', '2023-11-18 17:17:48', NULL, NULL, 5),
(35, 26, '', '2023-11-18 17:28:18', NULL, NULL, 0),
(36, 27, '', '2023-11-18 17:29:58', NULL, NULL, 0),
(37, 28, '', '2023-11-18 17:32:41', NULL, NULL, 0),
(38, 30, '', '2023-11-18 17:35:23', NULL, NULL, 1),
(39, 1, 'Testeo de Puntos 2', '2023-11-18 17:42:50', NULL, NULL, 5),
(40, 31, '', '2023-11-18 17:45:41', NULL, NULL, 1),
(41, 32, '', '2023-11-18 17:46:42', NULL, NULL, 1),
(42, 33, '', '2023-11-18 17:47:30', NULL, NULL, 1),
(43, 34, '', '2023-11-18 17:49:40', NULL, NULL, 1),
(44, 35, '[object HTMLInputElement]', '2023-11-18 17:50:38', NULL, NULL, 1),
(45, 36, '[object HTMLInputElement]', '2023-11-18 17:51:09', NULL, NULL, 1),
(46, 37, '¿Cuál es el capital de Francia?', '2023-11-18 17:52:27', NULL, NULL, 1),
(47, 38, '¿Cuáles son los dos tipos principales de energía renovable?', '2023-11-18 17:58:53', NULL, NULL, 10),
(48, 38, '¿Cuál es el elemento químico representado por el símbolo \"H\"?', '2023-11-18 17:58:53', NULL, NULL, 10),
(49, 39, '¿Cuál es el capital de Francia?', '2023-11-18 18:05:58', NULL, NULL, 10);

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
(1, 1, 3, '2023-11-18 09:12:58', NULL, NULL),
(2, 1, 5, '2023-11-18 09:12:58', NULL, NULL),
(3, 1, 8, '2023-11-18 09:12:58', NULL, NULL),
(4, 2, 2, '2023-11-18 09:32:40', NULL, NULL),
(5, 2, 4, '2023-11-18 09:32:40', NULL, NULL),
(6, 2, 7, '2023-11-18 09:32:40', NULL, NULL),
(7, 1, 1, '2023-11-18 12:02:14', NULL, NULL),
(8, 1, 1, '2023-11-18 12:08:55', NULL, NULL),
(9, 1, 7, '2023-11-18 12:44:52', NULL, NULL),
(10, 1, 4, '2023-11-18 12:44:52', NULL, NULL),
(11, 1, 3, '2023-11-18 12:44:52', NULL, NULL),
(12, 1, 2, '2023-11-18 12:47:13', NULL, NULL),
(13, 1, 7, '2023-11-18 12:47:13', NULL, NULL),
(14, 1, 5, '2023-11-18 12:47:13', NULL, NULL),
(15, 1, 1, '2023-11-18 12:49:03', NULL, NULL),
(16, 1, 7, '2023-11-18 12:49:03', NULL, NULL),
(17, 1, 4, '2023-11-18 12:49:03', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `idrol`, `apellidos`, `nombres`, `correo`, `claveacceso`, `token`, `token_estado`, `create_at`, `update_at`, `inactive_at`, `fechatoken`) VALUES
(1, 1, 'González', 'Juan', 'juan.gonzalez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(2, 2, 'Martínez', 'Ana', 'ana.martinez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(3, 2, 'Rodríguez', 'Pedro', 'pedro.rodriguez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(4, 2, 'Sánchez', 'Laura', 'laura.sanchez@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(5, 2, 'Díaz', 'Carlos', 'carlos.diaz@example.com', '$2y$10$hbzZihcSrLuQxZvnfmqYCu9z0gEMU2JnaGmjqPkfwpuuxf5un8ejS', NULL, NULL, '2023-11-12 08:48:46', NULL, NULL, NULL),
(6, 2, 'Villegas Salazar', 'Luis', 'villegasalazar08@gmail.com', '$2y$10$agTIMGR8DG68EJM9qzCxm.AefDUj4wEGJawA6JZB6w9LhUvrYqomm', '116081', 'P', '2023-11-19 09:47:03', NULL, NULL, '2023-11-19 09:47:12');

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
  MODIFY `idalternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `idevaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `inscritos`
--
ALTER TABLE `inscritos`
  MODIFY `idinscrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `idrespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"evaluaciones\",\"table\":\"evaluaciones\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-11-19 14:56:36', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
