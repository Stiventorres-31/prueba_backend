-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2023 a las 03:57:05
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
-- Base de datos: `distribuidor_lacteos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimientos`
--

CREATE TABLE `establecimientos` (
  `id_establecimiento` int(11) NOT NULL,
  `codigo_establecimiento` varchar(7) NOT NULL,
  `nombre_establecimiento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `establecimientos`
--

INSERT INTO `establecimientos` (`id_establecimiento`, `codigo_establecimiento`, `nombre_establecimiento`) VALUES
(1, 'Malambo', 'Minimercados'),
(3, 'bar3', 'Minimercados'),
(4, 'bar1', 'Minimercados'),
(7, 'ba1', 'Minimercados'),
(8, 'bca1', 'Minimercados'),
(11, 'nba1', 'Minimercados'),
(12, 'vba1', 'Minimercados'),
(13, 'va1', 'Minimercados'),
(14, 'cva1', 'Minimercados'),
(16, 'ca1', 'Minimercados'),
(18, 'ca01', 'Minimercados'),
(19, 'ca101', 'Minimercados'),
(21, 'c101', 'Minimercados'),
(23, 'a000', 'Minimercados'),
(25, 'a001', 'Minimercados'),
(26, 'a002', 'Minimercados'),
(27, 'a003', 'Minimercados'),
(29, 'a004', 'Minimercados'),
(31, 'a005', 'Minimercados'),
(32, 'a006', 'Minimercados'),
(33, 'a007', 'Minimercados'),
(34, 'a008', 'Minimercados'),
(36, 'a009', 'Minimercados'),
(38, 'a011', 'Minimercados'),
(39, 'a012', 'Minimercados'),
(41, 'a013', 'Minimercados'),
(43, 'a014', 'Minimercados'),
(44, 'a015', 'Minimercados'),
(45, 'a016', 'Minimercados'),
(46, 'a017', 'Minimercados'),
(47, 'a018', 'Minimercados'),
(48, 'a019', 'Minimercados'),
(49, 'a020', 'Minimercados'),
(50, 'a021', 'Minimercados'),
(52, 'a022', 'Minimercados'),
(53, 'a023', 'Minimercados'),
(62, 'a024', 'Minimercados'),
(64, 'a025', 'Minimercados'),
(66, 'a026', 'Minimercados'),
(68, 'a027', 'Minimercados'),
(69, 'a028', 'Minimercados'),
(72, 'a029', 'Minimercados'),
(74, 'a030', 'Minimercados'),
(76, 'a031', 'Minimercados'),
(77, 'a032', 'Minimercados'),
(78, 'a033', 'Minimercados'),
(79, 'a034', 'Minimercados'),
(81, 'a035', 'Minimercados'),
(83, 'a036', 'Minimercados'),
(84, 'a037', 'Minimercados'),
(86, 'a038', 'Minimercados'),
(87, 'a039', 'Minimercados'),
(89, 'a040', 'Minimercados'),
(90, 'a041', 'Minimercados'),
(91, 'a042', 'Minimercados'),
(92, 'a043', 'Minimercados'),
(95, 'a044', 'Minimercados'),
(101, 'a045', 'Minimercados'),
(102, 'a046', 'Minimercados'),
(104, 'a048', 'Minimercados'),
(105, 'arr01', 'tienda'),
(106, 'arr02', 'tienda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portafolios`
--

CREATE TABLE `portafolios` (
  `id_portafolio` int(11) NOT NULL,
  `codigo_portafolio` varchar(7) NOT NULL,
  `nombre_portafolio` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `portafolios`
--

INSERT INTO `portafolios` (`id_portafolio`, `codigo_portafolio`, `nombre_portafolio`) VALUES
(1, 'Bar01', 'Sueros'),
(2, 'Barr01', 'Lacteoss'),
(4, 'Barr02', 'Lacteos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` varchar(7) NOT NULL,
  `nombre_producto` varchar(20) NOT NULL,
  `id_establecimiento_fk` int(11) NOT NULL,
  `id_portafolio_fk` int(11) NOT NULL,
  `id_usuario_registrador_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `codigo_producto`, `nombre_producto`, `id_establecimiento_fk`, `id_portafolio_fk`, `id_usuario_registrador_fk`) VALUES
(1, 'Su202', 'costeño', 1, 1, 1),
(2, 'bvar0', 'costeño', 1, 1, 1),
(3, 'bva10', 'costeño', 1, 1, 1),
(4, 'c03', 'suero', 1, 1, 1),
(12, 'c01', 'suer1', 1, 1, 1),
(13, 'c06', 'suer1', 1, 1, 1),
(14, 'c09', 'suer1', 1, 1, 1),
(15, 'c47', 'suer1', 1, 1, 1),
(16, 'h47', 'suer1', 1, 1, 1),
(17, 'b02', 'suer1', 1, 1, 1),
(18, 'b03', 'suer1', 1, 1, 1),
(20, 'b04', 'suer1', 1, 1, 1),
(21, 'b05', 'suer1', 1, 1, 1),
(22, 'b06', 'suer1', 1, 1, 1),
(24, 'b07', 'suer1', 1, 1, 1),
(25, 'b08', 'suer1', 1, 1, 1),
(26, 'b09', 'suer1', 1, 1, 1),
(27, 'b10', 'suer1', 106, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `usuario` varchar(11) NOT NULL,
  `pass` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `usuario`, `pass`) VALUES
(1, 'stiven torres', 's3120', '1234'),
(2, 'Jeol', 'J2424', '123'),
(3, 'Jeol', 'Js2424', '123'),
(5, 'Jeol', 'Js24241', '123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD PRIMARY KEY (`id_establecimiento`),
  ADD UNIQUE KEY `codigo_establecimiento` (`codigo_establecimiento`);

--
-- Indices de la tabla `portafolios`
--
ALTER TABLE `portafolios`
  ADD PRIMARY KEY (`id_portafolio`),
  ADD UNIQUE KEY `codigo_portafolio` (`codigo_portafolio`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `id_establecimiento_fk` (`id_establecimiento_fk`),
  ADD KEY `id_portafolio_fk` (`id_portafolio_fk`),
  ADD KEY `id_usuario_registrador_fk` (`id_usuario_registrador_fk`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `id_establecimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `portafolios`
--
ALTER TABLE `portafolios`
  MODIFY `id_portafolio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_establecimiento_fk`) REFERENCES `establecimientos` (`id_establecimiento`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_portafolio_fk`) REFERENCES `portafolios` (`id_portafolio`),
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_usuario_registrador_fk`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
