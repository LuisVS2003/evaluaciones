-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2023 a las 19:16:46
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
-- Base de datos: `appstore`
--
CREATE DATABASE IF NOT EXISTS `appstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `appstore`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategoria`, `categoria`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Computadoras', '2023-10-28 18:46:28', NULL, NULL),
(2, 'Telefonos Moviles', '2023-10-28 18:46:28', NULL, NULL),
(3, 'Monitores', '2023-10-28 18:46:28', NULL, NULL),
(4, 'Accesorios', '2023-10-28 18:46:28', NULL, NULL),
(5, 'Perifericos', '2023-10-28 18:46:28', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especificaciones`
--

CREATE TABLE `especificaciones` (
  `idespecificaciones` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `valor` varchar(300) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `especificaciones`
--

INSERT INTO `especificaciones` (`idespecificaciones`, `idproducto`, `clave`, `valor`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 3, 'Marca', 'Teros', '2023-10-29 18:29:27', NULL, NULL),
(2, 3, 'Linea', 'Gaming', '2023-10-29 18:29:27', NULL, NULL),
(3, 3, 'Modelo', '2150', '2023-10-29 18:29:27', NULL, NULL),
(4, 3, 'Color', 'Negro', '2023-10-29 18:29:27', NULL, NULL),
(5, 3, 'Voltaje', '220V', '2023-10-29 18:29:27', NULL, NULL),
(6, 4, 'Marca', 'Reg Dragon', '2023-10-29 18:31:56', NULL, NULL),
(7, 4, 'Linea', 'Gaming', '2023-10-29 18:31:56', NULL, NULL),
(8, 4, 'Modelo', 'ProRGB', '2023-10-29 18:31:56', NULL, NULL),
(9, 4, 'Color', 'Rosado', '2023-10-29 18:31:56', NULL, NULL),
(10, 4, 'Voltaje', '220V', '2023-10-29 18:31:56', NULL, NULL),
(12, 5, 'Marca', 'Asus', '2023-10-29 18:56:44', NULL, NULL),
(13, 1, 'Voltaje', '220V', '2023-11-01 11:36:19', NULL, NULL),
(14, 8, 'PRUEBA', 'PRUEBA', '2023-11-01 11:50:32', NULL, NULL),
(15, 8, 'PRUEBA', 'PRUEBA', '2023-11-01 11:55:34', NULL, NULL),
(16, 7, 'PRUEBA', 'PRUEBA', '2023-11-01 11:56:47', NULL, NULL),
(17, 5, 'PRUEBA', 'PRUEBA', '2023-11-01 12:29:22', NULL, NULL),
(18, 5, 'PRUEBAS2', 'PRUEBA2', '2023-11-01 17:39:33', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galerias`
--

CREATE TABLE `galerias` (
  `idgaleria` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `rutafoto` varchar(90) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `galerias`
--

INSERT INTO `galerias` (`idgaleria`, `idproducto`, `rutafoto`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 2, 'prubea.jpg', '2023-10-30 11:38:09', NULL, NULL),
(2, 1, 'pruebas.jpg', '2023-10-30 22:43:08', NULL, NULL),
(3, 1, 'pruebassss.jpg', '2023-10-30 22:43:58', NULL, NULL),
(4, 1, 'pruebasssss.jpg', '2023-10-30 22:44:03', NULL, NULL),
(5, 1, 'prueba.jpg', '2023-11-01 12:32:54', NULL, NULL),
(6, 8, 'C:\\fakepath\\harold.jpg', '2023-11-01 12:47:29', NULL, NULL),
(11, 8, 'C:\\fakepath\\harold.jpg', '2023-11-01 12:54:56', NULL, NULL),
(12, 4, 'C:\\fakepath\\3.jpg', '2023-11-01 13:53:14', NULL, NULL),
(13, 1, '../imagesharold.jpg', '2023-11-01 15:11:50', NULL, NULL),
(14, 1, '../imagesfoto.jpg', '2023-11-01 15:11:50', NULL, NULL),
(15, 1, 'harold.jpg', '2023-11-01 15:23:51', NULL, NULL),
(16, 1, '../imagesharold.jpg', '2023-11-01 15:26:22', NULL, NULL),
(17, 1, '../images4.jpg', '2023-11-01 15:26:31', NULL, NULL),
(18, 1, '../images3.jpg', '2023-11-01 15:26:31', NULL, NULL),
(19, 1, '../images1.jpg', '2023-11-01 15:26:31', NULL, NULL),
(20, 1, '../imagespikachu.jpg', '2023-11-01 15:26:31', NULL, NULL),
(21, 1, 'images/4.jpg', '2023-11-01 15:29:20', NULL, NULL),
(22, 1, 'images/3.jpg', '2023-11-01 15:29:20', NULL, NULL),
(23, 1, 'images/1.jpg', '2023-11-01 15:29:20', NULL, NULL),
(24, 1, 'images/pikachu.jpg', '2023-11-01 15:29:20', NULL, NULL),
(25, 1, 'images/harold.jpg', '2023-11-01 15:29:26', NULL, NULL),
(26, 1, 'images/foto.jpg', '2023-11-01 15:29:26', NULL, NULL),
(27, 1, '../imagesharold.jpg', '2023-11-01 15:29:48', NULL, NULL),
(28, 1, '../imagesfoto.jpg', '2023-11-01 15:29:48', NULL, NULL),
(29, 1, '../images5.jpg', '2023-11-01 15:30:03', NULL, NULL),
(30, 1, '../imagesperfil.jpg', '2023-11-01 15:30:29', NULL, NULL),
(31, 1, 'images/perfil.jpg', '2023-11-01 15:30:45', NULL, NULL),
(32, 1, 'images/perfil.jpg', '2023-11-01 15:30:46', NULL, NULL),
(33, 1, 'images/perfil.jpg', '2023-11-01 15:30:47', NULL, NULL),
(34, 1, 'images/perfil.jpg', '2023-11-01 15:30:47', NULL, NULL),
(35, 1, 'images/perfil.jpg', '2023-11-01 15:30:47', NULL, NULL),
(36, 1, 'images/perfil.jpg', '2023-11-01 15:32:21', NULL, NULL),
(37, 1, '../images/perfil.jpg', '2023-11-01 15:32:48', NULL, NULL),
(38, 5, '../images/harold.jpg', '2023-11-01 16:23:14', NULL, NULL),
(39, 5, '../images/foto.jpg', '2023-11-01 16:23:14', NULL, NULL),
(40, 5, '../images/pikachu.jpg', '2023-11-01 17:02:40', NULL, NULL),
(41, 5, '../images/perfil.jpg', '2023-11-01 17:02:40', NULL, NULL),
(42, 8, '../images/harold.jpg', '2023-11-01 17:08:06', NULL, NULL),
(43, 8, '../images/1.jpg', '2023-11-01 17:08:26', NULL, NULL),
(44, 4, 'harold.jpg', '2023-11-01 17:13:52', NULL, NULL),
(45, 4, 'foto.jpg', '2023-11-01 17:13:52', NULL, NULL),
(46, 5, '3.jpg', '2023-11-01 17:18:02', NULL, NULL),
(47, 5, '4.jpg', '2023-11-01 17:19:50', NULL, NULL),
(48, 3, '6475633928896a5f17580caffa6f2a0e32b2a222.jpg', '2023-11-01 17:26:12', NULL, NULL),
(49, 8, '663437bee9139571848754dc2339b19f66d6ea0b.jpg', '2023-11-01 17:40:58', NULL, NULL),
(50, 5, 'a80cd6e655732e8cb99a53b08ec6982a2e23092e.jpg', '2023-11-01 18:25:15', NULL, NULL),
(51, 5, '8e736087739891c29b7d2f000f18abf02b59eeb7.jpg', '2023-11-01 18:26:44', NULL, NULL),
(52, 5, 'e53cc70688fd604903c572491124593990235177.jpg', '2023-11-01 18:34:01', NULL, NULL),
(53, 5, 'f2b32cef3b9f7c204ccde411f76485036706351a.jpg', '2023-11-01 18:40:07', NULL, NULL),
(54, 5, '8176cff7553fee220becba7a024399e18426561d.jpg', '2023-11-01 18:40:14', NULL, NULL),
(55, 8, '8a6c887541527ef62e38167e3a6c616f9900348f.jpg', '2023-11-01 18:43:42', NULL, NULL),
(56, 8, 'e03f3803429408bef9add0c2a232c83d249248b6.jpg', '2023-11-01 23:19:33', NULL, NULL),
(57, 5, '5463c711f20ea23f1d67f6039c005a1eaaf4a286.jpg', '2023-11-03 21:32:41', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidades`
--

CREATE TABLE `nacionalidades` (
  `idnacionalidad` int(11) NOT NULL,
  `nombrepais` varchar(50) NOT NULL,
  `nombrecorto` char(3) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nacionalidades`
--

INSERT INTO `nacionalidades` (`idnacionalidad`, `nombrepais`, `nombrecorto`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 'Andorra', 'AND', '2023-10-28 17:16:43', NULL, NULL),
(2, 'Emiratos Árabes Unidos', 'ARE', '2023-10-28 17:16:43', NULL, NULL),
(3, 'Afganistán', 'AFG', '2023-10-28 17:16:43', NULL, NULL),
(4, 'Antigua y Barbuda', 'ATG', '2023-10-28 17:16:43', NULL, NULL),
(5, 'Anguila', 'AIA', '2023-10-28 17:16:43', NULL, NULL),
(6, 'Albania', 'ALB', '2023-10-28 17:16:43', NULL, NULL),
(7, 'Armenia', 'ARM', '2023-10-28 17:16:43', NULL, NULL),
(8, 'Antillas Neerlandesas', 'ANT', '2023-10-28 17:16:43', NULL, NULL),
(9, 'Angola', 'AGO', '2023-10-28 17:16:43', NULL, NULL),
(10, 'Antártida', 'ATA', '2023-10-28 17:16:43', NULL, NULL),
(11, 'Argentina', 'ARG', '2023-10-28 17:16:43', NULL, NULL),
(12, 'Samoa Americana', 'ASM', '2023-10-28 17:16:43', NULL, NULL),
(13, 'Austria', 'AUT', '2023-10-28 17:16:43', NULL, NULL),
(14, 'Australia', 'AUS', '2023-10-28 17:16:43', NULL, NULL),
(15, 'Aruba', 'ABW', '2023-10-28 17:16:43', NULL, NULL),
(16, 'Islas Áland', 'ALA', '2023-10-28 17:16:43', NULL, NULL),
(17, 'Azerbaiyán', 'AZE', '2023-10-28 17:16:43', NULL, NULL),
(18, 'Bosnia y Herzegovina', 'BIH', '2023-10-28 17:16:43', NULL, NULL),
(19, 'Barbados', 'BRB', '2023-10-28 17:16:43', NULL, NULL),
(20, 'Bangladesh', 'BGD', '2023-10-28 17:16:43', NULL, NULL),
(21, 'Bélgica', 'BEL', '2023-10-28 17:16:43', NULL, NULL),
(22, 'Burkina Faso', 'BFA', '2023-10-28 17:16:43', NULL, NULL),
(23, 'Bulgaria', 'BGR', '2023-10-28 17:16:43', NULL, NULL),
(24, 'Bahréin', 'BHR', '2023-10-28 17:16:43', NULL, NULL),
(25, 'Burundi', 'BDI', '2023-10-28 17:16:43', NULL, NULL),
(26, 'Benin', 'BEN', '2023-10-28 17:16:43', NULL, NULL),
(27, 'San Bartolomé', 'BLM', '2023-10-28 17:16:43', NULL, NULL),
(28, 'Bermudas', 'BMU', '2023-10-28 17:16:43', NULL, NULL),
(29, 'Brunéi', 'BRN', '2023-10-28 17:16:43', NULL, NULL),
(30, 'Bolivia', 'BOL', '2023-10-28 17:16:43', NULL, NULL),
(31, 'Brasil', 'BRA', '2023-10-28 17:16:43', NULL, NULL),
(32, 'Bahamas', 'BHS', '2023-10-28 17:16:43', NULL, NULL),
(33, 'Bhután', 'BTN', '2023-10-28 17:16:43', NULL, NULL),
(34, 'Isla Bouvet', 'BVT', '2023-10-28 17:16:43', NULL, NULL),
(35, 'Botsuana', 'BWA', '2023-10-28 17:16:43', NULL, NULL),
(36, 'Belarús', 'BLR', '2023-10-28 17:16:43', NULL, NULL),
(37, 'Belice', 'BLZ', '2023-10-28 17:16:43', NULL, NULL),
(38, 'Canadá', 'CAN', '2023-10-28 17:16:43', NULL, NULL),
(39, 'Islas Cocos', 'CCK', '2023-10-28 17:16:43', NULL, NULL),
(40, 'República Centro-Africana', 'CAF', '2023-10-28 17:16:43', NULL, NULL),
(41, 'Congo', 'COG', '2023-10-28 17:16:43', NULL, NULL),
(42, 'Suiza', 'CHE', '2023-10-28 17:16:43', NULL, NULL),
(43, 'Costa de Marfil', 'CIV', '2023-10-28 17:16:43', NULL, NULL),
(44, 'Islas Cook', 'COK', '2023-10-28 17:16:43', NULL, NULL),
(45, 'Chile', 'CHL', '2023-10-28 17:16:43', NULL, NULL),
(46, 'Camerún', 'CMR', '2023-10-28 17:16:43', NULL, NULL),
(47, 'China', 'CHN', '2023-10-28 17:16:43', NULL, NULL),
(48, 'Colombia', 'COL', '2023-10-28 17:16:43', NULL, NULL),
(49, 'Costa Rica', 'CRI', '2023-10-28 17:16:43', NULL, NULL),
(50, 'Cuba', 'CUB', '2023-10-28 17:16:43', NULL, NULL),
(51, 'Cabo Verde', 'CPV', '2023-10-28 17:16:43', NULL, NULL),
(52, 'Islas Christmas', 'CXR', '2023-10-28 17:16:43', NULL, NULL),
(53, 'Chipre', 'CYP', '2023-10-28 17:16:43', NULL, NULL),
(54, 'República Checa', 'CZE', '2023-10-28 17:16:43', NULL, NULL),
(55, 'Alemania', 'DEU', '2023-10-28 17:16:43', NULL, NULL),
(56, 'Yibuti', 'DJI', '2023-10-28 17:16:43', NULL, NULL),
(57, 'Dinamarca', 'DNK', '2023-10-28 17:16:43', NULL, NULL),
(58, 'Domínica', 'DMA', '2023-10-28 17:16:43', NULL, NULL),
(59, 'República Dominicana', 'DOM', '2023-10-28 17:16:43', NULL, NULL),
(60, 'Argel', 'DZA', '2023-10-28 17:16:43', NULL, NULL),
(61, 'Ecuador', 'ECU', '2023-10-28 17:16:43', NULL, NULL),
(62, 'Estonia', 'EST', '2023-10-28 17:16:43', NULL, NULL),
(63, 'Egipto', 'EGY', '2023-10-28 17:16:43', NULL, NULL),
(64, 'Sahara Occidental', 'ESH', '2023-10-28 17:16:43', NULL, NULL),
(65, 'Eritrea', 'ERI', '2023-10-28 17:16:43', NULL, NULL),
(66, 'España', 'ESP', '2023-10-28 17:16:43', NULL, NULL),
(67, 'Etiopía', 'ETH', '2023-10-28 17:16:43', NULL, NULL),
(68, 'Finlandia', 'FIN', '2023-10-28 17:16:43', NULL, NULL),
(69, 'Fiji', 'FJI', '2023-10-28 17:16:43', NULL, NULL),
(70, 'Islas Malvinas', 'KLK', '2023-10-28 17:16:43', NULL, NULL),
(71, 'Micronesia', 'FSM', '2023-10-28 17:16:43', NULL, NULL),
(72, 'Islas Faroe', 'FRO', '2023-10-28 17:16:43', NULL, NULL),
(73, 'Francia', 'FRA', '2023-10-28 17:16:43', NULL, NULL),
(74, 'Gabón', 'GAB', '2023-10-28 17:16:43', NULL, NULL),
(75, 'Reino Unido', 'GBR', '2023-10-28 17:16:43', NULL, NULL),
(76, 'Granada', 'GRD', '2023-10-28 17:16:43', NULL, NULL),
(77, 'Georgia', 'GEO', '2023-10-28 17:16:43', NULL, NULL),
(78, 'Guayana Francesa', 'GUF', '2023-10-28 17:16:43', NULL, NULL),
(79, 'Guernsey', 'GGY', '2023-10-28 17:16:43', NULL, NULL),
(80, 'Ghana', 'GHA', '2023-10-28 17:16:43', NULL, NULL),
(81, 'Gibraltar', 'GIB', '2023-10-28 17:16:43', NULL, NULL),
(82, 'Groenlandia', 'GRL', '2023-10-28 17:16:43', NULL, NULL),
(83, 'Gambia', 'GMB', '2023-10-28 17:16:43', NULL, NULL),
(84, 'Guinea', 'GIN', '2023-10-28 17:16:43', NULL, NULL),
(85, 'Guadalupe', 'GLP', '2023-10-28 17:16:43', NULL, NULL),
(86, 'Guinea Ecuatorial', 'GNQ', '2023-10-28 17:16:43', NULL, NULL),
(87, 'Grecia', 'GRC', '2023-10-28 17:16:43', NULL, NULL),
(88, 'Georgia del Sur e Islas Sandwich del Sur', 'SGS', '2023-10-28 17:16:43', NULL, NULL),
(89, 'Guatemala', 'GTM', '2023-10-28 17:16:43', NULL, NULL),
(90, 'Guam', 'GUM', '2023-10-28 17:16:43', NULL, NULL),
(91, 'Guinea-Bissau', 'GNB', '2023-10-28 17:16:43', NULL, NULL),
(92, 'Guayana', 'GUY', '2023-10-28 17:16:43', NULL, NULL),
(93, 'Hong Kong', 'HKG', '2023-10-28 17:16:43', NULL, NULL),
(94, 'Islas Heard y McDonald', 'HMD', '2023-10-28 17:16:43', NULL, NULL),
(95, 'Honduras', 'HND', '2023-10-28 17:16:43', NULL, NULL),
(96, 'Croacia', 'HRV', '2023-10-28 17:16:43', NULL, NULL),
(97, 'Haití', 'HTI', '2023-10-28 17:16:43', NULL, NULL),
(98, 'Hungría', 'HUN', '2023-10-28 17:16:43', NULL, NULL),
(99, 'Indonesia', 'IDN', '2023-10-28 17:16:43', NULL, NULL),
(100, 'Irlanda', 'IRL', '2023-10-28 17:16:43', NULL, NULL),
(101, 'Israel', 'ISR', '2023-10-28 17:16:43', NULL, NULL),
(102, 'Isla de Man', 'IMN', '2023-10-28 17:16:43', NULL, NULL),
(103, 'India', 'IND', '2023-10-28 17:16:43', NULL, NULL),
(104, 'Territorio Británico del Océano Índico', 'IOT', '2023-10-28 17:16:43', NULL, NULL),
(105, 'Irak', 'IRQ', '2023-10-28 17:16:43', NULL, NULL),
(106, 'Irán', 'IRN', '2023-10-28 17:16:43', NULL, NULL),
(107, 'Islandia', 'ISL', '2023-10-28 17:16:43', NULL, NULL),
(108, 'Italia', 'ITA', '2023-10-28 17:16:43', NULL, NULL),
(109, 'Jersey', 'JEY', '2023-10-28 17:16:43', NULL, NULL),
(110, 'Jamaica', 'JAM', '2023-10-28 17:16:43', NULL, NULL),
(111, 'Jordania', 'JOR', '2023-10-28 17:16:43', NULL, NULL),
(112, 'Japón', 'JPN', '2023-10-28 17:16:43', NULL, NULL),
(113, 'Kenia', 'KEN', '2023-10-28 17:16:43', NULL, NULL),
(114, 'Kirguistán', 'KGZ', '2023-10-28 17:16:43', NULL, NULL),
(115, 'Camboya', 'KHM', '2023-10-28 17:16:43', NULL, NULL),
(116, 'Kiribati', 'KIR', '2023-10-28 17:16:43', NULL, NULL),
(117, 'Comoros', 'COM', '2023-10-28 17:16:43', NULL, NULL),
(118, 'San Cristóbal y Nieves', 'KNA', '2023-10-28 17:16:43', NULL, NULL),
(119, 'Corea del Norte', 'PRK', '2023-10-28 17:16:43', NULL, NULL),
(120, 'Corea del Sur', 'KOR', '2023-10-28 17:16:43', NULL, NULL),
(121, 'Kuwait', 'KWT', '2023-10-28 17:16:43', NULL, NULL),
(122, 'Islas Caimán', 'CYM', '2023-10-28 17:16:43', NULL, NULL),
(123, 'Kazajstán', 'KAZ', '2023-10-28 17:16:43', NULL, NULL),
(124, 'Laos', 'LAO', '2023-10-28 17:16:43', NULL, NULL),
(125, 'Líbano', 'LBN', '2023-10-28 17:16:43', NULL, NULL),
(126, 'Santa Lucía', 'LCA', '2023-10-28 17:16:43', NULL, NULL),
(127, 'Liechtenstein', 'LIE', '2023-10-28 17:16:43', NULL, NULL),
(128, 'Sri Lanka', 'LKA', '2023-10-28 17:16:43', NULL, NULL),
(129, 'Liberia', 'LBR', '2023-10-28 17:16:43', NULL, NULL),
(130, 'Lesotho', 'LSO', '2023-10-28 17:16:43', NULL, NULL),
(131, 'Lituania', 'LTU', '2023-10-28 17:16:43', NULL, NULL),
(132, 'Luxemburgo', 'LUX', '2023-10-28 17:16:43', NULL, NULL),
(133, 'Letonia', 'LVA', '2023-10-28 17:16:43', NULL, NULL),
(134, 'Libia', 'LBY', '2023-10-28 17:16:43', NULL, NULL),
(135, 'Marruecos', 'MAR', '2023-10-28 17:16:43', NULL, NULL),
(136, 'Mónaco', 'MCO', '2023-10-28 17:16:43', NULL, NULL),
(137, 'Moldova', 'MDA', '2023-10-28 17:16:43', NULL, NULL),
(138, 'Montenegro', 'MNE', '2023-10-28 17:16:43', NULL, NULL),
(139, 'Madagascar', 'MDG', '2023-10-28 17:16:43', NULL, NULL),
(140, 'Islas Marshall', 'MHL', '2023-10-28 17:16:43', NULL, NULL),
(141, 'Macedonia', 'MKD', '2023-10-28 17:16:43', NULL, NULL),
(142, 'Mali', 'MLI', '2023-10-28 17:16:43', NULL, NULL),
(143, 'Myanmar', 'MMR', '2023-10-28 17:16:43', NULL, NULL),
(144, 'Mongolia', 'MNG', '2023-10-28 17:16:43', NULL, NULL),
(145, 'Macao', 'MAC', '2023-10-28 17:16:43', NULL, NULL),
(146, 'Martinica', 'MTQ', '2023-10-28 17:16:43', NULL, NULL),
(147, 'Mauritania', 'MRT', '2023-10-28 17:16:43', NULL, NULL),
(148, 'Montserrat', 'MSR', '2023-10-28 17:16:43', NULL, NULL),
(149, 'Malta', 'MLT', '2023-10-28 17:16:43', NULL, NULL),
(150, 'Mauricio', 'MUS', '2023-10-28 17:16:43', NULL, NULL),
(151, 'Maldivas', 'MDV', '2023-10-28 17:16:43', NULL, NULL),
(152, 'Malawi', 'MWI', '2023-10-28 17:16:43', NULL, NULL),
(153, 'México', 'MEX', '2023-10-28 17:16:43', NULL, NULL),
(154, 'Malasia', 'MYS', '2023-10-28 17:16:43', NULL, NULL),
(155, 'Mozambique', 'MOZ', '2023-10-28 17:16:43', NULL, NULL),
(156, 'Namibia', 'NAM', '2023-10-28 17:16:43', NULL, NULL),
(157, 'Nueva Caledonia', 'NCL', '2023-10-28 17:16:43', NULL, NULL),
(158, 'Níger', 'NER', '2023-10-28 17:16:43', NULL, NULL),
(159, 'Islas Norkfolk', 'NFK', '2023-10-28 17:16:43', NULL, NULL),
(160, 'Nigeria', 'NGA', '2023-10-28 17:16:43', NULL, NULL),
(161, 'Nicaragua', 'NIC', '2023-10-28 17:16:43', NULL, NULL),
(162, 'Países Bajos', 'NLD', '2023-10-28 17:16:43', NULL, NULL),
(163, 'Noruega', 'NOR', '2023-10-28 17:16:43', NULL, NULL),
(164, 'Nepal', 'NPL', '2023-10-28 17:16:43', NULL, NULL),
(165, 'Nauru', 'NRU', '2023-10-28 17:16:43', NULL, NULL),
(166, 'Niue', 'NIU', '2023-10-28 17:16:43', NULL, NULL),
(167, 'Nueva Zelanda', 'NZL', '2023-10-28 17:16:43', NULL, NULL),
(168, 'Omán', 'OMN', '2023-10-28 17:16:43', NULL, NULL),
(169, 'Panamá', 'PAN', '2023-10-28 17:16:43', NULL, NULL),
(170, 'Perú', 'PER', '2023-10-28 17:16:43', NULL, NULL),
(171, 'Polinesia Francesa', 'PYF', '2023-10-28 17:16:43', NULL, NULL),
(172, 'Papúa Nueva Guinea', 'PNG', '2023-10-28 17:16:43', NULL, NULL),
(173, 'Filipinas', 'PHL', '2023-10-28 17:16:43', NULL, NULL),
(174, 'Pakistán', 'PAK', '2023-10-28 17:16:43', NULL, NULL),
(175, 'Polonia', 'POL', '2023-10-28 17:16:43', NULL, NULL),
(176, 'San Pedro y Miquelón', 'SPM', '2023-10-28 17:16:43', NULL, NULL),
(177, 'Islas Pitcairn', 'PCN', '2023-10-28 17:16:43', NULL, NULL),
(178, 'Puerto Rico', 'PRI', '2023-10-28 17:16:43', NULL, NULL),
(179, 'Palestina', 'PSE', '2023-10-28 17:16:43', NULL, NULL),
(180, 'Portugal', 'PRT', '2023-10-28 17:16:43', NULL, NULL),
(181, 'Islas Palaos', 'PLW', '2023-10-28 17:16:43', NULL, NULL),
(182, 'Paraguay', 'PRY', '2023-10-28 17:16:43', NULL, NULL),
(183, 'Qatar', 'QAT', '2023-10-28 17:16:43', NULL, NULL),
(184, 'Reunión', 'REU', '2023-10-28 17:16:43', NULL, NULL),
(185, 'Rumanía', 'ROU', '2023-10-28 17:16:43', NULL, NULL),
(186, 'Serbia y Montenegro', 'SRB', '2023-10-28 17:16:43', NULL, NULL),
(187, 'Rusia', 'RUS', '2023-10-28 17:16:43', NULL, NULL),
(188, 'Ruanda', 'RWA', '2023-10-28 17:16:43', NULL, NULL),
(189, 'Arabia Saudita', 'SAU', '2023-10-28 17:16:43', NULL, NULL),
(190, 'Islas Solomón', 'SLB', '2023-10-28 17:16:43', NULL, NULL),
(191, 'Seychelles', 'SYC', '2023-10-28 17:16:43', NULL, NULL),
(192, 'Sudán', 'SDN', '2023-10-28 17:16:43', NULL, NULL),
(193, 'Suecia', 'SWE', '2023-10-28 17:16:43', NULL, NULL),
(194, 'Singapur', 'SGP', '2023-10-28 17:16:43', NULL, NULL),
(195, 'Santa Elena', 'SHN', '2023-10-28 17:16:43', NULL, NULL),
(196, 'Eslovenia', 'SVN', '2023-10-28 17:16:43', NULL, NULL),
(197, 'Islas Svalbard y Jan Mayen', 'SJM', '2023-10-28 17:16:43', NULL, NULL),
(198, 'Eslovaquia', 'SVK', '2023-10-28 17:16:43', NULL, NULL),
(199, 'Sierra Leona', 'SLE', '2023-10-28 17:16:43', NULL, NULL),
(200, 'San Marino', 'SMR', '2023-10-28 17:16:43', NULL, NULL),
(201, 'Senegal', 'SEN', '2023-10-28 17:16:43', NULL, NULL),
(202, 'Somalia', 'SOM', '2023-10-28 17:16:43', NULL, NULL),
(203, 'Surinam', 'SUR', '2023-10-28 17:16:43', NULL, NULL),
(204, 'Santo Tomé y Príncipe', 'STP', '2023-10-28 17:16:43', NULL, NULL),
(205, 'El Salvador', 'SLV', '2023-10-28 17:16:43', NULL, NULL),
(206, 'Siria', 'SYR', '2023-10-28 17:16:43', NULL, NULL),
(207, 'Suazilandia', 'SWZ', '2023-10-28 17:16:43', NULL, NULL),
(208, 'Islas Turcas y Caicos', 'TCA', '2023-10-28 17:16:43', NULL, NULL),
(209, 'Chad', 'TCD', '2023-10-28 17:16:43', NULL, NULL),
(210, 'Territorios Australes Franceses', 'ATF', '2023-10-28 17:16:43', NULL, NULL),
(211, 'Togo', 'TGO', '2023-10-28 17:16:43', NULL, NULL),
(212, 'Tailandia', 'THA', '2023-10-28 17:16:43', NULL, NULL),
(213, 'Tanzania', 'TZA', '2023-10-28 17:16:43', NULL, NULL),
(214, 'Tayikistán', 'TJK', '2023-10-28 17:16:43', NULL, NULL),
(215, 'Tokelau', 'TKL', '2023-10-28 17:16:43', NULL, NULL),
(216, 'Timor-Leste', 'TLS', '2023-10-28 17:16:43', NULL, NULL),
(217, 'Turkmenistán', 'TKM', '2023-10-28 17:16:43', NULL, NULL),
(218, 'Túnez', 'TUN', '2023-10-28 17:16:43', NULL, NULL),
(219, 'Tonga', 'TON', '2023-10-28 17:16:43', NULL, NULL),
(220, 'Turquía', 'TUR', '2023-10-28 17:16:43', NULL, NULL),
(221, 'Trinidad y Tobago', 'TTO', '2023-10-28 17:16:43', NULL, NULL),
(222, 'Tuvalu', 'TUV', '2023-10-28 17:16:43', NULL, NULL),
(223, 'Taiwán', 'TWN', '2023-10-28 17:16:43', NULL, NULL),
(224, 'Ucrania', 'UKR', '2023-10-28 17:16:43', NULL, NULL),
(225, 'Uganda', 'UGA', '2023-10-28 17:16:43', NULL, NULL),
(226, 'Estados Unidos de América', 'USA', '2023-10-28 17:16:43', NULL, NULL),
(227, 'Uruguay', 'URY', '2023-10-28 17:16:43', NULL, NULL),
(228, 'Uzbekistán', 'UZB', '2023-10-28 17:16:43', NULL, NULL),
(229, 'Ciudad del Vaticano', 'VAT', '2023-10-28 17:16:43', NULL, NULL),
(230, 'San Vicente y las Granadinas', 'VCT', '2023-10-28 17:16:43', NULL, NULL),
(231, 'Venezuela', 'VEN', '2023-10-28 17:16:43', NULL, NULL),
(232, 'Islas Vírgenes Británicas', 'VGB', '2023-10-28 17:16:43', NULL, NULL),
(233, 'Islas Vírgenes de los Estados Unidos de América', 'VIR', '2023-10-28 17:16:43', NULL, NULL),
(234, 'Vietnam', 'VNM', '2023-10-28 17:16:43', NULL, NULL),
(235, 'Vanuatu', 'VUT', '2023-10-28 17:16:43', NULL, NULL),
(236, 'Wallis y Futuna', 'WLF', '2023-10-28 17:16:43', NULL, NULL),
(237, 'Samoa', 'WSM', '2023-10-28 17:16:43', NULL, NULL),
(238, 'Yemen', 'YEM', '2023-10-28 17:16:43', NULL, NULL),
(239, 'Mayotte', 'MYT', '2023-10-28 17:16:43', NULL, NULL),
(240, 'Sudáfrica', 'ZAF', '2023-10-28 17:16:43', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `precio` float(7,2) NOT NULL,
  `garantia` tinyint(4) NOT NULL,
  `fotografia` varchar(200) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `idcategoria`, `descripcion`, `precio`, `garantia`, `fotografia`, `create_at`, `update_at`, `inactive_at`) VALUES
(1, 3, 'Monitor Grande', 1599.00, 6, 'a8d5575f74a9c8dcbaf7e90325f66518819b372c.jpg', '2023-10-28 18:46:51', NULL, NULL),
(2, 3, 'Monitor UP', 599.00, 12, 'd4c6266b8312348508558bd7942dcddf215ad796.jpg', '2023-10-28 18:56:51', NULL, NULL),
(3, 5, 'Audifonos GOD', 50.00, 3, 'ad365167b5cc669fba34bcbb4c902f888336cc25.jpg', '2023-10-28 18:58:23', NULL, NULL),
(4, 5, 'Teclado Full RGB', 60.00, 12, 'ca22ce912ad42f5795dc2675ad2e9c545c15d7c3.jpg', '2023-10-28 18:59:11', NULL, NULL),
(5, 1, 'Laptop Stack', 3600.00, 12, '8738e390221e88bc835466c2dfecd5ad5c495a6e.jpg', '2023-10-28 19:00:39', NULL, NULL),
(6, 5, 'Teclado', 120.00, 6, '4ad896d57265665847802f58545ea8a3c3c8ea0d.jpg', '2023-10-28 21:56:11', NULL, '2023-10-28 22:17:52'),
(7, 5, 'PC', 123.00, 6, NULL, '2023-10-28 22:18:06', NULL, NULL),
(8, 1, 'PC4', 600.00, 6, '1643fde740629aeb84586140ccda35334bb59d6a.jpg', '2023-10-29 00:21:09', NULL, NULL),
(9, 5, 'TECLADO', 200.00, 6, '28286dc190e80f8cfb010d7344f8dd129848f8dc.jpg', '2023-10-29 00:33:57', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reset_pass`
--

CREATE TABLE `reset_pass` (
  `idreset` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(6) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reset_pass`
--

INSERT INTO `reset_pass` (`idreset`, `email`, `token`, `fecha`) VALUES
(1, 'prueba@gmail.com', '123456', '2023-11-06 00:28:55'),
(2, 'pruebass@gmail.com', '123456', '2023-11-06 01:12:40'),
(3, 'pruebashoy@gmail.com', '344484', '2023-11-06 01:30:12'),
(4, '', '111268', '2023-11-06 01:34:08'),
(5, '', '912750', '2023-11-06 01:36:05'),
(6, '', '616933', '2023-11-06 01:36:35'),
(7, 'efrainqn@gmail.com', '989230', '2023-11-06 01:46:31'),
(8, 'efrainqn@gmail.com', '454480', '2023-11-06 01:47:02'),
(9, '1398106@senati.pe', '342997', '2023-11-06 01:48:01'),
(10, 'efrainqn16@gmail.com', '819353', '2023-11-06 03:04:00'),
(11, 'efrainqn16@gmail.com', '334723', '2023-11-06 03:04:43'),
(12, 'efrainqn16@gmail.com', '269989', '2023-11-06 03:04:54'),
(13, 'prueba6@gmail.com', '502398', '2023-11-06 03:05:42'),
(14, 'efrainqn16@gmail.com', '661280', '2023-11-06 03:06:20'),
(15, 'efrainqn16@gmail.com', '684368', '2023-11-06 03:12:30'),
(16, '1398106@senati.pe', '253028', '2023-11-06 03:13:39'),
(17, '1398106@senati.pe', '124654', '2023-11-06 03:15:35'),
(18, '1398106@senati.pe', '683020', '2023-11-06 03:15:45'),
(19, '1398106@senati.pe', '457180', '2023-11-06 03:16:30'),
(20, '1398106@senati.pe', '298145', '2023-11-06 03:17:28'),
(21, '1398106@senati.pe', '272952', '2023-11-06 03:18:03'),
(22, '1398106@senati.pe', '907772', '2023-11-06 03:18:32'),
(23, '1398106@senati.pe', '858500', '2023-11-06 03:23:50'),
(24, '1398106@senati.pe', '479132', '2023-11-06 03:25:42'),
(25, '1398106@senati.pe', '768100', '2023-11-06 03:26:02'),
(26, '1398106@senati.pe', '876646', '2023-11-06 03:27:14'),
(27, '1398106@senati.pe', '252477', '2023-11-06 03:27:41'),
(28, '1398106@senati.pe', '580414', '2023-11-06 03:31:04'),
(29, '1398106@senati.pe', '782094', '2023-11-06 03:33:40'),
(30, '1398106@senati.pe', '279912', '2023-11-06 03:34:00'),
(31, '1398106@senati.pe', '219146', '2023-11-06 03:36:37'),
(32, '1398106@senati.pe', '225618', '2023-11-06 03:37:18'),
(33, '1398106@senati.pe', '900610', '2023-11-06 03:38:00'),
(34, '1398106@senati.pe', '214780', '2023-11-06 03:38:26'),
(35, '1398106@senati.pe', '238373', '2023-11-06 03:38:29'),
(36, '1398106@senati.pe', '188937', '2023-11-06 03:41:39'),
(37, '1398106@senati.pe', '931856', '2023-11-06 03:44:01'),
(38, '1398106@senati.pe', '591318', '2023-11-06 03:45:28'),
(39, 'efrainqn16@gmail.com', '296526', '2023-11-06 03:53:44'),
(40, 'efrainqn16@gmail.com', '414150', '2023-11-06 03:56:29'),
(41, 'efrainqn16@gmail.com', '489570', '2023-11-06 04:10:27'),
(42, 'efrainqn16@gmail.com', '916694', '2023-11-06 04:16:17'),
(43, 'efrainqn16@gmail.com', '220554', '2023-11-06 04:28:52'),
(46, 'efrainqn16@gmail.com', '489482', '2023-11-06 06:05:56'),
(48, 'efrainqn16@gmail.com', '905280', '2023-11-07 15:16:32');

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
(1, 'Administrador', '2023-10-28 17:16:27', NULL, NULL),
(2, 'Invitado', '2023-10-28 17:16:27', NULL, NULL),
(3, 'ASISTENTE', '2023-10-28 17:16:27', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `idrol` int(11) NOT NULL,
  `idnacionalidad` int(11) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `numcelular` varchar(9) DEFAULT NULL,
  `claveacceso` varchar(200) NOT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL,
  `inactive_at` datetime DEFAULT NULL,
  `estado_token` char(1) DEFAULT '0',
  `token` varchar(6) DEFAULT NULL,
  `fechatoken` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `avatar`, `idrol`, `idnacionalidad`, `apellidos`, `nombres`, `email`, `numcelular`, `claveacceso`, `create_at`, `update_at`, `inactive_at`, `estado_token`, `token`, `fechatoken`) VALUES
(1, NULL, 1, 11, 'Gomez Pizarro', 'Claudio Pizarro', 'claudiox@gmail.com', NULL, '$2y$10$JrWpvfajT/tVlC6C4f3q7eYYHVaOcG1MK/sIc0mqGPBGJ5dHM/P12', '2023-11-07 15:37:42', NULL, NULL, '0', NULL, NULL),
(2, NULL, 2, 54, 'Guzman Polo', 'Carla Sonia', 'carlithaa@gmial.com', NULL, '$2y$10$JrWpvfajT/tVlC6C4f3q7eYYHVaOcG1MK/sIc0mqGPBGJ5dHM/P12', '2023-11-07 15:37:42', NULL, NULL, '0', NULL, NULL),
(3, NULL, 1, 11, 'Quispe Napa', 'Harold Efrain', 'efrainqn16@gmail.com', NULL, '$2y$10$0Z0YxUESDzs.YEOMZbXdHejJlVHnOttBisbzUFDEPvV3ba8Cw5dfO', '2023-11-07 15:37:42', NULL, NULL, 'C', NULL, '2023-11-08 00:05:51');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `especificaciones`
--
ALTER TABLE `especificaciones`
  ADD PRIMARY KEY (`idespecificaciones`),
  ADD KEY `fk_idproducto` (`idproducto`);

--
-- Indices de la tabla `galerias`
--
ALTER TABLE `galerias`
  ADD PRIMARY KEY (`idgaleria`),
  ADD KEY `fk_Gidproducto` (`idproducto`);

--
-- Indices de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  ADD PRIMARY KEY (`idnacionalidad`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `fk_idcategoria` (`idcategoria`);

--
-- Indices de la tabla `reset_pass`
--
ALTER TABLE `reset_pass`
  ADD PRIMARY KEY (`idreset`);

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
  ADD UNIQUE KEY `uk_numcelular` (`numcelular`),
  ADD KEY `fk_idrol` (`idrol`),
  ADD KEY `fk_idnacionalidad` (`idnacionalidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especificaciones`
--
ALTER TABLE `especificaciones`
  MODIFY `idespecificaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `galerias`
--
ALTER TABLE `galerias`
  MODIFY `idgaleria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `nacionalidades`
--
ALTER TABLE `nacionalidades`
  MODIFY `idnacionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `reset_pass`
--
ALTER TABLE `reset_pass`
  MODIFY `idreset` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `especificaciones`
--
ALTER TABLE `especificaciones`
  ADD CONSTRAINT `fk_idproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `galerias`
--
ALTER TABLE `galerias`
  ADD CONSTRAINT `fk_Gidproducto` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_idcategoria` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`idcategoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_idnacionalidad` FOREIGN KEY (`idnacionalidad`) REFERENCES `nacionalidades` (`idnacionalidad`),
  ADD CONSTRAINT `fk_idrol` FOREIGN KEY (`idrol`) REFERENCES `roles` (`idrol`);
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
(5, 2, 3, '2023-11-16 14:45:00', '2023-11-19 23:45:00'),
(7, 2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 2, 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 2, 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 2, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  MODIFY `idinscrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"evaluaciones\",\"table\":\"inscritos\"},{\"db\":\"evaluaciones\",\"table\":\"preguntas\"},{\"db\":\"evaluaciones\",\"table\":\"roles\"},{\"db\":\"evaluaciones\",\"table\":\"usuarios\"},{\"db\":\"evaluaciones\",\"table\":\"evaluaciones\"},{\"db\":\"evaluaciones\",\"table\":\"cursos\"},{\"db\":\"evaluaciones\",\"table\":\"alternativas\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'evaluaciones', 'evaluaciones', '{\"CREATE_TIME\":\"2023-11-14 18:46:25\",\"col_order\":[0,1,3,2,4,5],\"col_visib\":[1,1,1,1,1,1]}', '2023-11-15 02:03:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-11-16 18:16:38', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
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
