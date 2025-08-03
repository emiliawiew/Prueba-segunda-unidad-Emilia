-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2025 a las 15:22:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET FOREIGN_KEY_CHECKS = 0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--
CREATE DATABASE IF NOT EXISTS `examen` DEFAULT CHARACTER SET utf8mb4 COLLATE=utf8mb4_general_ci;
USE `examen`;

-- --------------------------------------------------------

--
-- Eliminar tablas en orden correcto para evitar conflicto de claves foráneas
--

DROP TABLE IF EXISTS `libros`;
DROP TABLE IF EXISTS `clientes`;

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(5) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`) VALUES
(1, 'Elena Ruiz', 'elenaruiz@gmail.com'),
(2, 'Carlos Pérez', 'carlosperez@hotmail.com'),
(3, 'María Estévez', 'mariaestevez@gmail.com'),
(4, 'José Gómez', 'josegomez@yahoo.com'),
(5, 'Elena Campos', 'elenacampos@gmail.com'),
(6, 'Pedro Suárez', 'pedrosuarez@hotmail.com'),
(7, 'María Magdalena', 'mariammagdalena@gmail.com'),
(8, 'José Gutierrez', 'josegutierrez@yahoo.com'),
(9, 'Lucía Martínez', 'luciamartinez@gmail.com'),
(10, 'Andrés López', 'andreslopez@hotmail.com'),
(11, 'Raquel Fernández', 'raquelfernandez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(150) NOT NULL,
  `anio` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `anio`, `cliente_id`) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', 1967, 4),
(2, 'El Código Da Vinci', 'Dan Brown', 2003, 2),
(3, 'Sapiens', 'Yuval Noah Harari', 2011, 1),
(4, 'El Alquimista', 'Paulo Coelho', 1988, 2),
(5, '1984', 'George Orwell', 1949, 3),
(6, 'Harry Potter y la Piedra Filosofal', 'J.K. Rowling', 1997, 3),
(7, 'La Sombra del Viento', 'Carlos Ruiz Zafón', 2001, 10),
(8, 'El Juego del Ángel', 'Carlos Ruiz Zafón', 2008, 9),
(9, 'El Principito', 'Antoine de Saint-Exupéry', 1943, 8),
(10, 'Los Pilares de la Tierra', 'Ken Follett', 1989, 7),
(11, 'La Casa de los Espíritus', 'Isabel Allende', 1982, 5),
(12, 'Rebelión en la Granja', 'George Orwell', 1945, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
