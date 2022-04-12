-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2022 a las 21:37:18
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_security`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_system`
--

CREATE TABLE `admin_system` (
  `id` int(11) NOT NULL,
  `user` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `type` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `admin_system`
--

INSERT INTO `admin_system` (`id`, `user`, `password`, `type`, `name`) VALUES
(1, 'admin', '$2y$10$KgiTC9dwQEL3ZFkO8crXzOL/h1Xr6eCRSrecx6exVWixeXo0nw7Oe', 'admin', 'Juan Sosa Castillo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_deficiencia`
--

CREATE TABLE `tb_deficiencia` (
  `id` int(11) NOT NULL,
  `insidencia` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_deficiencia`
--

INSERT INTO `tb_deficiencia` (`id`, `insidencia`) VALUES
(1, 'Acceso no autorizado'),
(2, 'Destrucción o modificación de la información y/o e'),
(3, 'Error de operación o fallas de Software'),
(4, 'Contaminación con virus'),
(5, 'Ausencia de climatización en el local'),
(6, 'Probabilidad de que ocurra fuego, derrumbe o inund'),
(7, 'Robo, Hurto o suplantación de componentes del acti'),
(8, 'Deterioro físico'),
(9, 'Daños por descargas eléctricas'),
(10, 'Fallas de Hardware'),
(11, 'Roturas de tuberías hidráulicas'),
(12, 'Período de guerra'),
(13, 'Ocurrencia de fenómenos naturales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_dpto`
--

CREATE TABLE `tb_dpto` (
  `id` int(11) NOT NULL,
  `dpto` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_dpto`
--

INSERT INTO `tb_dpto` (`id`, `dpto`) VALUES
(9, 'Nodo'),
(10, 'Farmacia'),
(11, 'Docencia'),
(12, 'Dirección'),
(13, 'Admisión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_fuente`
--

CREATE TABLE `tb_fuente` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `potencia` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `model` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `ns` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_fuente`
--

INSERT INTO `tb_fuente` (`id`, `fk_pc`, `potencia`, `marca`, `model`, `ns`, `status`) VALUES
(5, 2, '456w', 'seagate', 'ASDE558', '44222FFFXZ2', 1),
(6, 4, '456w', 'seagate', 'STNL15154582', '44222FFFXZ5', 3),
(7, 5, '456w', 'seagate', 'ASDE558', '44222FFFXZ', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_hdd`
--

CREATE TABLE `tb_hdd` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_hdd`
--

INSERT INTO `tb_hdd` (`id`, `fk_pc`, `capacidad`, `marca`, `modelo`, `ns`, `status`) VALUES
(3, 2, 1000, 'seagate', 'STN5456', '554545sasds5', 2),
(4, 4, 1000, 'BTY-82', 'STN5456', '44222FFFXZ5852', 2),
(5, 5, 1000, 'BTY-82', 'HT258', '44222FFFXZ5852W', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_incidencia`
--

CREATE TABLE `tb_incidencia` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `incidencia` int(11) NOT NULL,
  `solucionada` int(2) NOT NULL,
  `acciones` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_solucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_incidencia`
--

INSERT INTO `tb_incidencia` (`id`, `fk_pc`, `fecha`, `incidencia`, `solucionada`, `acciones`, `fecha_solucion`) VALUES
(2, 2, 1642009500, 2, 2, 'medidas a tomar', NULL),
(3, 4, 1643219100, 4, 1, 'se tomo medidas', NULL),
(4, 4, 1641428580, 1, 2, 'medidas a tomar', NULL),
(5, 2, 1644452580, 1, 1, 'resuelto', NULL),
(6, 2, 1645057380, 1, 1, 'resuelto', NULL),
(7, 2, 1648077840, 1, 1, 'resuelto', NULL),
(8, 4, 1648077840, 1, 1, 'resuelto', NULL),
(9, 2, 1649546640, 1, 1, 'se tomo medidas', NULL),
(10, 2, 1649546640, 1, 1, 'medidas a tomar', NULL),
(11, 2, 1649546640, 1, 1, 'se tomo medidas', NULL),
(12, 2, 1649548320, 4, 1, 'medidas a tomar', NULL),
(13, 2, 1643158740, 1, 1, 'resuelto', NULL),
(14, 2, 1647530520, 3, 1, 'medidas a tomar', NULL),
(15, 2, 1647458640, 2, 1, 'medidas a tomar', NULL),
(16, 4, 1646838060, 2, 1, 'en observación', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_inspeccion`
--

CREATE TABLE `tb_inspeccion` (
  `id` int(11) NOT NULL,
  `fecha_inspeccion` int(11) NOT NULL,
  `fk_responsable` int(11) NOT NULL,
  `fk_dpto` int(11) NOT NULL,
  `accion` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_inspeccion`
--

INSERT INTO `tb_inspeccion` (`id`, `fecha_inspeccion`, `fk_responsable`, `fk_dpto`, `accion`) VALUES
(4, 1649521020, 4, 9, 'todo aparentemente bien'),
(5, 1649549280, 4, 9, 'plan de medidas'),
(6, 1641431340, 4, 9, 'todo aparentemente contro'),
(7, 1642122540, 4, 9, 'Otras medidas'),
(8, 1645060140, 4, 9, 'plan de medidas'),
(9, 1647389340, 4, 10, 'Otras medidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_lectorcompacto`
--

CREATE TABLE `tb_lectorcompacto` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `tipo` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mantenimiento`
--

CREATE TABLE `tb_mantenimiento` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `observacion` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_mantenimiento`
--

INSERT INTO `tb_mantenimiento` (`id`, `fk_pc`, `fecha`, `observacion`) VALUES
(2, 2, 1610041440, 'aaaa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_memoria`
--

CREATE TABLE `tb_memoria` (
  `id` int(11) NOT NULL,
  `fk_placa` int(11) NOT NULL,
  `tipo` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_memoria`
--

INSERT INTO `tb_memoria` (`id`, `fk_placa`, `tipo`, `capacidad`, `marca`, `modelo`, `ns`, `status`) VALUES
(3, 6, '1', 1000, 'BTY-82', 'HT258', '44222FFFXZ', 1),
(4, 7, '2', 1000, 'seagate', 'STN5456', '44222FFFXZ5', 3),
(5, 8, '4', 1000, 'BTY-82', 'asdawsdsdas', '44222FFFXZ5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_micro`
--

CREATE TABLE `tb_micro` (
  `id` int(11) NOT NULL,
  `fk_placa` int(11) NOT NULL,
  `velocidad` int(11) NOT NULL,
  `cantnucleos` int(2) NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `ns` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `status_tecnico` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_micro`
--

INSERT INTO `tb_micro` (`id`, `fk_placa`, `velocidad`, `cantnucleos`, `marca`, `modelo`, `ns`, `status_tecnico`) VALUES
(5, 6, 4, 4, 'LG', 'STN5456', '554545sasds5', 3),
(6, 7, 4, 4, 'seagate', 'STN5456', '44222FFFXZ585', 1),
(7, 8, 4, 4, 'BTY-82', '12121212', '44222FFFXZ2345IOU', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_modem`
--

CREATE TABLE `tb_modem` (
  `id` int(11) NOT NULL,
  `inventario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `status_inv` int(11) NOT NULL,
  `fk_responsable` int(11) NOT NULL,
  `fk_dpto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_modem`
--

INSERT INTO `tb_modem` (`id`, `inventario`, `marca`, `modelo`, `status`, `status_inv`, `fk_responsable`, `fk_dpto`) VALUES
(3, '12321321322', '132123sdasad', 'STN5456', 1, 1, 4, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_monitor`
--

CREATE TABLE `tb_monitor` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `pulgadas` int(2) NOT NULL,
  `inventario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_explotacion` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `status_inventario` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_mouse`
--

CREATE TABLE `tb_mouse` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `interfaz` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `inventario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_exp` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `status_inv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_movimiento`
--

CREATE TABLE `tb_movimiento` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `motivo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(2) NOT NULL COMMENT 'entrada/salida/interno'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_op_estado`
--

CREATE TABLE `tb_op_estado` (
  `id` int(11) NOT NULL,
  `idequipo` int(11) NOT NULL,
  `equipo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(1) NOT NULL,
  `fecha` int(11) NOT NULL,
  `inventario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_op_estado`
--

INSERT INTO `tb_op_estado` (`id`, `idequipo`, `equipo`, `estado`, `fecha`, `inventario`) VALUES
(20, 6, 'placamadre', 1, 1649374585, NULL),
(21, 7, 'placamadre', 1, 1649374602, NULL),
(22, 8, 'placamadre', 1, 1649374705, NULL),
(23, 5, 'microprocesador', 3, 1649376361, NULL),
(24, 6, 'microprocesador', 1, 1649376409, NULL),
(25, 7, 'microprocesador', 2, 1649376559, NULL),
(26, 3, 'Memoria Ram', 1, 1649376617, NULL),
(27, 4, 'Memoria Ram', 3, 1649376634, NULL),
(28, 5, 'Memoria Ram', 1, 1649376771, NULL),
(29, 5, 'Fuente interna', 1, 1649376832, NULL),
(30, 6, 'Fuente interna', 3, 1649376852, NULL),
(31, 7, 'Fuente interna', 3, 1649376876, NULL),
(32, 3, 'Disco duro', 2, 1649376924, NULL),
(33, 4, 'Disco duro', 2, 1649376938, NULL),
(34, 5, 'Disco duro', 1, 1649376950, NULL),
(35, 3, 'Teclado', 2, 1649382720, 2),
(36, 4, 'Teclado', 2, 1649382660, 3),
(37, 5, 'Teclado', 1, 1649377184, 1),
(38, 3, 'Modem', 1, 1649542465, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pc`
--

CREATE TABLE `tb_pc` (
  `id` int(11) NOT NULL,
  `nombrepc` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `mac` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `inventario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fk_dpto` int(11) NOT NULL,
  `sello_seguridad` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` int(11) NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `so` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fk_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_pc`
--

INSERT INTO `tb_pc` (`id`, `nombrepc`, `ip`, `mac`, `inventario`, `fk_dpto`, `sello_seguridad`, `fecha_inicio`, `marca`, `modelo`, `so`, `fk_responsable`) VALUES
(2, 'Servidor', '192.168.1.100', '45sase4822854', '45257LL45', 9, '45sse4458', 1646067180, 'Founder', '45er', 'Debian 10', 4),
(4, 'Firewall', '192.168.1.3', '48as4585468452', '45855485854', 9, '58455SDES58', 1273684440, 'Founder', 'H8154', 'Pfesense', 4),
(5, 'PC00', '192.168.1.100', 'cd3452df453f', '57485', 9, '0002515', 1399505640, 'no tiene', 'HT258', 'windows 10', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_placamadre`
--

CREATE TABLE `tb_placamadre` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `socket` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `numserie` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `status_tec` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_placamadre`
--

INSERT INTO `tb_placamadre` (`id`, `fk_pc`, `socket`, `marca`, `modelo`, `numserie`, `status_tec`) VALUES
(6, 2, '1150', 'BTY-82', 'HT258', '21321358455', 1),
(7, 4, '1150', 'HT81', 'STN5456', '97989899', 1),
(8, 5, '1150', 'BTY-82', 'HT258', '2132135845ES', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_printer`
--

CREATE TABLE `tb_printer` (
  `id` int(11) NOT NULL,
  `tipo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `t_repuesto` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `multifuncional` int(1) NOT NULL,
  `inventario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_responsable` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `status_inv` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_responsable`
--

CREATE TABLE `tb_responsable` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `lastname` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `cargo` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_responsable`
--

INSERT INTO `tb_responsable` (`id`, `nombre`, `lastname`, `cargo`) VALUES
(4, 'Alejandro', 'Pozo Castro', 'Informatico'),
(5, 'Oscar', 'Wide', 'Seguridad Informática'),
(6, 'Yamita', 'Sosa Castillo', 'Jefe de departamento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_rotura`
--

CREATE TABLE `tb_rotura` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `tipo_rotura` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `observ` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_solucion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_rotura`
--

INSERT INTO `tb_rotura` (`id`, `fk_pc`, `fecha`, `tipo_rotura`, `observ`, `fecha_solucion`) VALUES
(1, 2, 1647363000, 'prueba', 'ddddd', 1648675620);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_router`
--

CREATE TABLE `tb_router` (
  `id` int(11) NOT NULL,
  `inventario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `status_inv` int(11) NOT NULL,
  `fk_responsable` int(11) NOT NULL,
  `fk_dpto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_salva`
--

CREATE TABLE `tb_salva` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `observacion` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_software`
--

CREATE TABLE `tb_software` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `name_soft` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `version` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `fabricante` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_speaker`
--

CREATE TABLE `tb_speaker` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `inventario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicia` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `status_inv` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_switch`
--

CREATE TABLE `tb_switch` (
  `id` int(11) NOT NULL,
  `inventario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `programable` int(1) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `status_inv` int(2) NOT NULL,
  `fk_responsable` int(11) NOT NULL,
  `fk_dpto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_teclado`
--

CREATE TABLE `tb_teclado` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `interfaz` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `inventario` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_exp` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `status_inventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_teclado`
--

INSERT INTO `tb_teclado` (`id`, `fk_pc`, `interfaz`, `inventario`, `marca`, `modelo`, `fecha_exp`, `status`, `status_inventario`) VALUES
(3, 2, 'uSB', '458458', 'LG', 'STN5456', 1463617020, 2, 2),
(4, 4, 'USB', '1232132132', 'LG', '12121212', 1273018680, 2, 3),
(5, 5, 'PC-2', '45845834', 'LG', 'STN5456', 1546391940, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_telefono`
--

CREATE TABLE `tb_telefono` (
  `id` int(11) NOT NULL,
  `alcance` int(2) NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inventario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_dpto` int(11) NOT NULL,
  `fk_responsable` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `status_inv` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ups`
--

CREATE TABLE `tb_ups` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `inventario` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `marca` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ns` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` int(11) NOT NULL,
  `status` int(2) NOT NULL,
  `status_inv` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_virus`
--

CREATE TABLE `tb_virus` (
  `id` int(11) NOT NULL,
  `fk_pc` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `tipo_virus` int(2) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `efectos_negativo` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `accion` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `solucionado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `tb_virus`
--

INSERT INTO `tb_virus` (`id`, `fk_pc`, `fecha`, `tipo_virus`, `descripcion`, `efectos_negativo`, `accion`, `solucionado`) VALUES
(2, 2, 1647211140, 1, 'fasdas', 'sdasd', 'asdasd', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_system`
--
ALTER TABLE `admin_system`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tb_deficiencia`
--
ALTER TABLE `tb_deficiencia`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tb_dpto`
--
ALTER TABLE `tb_dpto`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tb_fuente`
--
ALTER TABLE `tb_fuente`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_fuente_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_hdd`
--
ALTER TABLE `tb_hdd`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_hdd_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_incidencia`
--
ALTER TABLE `tb_incidencia`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_incidencia_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_inspeccion`
--
ALTER TABLE `tb_inspeccion`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_inspeccion_tb_responsable_1` (`fk_responsable`) USING BTREE,
  ADD KEY `fk_tb_inspeccion_tb_dpto_1` (`fk_dpto`) USING BTREE;

--
-- Indices de la tabla `tb_lectorcompacto`
--
ALTER TABLE `tb_lectorcompacto`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_lectorcompacto_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_mantenimiento`
--
ALTER TABLE `tb_mantenimiento`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_mantenimiento_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_memoria`
--
ALTER TABLE `tb_memoria`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_memoria_tb_placamadre_1` (`fk_placa`) USING BTREE;

--
-- Indices de la tabla `tb_micro`
--
ALTER TABLE `tb_micro`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_micro_tb_placamadre_1` (`fk_placa`) USING BTREE;

--
-- Indices de la tabla `tb_modem`
--
ALTER TABLE `tb_modem`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_modem_tb_responsable_1` (`fk_responsable`) USING BTREE,
  ADD KEY `fk_tb_modem_tb_dpto_1` (`fk_dpto`) USING BTREE;

--
-- Indices de la tabla `tb_monitor`
--
ALTER TABLE `tb_monitor`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_monitor_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_mouse`
--
ALTER TABLE `tb_mouse`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_mouse_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_movimiento`
--
ALTER TABLE `tb_movimiento`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_movimiento_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_op_estado`
--
ALTER TABLE `tb_op_estado`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tb_pc`
--
ALTER TABLE `tb_pc`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_pc_tb_dpto_1` (`fk_dpto`) USING BTREE,
  ADD KEY `fk_tb_pc_tb_responsable_1` (`fk_responsable`) USING BTREE;

--
-- Indices de la tabla `tb_placamadre`
--
ALTER TABLE `tb_placamadre`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_placamadre_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_printer`
--
ALTER TABLE `tb_printer`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_printer_tb_responsable_1` (`fk_responsable`) USING BTREE;

--
-- Indices de la tabla `tb_responsable`
--
ALTER TABLE `tb_responsable`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tb_rotura`
--
ALTER TABLE `tb_rotura`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_rotura_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_router`
--
ALTER TABLE `tb_router`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_router_tb_responsable_1` (`fk_responsable`) USING BTREE,
  ADD KEY `fk_tb_router_tb_dpto_1` (`fk_dpto`) USING BTREE;

--
-- Indices de la tabla `tb_salva`
--
ALTER TABLE `tb_salva`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_salva_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_software`
--
ALTER TABLE `tb_software`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_software_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_speaker`
--
ALTER TABLE `tb_speaker`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_speaker_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_switch`
--
ALTER TABLE `tb_switch`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_switch_tb_responsable_1` (`fk_responsable`) USING BTREE,
  ADD KEY `fk_tb_switch_tb_dpto_1` (`fk_dpto`) USING BTREE;

--
-- Indices de la tabla `tb_teclado`
--
ALTER TABLE `tb_teclado`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_teclado_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_telefono`
--
ALTER TABLE `tb_telefono`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_telefono_tb_responsable_1` (`fk_responsable`) USING BTREE,
  ADD KEY `fk_tb_telefono_tb_dpto_1` (`fk_dpto`) USING BTREE;

--
-- Indices de la tabla `tb_ups`
--
ALTER TABLE `tb_ups`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_ups_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- Indices de la tabla `tb_virus`
--
ALTER TABLE `tb_virus`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `fk_tb_virus_tb_pc_1` (`fk_pc`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_system`
--
ALTER TABLE `admin_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_deficiencia`
--
ALTER TABLE `tb_deficiencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tb_dpto`
--
ALTER TABLE `tb_dpto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tb_fuente`
--
ALTER TABLE `tb_fuente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_hdd`
--
ALTER TABLE `tb_hdd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_incidencia`
--
ALTER TABLE `tb_incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tb_inspeccion`
--
ALTER TABLE `tb_inspeccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_lectorcompacto`
--
ALTER TABLE `tb_lectorcompacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_mantenimiento`
--
ALTER TABLE `tb_mantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_memoria`
--
ALTER TABLE `tb_memoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_micro`
--
ALTER TABLE `tb_micro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_modem`
--
ALTER TABLE `tb_modem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_monitor`
--
ALTER TABLE `tb_monitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_mouse`
--
ALTER TABLE `tb_mouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_movimiento`
--
ALTER TABLE `tb_movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_op_estado`
--
ALTER TABLE `tb_op_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `tb_pc`
--
ALTER TABLE `tb_pc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_placamadre`
--
ALTER TABLE `tb_placamadre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tb_printer`
--
ALTER TABLE `tb_printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_responsable`
--
ALTER TABLE `tb_responsable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_rotura`
--
ALTER TABLE `tb_rotura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_router`
--
ALTER TABLE `tb_router`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_salva`
--
ALTER TABLE `tb_salva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_software`
--
ALTER TABLE `tb_software`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_speaker`
--
ALTER TABLE `tb_speaker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_switch`
--
ALTER TABLE `tb_switch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_teclado`
--
ALTER TABLE `tb_teclado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_telefono`
--
ALTER TABLE `tb_telefono`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_ups`
--
ALTER TABLE `tb_ups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_virus`
--
ALTER TABLE `tb_virus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_fuente`
--
ALTER TABLE `tb_fuente`
  ADD CONSTRAINT `fk_tb_fuente_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_hdd`
--
ALTER TABLE `tb_hdd`
  ADD CONSTRAINT `fk_tb_hdd_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_incidencia`
--
ALTER TABLE `tb_incidencia`
  ADD CONSTRAINT `fk_tb_incidencia_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_inspeccion`
--
ALTER TABLE `tb_inspeccion`
  ADD CONSTRAINT `fk_tb_inspeccion_tb_dpto_1` FOREIGN KEY (`fk_dpto`) REFERENCES `tb_dpto` (`id`),
  ADD CONSTRAINT `fk_tb_inspeccion_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_lectorcompacto`
--
ALTER TABLE `tb_lectorcompacto`
  ADD CONSTRAINT `fk_tb_lectorcompacto_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_mantenimiento`
--
ALTER TABLE `tb_mantenimiento`
  ADD CONSTRAINT `fk_tb_mantenimiento_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_memoria`
--
ALTER TABLE `tb_memoria`
  ADD CONSTRAINT `fk_tb_memoria_tb_placamadre_1` FOREIGN KEY (`fk_placa`) REFERENCES `tb_placamadre` (`id`);

--
-- Filtros para la tabla `tb_micro`
--
ALTER TABLE `tb_micro`
  ADD CONSTRAINT `fk_tb_micro_tb_placamadre_1` FOREIGN KEY (`fk_placa`) REFERENCES `tb_placamadre` (`id`);

--
-- Filtros para la tabla `tb_modem`
--
ALTER TABLE `tb_modem`
  ADD CONSTRAINT `fk_tb_modem_tb_dpto_1` FOREIGN KEY (`fk_dpto`) REFERENCES `tb_dpto` (`id`),
  ADD CONSTRAINT `fk_tb_modem_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_monitor`
--
ALTER TABLE `tb_monitor`
  ADD CONSTRAINT `fk_tb_monitor_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_mouse`
--
ALTER TABLE `tb_mouse`
  ADD CONSTRAINT `fk_tb_mouse_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_movimiento`
--
ALTER TABLE `tb_movimiento`
  ADD CONSTRAINT `fk_tb_movimiento_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_pc`
--
ALTER TABLE `tb_pc`
  ADD CONSTRAINT `fk_tb_pc_tb_dpto_1` FOREIGN KEY (`fk_dpto`) REFERENCES `tb_dpto` (`id`),
  ADD CONSTRAINT `fk_tb_pc_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_placamadre`
--
ALTER TABLE `tb_placamadre`
  ADD CONSTRAINT `fk_tb_placamadre_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_printer`
--
ALTER TABLE `tb_printer`
  ADD CONSTRAINT `fk_tb_printer_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_rotura`
--
ALTER TABLE `tb_rotura`
  ADD CONSTRAINT `fk_tb_rotura_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_router`
--
ALTER TABLE `tb_router`
  ADD CONSTRAINT `fk_tb_router_tb_dpto_1` FOREIGN KEY (`fk_dpto`) REFERENCES `tb_dpto` (`id`),
  ADD CONSTRAINT `fk_tb_router_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_salva`
--
ALTER TABLE `tb_salva`
  ADD CONSTRAINT `fk_tb_salva_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_software`
--
ALTER TABLE `tb_software`
  ADD CONSTRAINT `fk_tb_software_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_speaker`
--
ALTER TABLE `tb_speaker`
  ADD CONSTRAINT `fk_tb_speaker_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_switch`
--
ALTER TABLE `tb_switch`
  ADD CONSTRAINT `fk_tb_switch_tb_dpto_1` FOREIGN KEY (`fk_dpto`) REFERENCES `tb_dpto` (`id`),
  ADD CONSTRAINT `fk_tb_switch_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_teclado`
--
ALTER TABLE `tb_teclado`
  ADD CONSTRAINT `fk_tb_teclado_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_telefono`
--
ALTER TABLE `tb_telefono`
  ADD CONSTRAINT `fk_tb_telefono_tb_dpto_1` FOREIGN KEY (`fk_dpto`) REFERENCES `tb_dpto` (`id`),
  ADD CONSTRAINT `fk_tb_telefono_tb_responsable_1` FOREIGN KEY (`fk_responsable`) REFERENCES `tb_responsable` (`id`);

--
-- Filtros para la tabla `tb_ups`
--
ALTER TABLE `tb_ups`
  ADD CONSTRAINT `fk_tb_ups_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);

--
-- Filtros para la tabla `tb_virus`
--
ALTER TABLE `tb_virus`
  ADD CONSTRAINT `fk_tb_virus_tb_pc_1` FOREIGN KEY (`fk_pc`) REFERENCES `tb_pc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
