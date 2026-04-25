-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-03-2026 a las 17:26:30
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sgbd_churrasqueria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `ci_persona` int(11) NOT NULL,
  `preferencias` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `ci_persona`, `preferencias`) VALUES
(1, 12345678, 'Churrasco bien cocido'),
(2, 13456789, 'Ensalada sin cebolla'),
(3, 10020030, 'Soda sin hielo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_en_momento` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_en_momento`) VALUES
(1, 1, 1, 1, 120.00),
(2, 1, 21, 1, 23.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesero`
--

CREATE TABLE `mesero` (
  `id_mesero` int(11) NOT NULL,
  `ci_persona` int(11) NOT NULL,
  `fecha_contratacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mesero`
--

INSERT INTO `mesero` (`id_mesero`, `ci_persona`, `fecha_contratacion`) VALUES
(1, 10293847, '2023-05-15'),
(2, 11928374, '2023-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(20) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `id_pedido`, `monto_total`, `metodo_pago`, `fecha_pago`) VALUES
(1, 1, 143.00, 'QR', '2026-03-26 13:25:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int(11) NOT NULL,
  `id_mesero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `fecha_pedido`, `id_cliente`, `id_mesero`) VALUES
(1, '2026-03-26 13:25:47', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ci` int(8) NOT NULL,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `apellido_paterno` varchar(12) NOT NULL,
  `apellido_materno` varchar(12) DEFAULT NULL,
  `zona` varchar(20) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `numero_casa` varchar(6) DEFAULT NULL,
  `telefono` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ci`, `primer_nombre`, `segundo_nombre`, `apellido_paterno`, `apellido_materno`, `zona`, `calle`, `numero_casa`, `telefono`) VALUES
(10020030, 'Maria', 'Elena', 'Quispe', 'Rojas', 'Central', 'Calle Bolivar', '120', 70011223),
(10293847, 'Emilio', 'Gabriel', 'Fernández', 'Jiménez', 'Central', '6 de Agosto', '1245', 72345678),
(11928374, 'Jonathan', 'Felipe', 'Jorge', 'Magne', 'Sud', 'Calle Herrera', '45', 68912345),
(12345678, 'Gustavo', NULL, 'Mamani', 'Perez', 'Norte', 'Av. Villarroel', 'SN', 71223344),
(13456789, 'Camilo', NULL, 'Mamani', 'Veizan', 'Este', 'Calle Pagador', '890', 60055443);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `precio_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre_producto`, `categoria`, `precio_unitario`) VALUES
(1, 'Parrilla El Mana', 'Platos a la Parrilla', 120.00),
(2, 'Bife Chorizo', 'Platos a la Parrilla', 65.00),
(3, 'Filete', 'Platos a la Parrilla', 60.00),
(4, 'Churrasco', 'Platos a la Parrilla', 50.00),
(5, 'Chuleta de Cerdo', 'Platos a la Parrilla', 55.00),
(6, 'Plato Chorizo', 'Platos a la Parrilla', 40.00),
(7, 'Pollo a la Brasa', 'Platos a la Parrilla', 45.00),
(8, 'Chorizo', 'Extras', 15.00),
(9, 'Criadilla', 'Extras', 12.00),
(10, 'Morcilla', 'Extras', 12.00),
(11, 'Tripitas', 'Extras', 12.00),
(12, 'Arroz y Papas', 'Extras', 20.00),
(13, 'Chori Pan', 'Extras', 15.00),
(14, 'Vinos Asperos', 'Vinos', 70.00),
(15, 'Vinos Pateros', 'Vinos', 70.00),
(16, 'Semi Dulces', 'Vinos', 50.00),
(17, 'Coca Cola - Fanta 2LTS', 'Gaseosas', 16.00),
(18, 'Coca Cola 1/2LTS', 'Gaseosas', 8.00),
(19, 'Coca Cola - Fanta - Sprite 1LTS', 'Gaseosas', 10.00),
(20, 'Personales', 'Gaseosas', 3.00),
(21, 'Cerveza', 'Bebidas Alcoholicas', 23.00),
(22, 'Vital 2LTS', 'Agua Natural', 15.00),
(23, 'Vital Personal', 'Agua Natural', 6.00),
(24, 'Jugo Frutal', 'Jugos', 16.00),
(25, 'Limonada', 'Jugos', 16.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `ci_persona` (`ci_persona`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `mesero`
--
ALTER TABLE `mesero`
  ADD PRIMARY KEY (`id_mesero`),
  ADD KEY `ci_persona` (`ci_persona`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_mesero` (`id_mesero`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mesero`
--
ALTER TABLE `mesero`
  MODIFY `id_mesero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ci_persona`) REFERENCES `persona` (`ci`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `mesero`
--
ALTER TABLE `mesero`
  ADD CONSTRAINT `mesero_ibfk_1` FOREIGN KEY (`ci_persona`) REFERENCES `persona` (`ci`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_mesero`) REFERENCES `mesero` (`id_mesero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
