-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2023 a las 17:39:56
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
-- Base de datos: `cumpleaños`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `id_persona` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`id_persona`, `nombre`, `apellido`, `fecha_nac`) VALUES
(2, 'Daiana', 'Justo', '1991-02-07'),
(3, 'Emilia', 'Mindurry', '2017-12-21'),
(4, 'Jesus Maria', 'Mindurry', '1990-08-09'),
(5, 'Valeria', 'Montenegro', '1991-03-16'),
(6, 'Tadeo', 'Perrota', '2022-11-09'),
(7, 'Bruno', 'Perrota', '1989-12-26'),
(8, 'Ariana', 'Barbosa', '1990-11-10'),
(9, 'Diego', 'Gaitan', '1988-05-16'),
(10, 'Paz', 'Gaitan', '2015-10-09'),
(11, 'Luz', 'Gaitan', '2022-02-18'),
(12, 'Analuz', 'Pozzo Avalos', '1991-01-05'),
(13, 'Laura', 'Leiva', '1991-03-01'),
(14, 'Luciano ', 'Muñoz', '1986-05-19'),
(15, 'Braian', 'Borovich', '1991-05-17'),
(16, 'Luciano', 'Serrani', '1985-12-31'),
(17, 'Melina', 'Ocanto', '1991-01-29'),
(18, 'Antonio', 'Serrani', '2022-11-26'),
(19, 'Gabriela', 'Curulli', '1991-06-12'),
(20, 'Emiliano', 'Balianelli', '1991-04-15'),
(21, 'Helena', 'Balianelli', '2023-10-16'),
(22, 'Eleonora', 'Santiso', '1990-10-23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datos`
--
ALTER TABLE `datos`
  ADD PRIMARY KEY (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `datos`
--
ALTER TABLE `datos`
  MODIFY `id_persona` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
