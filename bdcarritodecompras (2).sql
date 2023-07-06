-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2023 a las 04:55:12
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarritodecompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idcompra` bigint(20) NOT NULL,
  `cofecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idusuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idcompra`, `cofecha`, `idusuario`) VALUES
(2, '2022-12-02 01:28:17', 24),
(3, '2022-12-02 06:22:52', 23),
(4, '2022-12-03 01:22:27', 23),
(5, '2022-12-03 01:24:13', 23),
(6, '2022-12-05 00:12:51', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraestado`
--

CREATE TABLE `compraestado` (
  `idcompraestado` bigint(20) UNSIGNED NOT NULL,
  `idcompra` bigint(11) NOT NULL,
  `idcompraestadotipo` int(11) NOT NULL,
  `cefechaini` timestamp NOT NULL DEFAULT current_timestamp(),
  `cefechafin` timestamp NULL DEFAULT NULL,
  `idusuario` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compraestado`
--

INSERT INTO `compraestado` (`idcompraestado`, `idcompra`, `idcompraestadotipo`, `cefechaini`, `cefechafin`, `idusuario`) VALUES
(4, 2, 0, '2022-12-02 01:28:17', '2022-12-02 01:29:38', 24),
(5, 2, 1, '2022-12-02 01:29:38', '2022-12-02 01:34:56', 24),
(6, 2, 2, '2022-12-02 01:34:56', NULL, 24),
(7, 3, 0, '2022-12-02 06:22:52', '2022-12-02 06:23:39', 23),
(8, 3, 1, '2022-12-02 06:23:39', '2022-12-05 00:12:15', 23),
(9, 4, 0, '2022-12-03 01:22:27', '2022-12-03 01:22:59', 23),
(10, 4, 1, '2022-12-03 01:22:59', '2022-12-03 01:23:30', 23),
(11, 4, 2, '2022-12-03 01:23:30', '2022-12-03 01:23:43', 23),
(12, 4, 3, '2022-12-03 01:23:43', '2022-12-03 01:23:52', 23),
(13, 4, 4, '2022-12-03 01:23:52', NULL, 23),
(14, 5, 0, '2022-12-03 01:24:13', '2022-12-03 01:24:40', 23),
(15, 5, 1, '2022-12-03 01:24:39', '2022-12-03 01:24:55', 23),
(16, 5, 4, '2022-12-03 01:24:55', NULL, 23),
(17, 3, 4, '2022-12-05 00:12:15', NULL, 23),
(18, 6, 0, '2022-12-05 00:12:51', '2022-12-05 00:14:46', 23),
(19, 6, 1, '2022-12-05 00:14:46', NULL, 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraestadotipo`
--

CREATE TABLE `compraestadotipo` (
  `idcompraestadotipo` int(11) NOT NULL,
  `cetdescripcion` varchar(50) NOT NULL,
  `cetdetalle` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compraestadotipo`
--

INSERT INTO `compraestadotipo` (`idcompraestadotipo`, `cetdescripcion`, `cetdetalle`) VALUES
(0, 'En confección', 'Empieza cuando el usuario:cliente agrega un producto al carrito, hasta que inicia o efectua la compra '),
(1, 'iniciada', 'cuando el usuario : cliente inicia la compra de uno o mas productos del carrito'),
(2, 'aceptada', 'cuando el usuario administrador da ingreso a uno de las compras en estado = 1 '),
(3, 'enviada', 'cuando el usuario administrador envia a uno de las compras en estado =2 '),
(4, 'cancelada', 'un usuario administrador podra cancelar una compra en cualquier estado y un usuario cliente solo en estado=1 ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraitem`
--

CREATE TABLE `compraitem` (
  `idcompraitem` bigint(20) UNSIGNED NOT NULL,
  `idproducto` bigint(20) NOT NULL,
  `idcompra` bigint(20) NOT NULL,
  `cicantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compraitem`
--

INSERT INTO `compraitem` (`idcompraitem`, `idproducto`, `idcompra`, `cicantidad`) VALUES
(3, 3, 2, 1),
(4, 4, 2, 1),
(5, 2, 3, 1),
(6, 1, 4, 1),
(7, 1, 5, 1),
(8, 2, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idmenu` bigint(20) NOT NULL,
  `menombre` varchar(50) NOT NULL COMMENT 'Nombre del item del menu',
  `medescripcion` varchar(124) NOT NULL COMMENT 'Descripcion mas detallada del item del menu',
  `idpadre` bigint(20) DEFAULT NULL COMMENT 'Referencia al id del menu que es subitem',
  `medeshabilitado` timestamp NULL DEFAULT current_timestamp() COMMENT 'Fecha en la que el menu fue deshabilitado por ultima vez'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idmenu`, `menombre`, `medescripcion`, `idpadre`, `medeshabilitado`) VALUES
(7, 'Home', '../home/paginaSegura.php', NULL, NULL),
(11, 'Mi perfil', '#', NULL, NULL),
(12, 'Mis datos', '../usuario/perfil.php', 11, '2022-12-03 09:17:54'),
(13, 'Cambiar Datos', '../usuario/cambiardatos.php', 11, NULL),
(14, 'Mis compras', '../compra/miscompras.php', 11, NULL),
(15, 'Administrar', '#', NULL, NULL),
(16, 'Gestión de Menú', '../menu/listaMenu.php', 15, NULL),
(19, 'Gestión permisos páginas', '../menu/permisosMenu.php', 15, NULL),
(20, 'Gestión de Usuario', '../usuario/listarUsuario.php', 15, NULL),
(21, 'Depósito', '#', NULL, NULL),
(22, 'Gestión de Producto', '../producto/listaProducto.php', 21, NULL),
(23, 'Supervisar compras', '../compra/listaCompras.php', 21, NULL),
(24, 'Carrito', '#', NULL, NULL),
(25, 'Compra', '../compra/index.php', NULL, NULL),
(29, 'Asignar Menú', '../menu/asignarMenu.php', NULL, '2022-12-04 12:07:46'),
(30, 'Asignar Rol', '../usuario/asignarRol.php', NULL, '2022-12-04 12:08:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menurol`
--

CREATE TABLE `menurol` (
  `idmenu` bigint(20) NOT NULL,
  `idrol` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menurol`
--

INSERT INTO `menurol` (`idmenu`, `idrol`) VALUES
(7, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 1),
(16, 1),
(19, 1),
(20, 1),
(21, 3),
(22, 3),
(23, 3),
(24, 2),
(25, 2),
(29, 1),
(30, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `pronombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `prodetalle` varchar(512) NOT NULL,
  `procantstock` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `urlimagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `pronombre`, `prodetalle`, `procantstock`, `tipo`, `precio`, `urlimagen`) VALUES
(1, 'DAHUA', 'Camara 2mpx', 5, 'Camaras', '23000', 'https://i.ibb.co/ygNPwx6/c4.webp'),
(2, 'DAHUA', 'DVR Dahua', 6, 'Equipos', '20900', 'https://i.ibb.co/LJzSz9f/E2.webp'),
(3, 'DAHUA', 'Camara 3mpx', 34, 'Camaras', '30000', 'https://i.ibb.co/19KG1GP/C2.webp'),
(4, 'HIKVISION', 'Camara 4mpx', 14, 'Camaras', '21000', 'https://i.ibb.co/wShpvTg/C3.webp'),
(5, 'DAHUA', 'DVR 4108', 30, 'Equipos', '30000', 'https://i.ibb.co/SXwW8g6/E1.webp'),
(6, 'DAHUA', 'DVR 4104', 10, 'Equipos', '18000', 'https://i.ibb.co/LJzSz9f/E2.webp'),
(7, 'DAHUA', 'Camara Domo 2mpx', 29, 'Camaras', '20000', 'https://i.ibb.co/ygNPwx6/c4.webp'),
(8, 'HIKVISION', 'Camara Domo 5mpx', 50, 'Camaras', '32000', 'https://i.ibb.co/VQwtyXG/C5.webp'),
(9, 'DAHUA', 'DVR XV08', 30, 'Equipos', '30000', 'https://i.ibb.co/LJzSz9f/E2.webp'),
(10, 'WD', 'Disco duro 1tb', 35, 'Accesorios', '35000', 'https://i.ibb.co/CpyN3tZ/A1.webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `rodescripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rodescripcion`) VALUES
(1, 'Administrador'),
(2, 'Cliente'),
(3, 'Deposito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` bigint(20) NOT NULL,
  `usnombre` varchar(50) NOT NULL,
  `uspass` varchar(150) NOT NULL,
  `usmail` varchar(50) NOT NULL,
  `usdeshabilitado` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usnombre`, `uspass`, `usmail`, `usdeshabilitado`) VALUES
(1, 'Bruno', 'e10adc3949ba59abbe56e057f20f883e', 'br@gmail.com', NULL),
(2, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'br2@gmail.com', NULL),
(3, 'Enzo Perez', '8c531d5ff27a37d697d53cab360ccf15', 'eperez@gmail.com', '2022-11-12 12:48:30'),
(23, 'pepa', 'c4ca4238a0b923820dcc509a6f75849b', 'pepa@pepa.com', NULL),
(24, 'Bruce', 'c4ca4238a0b923820dcc509a6f75849b', 'bruce@gmail.com', NULL),
(25, 'cliente', '202cb962ac59075b964b07152d234b70', 'cliente@correo.ar', '2022-12-04 12:06:12'),
(26, 'maria', 'c4ca4238a0b923820dcc509a6f75849b', 'mar@gmail.com', '2022-12-04 12:06:04'),
(27, 'depo', 'c4ca4238a0b923820dcc509a6f75849b', 'doo@gmail.com', '2022-12-02 05:00:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--

CREATE TABLE `usuariorol` (
  `idusuario` bigint(20) NOT NULL,
  `idrol` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuariorol`
--

INSERT INTO `usuariorol` (`idusuario`, `idrol`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(23, 1),
(23, 2),
(23, 3),
(24, 1),
(24, 2),
(25, 2),
(26, 2),
(27, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD UNIQUE KEY `idcompra` (`idcompra`),
  ADD KEY `fkcompra_1` (`idusuario`);

--
-- Indices de la tabla `compraestado`
--
ALTER TABLE `compraestado`
  ADD PRIMARY KEY (`idcompraestado`),
  ADD UNIQUE KEY `idcompraestado` (`idcompraestado`),
  ADD KEY `fkcompraestado_1` (`idcompra`),
  ADD KEY `fkcompraestado_2` (`idcompraestadotipo`),
  ADD KEY `fkcompraestado_3` (`idusuario`);

--
-- Indices de la tabla `compraestadotipo`
--
ALTER TABLE `compraestadotipo`
  ADD PRIMARY KEY (`idcompraestadotipo`);

--
-- Indices de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  ADD PRIMARY KEY (`idcompraitem`),
  ADD UNIQUE KEY `idcompraitem` (`idcompraitem`),
  ADD KEY `fkcompraitem_1` (`idcompra`),
  ADD KEY `fkcompraitem_2` (`idproducto`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`),
  ADD UNIQUE KEY `idmenu` (`idmenu`),
  ADD KEY `fkmenu_1` (`idpadre`);

--
-- Indices de la tabla `menurol`
--
ALTER TABLE `menurol`
  ADD PRIMARY KEY (`idmenu`,`idrol`),
  ADD KEY `fkmenurol_2` (`idrol`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD UNIQUE KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `idrol` (`idrol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`idusuario`,`idrol`),
  ADD KEY `idusuario` (`idusuario`),
  ADD KEY `idrol` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idcompra` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `compraestado`
--
ALTER TABLE `compraestado`
  MODIFY `idcompraestado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  MODIFY `idcompraitem` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fkcompra_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `compraestado`
--
ALTER TABLE `compraestado`
  ADD CONSTRAINT `fkcompraestado_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkcompraestado_2` FOREIGN KEY (`idcompraestadotipo`) REFERENCES `compraestadotipo` (`idcompraestadotipo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkcompraestado_3` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `compraitem`
--
ALTER TABLE `compraitem`
  ADD CONSTRAINT `fkcompraitem_1` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkcompraitem_2` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fkmenu_1` FOREIGN KEY (`idpadre`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `menurol`
--
ALTER TABLE `menurol`
  ADD CONSTRAINT `fkmenurol_1` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkmenurol_2` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD CONSTRAINT `fkmovimiento_1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariorol_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
