-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2025 a las 13:34:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_cadena_ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `ID_Almacen` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `Codigo_postal_almacen` varchar(10) NOT NULL,
  `Provincia_almacen` varchar(20) NOT NULL,
  `Ciudad_almacen` varchar(20) NOT NULL,
  `Numero_calle_almacen` int(11) NOT NULL,
  `Nombre_calle_almacen` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`ID_Almacen`, `ID_Sucursal`, `Codigo_postal_almacen`, `Provincia_almacen`, `Ciudad_almacen`, `Numero_calle_almacen`, `Nombre_calle_almacen`) VALUES
(1, 1, 'C1424CAJ', 'CABA', 'CABA', 360, 'Guayaquil'),
(2, 2, 'C1428BRA', 'CABA', 'CABA', 1503, 'Manuel Ugarte'),
(3, 3, 'C1229AAJ', 'CABA', 'CABA', 2232, 'Humberto Primo'),
(4, 1, 'C1000ABC', 'CABA', 'CABA', 101, 'Lavalle'),
(5, 2, 'C1001XYZ', 'CABA', 'CABA', 505, 'Florida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calidad`
--

CREATE TABLE `calidad` (
  `ID_Inspección` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Almacen` int(11) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `Fecha_Devolucion_A_Proveedor` date DEFAULT NULL,
  `Estado_Actual_Producto` varchar(50) NOT NULL,
  `Estado_Final_Producto` varchar(20) NOT NULL,
  `Fecha_Estado_Actual_Producto` date NOT NULL,
  `Cantidad_Devuelta` int(11) DEFAULT NULL,
  `Observaciones` varchar(50) DEFAULT NULL,
  `Fecha_Reingreso_Producto_A_Almacen` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `calidad`
--

INSERT INTO `calidad` (`ID_Inspección`, `ID_Producto`, `ID_Almacen`, `ID_Proveedor`, `Fecha_Devolucion_A_Proveedor`, `Estado_Actual_Producto`, `Estado_Final_Producto`, `Fecha_Estado_Actual_Producto`, `Cantidad_Devuelta`, `Observaciones`, `Fecha_Reingreso_Producto_A_Almacen`) VALUES
(9, 1, 1, 1, NULL, 'recibido', 'pendiente', '2025-06-01', 0, NULL, NULL),
(10, 1, 1, 1, NULL, 'autorizado para venta', 'cerrado', '2025-06-04', 0, NULL, '2025-06-05'),
(11, 2, 2, 2, NULL, 'en tránsito hacia sucursal', 'pendiente', '2025-06-03', 0, NULL, NULL),
(12, 2, 3, 2, NULL, 'recibido en sucursal', 'cerrado', '2025-06-04', 0, NULL, '2025-06-04'),
(13, 3, 3, 3, NULL, 'en bandeja', 'pendiente', '2025-06-05', 0, NULL, NULL),
(14, 3, 3, 3, NULL, 'enviado a cliente', 'cerrado', '2025-06-08', 0, NULL, '2025-06-09'),
(15, 4, 4, 4, NULL, 'devuelto por cliente', 'pendiente', '2025-06-10', 1, 'Roto', NULL),
(16, 4, 4, 4, NULL, 'producto reincorporado al inventario', 'cerrado', '2025-06-12', 0, 'Aceptado nuevamente', '2025-06-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cerrajeria`
--

CREATE TABLE `cerrajeria` (
  `ID_Producto` int(11) NOT NULL,
  `Pallet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cerrajeria`
--

INSERT INTO `cerrajeria` (`ID_Producto`, `Pallet`) VALUES
(1, 1),
(2, 3),
(3, 1),
(4, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(20) NOT NULL,
  `Apellido_Cliente` varchar(20) NOT NULL,
  `Telefono_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nombre_Cliente`, `Apellido_Cliente`, `Telefono_Cliente`) VALUES
(1, 'María', 'López', 113456789),
(2, 'Carlos', 'Martínez', 114567890),
(3, 'Lucía', 'Fernández', 115678901),
(4, 'Diego', 'Gómez', 116789012),
(5, 'Sofía', 'Pérez', 117890123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `ID_Compra` int(11) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `ID_Almacen` int(11) NOT NULL,
  `Número_Factura_Asociada` varchar(20) NOT NULL,
  `Fecha_Compra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`ID_Compra`, `ID_Proveedor`, `ID_Almacen`, `Número_Factura_Asociada`, `Fecha_Compra`) VALUES
(1, 1, 1, 'FAC-001', '2025-06-01'),
(2, 2, 2, 'FAC-002', '2025-06-02'),
(3, 3, 3, 'FAC-003', '2025-06-03'),
(4, 4, 4, 'FAC-004', '2025-06-04'),
(5, 5, 5, 'FAC-005', '2025-06-05'),
(6, 1, 1, 'FAC-006', '2025-06-06'),
(7, 3, 3, 'FAC-007', '2025-06-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo_almacenamiento`
--

CREATE TABLE `costo_almacenamiento` (
  `ID_Producto` int(11) NOT NULL,
  `Costo_Diario` int(11) NOT NULL,
  `Dias_Permanencia` int(11) NOT NULL,
  `Fecha_Vencimiento_Producto` date NOT NULL,
  `Costo_Final` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `costo_almacenamiento`
--

INSERT INTO `costo_almacenamiento` (`ID_Producto`, `Costo_Diario`, `Dias_Permanencia`, `Fecha_Vencimiento_Producto`, `Costo_Final`) VALUES
(1, 150, 20, '2026-06-01', 3000),
(2, 100, 30, '2027-01-01', 3000),
(3, 50, 15, '2026-12-15', 750),
(4, 75, 25, '2026-09-30', 1875),
(5, 200, 10, '2027-03-10', 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `ID_Compra` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Costo_Unitario` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`ID_Compra`, `ID_Producto`, `Costo_Unitario`, `Cantidad`) VALUES
(1, 1, 40000, 10),
(2, 2, 10000, 20),
(3, 3, 4500, 30),
(4, 4, 8000, 15),
(5, 5, 14000, 5),
(6, 1, 41000, 5),
(7, 3, 4600, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `ID_Almacen` int(11) NOT NULL,
  `Fecha_Solicitud_Pedido` date NOT NULL,
  `Fecha_Entrega_Pedido` date NOT NULL,
  `Estado_Pedido` varchar(20) NOT NULL,
  `Cantidad_Pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`ID_Pedido`, `ID_Producto`, `ID_Sucursal`, `ID_Almacen`, `Fecha_Solicitud_Pedido`, `Fecha_Entrega_Pedido`, `Estado_Pedido`, `Cantidad_Pedido`) VALUES
(1, 1, 1, 1, '2025-06-01', '2025-06-03', 'Entregado', 5),
(2, 2, 2, 2, '2025-06-02', '2025-06-04', 'Pendiente', 10),
(3, 3, 3, 3, '2025-06-03', '2025-06-05', 'Entregado', 20),
(4, 4, 4, 4, '2025-06-04', '2025-06-06', 'Cancelado', 8),
(5, 5, 5, 5, '2025-06-05', '2025-06-07', 'Entregado', 3),
(6, 1, 1, 1, '2025-06-06', '2025-06-08', 'Entregado', 4),
(7, 2, 2, 2, '2025-06-07', '2025-06-09', 'Entregado', 6),
(8, 3, 3, 3, '2025-06-08', '2025-06-10', 'Entregado', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electrica`
--

CREATE TABLE `electrica` (
  `ID_Producto` int(11) NOT NULL,
  `Longitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `electrica`
--

INSERT INTO `electrica` (`ID_Producto`, `Longitud`) VALUES
(1, 5),
(2, 3),
(3, 8),
(4, 10),
(5, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `ID_Factura` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Sucursal` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Número_Factura` varchar(20) NOT NULL,
  `Nombre_Producto` varchar(20) NOT NULL,
  `Precio_Producto` float NOT NULL,
  `Cantidad_Producto` int(11) NOT NULL,
  `Precio_Final_Producto` float NOT NULL,
  `Total_Factura` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`ID_Factura`, `ID_Producto`, `ID_Sucursal`, `ID_Cliente`, `Número_Factura`, `Nombre_Producto`, `Precio_Producto`, `Cantidad_Producto`, `Precio_Final_Producto`, `Total_Factura`) VALUES
(1, 1, 1, 1, 'F-1001', 'Taladro', 45000, 1, 45000, 45000),
(2, 2, 2, 2, 'F-1002', 'Martillo', 12000, 2, 24000, 24000),
(3, 3, 3, 3, 'F-1003', 'Tornillo', 5000, 10, 50000, 50000),
(4, 4, 4, 4, 'F-1004', 'Cable', 8500, 3, 25500, 25500),
(5, 5, 5, 5, 'F-1005', 'Pintura', 15000, 2, 30000, 30000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fijaciones`
--

CREATE TABLE `fijaciones` (
  `ID_Producto` int(11) NOT NULL,
  `Peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fijaciones`
--

INSERT INTO `fijaciones` (`ID_Producto`, `Peso`) VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 4),
(5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `ID_Producto` int(11) NOT NULL,
  `Unidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`ID_Producto`, `Unidad`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 1),
(5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_diario`
--

CREATE TABLE `inventario_diario` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Almacen` int(11) NOT NULL,
  `Fecha_Conteo` date NOT NULL,
  `Cantidad_Contada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario_diario`
--

INSERT INTO `inventario_diario` (`ID_Producto`, `ID_Almacen`, `Fecha_Conteo`, `Cantidad_Contada`) VALUES
(1, 1, '2025-06-10', 50),
(1, 1, '2025-06-11', 52),
(2, 2, '2025-06-10', 80),
(2, 2, '2025-06-11', 90),
(3, 3, '2025-06-10', 200),
(3, 3, '2025-06-11', 205),
(4, 4, '2025-06-10', 100),
(5, 5, '2025-06-10', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_construccion`
--

CREATE TABLE `material_construccion` (
  `ID_Producto` int(11) NOT NULL,
  `Pallet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `material_construccion`
--

INSERT INTO `material_construccion` (`ID_Producto`, `Pallet`) VALUES
(1, 2),
(2, 2),
(3, 4),
(4, 3),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_productos`
--

CREATE TABLE `movimientos_productos` (
  `ID_Movimiento` int(11) NOT NULL,
  `ID_Almacen` int(11) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Fecha_Movimiento_Producto` date NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Tipo_Movimiento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos_productos`
--

INSERT INTO `movimientos_productos` (`ID_Movimiento`, `ID_Almacen`, `ID_Proveedor`, `ID_Producto`, `Fecha_Movimiento_Producto`, `Cantidad`, `Tipo_Movimiento`) VALUES
(1, 1, 1, 1, '2025-06-01', 10, 'Ingreso'),
(2, 2, 2, 2, '2025-06-02', 20, 'Ingreso'),
(3, 3, 3, 3, '2025-06-03', 30, 'Ingreso'),
(4, 4, 4, 4, '2025-06-04', 15, 'Ingreso'),
(5, 5, 5, 5, '2025-06-05', 5, 'Ingreso'),
(6, 1, 1, 1, '2025-06-12', 5, 'Ingreso'),
(7, 2, 2, 2, '2025-06-13', 10, 'Ingreso'),
(8, 1, 1, 1, '2025-06-14', 4, 'Transferencia'),
(9, 3, 3, 3, '2025-06-15', 5, 'Transferencia'),
(10, 4, 4, 4, '2025-06-16', 1, 'Salida'),
(11, 5, 5, 5, '2025-06-16', 3, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pintura`
--

CREATE TABLE `pintura` (
  `ID_Producto` int(11) NOT NULL,
  `Volumen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pintura`
--

INSERT INTO `pintura` (`ID_Producto`, `Volumen`) VALUES
(1, 2),
(2, 1),
(3, 5),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plomeria`
--

CREATE TABLE `plomeria` (
  `ID_Producto` int(11) NOT NULL,
  `Unidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plomeria`
--

INSERT INTO `plomeria` (`ID_Producto`, `Unidad`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 2),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre_Producto` varchar(20) NOT NULL,
  `Descripcion_Producto` varchar(50) NOT NULL,
  `Vencimiento_Producto` date NOT NULL,
  `Cantidad_Producto` int(11) NOT NULL,
  `Precio_Producto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `Nombre_Producto`, `Descripcion_Producto`, `Vencimiento_Producto`, `Cantidad_Producto`, `Precio_Producto`) VALUES
(1, 'Taladro', 'Taladro inalámbrico industrial', '2026-06-01', 50, 45000),
(2, 'Martillo', 'Martillo de uña reforzado', '2027-01-01', 80, 12000),
(3, 'Tornillo', 'Caja de tornillos de acero (100u)', '2026-12-15', 200, 5000),
(4, 'Cable', 'Cable eléctrico 10m', '2026-09-30', 100, 8500),
(5, 'Pintura', 'Balde de pintura blanca 4L', '2027-03-10', 30, 15000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre_Proveedor` varchar(20) NOT NULL,
  `Codigo_Postal_Proveedor` varchar(10) NOT NULL,
  `Provincia_Proveedor` varchar(20) NOT NULL,
  `Ciudad_Proveedor` varchar(20) NOT NULL,
  `Numero_Calle_Proveedor` int(11) NOT NULL,
  `Nombre_Calle_Proveedor` varchar(20) NOT NULL,
  `Numero_Telefono_1_Proveedor` int(11) NOT NULL,
  `Numero_Telefono_2_Proveedor` int(11) DEFAULT NULL,
  `Email_1_Proveedor` varchar(50) NOT NULL,
  `Email_2_Proveedor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_Proveedor`, `Nombre_Proveedor`, `Codigo_Postal_Proveedor`, `Provincia_Proveedor`, `Ciudad_Proveedor`, `Numero_Calle_Proveedor`, `Nombre_Calle_Proveedor`, `Numero_Telefono_1_Proveedor`, `Numero_Telefono_2_Proveedor`, `Email_1_Proveedor`, `Email_2_Proveedor`) VALUES
(1, 'FerroMax', 'C1001ABC', 'CABA', 'Buenos Aires', 101, 'Mitre', 111111111, NULL, 'contacto@ferromax.com', NULL),
(2, 'ToolCorp', 'B2002BCD', 'Buenos Aires', 'La Plata', 202, 'Belgrano', 222222222, 222222223, 'ventas@toolcorp.com', 'soporte@toolcorp.com'),
(3, 'InsumosSur', 'C3003CDE', 'CABA', 'CABA', 303, 'San Martín', 333333333, NULL, 'info@insumossur.com', NULL),
(4, 'Construmax', 'B4004DEF', 'Buenos Aires', 'Mar del Plata', 404, 'Alberdi', 444444444, 444444445, 'pedidos@construmax.com', 'logistica@construmax.com'),
(5, 'PinturAR', 'C5005EFG', 'CABA', 'Buenos Aires', 505, 'Corrientes', 555555555, NULL, 'ventas@pinturar.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `ID_Almacen` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Estado_Producto` varchar(100) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`ID_Almacen`, `ID_Producto`, `Estado_Producto`, `Cantidad`) VALUES
(1, 1, 'Nuevo', 50),
(2, 2, 'Usado', 60),
(3, 3, 'Nuevo', 180),
(4, 4, 'Reacondicionado', 90),
(5, 5, 'Nuevo', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `ID_Sucursal` int(11) NOT NULL,
  `Nombre_Sucursal` varchar(20) NOT NULL,
  `Telefono_A_Sucursal` int(11) NOT NULL,
  `Telefono_B_Sucursal` int(11) DEFAULT NULL,
  `Email_A_Sucursal` varchar(20) NOT NULL,
  `Email_B_Sucursal` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`ID_Sucursal`, `Nombre_Sucursal`, `Telefono_A_Sucursal`, `Telefono_B_Sucursal`, `Email_A_Sucursal`, `Email_B_Sucursal`) VALUES
(1, 'Sucursal Norte', 555123456, 555123457, 'sucur_norte@ferre.co', 'norte2@ferre.com'),
(2, 'Sucursal Sur', 555123458, NULL, 'sucur_sur@ferre.com', NULL),
(3, 'Sucursal Centro', 555123459, 555123460, 'sucur_centro@ferre.c', 'centro2@ferre.com'),
(4, 'Sucursal Este', 555123461, NULL, 'sucur_este@ferre.com', NULL),
(5, 'Sucursal Oeste', 555123462, 555123463, 'sucur_oeste@ferre.co', 'oeste2@ferre.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`ID_Almacen`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`);

--
-- Indices de la tabla `calidad`
--
ALTER TABLE `calidad`
  ADD PRIMARY KEY (`ID_Inspección`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Almacen` (`ID_Almacen`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `cerrajeria`
--
ALTER TABLE `cerrajeria`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`ID_Compra`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Almacen` (`ID_Almacen`);

--
-- Indices de la tabla `costo_almacenamiento`
--
ALTER TABLE `costo_almacenamiento`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`ID_Compra`,`ID_Producto`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_Almacen` (`ID_Almacen`);

--
-- Indices de la tabla `electrica`
--
ALTER TABLE `electrica`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `fijaciones`
--
ALTER TABLE `fijaciones`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `inventario_diario`
--
ALTER TABLE `inventario_diario`
  ADD PRIMARY KEY (`ID_Producto`,`ID_Almacen`,`Fecha_Conteo`),
  ADD KEY `ID_Almacen` (`ID_Almacen`);

--
-- Indices de la tabla `material_construccion`
--
ALTER TABLE `material_construccion`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `movimientos_productos`
--
ALTER TABLE `movimientos_productos`
  ADD PRIMARY KEY (`ID_Movimiento`),
  ADD KEY `ID_Almacen` (`ID_Almacen`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `pintura`
--
ALTER TABLE `pintura`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `plomeria`
--
ALTER TABLE `plomeria`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID_Almacen`,`ID_Producto`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `ID_Almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `calidad`
--
ALTER TABLE `calidad`
  MODIFY `ID_Inspección` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `ID_Compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimientos_productos`
--
ALTER TABLE `movimientos_productos`
  MODIFY `ID_Movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `ID_Sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`);

--
-- Filtros para la tabla `calidad`
--
ALTER TABLE `calidad`
  ADD CONSTRAINT `calidad_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `calidad_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacenes` (`ID_Almacen`),
  ADD CONSTRAINT `calidad_ibfk_3` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`);

--
-- Filtros para la tabla `cerrajeria`
--
ALTER TABLE `cerrajeria`
  ADD CONSTRAINT `cerrajeria_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`),
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacenes` (`ID_Almacen`);

--
-- Filtros para la tabla `costo_almacenamiento`
--
ALTER TABLE `costo_almacenamiento`
  ADD CONSTRAINT `costo_almacenamiento_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`ID_Compra`) REFERENCES `compras` (`ID_Compra`),
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`),
  ADD CONSTRAINT `detalle_pedidos_ibfk_3` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacenes` (`ID_Almacen`);

--
-- Filtros para la tabla `electrica`
--
ALTER TABLE `electrica`
  ADD CONSTRAINT `electrica_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`),
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);

--
-- Filtros para la tabla `fijaciones`
--
ALTER TABLE `fijaciones`
  ADD CONSTRAINT `fijaciones_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD CONSTRAINT `herramientas_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `inventario_diario`
--
ALTER TABLE `inventario_diario`
  ADD CONSTRAINT `inventario_diario_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `inventario_diario_ibfk_2` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacenes` (`ID_Almacen`);

--
-- Filtros para la tabla `material_construccion`
--
ALTER TABLE `material_construccion`
  ADD CONSTRAINT `material_construccion_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `movimientos_productos`
--
ALTER TABLE `movimientos_productos`
  ADD CONSTRAINT `movimientos_productos_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacenes` (`ID_Almacen`),
  ADD CONSTRAINT `movimientos_productos_ibfk_2` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`),
  ADD CONSTRAINT `movimientos_productos_ibfk_3` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `pintura`
--
ALTER TABLE `pintura`
  ADD CONSTRAINT `pintura_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `plomeria`
--
ALTER TABLE `plomeria`
  ADD CONSTRAINT `plomeria_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`ID_Almacen`) REFERENCES `almacenes` (`ID_Almacen`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
