-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2023 a las 23:06:18
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

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
(2, '2022-12-02 01:28:17', 4),
(3, '2022-12-02 06:22:52', 3),
(4, '2022-12-03 01:22:27', 3),
(5, '2022-12-03 01:24:13', 3),
(11, '2023-07-23 08:38:21', 4);

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
(4, 2, 0, '2022-12-02 01:28:17', '2022-12-02 01:29:38', 4),
(5, 2, 1, '2022-12-02 01:29:38', NULL, 4),
(7, 3, 0, '2022-12-02 06:22:52', '2022-12-02 06:23:39', 3),
(8, 3, 1, '2022-12-02 06:23:39', '2023-07-23 19:39:55', 3),
(9, 4, 0, '2022-12-03 01:22:27', '2022-12-03 01:22:59', 3),
(10, 4, 1, '2022-12-03 01:22:59', '2022-12-03 01:23:30', 3),
(11, 4, 2, '2022-12-03 01:23:30', NULL, 3),
(14, 5, 0, '2022-12-03 01:24:13', '2022-12-03 01:24:40', 3),
(15, 5, 1, '2022-12-03 01:24:39', '2023-07-23 19:38:56', 3),
(146, 11, 0, '2023-07-23 08:38:21', '2023-07-23 08:39:38', 4),
(147, 11, 1, '2023-07-23 08:39:37', '2023-07-23 08:42:24', 4),
(148, 11, 4, '2023-07-23 08:42:24', NULL, 4),
(149, 5, 2, '2023-07-23 19:38:53', '2023-07-23 20:10:45', 3),
(150, 3, 2, '2023-07-23 19:39:55', NULL, 3),
(151, 5, 3, '2023-07-23 20:10:41', NULL, 3);

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
(23, 1, 11, 20);

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
(7, 'Inicio', '../home/paginaSegura.php', NULL, NULL),
(11, 'Mi perfil', '#', NULL, NULL),
(12, 'Mi perfil', '../usuario/perfil.php', 11, NULL),
(13, 'Cambiar Datos', '../usuario/cambiardatos.php', 11, '2023-07-13 12:06:40'),
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
(30, 'Asignar Rol', '../usuario/asignarRol.php', NULL, '2022-12-04 12:08:40'),
(31, 'Gestión de Rol', '../rol/ListarRol.php', 15, NULL),
(32, 'Nuevo Rol', '../rol/formRol.php', 15, '2023-07-17 15:38:41'),
(33, 'Enviar correo', '../compra/accion/email.php', 21, '2023-07-23 04:54:50'),
(34, 'Gestión de Correo', '../compra/enviarEmail.php', 21, '2023-07-23 04:54:55'),
(35, 'Correo', '../compra/email.php', 21, '2023-07-23 04:55:01');

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
(7, 1),
(7, 2),
(7, 3),
(11, 2),
(12, 1),
(12, 2),
(12, 3),
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
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(33, 3),
(34, 3),
(35, 3);

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
(1, 'DAHUA - 1', 'Camara 2mpx', 20, 'Camaras', '23000', 'https://i.ibb.co/ygNPwx6/c4.webp'),
(2, 'DAHUA DVR', 'DVR Dahua', 5, 'Equipos', '20900', 'https://i.ibb.co/LJzSz9f/E2.webp'),
(3, 'DAHUA - 2', 'Camara 3mpx', 33, 'Camaras', '30000', 'https://i.ibb.co/19KG1GP/C2.webp'),
(4, 'HIKVISION', 'Camara 4mpx', 14, 'Camaras', '21000', 'https://i.ibb.co/wShpvTg/C3.webp'),
(5, 'DAHUA', 'DVR 4108', 13, 'Equipos', '30000', 'https://i.ibb.co/SXwW8g6/E1.webp'),
(6, 'DAHUA', 'DVR 4104', 10, 'Equipos', '18000', 'https://i.ibb.co/LJzSz9f/E2.webp'),
(7, 'DAHUA - 3', 'Camara Domo 2mpx', 29, 'Camaras', '20000', 'https://i.ibb.co/ygNPwx6/c4.webp'),
(8, 'HIKVISION', 'Camara Domo 5mpx', 50, 'Camaras', '32000', 'https://i.ibb.co/VQwtyXG/C5.webp'),
(9, 'DAHUA', 'DVR XV08', 30, 'Equipos', '30000', 'https://i.ibb.co/LJzSz9f/E2.webp'),
(10, 'WD - Disco', 'Disco duro 1tb', 45, 'Accesorios', '35000', 'https://i.ibb.co/CpyN3tZ/A1.webp');

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
(1, 'Veronica', 'e10adc3949ba59abbe56e057f20f883e', 'sonoiovero.bis@gmail.com', NULL),
(2, 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 'veronica.arce@est.fi.uncoma.edu.ar', NULL),
(3, 'Pepa', 'e10adc3949ba59abbe56e057f20f883e', 'sonoiovero@hotmail.com', NULL),
(4, 'Carlos', 'e10adc3949ba59abbe56e057f20f883e', 'sonoiovero@hotmail.com', NULL),
(5, 'Maria', 'e10adc3949ba59abbe56e057f20f883e', 'sonoiovero.bis@gmail.com', NULL);

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
(1, 3),
(2, 1),
(3, 2),
(4, 2),
(5, 2);

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
  MODIFY `idcompra` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `compraestado`
--
ALTER TABLE `compraestado`
  MODIFY `idcompraestado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT de la tabla `compraitem`
--
ALTER TABLE `compraitem`
  MODIFY `idcompraitem` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

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
