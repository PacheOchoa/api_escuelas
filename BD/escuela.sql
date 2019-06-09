-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2019 a las 19:14:08
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `semestres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`, `semestres`) VALUES
(1, 'Ingeniería industrial', 8),
(2, 'Ingeniería en industrias alimentarias', 8),
(3, 'Ingeniería en gestión empresarial', 8),
(4, 'Ingeniería en electrónica ', 8),
(5, 'Ingeniería en informática', 8),
(6, 'Enfermería', 8),
(7, 'Fisioterapia', 9),
(8, 'medicina', 10),
(9, 'Nutrición', 8),
(10, 'Odontología', 9),
(11, 'Enfermería complementario', 12),
(12, 'Ingeniería Aeroespacial', 9),
(13, 'Ingeniería Biónica', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidad`
--

CREATE TABLE `universidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `id_zona` int(11) NOT NULL,
  `publica` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `mision` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `vision` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `universidad`
--

INSERT INTO `universidad` (`id`, `nombre`, `id_zona`, `publica`, `id_carrera`, `mision`, `vision`) VALUES
(1, ' Instituto Tecnológico Superior de Acatlán de Osorio (ITSAO)', 1, 'SI', 1, '', ''),
(2, ' Instituto Tecnológico Superior de Acatlán de Osorio (ITSAO)', 1, 'SI', 2, '', ''),
(3, ' Instituto Tecnológico Superior de Acatlán de Osorio (ITSAO)', 1, 'SI', 3, '', ''),
(4, ' Instituto Tecnológico Superior de Acatlán de Osorio (ITSAO)', 1, 'SI', 4, '', ''),
(5, ' Instituto Tecnológico Superior de Acatlán de Osorio (ITSAO)', 1, 'SI', 5, '', ''),
(6, 'Universidad de Puebla', 1, 'NO', 6, '', ''),
(7, 'Universidad de Puebla', 1, 'NO', 7, '', ''),
(8, 'Universidad de Puebla', 1, 'NO', 8, '', ''),
(9, 'Universidad de Puebla', 1, 'NO', 9, '', ''),
(10, 'Universidad de Puebla', 1, 'NO', 10, '', ''),
(11, 'Universidad de Puebla', 1, 'NO', 11, '', ''),
(12, 'Universidad de Puebla', 1, 'NO', 12, '', ''),
(13, 'Universidad de Puebla', 1, 'NO', 13, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`id`, `nombre`) VALUES
(1, 'ACATLÁN');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zona` (`id_zona`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `universidad`
--
ALTER TABLE `universidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `universidad`
--
ALTER TABLE `universidad`
  ADD CONSTRAINT `universidad_ibfk_1` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id`),
  ADD CONSTRAINT `universidad_ibfk_2` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
