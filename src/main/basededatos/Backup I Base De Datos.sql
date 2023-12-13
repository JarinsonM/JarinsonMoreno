-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_com
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `idcargo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Admin',1),(2,'Cliente',1),(3,'Usuario',1);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` int NOT NULL,
  `idsexo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `idcliente_sexo_idx` (`idsexo`),
  CONSTRAINT `idcliente_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (123,1,'Jhon','43257','jhon@gmail.com','Jazmin',1,'2003-10-05','Cedula'),(127,1,'jarinson','563579','jarinson@gmail.com','palenque',1,'2002-12-12','Cedula'),(322,1,'keiler','1122121','keiler@gmail.com','minercol',1,'2023-10-04','Tarjeta de Identidad'),(999,2,'joel','537829','joel@gmail.com','niño jesus',1,'2023-10-04','Tarjeta de Identidad'),(1234,1,'pedro','43527','pedro@gmail.com','las brisas',1,'2000-11-09','cedula'),(2334,3,'Ana','743648','Ana@gmail.com','las mercedes',1,'2023-10-10','Tarjeta de Identidad'),(12324,1,'adrian','321425366','adrian@gmail.com','palenque',1,'2001-12-11','Cedula');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura_compra`
--

DROP TABLE IF EXISTS `detalle_factura_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura_compra` (
  `iddetalle_factura_compra` int NOT NULL AUTO_INCREMENT,
  `id_factcompra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_comprada` int NOT NULL,
  `precio_unitario_compra` float NOT NULL,
  `precio_total_compra` float NOT NULL,
  PRIMARY KEY (`iddetalle_factura_compra`),
  KEY `id_factcompra_idx` (`id_factcompra`),
  KEY `id_producto_idx` (`id_producto`),
  CONSTRAINT `id_factcompra` FOREIGN KEY (`id_factcompra`) REFERENCES `factura_compra` (`idfactura_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura_compra`
--

LOCK TABLES `detalle_factura_compra` WRITE;
/*!40000 ALTER TABLE `detalle_factura_compra` DISABLE KEYS */;
INSERT INTO `detalle_factura_compra` VALUES (21,15,1,321,32100,180002),(37,19,3,2,10000,200000),(41,12,2,1,15000,180000),(52,18,7,4,20000,500021),(92,16,6,800,35000,300214);
/*!40000 ALTER TABLE `detalle_factura_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_com_prod`
--

DROP TABLE IF EXISTS `fact_com_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_com_prod` (
  `idfact_com_prod` int NOT NULL AUTO_INCREMENT,
  `idfact_com` int NOT NULL,
  `idpro` int NOT NULL,
  `cantidad_com` int NOT NULL,
  `pre_uni` int NOT NULL,
  `pre_total` int NOT NULL,
  PRIMARY KEY (`idfact_com_prod`),
  KEY `idproducto_idx` (`idpro`),
  KEY `idfact_comp_idx` (`idfact_com`),
  CONSTRAINT `idfact_comp` FOREIGN KEY (`idfact_com`) REFERENCES `fact_comp` (`idfact_comp`),
  CONSTRAINT `idpro` FOREIGN KEY (`idpro`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_com_prod`
--

LOCK TABLES `fact_com_prod` WRITE;
/*!40000 ALTER TABLE `fact_com_prod` DISABLE KEYS */;
INSERT INTO `fact_com_prod` VALUES (24,16,1,122,122,14884),(25,13,2,8989,7878,70815342),(26,13,1,1,1,1),(27,13,3,800,111,88800),(28,18,3,5,10000,50000),(29,18,3,5,10000,50000),(30,18,4,5,10000,50000),(31,13,1,2,1000,2000),(32,17,1,2,1000,2000),(33,19,4,9999,9999,99980001),(36,13,2,3,29484,88452),(37,29,2,3,4253,12759),(38,28,2,3,3445,10335),(39,13,5,1,2,2),(40,13,2,1,2,2);
/*!40000 ALTER TABLE `fact_com_prod` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Total_Compra` BEFORE INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
set new.pre_total = new.cantidad_com * new.pre_uni;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Automatizacion_Cantidad_Precio` AFTER INSERT ON `fact_com_prod` FOR EACH ROW BEGIN
update producto inner join fact_com_prod on fact_com_prod.idpro = producto.idproducto set cantidad = cantidad + new.cantidad_com, precio = new.pre_uni+ (new.pre_uni*0.20) where idpro = producto.idproducto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fact_comp`
--

DROP TABLE IF EXISTS `fact_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_comp` (
  `idfact_comp` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `idusu` int NOT NULL,
  `fecha` date NOT NULL,
  `total_comp` int NOT NULL,
  `descuento` float DEFAULT NULL,
  `tipodepago` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  PRIMARY KEY (`idfact_comp`),
  KEY `idProveedor_idx` (`idProveedor`),
  KEY `idusuario_idx` (`idusu`),
  CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusu` FOREIGN KEY (`idusu`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_comp`
--

LOCK TABLES `fact_comp` WRITE;
/*!40000 ALTER TABLE `fact_comp` DISABLE KEYS */;
INSERT INTO `fact_comp` VALUES (13,1,2,'2005-12-12',1,1,'Efectivo',1,0),(14,1,3,'2023-11-19',1,1,'Efectivo',1,0),(15,1,3,'2023-11-19',1,1,'Seleccionar:',1,0),(16,1,3,'2023-11-19',1,1,'Tarjeta de Credito',1,0),(17,1,3,'2023-11-19',1,1,'Tarjeta de Credito',0,0),(18,1,5,'2023-11-22',0,0,'Tarjeta de Credito',1,0),(19,1,4,'2023-11-22',0,0,'Tarjeta de Credito',1,0),(20,1,5,'2023-11-22',0,0.19,'Tarjeta de Credito',1,0),(21,1,5,'2023-11-22',0,0.19,'Efectivo',1,0),(22,1,4,'2023-11-24',0,0.19,'Tarjeta de Credito',1,0),(23,1,5,'2023-11-24',0,0.19,'Efectivo',0,0),(24,3,5,'2023-11-24',0,0.19,'Tarjeta de Credito',1,0),(25,3,2,'2023-11-24',0,0.19,'Efectivo',1,0),(26,3,3,'2023-11-30',0,0.19,'Tarjeta de Credito',1,2),(28,3,1,'2023-11-30',0,0.19,'111',1,11),(29,2,1,'2023-12-07',0,0.19,'Tarjeta de Credito',1,1234);
/*!40000 ALTER TABLE `fact_comp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipopago` varchar(45) NOT NULL,
  `impuesto` float NOT NULL,
  `totalfactura` float NOT NULL,
  `cedula` int NOT NULL,
  `idusuario` int NOT NULL,
  `condicion` tinyint NOT NULL,
  `numerodecomprobante` int NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `cedula_idx` (`cedula`),
  KEY `idusuario_idx` (`idusuario`),
  CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `cliente` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2001-10-12','Efectivo',0.19,1,123,1,1,0),(6,'2023-11-29','tarjeta de credito',0.19,1,123,1,1,0);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_compra`
--

DROP TABLE IF EXISTS `factura_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_compra` (
  `idfactura_compra` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_usuario` int NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `descuento` float NOT NULL,
  `total_compra` float NOT NULL,
  `fecha_compra` date NOT NULL,
  PRIMARY KEY (`idfactura_compra`),
  KEY `id_proveedor_idx` (`id_proveedor`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_compra`
--

LOCK TABLES `factura_compra` WRITE;
/*!40000 ALTER TABLE `factura_compra` DISABLE KEYS */;
INSERT INTO `factura_compra` VALUES (12,1,3,'tarjeta de gredito',0.19,1,'2020-01-12'),(13,1,2,'efectivo',0.19,1,'2021-02-20'),(21,1,1,'eectivo',0.19,1,'2023-03-21');
/*!40000 ALTER TABLE `factura_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mostrar_cargo`
--

DROP TABLE IF EXISTS `mostrar_cargo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cargo` AS SELECT 
 1 AS `idcargo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_cliente`
--

DROP TABLE IF EXISTS `mostrar_cliente`;
/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_cliente` AS SELECT 
 1 AS `Cedula`,
 1 AS `Genero`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_detalle_factura`
--

DROP TABLE IF EXISTS `mostrar_detalle_factura`;
/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_detalle_factura` AS SELECT 
 1 AS `IdentificadorFacturaCompra`,
 1 AS `Producto`,
 1 AS `CantidadComprada`,
 1 AS `PrecioUnitario`,
 1 AS `PrecioTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_detalle_factura_compra`
--

DROP TABLE IF EXISTS `mostrar_detalle_factura_compra`;
/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_detalle_factura_compra` AS SELECT 
 1 AS `Nº_Detalle_Factura_Compra`,
 1 AS `Nº_Factura_Compra`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `Precio_Unitario`,
 1 AS `Precio_Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_factura_compra`
--

DROP TABLE IF EXISTS `mostrar_factura_compra`;
/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_factura_compra` AS SELECT 
 1 AS `Identificador`,
 1 AS `IdProveedor`,
 1 AS `IdUsuario`,
 1 AS `Fecha`,
 1 AS `TotalCompra`,
 1 AS `Descuento`,
 1 AS `TipoDePago`,
 1 AS `NumeroDeComprobante`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_producto`
--

DROP TABLE IF EXISTS `mostrar_producto`;
/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_producto` AS SELECT 
 1 AS `Identificador`,
 1 AS `NombreDelProducto`,
 1 AS `DescripcionDelProducto`,
 1 AS `Existencias`,
 1 AS `ImagenDelProducto`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_proveedor`
--

DROP TABLE IF EXISTS `mostrar_proveedor`;
/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_proveedor` AS SELECT 
 1 AS `Identificacion`,
 1 AS `Genero`,
 1 AS `TipoDeDocumento`,
 1 AS `Nombre`,
 1 AS `Correo`,
 1 AS `Telefono`,
 1 AS `Direccion`,
 1 AS `TipoDePersona`,
 1 AS `FechaDeNacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_sexo`
--

DROP TABLE IF EXISTS `mostrar_sexo`;
/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_sexo` AS SELECT 
 1 AS `idsexo`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_usuario`
--

DROP TABLE IF EXISTS `mostrar_usuario`;
/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_usuario` AS SELECT 
 1 AS `Identificador`,
 1 AS `Genero`,
 1 AS `Cargo`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `Direccion`,
 1 AS `FechaDeNacimiento`,
 1 AS `TipoDeDocumento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mostrar_venta`
--

DROP TABLE IF EXISTS `mostrar_venta`;
/*!50001 DROP VIEW IF EXISTS `mostrar_venta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mostrar_venta` AS SELECT 
 1 AS `Identificador`,
 1 AS `Fecha`,
 1 AS `TipoDePago`,
 1 AS `Impuesto`,
 1 AS `TotalFactura`,
 1 AS `Cedula`,
 1 AS `IDUsuario`,
 1 AS `NumeroDeComprobante`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` longblob,
  `precio` float NOT NULL,
  `condicion` tinyint NOT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Mouse','Funciona',20937,NULL,2.4,0,''),(2,'TV','nose',20901,_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B�7\020200721<\0124448+00008BIM%\0\0\0\0\0lD�.w�@q&���\'ǐ8BIM:\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\�\0\0\0\0\0\0\0\0\0Grn doub@o\�\0\0\0\0\0\0\0\0\0Bl  doub@o\�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\�\0\0\0\0\0\0�\0\0\0�\0\0\�\0,\0\0\0!�\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\�8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\0(\�\�\0��\�\0(\�\�\0��\�\0(\�\�\0\0�N\�\0,\�\�\0��\�\0(v\'\0��\�\0(v\'\0\0��;\0*��\0��;\0*��\0��;\0*��\0\0�\�N\09��\0�\�N\09��\0�\�N\09��\0\0�؝\09��\0�؝\09��\0�؝\09��\0\0��;\0:\0\0\0��;\0:\0\0\0��;\0:\0\0\0\0�\0\0\0;�;\0�\0\0\0;�;\0�\0\0\0;�;\0\0�;\0=bv\0�;\0=bv\0�;\0=bv\0\0��\0>��\0��\0>��\0��\0>��\0\0�\�N\0?��\0�\�N\0?��\0�\�N\0?��\0\0�؝\0A\�N\0�؝\0A\�N\0�؝\0A\�N\0\0�؝\0F\'b\0�؝\0F\'b\0�؝\0F\'b\0\0\�N\�\0I�\0\�N\�\0I�\0\�N\�\0I�\0\0ű;\0O�;\0ű;\0O�;\0ű;\0O�;\0\0\��\0W�\�\0\��\0W�\�\0\��\0W�\�\0\0\�;\0d��\0\�;\0d��\0\�;\0d��\0\0\�bv\0t��\0\�bv\0t��\0\�bv\0t��\0\0\�N\�\0�bv\0\�N\�\0�bv\0\�N\�\0�bv\0\0\�\�N\0�\'b\0\�\�N\0�\'b\0\�\�N\0�\'b\0\0\�\�N\0�;\0\�\�N\0�;\0\�\�N\0�;\0\0�D\�\0�I\�\0��\�\0�;\0��\�\0�;\0\0�bv\0�\'b\0�bv\0�\'b\0�bv\0�\'b\0\0�؝\0�\�N\0���\0�v\'\0���\0�v\'\0\0�؝\0\�N\�\0��\�\0ǉ\�\0��\�\0ǉ\�\0\0��;\0\�\�\�\0~�\�\0Ɲ�\0~�\�\0Ɲ�\0\0h\�N\0\�\�\�\0b;\0�;\0b;\0�;\0\0Xbv\0���\0T\0\0\0���\0O��\0���\0\0V؝\0y��\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0X؝\0u�\0X؝\0u�\0X؝\0u�\0\0X\0\0\0s�\�\0X\0\0\0s�\�\0X\0\0\0s�\�\0\0Xbv\0q��\0Xbv\0q��\0Xbv\0q��\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h�\�\0I��\0v\0\0\0>\�N\0v\0\0\0>\�N\0\0x�\0>\0\0\0x�\0>\0\0\0x�\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0�\�%\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\01\0\0\0\0\0\0\0�2\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0ipp\0�i\0\0\0\0\0\0(\0\0�\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(��\0\0\0\0\0\0��\0\0\0\0\0\0�\"\0\0\0\0\0\0\0�\'\0\0\0\0�\0\0�\0\0\0\0\00210�\0\0\0\0\0\0�\0\0\0\0\0\02�\0\0\0\0\0�\0\0\0\0\0\0F�\0\n\0\0\0\0\0N�\0\0\0\0\0\0V�\0\n\0\0\0\0\0^�\0\n\0\0\0\0\0f�\0\0\0\0\0\0n�\0\0\0\0\0\0\0�\0\0\0\0\0�\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0v��\0\0\0\0\0\0~��\0\0\0\0\0\0���\0\0\0\0\0\0��\0\0\0\0\00100�\0\0\0\0\0\0\0�\0\0\0\0\0\0 �\0\0\0\0\0\0 �\0\0\0\0\0\0��\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0��\0\0\0\0\0\Z\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0��\0;�\�\0\0\0\0�\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0�\�\0\0\'\0\0\0�\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0�\0\0\0d\0\0$\0\0\�354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\��http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�\0C\0�\�\0C��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa�Br����\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1A�Qaq�\"2����\��B\�b�\�\0\0\0?\0\�ƀ4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@:�\�ۛ\�\�\�\��\��Ï�%xH�ڼ�\�#\�\�J\n��0Q*�/,.�S\0�,[�W�\�\�t3n\�N\�刢\��\0�Rw\�\�Ydb��i�kN+5\��.u�K�A$zq��$\�s�ͤ����=THcu�p\�/\�\n����75z�~L\'�(���\�\�Q�\\��eZ�\'\0\r\�JV#�#\�zA:~�\0�\��%\r_�	d��\�\�c��Ws\�=2\�64��Q\�1�\�@�\�R]TUn�G��d\�MtWEB*p:j\"r\0\��\0�\�u\�B���E�m\�\�/�\�GQ���%`�A\'r��a=F)�r�\�\r:\�\�U2��� ����\��\0\�� ��\�\�n!\�د:V�Z���.\��N@I(A�\���1T)D�\�\�@�a/�d\�N�%4�C��$4�\r\0hs8nm��#�3�E�\�tjj�I[� �Ւ(\�\�G$u9&n\�4Ee�&\0jKVJM茕\�\�X�I��Uv[U&;�4E\�]\�L�\�F\�\�7�!P�/겭&)����o~\�@J!\�N\0+\�zd���ϟ379�0\�_��ʛ��\�d��rb߽\�r\�[\�bZ��\�|ʹ\�\'(���\�9D�4\�,EA�Ȣf��\n߅�ֺQ=��,$-ƹ\'�)o\�ƭ\�=)��O��\�m��jѬ��n��\�ceY\0*���?;�\�-\�nổOO-�(w/��P���p]Jf�\��+�3lm�\�y^g�i\�/�J\��\�cwN�_g �9��\�*�wmT,��2m��k2�m��-�\�\�C<\\$\�A�\�\�g\ZW\Z:,%\��\�G�N(7;\�TH0�e\�Xܨ�\�vRj�Ԅ�AyJ\�S�|�q�k�\�\�c�\�51IU�²E0O@�LoLJ\0 \" \Z�\�k8�(k{��n�%ę5�Ka��Z(HF�g�����N\�J�Ą\�I��y\�	Nt\�Y2��)�s\�\�O5\�*o~sB�4\�<�\�΀�i\��\�5���\�IIA#-fhf\�ei`TRYE�e�#U��@E�\�m{@����@\Z\0\�1\�\'��0\�\�Ea�Lo[��1Y|�Rz�Uk\�\�]-i$��ʮG\�ǂ��Q4�>�\�Ybbt*_-ߑ�\�\�\�k>n��\�)n�-n�p��DE*�ҭ\�Y�s\nq\�\�4�B5�\0��2�ݾD�=�̦\�\�\��\�\�VU\�\�|�ow�\�c�ig�I���\�Ж\"\�\�p,��@K��k��L዗,n�`2�82e(��\Z\��Qy��o[;\�V1\��s�f<���m�m\�\�\� \�\\��\�\�b$S=\�\"f\\h��3\�D��FB:	*���9\�)ٳ-z�m���.~y�:�b��m.�r\�\�&B\�u0�J�\�lX��\�q$\�뒝H�nV��+�P.\�\"/�d�\�鑓h�m�~\�guٕIA�Y�qV;�㷲�\��,���򈴯B���.\���:�U�e)\nR�ˤǵ4\�1l����U\Z�%���ݥm\�ҙYOt\�-�}3ۭ�\��`XI��[X�\��SP9*\��\0�XJF�\�\�M�rVҵ��,\����4mj�\�\�Eʶu\�&F����+ٵ�/)\"\�)$���1`G\�^$\�4�7ar$�\0$Aѵ��=\�*N\�\�\�\�`O�V8�!�D\��K��f�\�Q�]>\�\�٣,����\�%7\�99U޻+�Q3\�%\�\�.�L\�\�)d�\��ߨ�\�\�roӿ6-�9I��\�nӶ;\�\�e��J�\�l�HJ^6\�o�EAN�\�	��u�e\�1S3�G `)-	�\�N\�!ŧ\�kB.E�\�l|�r\�q&ɤ���ٽn���ϒ�S0���?v�����S�7M�N�\�ď�\����X[����˄DZ�w��\�Ej�1�vr{�@^Er�d`ʊ�\�9\�Ax�F6�{�(e�\�e\�vw\���ܝ~�,�\�\��褐z1�p1i�W�d	���n\0�F\��(eUS��&\�vٲIhy�\�\\\�\�wֻ[\��j��؇1J�\�\� \�H8\�K\�b�����C�C\�+\�\\��I��_\�%�X\��m�j�È�\�\�)J�G(Tb%��RIND��F�h�TT���\�5Pº\��ꔽ�O\\Ģ\�Cr�\���\�f�n\�1\�\n\�k�e8DA^\re��.c?�n\�h�YF-��\��R$�&\����Qk|��\�[�\�qR�	�\�ϕXK\�\'$�\�g\�r\r�5\�6I��Ĭ�\�BW�J]\�\�e\�!�8�v�-)v4\�Q��]\�l�E\�l���qq�{��{]\�vn���JW�\�^=3F\�@x\\��\0\"\Z��H�y;�_��IӇ\n��\�DC�DD\�0�)@90�\0\0<�\Z\�\�K%z��\�R�\�\�\ZZ\�f�\�g~�;��̶\�\�-�=M\�9�*͉\�$�ա��z�l���\�V2�P;:\�jN�\�D^�����K�9߱t�WY\�\�\��H^��\r\�\�c#�w\'s��G䛥��E��U\�\�1�R�Y�k\r�1�r��Lb R�gH%�2�ʛ\�@�����|uM��h��D����\\���\�C�M\�\�\�\�\�]9* �@t\�O\�mʮ\��Ȇ�ﯯ\�\�7L\�]\�ll9X\�w��ƌ e�L&1&�ϟ\�%@\��\�|\�/ߵR�\�^��\�o�r{C\�\�7\'[���g��;��\�S\�H�)���\��MYG\�$u�h/�\�Ң_]F�\�$\�J�\�`��L[։J\�ZY\�+%e����\�t\�~�=�d\�䈾��xI�&�\�\�\�V\�qE0�^�\�3o߄Z�A\�.�\�\�&\�\�\�f����\\5R�[��Z�:�\n��C�\�MW���2L��\0��=3|�iC���4\�:�&֋/\���o��˅�&R���\���Ɵ����klV�%\�a�>\� �� VˮqVI\�`ٲ�ETCH\�N���d&�_9\�{[\�y%n\�5��\\U\n\�:0Y\�K�\ns�\�\Z\�w\'*\"B�ƿ\"\rZ\�ق\�Ag+�\�\�\ZY�l���d��x��1d܍Y4H��\�\"�I��?\�\��\"<��D\�\"#έv�\�y�5^&dG��|��\�\�<~�\0�\�\�OF7��1�nDD�o����j�s7{�U\�W�,\��w!��\�?\'x\�\�L�����]ʣM\�h�;e\��L\\{�)�F�1r\�6c����Z^F���\�а\�\�]\�z�o��\"\�K�u�M�X\r\�Z5d\�S�[��ZfY*\�1l渙���B����70\�D�E��[\�K�׺\�\�]\�9ػ�e�I;:\�:�\�1�V\�Q��\�H�u\�\�#!.TS)J�^ͬ�\��ڸA\0\0M�\n9?$I:\�ۙU6e�\�<\0�Փq}E>\����\�H_�*z%0�\0%UL\�v�\�\��ήJ�JOLבy\�N\�\�=*pJGS\���\�\�Њr&\�o/�~\0\r\�x\�8\�y�`�����lsx5\�ɕVқf\�蘆\�\�O\�] n>\�Uۤ`��P\�U�p��%j�n�\�V݌;�=�\�x\Z\�$g\�ү��ՋQ\"�,�����H�@\�UC�\"�9J<��u\�\��\�\\��nQ:<sI��\�0\�֯2�qU��\���ƚ\�\�!\�6�\�j\'x�D\�\�=�����\�\��+Ћn֞&���%���\�%V��P.4c\�\�J�\�<��Y\�\�\��\�Z1\�e��4R]\�EDǷ;��.Tn��\�˪\�-F#,��\�\�\�O\'	]��rbB`+\�\�\�UaEڎ��,�P*��%1Ψ�0:\�(������wC-ߑ&\�8y�\�<���<��\0���o<�\"Y^\�~�\0>x|}�����w�I=+[��\�d[3d\�ju��t�.�1\\81�\�4?���jq��x�\�\Z\�B7�&8jMW\�\�\�в��[����V!3<w�\�\�ZM~�Y7��\�I-ڽ�Wq|\�#�\�opJ���EQ�Q�&8�@\�28X�\�P�Sz�����N���iFQ�V[�\�\�{;?\�t6�Q��.���4W����r��)8V��\"\�`\"�t�\�9Q�A�&\"a9\�G)K\\\�,�;�3PPNQ\�gm��ew�J\�G6	��8{�`���	H\�%L\�Wi\�U�h�iο�β.\�11ݘ����\�\"\'Pyn3\'L����T�QV\�\��\�<:\��uu��ކ\�:\�K&\Z\�O�\�形�l�j�X�f�5���n6<�\�rrG�Z!�@7�S��5\�P��\�k[\�\�\��PI\��W�c�;�C�Ub�\��\�&P!y�\�iBM\�D�m#�.\�\�\�\�i�\�\�#[��),G�����!Y�u`�h\�S��@�%�a\'%w)$\n���\�aҕe�g\'t\�D\�\�\�\�+k�/\�0.\\�-��Rd\�F���\�\�\�+xɕY4\�ʴ\��R��3r�k%�\�Dj\�X�LX7+�K\�L�;��\�\�^�\�\�R�BΛ�\n|YW�F:>�*$�AT\�,d\�\�yk�X�<�zP\0p\�J�\\3f\�2UE,�\�.\�+TK\�!����\�!\�\��\0�X��+�J �㏁��\�\�\�W�\��Y��)&��\�V���ѩz�*}4SUuD?�\'\�c\�\�\�\Z�j	Y\�,\�~\�\�[V*LZ�qm\�\�٬�䓃&�)$+=�p��� \��c����|�5\�\�M\�m�\�5�ӛ�M\�&.\�\\\�[Q�u�b\�kp0m�E�uaJ�1��IU\\_\�\ZI\�\'PL��x\��d�M\�\���R[�y�\"Y\�\�>v�}u/�<a*�\�\�\�H�?Q�-�v\�x�\�t��@H4ZR\��\�%Z1@��VX��5X\�$|C��OSm�]\��7�\�֎y\�Q\\�\��3R�\�\�r��\�\�I��s�ym�\�;vqE\"�\�ۀ,s^N\0TY Ͳd�R��58��W<^oĈ���b\Z\'n\�}Z:\�\�\�Q�S�\�����,HC92\�jW\�;\�!.�7��dY�6n�10	�yl��9\Z\��UJ�̤�Y�:�\�Ʊ��aɴllc6���̑I�6Y �flZ7D�D\"\�$�L�\0)H�\0\0\0k���\�8�g<ms\�YV�\�\�2\�Ͷ� �����HS]2<`\�\'1\�n\�[�j�.�8E7\r�Id\�r\�I�j\�\0�\��/ۊ\�%��t>�\�8R�\�\�\�ܨ�n����<\�.U�\�C6\�\�(\�\�G3+\"���A�\�\�uu^���sĜ�l\�V-\�\�hЎ�:�\�\� \�\�\�\n�9���v��\�x;�TT\�;8��\"(��7?4\�Ut��ן\"t\�\�9����3(�\��-y\��9zѰ�U`<�\�T$ռ�ی��Uy��\�\�u4�)�0�0r�z�<�D\��\�R�*\��\�\�9]m^�a6�\�M)����\�(������O�(�T\��\07��\�EL�\��\�\�,(��@5u%\nC{�CX�\�Ux\�f����|�E\�(���M4W������\�\�\�И\�->�\��\�wIf�\�T\�@\�F�;�\�1v��<T\�U~U־\�~]�+��	\�ҐE�F\�Ie�ޒ�\�\�\�\�c)�\�-?�K\��(��T;ڞeγ�Jx\�[\"�i\�W[W%+\n!pO\�gA$��/\�90\�\�FGJ�	8t\�\�\�\�\�v\��\�cI\�1\�\\��\�^\�j�{�\�T]\�Xm��-dG\��x\�v�\���w@\�(Xq\�yDѮтX�7D�9 e\�R5\"�zd�\�-:��\�,I;�u>\�\�\��8\�su�цHۥ\�\�\�m$@���Cȳ`\�J�1��\�bm2�}X�&�\"\"\0�r\�Z]�s���\�l��M�10�\\�\"\�\�X�\Z\�\�S������lrըF�͔��\���\�\�\�&Ғ\�P-H\r\0\0���>|����\0�\0MB���u6�쌖Y�C\"\��\�Չ��өU+s\�p�\�K5��#Nz����^�|�.�ȓ\�.)��(\�۪�m�2��o�\�4\�b\�\�Vm\�\�u�:YزuuRcd	&b��S0\�B\�\�\�(tT\n\�\�)�@\��\�(Y* �n>�\�H��X�:\�G�k�ʚe?\�Ls��\0��`Ҿ@��UzϘDG\���G�Cr�\��qǪp��\0�+\�)}*\�f\�\�\�\�@y)�q\�\�@\0D;T\�\���\��A/v����T�\�8\�\"\�\�[_��\�5ko���L\�;�\�4�;�5��Xه�M��-\�ʠ��US/&\n\�.Qq\�>\�M=h\�D��ߺZmf6BE4\�\rX�Ad\\\���,L\�\�JHJJ9\�d\�c+%+$\�E�\\TJ\�Sa�`�p��d���\�!cN��o���-Y��\�mz?Y^��\Z1�� 9��R�A]8�S!  Q��W�E�\�cb\Z0l�Y6\�x�Tq\"��k.��\��N7�u_��\0\�oݝ?ÅJ=�\�Ԭ��m�}�l\�o����8�g�<�],s��u\�3x�\n[[c[�3\�VX�������|���NM��|ı�Q\�\�H��b�Ҧ�g.&\�i]���Դ��\�Ǔq��=\�\�\�~��\Z\�\��\��4�\r\0h@\Z\0\��}[�}B�\�l5��[\�4����\�\�\�9�IѲF-ȱ1�q1W�5�8LF\�hFMK!\�l�=t���Y��CV�\�\n�t\�ꕷ���\�6%\�\��/*l{�\�wq\�E\��\�rW{�\�\�p�9Et��\�d�Tri7эP�+d\����}�-���]\����7�<�jN\�z�2\�\�qN\�i��TR2�Ւ|\��瘱s��M�u\�yKM�\�c�E˅_˶n�3*\�ɚL�5j�h��Ê�tF2���������\r\0h@\Z\0\��4�\r\0p��!�?�\�\�\�\�@\Z\0\���\�',2.4,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg'),(3,'PC','ei',11737,NULL,2.4,1,''),(4,'Laptop','gtvuc',10991,NULL,2.4,1,''),(5,'Celular','ggfy',32,NULL,2.4,1,''),(6,'memoria','15g',40,NULL,247.534,0,''),(7,'teclado','hfjdhd',0,_binary 'ÃÂÃÂ¿ÃÂÃÂÃÂÃÂ¿ÃÂÃÂ \0JFIF\0\0`\0`\0\0ÃÂÃÂ¿ÃÂÃÂ¾\0<CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 100\nÃÂÃÂ¿ÃÂÃÂ\0C\0ÃÂÃÂ¿ÃÂÃÂ\0CÃÂÃÂ¿ÃÂÃÂ\0\0h\0h\"\0ÃÂÃÂ¿ÃÂÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÃÂÃÂ¿ÃÂÃÂ\0=\0\0\0\0\0\0\0!1	QÃÂÃÂ\n\"AaqÃÂÃÂ2ÃÂÃÂ¡ÃÂÃÂ±ÃÂÃÂÃÂÃÂÃÂÃÂ°ÃÂÃÂ¡#RrBÃÂÃÂÃÂÃÂ¢ÃÂÃÂ£ÃÂÃÂ±ÃÂÃÂ¿ÃÂÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÃÂÃÂ¿ÃÂÃÂ\0 \0\0\0\0\0\0\0\0\0\0\0\01QÃÂÃÂ!qÃÂÃÂÃÂÃÂÃÂÃÂ°ÃÂÃÂ±ÃÂÃÂ¿ÃÂÃÂ\0\0\0?\0ÃÂÃÂÃÂÃÂ)ÃÂÃÂ&ÃÂÃÂÃÂÃÂÃÂÃÂrÃÂÃÂºÃÂÃÂ¼ÃÂÃÂ¿MKÃÂÃÂªÃÂÃÂ¥ÃÂÃÂ¸}ÃÂÃÂ¶ÃÂÃÂÃÂÃÂ£ÃÂÃÂ¹ÃÂÃÂ¼ÃÂÃÂºÃÂÃÂªQÃÂÃÂ¤>ÃÂÃÂ¬ÃÂÃÂ.ÃÂÃÂÃÂÃÂ¯ÃÂÃÂ¸ÃÂÃÂ¼9ÃÂÃÂªÃÂÃÂ­ÃÂÃÂ®ÃÂÃÂºÃÂÃÂ:ÃÂÃÂ(w(d@ÃÂÃÂÃÂÃÂm@SHÃÂÃÂ©ÃÂÃÂ¿\0ÃÂÃÂ?}U0ÃÂÃÂ¤:ÃÂÃÂ¤3ÃÂÃÂ²ÃÂÃÂ¼:ÃÂÃÂ²ÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂ]IÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¯ÃÂÃÂ¯ÃÂÃÂ²xÃÂÃÂ¹:IÃÂÃÂ#ÃÂÃÂ¾ÃÂÃÂÃÂÃÂ¿\0ÃÂÃÂ´?}CÃÂÃÂ¹K?pÃÂÃÂ¸ÃÂÃÂ¿\0ÃÂÃÂgÃÂÃÂ³ÃÂÃÂ½ÃÂÃÂMU)J ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³ÃÂÃÂ«ÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¯ÃÂÃÂµ2u<ÃÂÃÂ7rÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂ·ÃÂÃÂµ(y{ÃÂÃÂ¿\0ÃÂÃÂÃÂÃÂºÃÂÃÂ°ÃÂÃÂªÃÂÃÂÃÂÃÂ¶ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ´ÃÂÃÂ®kÃÂÃÂÃÂÃÂ{,ÃÂÃÂÃÂÃÂÃÂÃÂ£ZÃÂÃÂu<<ÃÂÃÂ¢IÃÂÃÂª$ÃÂÃÂÃÂÃÂÃÂÃÂ¥.ÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂ¦ÃÂÃÂUÃÂÃÂMc\"\ngTÃÂÃÂ6ÃÂÃÂÃÂÃÂÃÂÃÂp)JaÃÂÃÂ >ÃÂÃÂ°ÃÂÃÂ´/ÃÂÃÂÃÂÃÂ\"ÃÂÃÂPÃÂÃÂ¶ÃÂÃÂÃÂÃÂ\0\0zÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¿ÃÂÃÂÃÂÃÂ¿\0^ÃÂÃÂ½ÃÂÃÂÃÂÃÂ¯fÃÂÃÂ»WÃÂÃÂÃÂÃÂÃÂÃÂ·ÃÂÃÂÃÂÃÂºBÃÂÃÂÃÂÃÂÃÂÃÂ®ÃÂÃÂ¤({`ÃÂÃÂÃÂÃÂÃÂÃÂ®jhH&6ÃÂÃÂ®ÃÂÃÂÃÂÃÂ¨zFÃÂÃÂÃÂÃÂkÃÂÃÂ¡ÃÂÃÂ¤bfÃÂÃÂªÃÂÃÂÃÂÃÂ´=FÃÂÃÂµtÃÂÃÂ¢$ÃÂÃÂºsXÃÂÃÂ¢ÃÂÃÂABÃÂÃÂ·@ÃÂÃÂmÃÂÃÂ¦ÃÂÃÂÃÂÃÂµ2N$ÃÂÃÂgFZÃÂÃÂªÃÂÃÂÃÂÃÂÃÂÃÂQÃÂÃÂ§ÃÂÃÂªÃÂÃÂº>wÃÂÃÂ#PÃÂÃÂJÃÂÃÂ³ÃÂÃÂpÃÂÃÂºÃÂÃÂÃÂÃÂ·YÃÂÃÂpÃÂÃÂ£ÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂªÃÂÃÂ¨<SÃÂÃÂÃÂÃÂ[sÃÂÃÂ	ÃÂÃÂ§ÃÂÃÂcÃÂÃÂ¦0=@|C\\ÃÂÃÂÃÂÃÂ£ÃÂÃÂ«ÃÂÃÂÃÂÃÂÃÂÃÂ7	#ÃÂÃÂºÃÂÃÂ½ÃÂÃÂ¬\\WÃÂÃÂ¡ÃÂÃÂÃÂÃÂGÃÂÃÂ*ÃÂÃÂ©uÃÂÃÂR%ÃÂÃÂ¸7K<1ÃÂÃÂ9ÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂ§PÃÂÃÂ«ÃÂÃÂÃÂÃÂÃÂÃÂ¶ÃÂÃÂ¥ÃÂÃÂ¯ÃÂÃÂ.ÃÂÃÂ¯ÃÂÃÂÃÂÃÂ5\ZÃÂÃÂ}yG1DÃÂÃÂ«DÃÂÃÂ3EÃÂÃÂ²ÃÂÃÂ¬ÃÂÃÂ¦ÃÂÃÂÃÂÃÂUÃÂÃÂµz!W*ÃÂÃÂ£EÃÂÃÂªtLÃÂÃÂg ÃÂÃÂ¥QÃÂÃÂÃÂÃÂ©ÃÂÃÂ4ÃÂÃÂ¬\"ÃÂÃÂÃÂÃÂq0ÃÂÃÂÃÂÃÂ¦\0oxÃÂÃÂPÃÂÃÂ±ÃÂÃÂªÃÂÃÂÃÂÃÂ­ÃÂÃÂ¤ÃÂÃÂ­-\nÃÂÃÂÃÂÃÂÃÂÃÂ®ÃÂÃÂyÃÂÃÂ¯\nÃÂÃÂ±ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ sÃÂÃÂNÃÂÃÂÃÂÃÂ´ÃÂÃÂÃÂÃÂ¯FÃÂÃÂ»p{ÃÂÃÂ¨ÃÂÃÂuÃÂÃÂ ÃÂÃÂÃÂÃÂc~.Mot-ÃÂÃÂ´EÃÂÃÂºÃÂÃÂÃÂÃÂ§lÃÂÃÂ¤ÃÂÃÂw(ÃÂÃÂ¼ÃÂÃÂ¬ÃÂÃÂBÃÂÃÂ£M8ÃÂÃÂ¨n1,ÃÂÃÂ´ÃÂÃÂªHÃÂÃÂ+ÃÂÃÂÃÂÃÂµHxÃÂÃÂÃÂÃÂÃÂÃÂ¼mÃÂÃÂºÃÂÃÂ¯ÃÂÃÂÃÂÃÂ³PÃÂÃÂ*ÃÂÃÂ .\\ÃÂÃÂÃÂÃÂ¿ÃÂÃÂ¹-ÃÂÃÂ¶N6ÃÂÃÂÃÂÃÂÃÂÃÂ|ÃÂÃÂ®~RI7$ÃÂÃÂÃÂÃÂ³ÃÂÃÂmÃÂÃÂ¼ÃÂÃÂ¶ÃÂÃÂÃÂÃÂ-ÃÂÃÂºÃÂÃÂ©ÃÂÃÂ!YÃÂÃÂÃÂÃÂ9S\0ÃÂÃÂ$ÃÂÃÂªQ)ÃÂÃÂÃÂÃÂÃÂÃÂ¾ÃÂÃÂ£ÃÂÃÂ3ÃÂÃÂyÃÂÃÂ»ÃÂÃÂ´k ^@ÃÂÃÂÃÂÃÂ¼ÃÂÃÂ©ÃÂÃÂÃÂÃÂ1ÃÂÃÂÃÂÃÂ¦>ÃÂÃÂLÃÂÃÂ¨ÃÂÃÂVQ\0ÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂ#ÃÂÃÂÃÂÃÂÃÂÃÂ¨=1ÃÂÃÂÃÂÃÂsÃÂÃÂ¾51ÃÂÃÂºÃÂÃÂÃÂÃÂ´RÃÂÃÂMÃÂÃÂ!\0\0ÃÂÃÂµÃÂÃÂ¸\0tÃÂÃÂºÃÂÃÂ¸ÃÂÃÂª<ÃÂÃÂ¢ÃÂÃÂÃÂÃÂ­ÃÂÃÂ ÃÂÃÂGÃÂÃÂ¥ÃÂÃÂºÃÂÃÂÃÂÃÂªÃÂÃÂ¨)pÃÂÃÂ~?ÃÂÃÂ¶ÃÂÃÂª\0`\0ÃÂÃÂÃÂÃÂ¨ÃÂÃÂ¨ÃÂÃÂ&wkÃÂÃÂÃÂÃÂ§ÃÂÃÂiÃÂÃÂÃÂÃÂÃÂÃÂ·ÃÂÃÂ¶ÃÂÃÂ¢EÃÂÃÂ>ÃÂÃÂ·ÃÂÃÂ©iÃÂÃÂ¿ÃÂÃÂ­%ÃÂÃÂ³?xÃÂÃÂ¢nÃÂÃÂ¯nÃÂÃÂÃÂÃÂ©JFÃÂÃÂ¾bdÃÂÃÂÃÂÃÂ¦TÃÂÃÂKÃÂÃÂ¹ÃÂÃÂÃÂÃÂ >ÃÂÃÂ4ÃÂÃÂªÃÂÃÂªpÃÂÃÂuÃÂÃÂÃÂÃÂªÃÂÃÂ¡T\nÃÂÃÂÃÂÃÂÃÂÃÂ­8ÃÂÃÂ­ÃÂÃÂUyqÃÂÃÂ¨8ÃÂÃÂ¶ÃÂÃÂ¨ÃÂÃÂÃÂÃÂ¥CÃÂÃÂR3QU=CÃÂÃÂÃÂÃÂÃÂÃÂ¦ÃÂÃÂ«ÃÂÃÂ¤ÃÂÃÂ©ÃÂÃÂÃÂÃÂÃÂÃÂ¡ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂpCÃÂÃÂ©ÃÂÃÂÃÂÃÂvÃÂÃÂ©	P]ÃÂÃÂ»ÃÂÃÂ´ÃÂÃÂ9ÃÂÃÂº*ÃÂÃÂSÃÂÃÂ¯uÃÂÃÂhÃÂÃÂuMÃÂÃÂÃÂÃÂ5ÃÂÃÂo)ÃÂÃÂ1ÃÂÃÂ£|ÃÂÃÂ·bÃÂÃÂ¶ÃÂÃÂÃÂÃÂÃÂÃÂ©ÃÂÃÂ¥ÃÂÃÂL\n\'ÃÂÃÂ«VJÃÂÃÂ¤EBa6_ÃÂÃÂ·ÃÂÃÂÃÂÃÂ·ÃÂÃÂ¦O~ÃÂÃÂ.uÃÂÃÂÃÂÃÂ¤(MÃÂÃÂv}ÃÂÃÂ®:ÃÂÃÂºpÃÂÃÂ¨\"ÃÂÃÂÃÂÃÂ¯~*ÃÂÃÂiYSÃÂÃÂ´ÃÂÃÂÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂ«ÃÂÃÂ<ÃÂÃÂÃÂÃÂ)ÃÂÃÂ¨ÃÂÃÂÃÂÃÂÃÂÃÂ»H@-ÃÂÃÂUÃÂÃÂ«ÃÂÃÂ¦4ÃÂÃÂÃÂÃÂ¤ÃÂÃÂ£ÃÂÃÂÃÂÃÂ®ÃÂÃÂÃÂÃÂ6ZEÃÂÃÂÃÂÃÂ¦ÃÂÃÂ\\ÃÂÃÂ ÃÂÃÂ­g/KÃÂÃÂeJÃÂÃÂ JbÃÂÃÂ¢ÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂº@BÃÂÃÂ3ÃÂÃÂ»FÃÂÃÂ¢ÃÂÃÂ³ÃÂÃÂ	OÃÂÃÂ±ÃÂÃÂ ÃÂÃÂ§ÃÂÃÂ¦*ÃÂÃÂªÃÂÃÂ¦ÃÂÃÂÃÂÃÂXÃÂÃÂ¥TÃÂÃÂ:ÃÂÃÂ\\ÃÂÃÂÃÂÃÂÃÂÃÂzKÃÂÃÂÃÂÃÂÃÂÃÂYÃÂÃÂ¡ÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂªw$IAÃÂÃÂ¢PÃÂÃÂ¹ZÃÂÃÂÃÂÃÂ«ÃÂÃÂ9DADÃÂÃÂNÃÂÃÂ°\ZÃÂÃÂªE?ÃÂÃÂÃÂÃÂÃÂÃÂEÃÂÃÂ»8ÃÂÃÂÃÂÃÂ¾ÃÂÃÂ :ÃÂÃÂ&ÃÂÃÂ¡@Dy5ÃÂÃÂÃÂÃÂ´ÃÂÃÂÃÂÃÂÃÂÃÂ³ÃÂÃÂmÃÂÃÂ¡ÃÂÃÂ»}ÃÂÃÂ²moÃÂÃÂ¯}ÃÂÃÂ¡JÃÂÃÂÃÂÃÂ·ÃÂÃÂ¶ÃÂÃÂ« pWÃÂÃÂ¾ÃÂÃÂZÃÂÃÂÃÂÃÂ¾ÃÂÃÂ¦tÃÂÃÂÃÂÃÂªÃÂÃÂS6ÃÂÃÂ³ÃÂÃÂ±ÃÂÃÂ´ÃÂÃÂ84ÃÂÃÂBÃÂÃÂTZÃÂÃÂ \"@ÃÂÃÂSÃÂÃÂ¼ÃÂÃÂ»!ÃÂÃÂ¶ÃÂÃÂ¶;=ÃÂÃÂ¬ÃÂÃÂ²ÃÂÃÂUÃÂÃÂ¢ÃÂÃÂÃÂÃÂMÃÂÃÂlÃÂÃÂ¦ÃÂÃÂBÃÂÃÂ¤ÃÂÃÂÃÂÃÂ *\'EÃÂÃÂÃÂÃÂ®MÃÂÃÂ\\ÃÂÃÂµÃÂÃÂ¥VÃÂÃÂÃÂÃÂ°(ÃÂÃÂ¸ÃÂÃÂ^iÃÂÃÂµ*ÃÂÃÂÃÂÃÂ°\0VÃÂÃÂ\rÃÂÃÂÃÂÃÂ¦ÃÂÃÂ¥*ÃÂÃÂ£ÃÂÃÂ¼?}SÃÂÃÂzÃÂÃÂqdGaÃÂÃÂÃÂÃÂ³ÃÂÃÂgÃÂÃÂ°\0\0\0ZÃÂÃÂÃÂÃÂ]ÃÂÃÂ¡[ÃÂÃÂºÃÂÃÂ<cÃÂÃÂÃÂÃÂ¾ÃÂÃÂ³||>ÃÂÃÂ½:hÃÂÃÂ+ÃÂÃÂ¼`-ÃÂÃÂ¿ÃÂÃÂ¨ÃÂÃÂ³ÃÂÃÂ¯ÃÂÃÂqÃÂÃÂÃÂÃÂÃÂÃÂ©ÃÂÃÂ9@ÃÂÃÂ±Z4DÃÂÃÂ½ÃÂÃÂ§ÃÂÃÂºÃÂÃÂ©jÃÂÃÂ©ÃÂÃÂºyÃÂÃÂ¾ÃÂÃÂÃÂÃÂ¨ÃÂÃÂ !ÃÂÃÂ?ÃÂÃÂ§ÃÂÃÂ¼ÃÂÃÂ©ÃÂÃÂ¥ÃÂÃÂ ÃÂÃÂ>ÃÂÃÂ°ÃÂÃÂ¼ÃÂÃÂÃÂÃÂ³\rUÃÂÃÂ\0ÃÂÃÂ ÃÂÃÂ?ÃÂÃÂtÃÂÃÂ¼2rbcÃÂÃÂJIÃÂÃÂ»AÃÂÃÂtsG/ÃÂÃÂ¤9TÃÂÃÂ¨7dÃÂÃÂÃÂÃÂ*9xÃÂÃÂ­uÃÂÃÂ DÃÂÃÂjÃÂÃÂ%WUCÃÂÃÂÃÂÃÂ¦cÃÂÃÂ ^ÃÂÃÂ­#ovÃÂÃÂ¬[ÃÂÃÂ­7ÃÂÃÂ³^ÃÂÃÂ¶ÃÂÃÂ6ÃÂÃÂjÃÂÃÂ®ÃÂÃÂ²$ÃÂÃÂÃÂÃÂÃÂÃÂOP\nÃÂÃÂ¡ÃÂÃÂÃÂÃÂ®Q\\ÃÂÃÂ³ÃÂÃÂ¬ÃÂÃÂ¦ÃÂÃÂY4ÃÂÃÂ ÃÂÃÂ­ÃÂÃÂJÃÂÃÂµÃÂÃÂ¯ÃÂÃÂ®\nVÃÂÃÂ¯EÃÂÃÂT*ÃÂÃÂ\"CÃÂÃÂÃÂÃÂ·ÃÂÃÂÃÂÃÂ¹ÃÂÃÂÃÂÃÂ·9ÃÂÃÂ»=ÃÂÃÂÃÂÃÂ®ÃÂÃÂª`ÃÂÃÂ«=ÃÂÃÂÃÂÃÂ¨ÃÂÃÂ«zÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂ´vÃÂÃÂ ÃÂÃÂÃÂÃÂºÃÂÃÂ·t\ZhDZÃÂÃÂtÃÂÃÂ~@ÃÂÃÂÃÂÃÂ¨xÃÂÃÂÃÂÃÂÃÂÃÂ@ÃÂÃÂ¬ÃÂÃÂ«ÃÂÃÂÃÂÃÂ¥CÃÂÃÂÃÂÃÂ9ÃÂÃÂ]ÃÂÃÂµGÃÂÃÂ¶oÃÂÃÂÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂ±ÃÂÃÂ«\Zn.ÃÂÃÂ´ÃÂÃÂ¶ÃÂÃÂ¥ÃÂÃÂ»+ÃÂÃÂ*ÃÂÃÂ½ÃÂÃÂT+ÃÂÃÂµÃÂÃÂ¨8ÃÂÃÂ«WZÃÂÃÂvÃÂÃÂ5ÃÂÃÂÃÂÃÂ¥\nmÃÂÃÂ£ÃÂÃÂª:ÃÂÃÂ­ÃÂÃÂ¡ÃÂÃÂ² tÃÂÃÂ«ÃÂÃÂTÃÂÃÂ¼ÃÂÃÂ3T-ÃÂÃÂÃÂÃÂ¼{ÃÂÃÂ¹ÃÂÃÂÃÂÃÂ·ÃÂÃÂ¶ÃÂÃÂH3ÃÂÃÂÃÂÃÂ«wAyÃÂÃÂ­ÃÂÃÂµÃÂÃÂÃÂÃÂ¦TÃÂÃÂ]%ÃÂÃÂ&%ÃÂÃÂÃÂÃÂ¬JRÃÂÃÂ²ÃÂÃÂHÃÂÃÂÃÂÃÂVl>ÃÂÃÂm4ÃÂÃÂªÃÂÃÂHÃÂÃÂBÃÂÃÂ»\\2ÃÂÃÂ1>ÃÂÃÂºjÃÂÃÂ¯ÃÂÃÂªÃÂÃÂÃÂÃÂµ{pÃÂÃÂ¬ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ²lÃÂÃÂVÃÂÃÂªÃÂÃÂÃÂÃÂ¬ÃÂÃÂÃÂÃÂ»ÃÂÃÂ³tÃÂÃÂ»P*g*ÃÂÃÂZÃÂÃÂµÃÂÃÂ­}ÃÂÃÂH	ÃÂÃÂGRoBÃÂÃÂÃÂÃÂ ÃÂÃÂYÃÂÃÂ«ÃÂÃÂ ÃÂÃÂÃÂÃÂ9ZÃÂÃÂ¶>Ej*ÃÂÃÂÃÂÃÂ0ÃÂÃÂRÃÂÃÂµ9c\"ÃÂÃÂÃÂÃÂPÃÂÃÂ9jÃÂÃÂªÃÂÃÂÃÂÃÂ@ÃÂÃÂÃÂÃÂ«ÃÂÃÂ«ÃÂÃÂÃÂÃÂ´ÃÂÃÂlpÃÂÃÂÃÂÃÂQÃÂÃÂ¨ÃÂÃÂ³Z\nfÃÂÃÂ¬ÃÂÃÂ¹ÃÂÃÂ»ÃÂÃÂÃÂÃÂ9ÃÂÃÂ%ÃÂÃÂRÃÂÃÂ©ÃÂÃÂ[tÃÂÃÂ·ÃÂÃÂ\"ÃÂÃÂÃÂÃÂ°ÃÂÃÂ´ÃÂÃÂÃÂÃÂ¦IÃÂÃÂ5ÃÂÃÂ²ÃÂÃÂÃÂÃÂ¥DÃÂÃÂ²ÃÂÃÂÃÂÃÂ°ÃÂÃÂ¶ÃÂÃÂº0ÃÂÃÂÃÂÃÂÃÂÃÂ»ÃÂÃÂ,DÃÂÃÂ*$#ÃÂÃÂÃÂÃÂ´ÃÂÃÂÃÂÃÂ¤ÃÂÃÂ§ÃÂÃÂ¡j)ÃÂÃÂ£-/MÃÂÃÂDp\nROU(8ÃÂÃÂgÃÂÃÂ\0\0dÃÂÃÂ¬`ÃÂÃÂ/ÃÂÃÂ\0\0ÃÂÃÂÃÂÃÂ§ÃÂÃÂ/(ÃÂÃÂ´IQUÃÂÃÂ½ÃÂÃÂÃÂÃÂJkÃÂÃÂ¥\\/ÃÂÃÂ­uÃÂÃÂ`ÃÂÃÂÃÂÃÂÃÂÃÂºÃÂÃÂ¶ÃÂÃÂ=US\nf8ÃÂÃÂ@qÃÂÃÂ%ÃÂÃÂ¥ÃÂÃÂÃÂÃÂ¹ÃÂÃÂ>_ÃÂÃÂ¨ÃÂÃÂªMLnÃÂÃÂ¾_O~:ÃÂÃÂÃÂÃÂ³ÃÂÃÂ KÃÂÃÂ ÃÂÃÂ±ÃÂÃÂ®!HjeÃÂÃÂ©T)NC\0ÃÂÃÂrÃÂÃÂÃÂÃÂrÃÂÃÂRÃÂÃÂÃÂÃÂ¦)ÃÂÃÂ!ÃÂÃÂ@ÃÂÃÂ !ÃÂÃÂ@CFÃÂÃÂ©\\ÃÂÃÂµÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\\ÃÂÃÂ¢ DÃÂÃÂ1ÃÂÃÂ \"\0ÃÂÃÂ²\0ÃÂÃÂ\0ÃÂÃÂ¼ÃÂÃÂ´h2ÃÂÃÂºyÃÂÃÂ¾ÃÂÃÂÃÂÃÂ ÃÂÃÂ<ÃÂÃÂ¾ÃÂÃÂÃÂÃÂÃÂÃÂ¾zÃÂÃÂÃÂÃÂÃÂÃÂ«ÃÂÃÂu}ÃÂÃÂ?ÃÂÃÂ®ÃÂÃÂm\Z4h5ÃÂÃÂ»t[ÃÂÃÂÃÂÃÂµÃÂÃÂAÃÂÃÂ²5ÃÂÃÂÃÂÃÂ¾ÃÂÃÂ¼ÃÂÃÂ²R1ÃÂÃÂÃÂÃÂAd	ÃÂÃÂ¶ÃÂÃÂC)#PNGSÃÂÃÂPÃÂÃÂÃÂÃÂ´)\\6R^fZbQÃÂÃÂ£VÃÂÃÂ¬ÃÂÃÂY \nÃÂÃÂ®ÃÂÃÂ,ÃÂÃÂFÃÂÃÂ®MÃÂÃÂÃÂÃÂ¾ÃÂÃÂ/iMÃÂÃÂÃÂÃÂ­	ÃÂÃÂÃÂÃÂ°VÃÂÃÂÃÂÃÂÃÂÃÂNTÃÂÃÂÃÂÃÂªÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¬ÃÂÃÂª9ÃÂÃÂiÃÂÃÂº*jJÃÂÃÂ½ÃÂÃÂ~ÃÂÃÂfÃÂÃÂ¢ÃÂÃÂzÃÂÃÂ£I9ÃÂÃÂÃÂÃÂ¨(8ÃÂÃÂ¸ÃÂÃÂÃÂÃÂÃÂÃÂpwÃÂÃÂºÃÂÃÂ²iÃÂÃÂ¶YS5TÃÂÃÂ¤~vÃÂÃÂ¨ÃÂÃÂ¶ÃÂÃÂ¿eÃÂÃÂ·ÃÂÃÂdÃÂÃÂ«;)+wZÃÂÃÂµnWmAu#ÃÂÃÂ¦af#\\ÃÂÃÂµ?UÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ°ÃÂÃÂ¶ÃÂÃÂÃÂÃÂ«)ÃÂÃÂDÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂfnÃÂÃÂ±ÃÂÃÂ³ÃÂÃÂ´ÃÂÃÂ»ÃÂÃÂ§	:`ÃÂÃÂ¡ÃÂÃÂ£7ÃÂÃÂ«ÃÂÃÂ·ÃÂÃÂÃÂÃÂ3ÃÂÃÂyÃÂÃÂ·+ÃÂÃÂp\"lÃÂÃÂ¥ÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂ²ÃÂÃÂ°ÃÂÃÂÃÂÃÂ¤ÃÂÃÂ­ÃÂÃÂ}JÃÂÃÂÃÂÃÂÃÂÃÂ,ÃÂÃÂQGÃÂÃÂÃÂÃÂdÃÂÃÂÃÂÃÂÃÂÃÂ¼iQÃÂÃÂÃÂÃÂ¦ÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂ¢ÃÂÃÂ¡hÃÂÃÂÃÂÃÂ¨D)ÃÂÃÂ¯Qu,ÃÂÃÂgÃÂÃÂ°ÃÂÃÂªÃÂÃÂ½ÃÂÃÂÃÂÃÂµÃÂÃÂªBÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂ®ÃÂÃÂ ÃÂÃÂ«f4ÃÂÃÂÃÂÃÂºÃÂÃÂ¤ÃÂÃÂ¶ÃÂÃÂDÃÂÃÂ¹JÃÂÃÂÃÂÃÂ»n]HÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­xZÃÂÃÂÃÂÃÂÃÂÃÂ´shÃÂÃÂÃÂÃÂÃÂÃÂxÃÂÃÂªÃÂÃÂwsÃÂÃÂ§ÃÂÃÂr*ÃÂÃÂ) ÃÂÃÂzbpÃÂÃÂÃÂÃÂ´ÃÂÃÂwKhl/gÃÂÃÂUE\\z=ÃÂÃÂÃÂÃÂ\rÃÂÃÂL#f)ÃÂÃÂ#CÃÂÃÂ¿ZNÃÂÃÂ´ÃÂÃÂ¨ÃÂÃÂ5ÃÂÃÂ»ÃÂÃÂ,%ÃÂÃÂÃÂÃÂ¶)ÃÂÃÂÃÂÃÂÃÂÃÂ!ÃÂÃÂÃÂÃÂ±HÃÂÃÂµ\ZÃÂÃÂ´ÃÂÃÂ¹ÃÂÃÂ\\ÃÂÃÂ¨ÃÂÃÂÃÂÃÂÃÂÃÂ®ÃÂÃÂÃÂÃÂ¨ÃÂÃÂÃÂÃÂ.ÃÂÃÂGÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂ­ÃÂÃÂµÃÂÃÂ¦oSÃÂÃÂºÃÂÃÂ¾ÃÂÃÂ©ÃÂÃÂNÃÂÃÂjZÃÂÃÂÃÂÃÂ®cjÃÂÃÂ©zUÃÂÃÂYÃÂÃÂÃÂÃÂÃÂÃÂ¦ÃÂÃÂ¥a\"aÃÂÃÂ«ÃÂÃÂÃÂÃÂ¦ÃÂÃÂÃÂÃÂÃÂÃÂ¥jÃÂÃÂµ^SÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂ,ÃÂÃÂ¡ÃÂÃÂ<ÃÂÃÂfLÃÂÃÂÃÂÃÂ¯uu%iihÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂ¹ÃÂÃÂ¥ÃÂÃÂÃÂÃÂ¶ÃÂÃÂµÃÂÃÂ¶ÃÂÃÂÃÂÃÂªÃÂÃÂªÃÂÃÂ¢ÃÂÃÂXjiÃÂÃÂeÃÂÃÂ»ÃÂÃÂ¦ÃÂÃÂÃÂÃÂI[ÃÂÃÂQÃÂÃÂ2ÃÂÃÂ¨(ÃÂÃÂ«ÃÂÃÂ_SOÃÂÃÂªÃÂÃÂ§4ÃÂÃÂ¥*ÃÂÃÂ¡ÃÂÃÂGpÃÂÃÂµ4LÃÂÃÂiHÃÂÃÂMÃÂÃÂG}ÃÂÃÂ«ÃÂÃÂ¦.LÃÂÃÂÃÂÃÂ«hÃÂÃÂÃÂÃÂÃÂÃÂ·t=?gÃÂÃÂÃÂÃÂ§ÃÂÃÂrÃÂÃÂÃÂÃÂÃÂÃÂpÃÂÃÂ¢=FnÃÂÃÂi+ ÃÂÃÂÃÂÃÂ,ÃÂÃÂ£AÃÂÃÂÃÂÃÂ+ÃÂÃÂ	ÃÂÃÂ\nÃÂÃÂ¦\nÃÂÃÂ;jCTÃÂÃÂÃÂÃÂ·jÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂºz6mmjv&ÃÂÃÂ½ÃÂÃÂ¿\0NÃÂÃÂ®w4ÃÂÃÂ¾ÃÂÃÂ±ky;ÃÂÃÂ²ÃÂÃÂ­,ÃÂÃÂ¼3hÃÂÃÂ´-ÃÂÃÂº|ÃÂÃÂ¥CkXB6ÃÂÃÂMÃÂÃÂ»ÃÂÃÂ¥j1ÃÂÃÂmLP/$ÃÂÃÂ³8ÃÂÃÂÃÂÃÂ·V@#ÃÂÃÂÃÂÃÂ±Q6ÃÂÃÂÃÂÃÂ¸ÃÂÃÂ£ÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¢M.Y[ÃÂÃÂÃÂÃÂ¶ÃÂÃÂiÃÂÃÂÃÂÃÂZ~ÃÂÃÂÃÂÃÂtÃÂÃÂÃÂÃÂmÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂBÃÂÃÂ7MÃÂÃÂcÃÂÃÂ­N5ÃÂÃÂd\nbÃÂÃÂÃÂÃÂ¨ÃÂÃÂ¤C,ÃÂÃÂS1ÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂ]ÃÂÃÂÃÂÃÂ¹UÃÂÃÂÃÂÃÂ7m*ÃÂÃÂºÃÂÃÂzÃÂÃÂ¦ÃÂÃÂ¢ÃÂÃÂ¬mÃÂÃÂÃÂÃÂ¦iS2ÃÂÃÂ»WHQ4ÃÂÃÂ­EF)XÃÂÃÂCDÃÂÃÂ¹MÃÂÃÂ²nÃÂÃÂdÃÂÃÂ¾ÃÂÃÂ¨ÃÂÃÂÃÂÃÂÃÂÃÂ1^ÃÂÃÂº{ÃÂÃÂ.ÃÂÃÂ¨ÃÂÃÂ¤hfÃÂÃÂ­\nÃÂÃÂrÃÂÃÂªMÃÂÃÂÃÂÃÂ<_ÃÂÃÂ¾|ÃÂÃÂ¹ÃÂÃÂ§RÃÂÃÂªcÃÂÃÂµÃÂÃÂ«ÃÂÃÂÃÂÃÂ§O.ÃÂÃÂÃÂÃÂ¿<ÃÂÃÂª]3ÃÂÃÂ»ÃÂÃÂÃÂÃÂÃÂÃÂ¡ÃÂÃÂ¤!ÃÂÃÂ¤sÃÂÃÂtHÃÂÃÂÃÂÃÂ¿\0wÃÂÃÂFÃÂÃÂ§ÃÂÃÂ»EÃÂÃÂsÃÂÃÂ 8ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂXÃÂÃÂ¥(ÃÂÃÂ¦9$ÃÂÃÂÃÂÃÂ¶p\0ÃÂÃÂ·ÃÂÃÂÃÂÃÂ°ÃÂÃÂÃÂÃÂN?O?ÃÂÃÂu}ÃÂÃÂ?ÃÂÃÂ¦ÃÂÃÂ ~ÃÂÃÂ^CÃÂÃÂ¨ÃÂÃÂÃÂÃÂ®ÃÂÃÂ¹ÃÂÃÂ½thÃÂÃÂÃÂÃÂ¼eÃÂÃÂ·p8dp?ÃÂÃÂ|sÃÂÃÂ\0ÃÂÃÂ¦8\rjÃÂÃÂÃÂÃÂ©ÃÂÃÂÃÂÃÂ¦ÃÂÃÂÃÂÃÂ¶ÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸+[BÃÂÃÂRÃÂÃÂª+ÃÂÃÂ°ÃÂÃÂÃÂÃÂ«#\\ÃÂÃÂÃÂÃÂRÃÂÃÂ¬XÃÂÃÂÃÂÃÂIÃÂÃÂÃÂÃÂ¢!ÃÂÃÂPQÃÂÃÂ²aÃÂÃÂÃÂÃÂ@\0GAÃÂÃÂ´ÃÂÃÂºÃÂÃÂ¤rÃÂÃÂyÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ´`ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂO,0ÃÂÃÂÃÂÃÂEÃÂÃÂ¸OJ7avÃÂÃÂGÃÂÃÂÃÂÃÂÃÂÃÂ~ÃÂÃÂ¦ÃÂÃÂÃÂÃÂdÃÂÃÂVÃÂÃÂÃÂÃÂ$\r4wÃÂÃÂÃÂÃÂlÃÂÃÂÃÂÃÂQÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂ\0ÃÂÃÂ;rÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¸ÃÂÃÂ«ÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂKwl,tJÃÂÃÂtÃÂÃÂÃÂÃÂÃÂÃÂ3ÃÂÃÂÃÂÃÂÃÂÃÂ¦EÃÂÃÂaÃÂÃÂªÃÂÃÂFÃÂÃÂÃÂÃÂ`ÃÂÃÂ:RÃÂÃÂ¢BÃÂÃÂÃÂÃÂ\0ÃÂÃÂAÃÂÃÂÃÂÃÂ®bnÃÂÃÂÃÂÃÂ3ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ±ÃÂÃÂ}.ÃÂÃÂ½ÃÂÃÂ¤c\0ÃÂÃÂ¤DUtÃÂÃÂ¹fÃÂÃÂ¨1ÃÂÃÂÃÂÃÂ¥OÃÂÃÂ!I]ÃÂÃÂ¦LvIn*ÃÂÃÂÃÂÃÂ¹ÃÂÃÂÃÂÃÂÃÂÃÂ§&ÃÂÃÂ¬;ÃÂÃÂÃÂÃÂÃÂÃÂ¶ÃÂÃÂÃÂÃÂÃÂÃÂ¦ÃÂÃÂ§ÃÂÃÂ¯;ÃÂÃÂª*ÃÂÃÂCLÃÂÃÂ°EÃÂÃÂ²ÃÂÃÂ±LR7ÃÂÃÂ²BÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¨ÃÂÃÂ©ÃÂÃÂ#ÃÂÃÂÃÂÃÂÃÂÃÂ»m6ÃÂÃÂ°ÃÂÃÂ±ÃÂÃÂÃÂÃÂ$ÃÂÃÂÃÂÃÂ«ÃÂÃÂ«ÃÂÃÂEMÃÂÃÂº~ÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂªÃÂÃÂ³-yÃÂÃÂ¸-ÃÂÃÂ>ÃÂÃÂXÃÂÃÂ©ÃÂÃÂ«H[vÃÂÃÂÃÂÃÂBÃÂÃÂ¬ÃÂÃÂZ.z\rÃÂÃÂ¢$fÃÂÃÂDxD%ÃÂÃÂ¦ÃÂÃÂÃÂÃÂÃÂÃÂ{ÃÂÃÂ¾16ÃÂÃÂ/ÃÂÃÂÃÂÃÂ±ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ(ÃÂÃÂÃÂÃÂÃÂÃÂ¯;ÃÂÃÂÃÂÃÂ¸ÃÂÃÂ±ÃÂÃÂ³-*ÃÂÃÂmÃÂÃÂSBÃÂÃÂ¹ÃÂÃÂ¨dÃÂÃÂO,ÃÂÃÂ²ÃÂÃÂ	ISÃÂÃÂ°ÃÂÃÂµltÃÂÃÂÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¢4{ÃÂÃÂ]ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ±ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ WÃÂÃÂÃÂÃÂ¼ÃÂÃÂPÃÂÃÂÃÂÃÂ´}#UHÃÂÃÂÃÂÃÂJÃÂÃÂ¶ÃÂÃÂ¨eJNÃÂÃÂ£ ÃÂÃÂ¹ÃÂÃÂ¤ÃÂÃÂ­2ÃÂÃÂ~EÃÂÃÂ´ÃÂÃÂ²ÃÂÃÂ®ÃÂÃÂ¡[;ÃÂÃÂMÃÂÃÂÃÂÃÂ\"dÃÂÃÂÃÂÃÂ{ÃÂÃÂ!ÃÂÃÂ2ÃÂÃÂÃÂÃÂÃÂÃÂ&ÃÂÃÂ²DPÃÂÃÂ³6{r%ÃÂÃÂ¦AMÃÂÃÂÃÂÃÂÃÂÃÂ ÃÂÃÂ»GGvÃÂÃÂÃÂÃÂÃÂÃÂ¡jÃÂÃÂÃÂÃÂªÃÂÃÂÃÂÃÂlÃÂÃÂÃÂÃÂ,aÃÂÃÂÃÂÃÂ·gL!ÃÂÃÂÃÂÃÂ²ÃÂÃÂ1L,zÃÂÃÂ¸6rÃÂÃÂ­ÃÂÃÂ­ÃÂÃÂj>ÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂ«ÃÂÃÂÃÂÃÂªÃÂÃÂÃÂÃÂÃÂÃÂºxÃÂÃÂ:ÃÂÃÂNÃÂÃÂ|ÃÂÃÂ¹ÃÂÃÂ\"ÃÂÃÂBÃÂÃÂ£ÃÂÃÂ¬ÃÂÃÂMeÃÂÃÂAÃÂÃÂÃÂÃÂ*ÃÂÃÂ»TLÃÂÃÂ¢ÃÂÃÂ¡SLGÃÂÃÂD7kÃÂÃÂ»ÃÂÃÂÃÂÃÂ½ÃÂÃÂ»nÃÂÃÂ¦ÃÂÃÂª[3ÃÂÃÂ½[ÃÂÃÂ¢ÃÂÃÂ´e[\"ÃÂÃÂBj\"ÃÂÃÂÃÂÃÂ¨%*JÃÂÃÂ®aÃÂÃÂÃÂÃÂUIÃÂÃÂÃÂÃÂ\naÃÂÃÂÃÂÃÂ¸ÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂ;ÃÂÃÂ¨ÃÂÃÂ¦+ÃÂÃÂÃÂÃÂ©ÃÂÃÂMÃÂÃÂWAÃÂÃÂpÃÂÃÂ«ÃÂÃÂ\"<ÃÂÃÂ0?ÃÂÃÂ¨ÃÂÃÂµÃÂÃÂ«ÃÂÃÂ¹ÃÂÃÂ³ÃÂÃÂÃÂÃÂ¡ÃÂÃÂ®xÃÂÃÂÃÂÃÂ·wÃÂÃÂµRÃÂÃÂ0ÃÂÃÂ§ZÃÂÃÂÃÂÃÂ«ÃÂÃÂ¯g^3ÃÂÃÂMÃÂÃÂ-ÃÂÃÂµÃÂÃÂ¢ÃÂÃÂ©ÃÂÃÂªÃÂÃÂºÃÂÃÂ¶ÃÂÃÂªHÃÂÃÂHPÃÂÃÂ¯ÃÂÃÂ©ÃÂÃÂ«\\ZNb%eSÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¢ÃÂÃÂÃÂÃÂeÃÂÃÂ¢ÃÂÃÂªd\nRÃÂÃÂ»[ÃÂÃÂ²CÃÂÃÂ´ÃÂÃÂº3ÃÂÃÂ´ÃÂÃÂÃÂÃÂÃÂÃÂJÃÂÃÂÃÂÃÂ4eyfÃÂÃÂªÃÂÃÂ¸ÃÂÃÂ2ÃÂÃÂ¹ÃÂÃÂ;JÃÂÃÂÃÂÃÂ¨ÃÂÃÂTPFÃÂÃÂ©!\'ÃÂÃÂ©ÃÂÃÂOTÃÂÃÂ±-V`UÃÂÃÂ?ÃÂÃÂÃÂÃÂ¨ÃÂÃÂÃÂÃÂ.ÃÂÃÂÃÂÃÂFÃÂÃÂÃÂÃÂlÃÂÃÂ&ÃÂÃÂª@ÃÂÃÂ§5ÃÂÃÂ¢2.)idÃÂÃÂ¢ÃÂÃÂ*oÃÂÃÂÃÂÃÂP@ÃÂÃÂ¦PR\08ÃÂÃÂxCÃÂÃÂ|dqÃÂÃÂJbÃÂÃÂÃÂÃÂ¼FÃÂÃÂ¾ÃÂÃÂ¼ÃÂÃÂ¹ÃÂÃÂ$SÃÂÃÂ³:WÃÂÃÂ¸l	ÃÂÃÂÃÂÃÂ®ÃÂÃÂ·KÃÂÃÂÃÂÃÂ¤\0<gÃÂÃÂ¢7ÃÂÃÂ²!ÃÂÃÂ\"ÃÂÃÂÃÂÃÂ´h0ÃÂÃÂ¶ÃÂÃÂ§ÃÂÃÂ·#nÃÂÃÂ¶ÃÂÃÂejÃÂÃÂÃÂÃÂ¥tUÃÂÃÂ-)J-OÃÂÃÂ°3HÃÂÃÂÃÂÃÂ±<ÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¥YQFRtÃÂÃÂ+ÃÂÃÂÃÂÃÂ½ÃÂÃÂÃÂÃÂlÃÂÃÂ¬ÃÂÃÂ¬ÃÂÃÂ¼ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂnÃÂÃÂ¢ÃÂÃÂ²RÃÂÃÂÃÂÃÂÃÂÃÂ°jÃÂÃÂºÃÂÃÂCÃÂÃÂ»ÃÂÃÂÃÂÃÂqÃÂÃÂ_ÃÂÃÂ°UÃÂÃÂÃÂÃÂ,ÃÂÃÂÃÂÃÂWÃÂÃÂ§ÃÂÃÂ48ÃÂÃÂ¥&ÃÂÃÂÃÂÃÂ¸E^\nÃÂÃÂ±ÃÂÃÂÃÂÃÂ¦ ÃÂÃÂ·*ÃÂÃÂ¢ÃÂÃÂ!ÃÂÃÂ¼=G)ÃÂÃÂÃÂÃÂ«60ÃÂÃÂÃÂÃÂ´:ÃÂÃÂ ÃÂÃÂµTÃÂÃÂ°ÃÂÃÂ¨ÃÂÃÂ«AÃÂÃÂ¼\rÃÂÃÂ´[}ÃÂÃÂÃÂÃÂ­ÃÂÃÂ¾ÃÂÃÂ»ÃÂÃÂ°ÃÂÃÂ^!ÃÂÃÂ¤ÃÂÃÂYÃÂÃÂ¥ÃÂÃÂ²ÃÂÃÂ¤ÃÂÃÂÃÂÃÂ{\r-/NÃÂÃÂÃÂÃÂ±ÃÂÃÂ¨iÃÂÃÂÃÂÃÂÃÂÃÂ©6\"ÃÂÃÂÃÂÃÂ¤!&ÃÂÃÂ£ÃÂÃÂH7ÃÂÃÂvÃÂÃÂÃÂÃÂµ~ÃÂÃÂÃÂÃÂ5ÃÂÃÂ@ÃÂÃÂ­kÃÂÃÂ¯=yhÃÂÃÂ®dÃÂÃÂ¬ÃÂÃÂÃÂÃÂ¿\0ÃÂÃÂ®ÃÂÃÂ©uÃÂÃÂPÃÂÃÂªÃÂÃÂ²,ÃÂÃÂR*ÃÂÃÂ¤%0ÃÂÃÂ08%)i<ÃÂÃÂxGÃÂÃÂ½ÃÂÃÂ¯ÃÂÃÂ8ÃÂÃÂµÃÂÃÂt	ÃÂÃÂÃÂÃÂ¼;ÃÂÃÂ»ÃÂÃÂotM,ÃÂÃÂÃÂÃÂÃÂÃÂºÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\\W:ÃÂÃÂÃÂÃÂ\'GÃÂÃÂ¯JÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂ§ÃÂÃÂjÃÂÃÂÃÂÃÂ\"ÃÂÃÂ¢\0LV(ÃÂÃÂÃÂÃÂ1ÃÂÃÂ%ÃÂÃÂÃÂÃÂ^ÃÂÃÂºÃÂÃÂºÃÂÃÂ»oOTÃÂÃÂEÃÂÃÂ¼ÃÂÃÂ§%$U0ÃÂÃÂ­VÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­+ÃÂÃÂÃÂÃÂ¢ÃÂÃÂ¡J\'ÃÂÃÂÃÂÃÂÃÂÃÂ®ÃÂÃÂ£(ÃÂÃÂsÃÂÃÂÃÂÃÂb ÃÂÃÂ2ÃÂÃÂÃÂÃÂ¨ ÃÂÃÂ§	C\ZtkÃÂÃÂ­ÃÂÃÂÃÂÃÂ¶ÃÂÃÂmÃÂÃÂ¨ÃÂÃÂÃÂÃÂ¿\0ÃÂÃÂ¹ÃÂÃÂ¸ÃÂÃÂ¬ÃÂÃÂ¸ÃÂÃÂ»ÃÂÃÂ¨ÃÂÃÂ©\nÃÂÃÂ®YÃÂÃÂ+&@ÃÂÃÂRÃÂÃÂ»ÃÂÃÂ¡DTQ@\0ÃÂÃÂ2ÃÂÃÂÃÂÃÂ\" \06KÃÂÃÂjÃÂÃÂ½ÃÂÃÂvÃÂÃÂ[ÃÂÃÂ¤cÃÂÃÂ¹]ÃÂÃÂÃÂÃÂÃÂÃÂ·ÃÂÃÂ\rÃÂÃÂ¸ÃÂÃÂÃÂÃÂ¯dÃÂÃÂYÃÂÃÂ^ÃÂÃÂ ÃÂÃÂ ÃÂÃÂªÃÂÃÂnÃÂÃÂ:ÃÂÃÂhQÃÂÃÂÃÂÃÂq^FÃÂÃÂ ÃÂÃÂ»ÃÂÃÂ!ÃÂÃÂvÃÂÃÂÃÂÃÂ¨ÃÂÃÂ¥3ÃÂÃÂ¿da5rÃÂÃÂ·ÃÂÃÂeÃÂÃÂ¦ÃÂÃÂ¢ÃÂÃÂTÃÂÃÂÃÂÃÂ¼ÃÂÃÂ§ÃÂÃÂ¶ÃÂÃÂ«SRuÃÂÃÂÃÂÃÂ¢ÃÂÃÂ ÃÂÃÂªÃÂÃÂÃÂÃÂ%E0ÃÂÃÂmÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂ£]*-RÃÂÃÂ¦\0\'\0ÃÂÃÂ©IÃÂÃÂh~ÃÂÃÂÃÂÃÂgÃÂÃÂKÃÂÃÂr-MÃÂÃÂÃÂÃÂ¹EÃÂÃÂ¯ÃÂÃÂÃÂÃÂ©ÃÂÃÂªwÃÂÃÂ»ÃÂÃÂÃÂÃÂ®ÃÂÃÂAÃÂÃÂ°ÃÂÃÂ³HhjHÃÂÃÂ²t#ÃÂÃÂ³*Q\0BJ&,ÃÂÃÂÃÂÃÂ#ÃÂÃÂÃÂÃÂ \ZLÃÂÃÂºwtÃÂÃÂÃÂÃÂwvb\nÃÂÃÂ¢vsCÃÂÃÂUÃÂÃÂ±`zÃÂÃÂ´ÃÂÃÂÃÂÃÂÃÂÃÂ¡ÃÂÃÂ©XÃÂÃÂ¤ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ%dz~\"yÃÂÃÂ¬ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂPPÃÂÃÂ°ÃÂÃÂ>!8ÃÂÃÂÃÂÃÂ©-ÃÂÃÂ­ÃÂÃÂ¦ÃÂÃÂ/ÃÂÃÂ¥ÃÂÃÂÃÂÃÂÃÂÃÂGmÃÂÃÂ@ÃÂÃÂJjÃÂÃÂÃÂÃÂ BÃÂÃÂ¨ÃÂÃÂªÃÂÃÂ¡ÃÂÃÂH2F8ÃÂÃÂÃÂÃÂ²	F	:ÃÂÃÂ°ÃÂÃÂ´ÃÂÃÂ2)!VÃÂÃÂ+ÃÂÃÂ¢%1ÃÂÃÂÃÂÃÂÃÂÃÂJbÃÂÃÂªÃÂÃÂ9\ZÃÂÃÂ»ÃÂÃÂ´ÃÂÃÂÃÂÃÂ¬ÃÂÃÂ­ÃÂÃÂµÃÂÃÂÃÂÃÂ£ÃÂÃÂ°ZÃÂÃÂÃÂÃÂ³fÃÂÃÂ?VÃÂÃÂÃÂÃÂªÃÂÃÂ®Y\"ÃÂÃÂ­MÃÂÃÂºfTÃÂÃÂÃÂÃÂ7EÃÂÃÂ¢(D9;BÃÂÃÂ ÃÂÃÂ¦ÃÂÃÂ sPÃÂÃÂÃÂÃÂÃÂÃÂ»ÃÂÃÂ¤~ÃÂÃÂ´GÃÂÃÂÃÂÃÂvÃÂÃÂÃÂÃÂ¶ÃÂÃÂn)(kÃÂÃÂ³ÃÂÃÂ¼ÃÂÃÂÃÂÃÂI=RqgÃÂÃÂ¶ÃÂÃÂÃÂÃÂ9$-TÃÂÃÂtÃÂÃÂ¥]LÃÂÃÂpÃÂÃÂ¿ÃÂÃÂ°\"ÃÂÃÂÃÂÃÂÃÂÃÂµmÃÂÃÂÃÂÃÂ¹ÃÂÃÂÃÂÃÂ°\rl]ÃÂÃÂ ÃÂÃÂ´ÃÂÃÂ·ÃÂÃÂ|ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂtXQpN15;ÃÂÃÂÃÂÃÂªÃÂÃÂÃÂÃÂÃÂÃÂ¤leÃÂÃÂ£ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂ¥ÃÂÃÂ	rÃÂÃÂyÃÂÃÂªÃÂÃÂ[MÃÂÃÂºz0ÃÂÃÂZÃÂÃÂ£	\ZÃÂÃÂºÃÂÃÂ«ÃÂÃÂ«=pHRYÃÂÃÂ\\ÃÂÃÂ²ÃÂÃÂÃÂÃÂ±PC1ÃÂÃÂ¥iÃÂÃÂ²A@$ <$ÃÂÃÂBHÃÂÃÂ¥ÃÂÃÂÃÂÃÂ·ÃÂÃÂcÃÂÃÂ1ÃÂÃÂºÃÂÃÂ$\rKR.ÃÂÃÂÃÂÃÂYÃÂÃÂºÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂnEW3ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂºÃÂÃÂ©$ÃÂÃÂÃÂÃÂ¨qw!M\ZjeÃÂÃÂÃÂÃÂPÃÂÃÂc)=QÃÂÃÂÃÂÃÂ¹1ÃÂÃÂ»ÃÂÃÂ(qiTldj.ÃÂÃÂ¨ÃÂÃÂÃÂÃÂD) ÃÂÃÂ²4KÃÂÃÂ³&SXÃÂÃÂ©ÃÂÃÂ-QjÃÂÃÂ¨ÃÂÃÂLÃÂÃÂ­-AÃÂÃÂ¦ÃÂÃÂ®iÃÂÃÂÃÂÃÂ¦ÃÂÃÂªJÃÂÃÂ8ÃÂÃÂKÃÂÃÂÃÂÃÂ¹ÃÂÃÂVOc[UÃÂÃÂÃÂÃÂ[HÃÂÃÂ]fhÃÂÃÂª}iÃÂÃÂÃÂÃÂÃÂÃÂ(8ÃÂÃÂ¿\0hÃÂÃÂwÃÂÃÂ¦jÃÂÃÂÃÂÃÂ«xÃÂÃÂ°PqÃÂÃÂÃÂÃÂÃÂÃÂªÃÂÃÂp|B<ÃÂÃÂlPAÃÂÃÂ¨ÃÂÃÂÃÂÃÂ»dRnÃÂÃÂeÃÂÃÂ¦ÃÂÃÂ	ÃÂÃÂHPÃÂÃÂ\nDÃÂÃÂ)(\0RÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂ»kÃÂÃÂ´V,\r$ÃÂÃÂ|ÃÂÃÂ¶ÃÂÃÂ©ÃÂÃÂ¯5utÃÂÃÂ¤ÃÂÃÂRZBÃÂÃÂÃÂÃÂ£DÃÂÃÂ¶ÃÂÃÂ¾ÃÂÃÂUq\0:ÃÂÃÂÃÂÃÂ/ÃÂÃÂ»ÃÂÃÂªÃÂÃÂÃÂÃÂºg 9ÃÂÃÂÃÂÃÂ©ÃÂÃÂ*DÃÂÃÂÃÂÃÂÃÂÃÂ6ÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂ¾ÃÂÃÂ­ÃÂÃÂÃÂÃÂ·ÃÂÃÂµ[pÃÂÃÂµtÃÂÃÂÃÂÃÂ©ÃÂÃÂ¡ÃÂÃÂ|ÃÂÃÂ´ÃÂÃÂ«ÃÂÃÂ¨ÃÂÃÂºv5&ÃÂÃÂÃÂÃÂLÃÂÃÂ®ÃÂÃÂMÃÂÃÂOT2*\nÃÂÃÂ²ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ·nÃÂÃÂ¤ÃÂÃÂ¬ÃÂÃÂÃÂÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂ²ÃÂÃÂµ\"ÃÂÃÂjÃÂÃÂHÃÂÃÂaÃÂÃÂ¹{ÃÂÃÂÃÂÃÂAÃÂÃÂ³ÃÂÃÂ¾QÃÂÃÂ¼ÃÂÃÂºÃÂÃÂ£ÃÂÃÂ3ÃÂÃÂÃÂÃÂÃÂÃÂ¹ÃÂÃÂAÃÂÃÂnÃÂÃÂ¶ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ=I|ÃÂÃÂ3ÃÂÃÂÃÂÃÂ 0c ÃÂÃÂÃÂÃÂCÃÂÃÂAÃÂÃÂº5ÃÂÃÂ® 4ÃÂÃÂ¨ÃÂÃÂ WkÃÂÃÂ¦@ÃÂÃÂÃÂÃÂÃÂÃÂ¥ÃÂÃÂÃÂÃÂ¼ÃÂÃÂ´h21ÃÂÃÂ dÃÂÃÂÃÂÃÂÃÂÃÂ`<ÃÂÃÂ<tÃÂÃÂ<3ÃÂÃÂ®ÃÂÃÂ«ÃÂÃÂ¯9ÃÂÃÂÃÂÃÂsÃÂÃÂTÃÂÃÂ¹ÃÂÃÂ»ÃÂÃÂÃÂÃÂÃÂÃÂ¼ÃÂÃÂÃÂÃÂ®ÃÂÃÂ\ZÃÂÃÂÃÂÃÂ¼lBÃÂÃÂ \"ÃÂÃÂ³vÃÂÃÂ¦ÃÂÃÂ!)DÃÂÃÂÃÂÃÂÃÂÃÂ§ÃÂÃÂ¿\0:jÃÂÃÂ{BÃÂÃÂÃÂÃÂÃÂÃÂµÃÂÃÂÃÂÃÂ¶\n	ÃÂÃÂ\'IÃÂÃÂ°ÃÂÃÂÃÂÃÂÃÂÃÂ¿w=\Z4ÃÂÃÂºkkVJÃÂÃÂ¢wÃÂÃÂ¶ÃÂÃÂÃÂÃÂ¥JIÃÂÃÂ»ÃÂÃÂ©ÃÂÃÂ«nb8uÃÂÃÂYQ+ÃÂÃÂÃÂÃÂÃÂÃÂ ;ÃÂÃÂg8ÃÂÃÂ§WDÃÂÃÂÃÂÃÂ¶tÃÂÃÂÃÂÃÂ¦xÃÂÃÂºbÃÂÃÂt\0TÃÂÃÂ\ZÃÂÃÂ£ÃÂÃÂÃÂÃÂ¡ÃÂÃÂÃÂÃÂÃÂÃÂ a(\0`\nRCÃÂÃÂ\0-\Z4-ÃÂÃÂ±!#JnÃÂÃÂtA0ÃÂÃÂ¤b&ÃÂÃÂ\0ÃÂÃÂ·ÃÂÃÂ\08ÃÂÃÂÃÂÃÂ-xVÃÂÃÂ¬ÃÂÃÂ ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ<ÃÂÃÂÃÂÃÂÃÂÃÂ±\0ÃÂÃÂz|<4hÃÂÃÂ|ÃÂÃÂÃÂÃÂ®ÃÂÃÂÃÂÃÂpÃÂÃÂ¢]\rÃÂÃÂaa~#ÃÂÃÂÃÂÃÂÃÂÃÂ:ÃÂÃÂ¢[ÃÂÃÂ³AÃÂÃÂ®ÃÂÃÂ1ÃÂÃÂ¦ÃÂÃÂ¿\0ÃÂÃÂÃÂÃÂÃÂÃÂ?ÃÂÃÂ>?ÃÂÃÂ¦ÃÂÃÂ\Z\nÃÂÃÂ©ÃÂÃÂ*\rAÃÂÃÂÃÂÃÂqÃÂÃÂÃÂÃÂ´ÃÂÃÂ¦ÃÂÃÂ¢ÃÂÃÂÃÂÃÂ²ÃÂÃÂÃÂÃÂ:ÃÂÃÂ³}5ÃÂÃÂ¬VÃÂÃÂ¢ÃÂÃÂI .BÃÂÃÂ¢ÃÂÃÂUÃÂÃÂ±qÃÂÃÂWÃÂÃÂÃÂÃÂ2 nÃÂÃÂÃÂÃÂÃÂÃÂ°  \r\Z4ÃÂÃÂªÃÂÃÂ§ÃÂÃÂÃÂÃÂhÃÂÃÂÃÂÃÂ Jn=ÃÂÃÂÃÂÃÂ½Ma\"ep@)ÃÂÃÂHlÃÂÃÂ¤xyÃÂÃÂ0ÃÂÃÂ£fÃÂÃÂ\ZÃÂÃÂ¿ÃÂÃÂ',75.4765,1,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\porta-celular.jpg'),(8,'mouse','fgfg',3,_binary 'ÃÂ¿ÃÂÃÂ¿ÃÂ \0JFIF\0\0`\0`\0\0ÃÂ¿ÃÂ¾\0;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 90\nÃÂ¿ÃÂ\0C\0\n\n\n\r\rÃÂ¿ÃÂ\0C		\r\rÃÂ¿ÃÂ\0\0h\0h\0ÃÂ¿ÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÃÂ¿ÃÂ\0A\0\r\0\0\0\0\0!\"1AQ	aÃÂ2BqbrÃÂ$ÃÂÃÂ°%3CRcsÃÂÃÂÃÂÃÂ¡ÃÂ±ÃÂÃÂÃÂ¿ÃÂ\0\0\0\0\0\0\0\0\0\0\0\0\0ÃÂ¿ÃÂ\00\0\0\0\0\0\0\0!1AQ\"aqÃÂÃÂÃÂ¡ÃÂ°#2RÃÂ¡BÃÂ±ÃÂÃÂ¿ÃÂ\0\0\0?\0ÃÂªÃÂ\0P\0PJ\0ÃÂ +@@@@@@AÃÂ¯ÃÂ~ÃÂ·^6ÃÂb4ÃÂ´\r9wÃÂeÃÂ½ÃÂ/mÃÂÃÂÃÂ%l:a\nqÃÂ)+ÃÂ ÃÂ ÃÂºÃÂgNÃÂÃÂÃÂ§\ZÃÂQn)ÃÂvÃÂ½TÃÂÃÂ¡.VÃÂ­ÃÂÃÂ¥-iRBÃÂ)ÃÂ¼/%$k@ÃÂ=eeÃÂ¦ÃÂ{ÃÂ¢ÃÂÃÂaÃÂ°ÃÂ°ÃÂ²ÃÂ¶ÃÂ®zÃÂÃÂ´ÃÂÃÂµÃÂ©ÃÂµÃÂÃÂ¯ÃÂ ÃÂÃÂ¶ÃÂ:ÃÂ´ÃÂ&ÃÂÃÂmÃÂ¬ÃÂ¿ÃÂ©8ÃÂ§	UÃÂ®ÃÂÃÂ´ÃÂÃÂ­ÃÂ¹ÃÂ2HÃÂ¢ÃÂ´ÃÂ¡ÃÂÃÂaÃÂ¯ÃÂ©ÃÂÃÂÃÂ½ÃÂ»ZÃÂ±rÃÂ¿\0%ÃÂ¸{ÃÂ¾2bUÃÂ´ÃÂ¯EuN/{ÃÂ¾ÃÂÃÂ¶ÃÂÃÂÃÂ½ÃÂZÃÂ;ÃÂfÃÂ1x	ÃÂ)ÃÂ¯ÃÂÃÂOÃÂ°iÃÂ®*?`kÃÂ1ÃÂ(#@VÃÂ(ÃÂ(ÃÂ(ÃÂ(4|i7ÃÂ¶ÃÂ¶ÃÂ»i= ÃÂÃÂ¥lÃÂ,ÃÂ0ÃÂ¢3ÃÂ/ÃÂpÃÂÃÂÃÂ¾ÃÂ­ÃÂ¦ÃÂÃÂÃÂRÃÂ¶XÃÂÃÂ«%ÃÂI[mÃÂi33jqÃÂrI=\0ÃÂÃÂ¹ÃÂOZÃÂ¹ÃÂÃÂ:=ÃÂ;ÃÂ©ÃÂÃÂÃÂ&ÃÂ°ÃÂÃÂOÃÂ¯MGÃÂº/vÃÂ±ÃÂ¼]cihÃÂªb2ÃÂÃÂÃÂ+h)iÃÂ¦ÃÂOÃÂ©SÃÂ«ÃÂÃÂ°{gÃÂ­YÃÂ´]\ZÃÂ¹ÃÂrÃÂ~ÃÂ|ÃÂ¼ÃÂ¹+ÃÂ¿sÃÂ6ÃÂ¯ÃÂ¿\0d&ÃÂÃÂÃÂÃÂM\rI6sRÃÂÃÂ·ÃÂ°ÃÂºJzÃÂÃÂ§CÃÂ´ÃÂÃÂ´ÃÂPZÃÂ\\~ÃÂÃÂiÃÂ¥ÃÂ¶{ÃÂ£TÃÂ­k:PÃÂ«lÃÂÃÂ­m-ÃÂÃÂBÃÂÃÂ´ÃÂÃÂµÃÂ¹ÃÂÃÂÃÂ?ÃÂÃÂ²ÃÂ¹ÃÂ¨ÃÂ§ÃÂ¾ÃÂÃÂÃÂÃÂ®ÃÂ±ÃÂ­ÃÂ³2ÃÂ¶ÃÂ«ÃÂ£S~ÃÂÃÂÃÂ¯ÃÂ´LÃÂ\0	TÃÂ#ÃÂªÃÂÃÂ·ÃÂªZpÃÂ­ÃÂ¾ÃÂM@&ÃÂÃÂ¼KÃÂ¶rÃÂ-/UÃÂ«JNpÃÂÃÂÃÂºÃÂÃÂdÃÂ¿\0ÃÂ¶MÃÂ¹ÃÂ¨	/eÃÂ¿[uÃÂ§ZnnpÃÂDÃÂoÃÂ¥ÃÂ¦ÃÂÃÂº)$ÃÂÃÂ¼ÃÂ¨ÃÂº\0ÃÂ \n\0ÃÂ (|ÃÂÃÂ§;ÃÂ¶ÃÂ®ÃÂ¢YÃÂÃÂªÃÂ·3P!ÃÂÃÂ¼cxveÃÂºcÃÂ¡ÃÂÃÂ´!ÃÂ¬ÃÂ½ÃÂ¨N6ÃÂÃÂ£ÃÂ¬ÃÂÃÂ®ÃÂ¥iÃÂ`ÃÂÃÂ»/ÃÂ½DÃÂÃÂ¨ÃÂÃÂÃÂÃÂ±!)\n\nH\'ÃÂyÃÂ½EsÃÂ¯SÃÂ©ÃÂÃÂ¼ÃÂÃÂ¸ÃÂªcÃÂ¦-tÃÂ½ZÃÂÃÂ¼ÃÂ¨zFÃÂ£uEUÃÂ£EÃÂ2{?8ÃÂÃÂ£ÃÂ¨K=UÃÂ®ÃÂ§ÃÂÃÂ.ÃÂÃÂ¸ÃÂ°ÃÂ©ÃÂÃÂJÃÂÃÂÃÂ\nÃÂÃÂ¡$ÃÂ´ÃÂÃÂ¸ÃÂÃÂÃÂJWÃÂ½%ÃÂÃÂ²ÃÂÃÂÃÂjÃÂÃÂ´kÃÂ­6ÃÂUk4ÃÂ±ÃÂ[ÃÂ ÃÂÃÂ¹ÃÂ¹ÃÂunÃÂÃÂÃÂ¦ÃÂÃÂ¬EÃÂp-.ÃÂ ÃÂ°QÃÂqÃÂÃÂ¤ÃÂ§ÃÂ¡ÃÂ´5ÃÂt?NÃÂÃÂµÃÂ¯ÃÂÃÂ¬ÃÂ¬mÃÂ¾ÃÂKÃÂ©\\TÃÂ·ÃÂÃÂ·SÃÂºOÃÂ>ÃÂÃÂ«RÃÂ¢ÃÂ¾ÃÂ«r2ÃÂ6ÃÂ§vBzÃÂ¸ÃÂÃÂ«]\'K[ÃÂÃÂz^ÃÂ¶v|;R	ÃÂ¶ÃÂ¬ÃÂºÃÂ´ÃÂ¤ÃÂRÃÂ ÃÂÃÂYHÃÂ®ÃÂ­ÃÂ¢ÃÂ²ÃÂÃÂ¡>ufÃÂc/ÃÂ®D>ÃÂ|ÃÂ¶ÃÂ¶}ÃÂVk}lÃÂ³ÃÂ\ZÃÂ¶[ÃÂ¢ÃÂ·laÃÂ8ÃÂ¤2ÃÂ«ÃÂ®ÃÂkQ@<TRÃÂ\'ÃÂ©;ÃÂÃÂÃÂ­ÃÂÃÂ§ÃÂ,ÃÂ¾gXjÃÂ\n\0ÃÂ \nÃÂ½\ZÃÂ±ÃÂ­ÃÂ°ÃÂMeÃÂ«ÃÂXBlÃÂ¶ÃÂSÃÂUÃÂªÃÂ¶ÃÂRÃÂ>ÃÂª	zÃÂÃÂªÃÂ¥=)ÃÂ§^|ÃÂ©ÃÂÃÂY[ÃÂRÃÂºÃÂ©DÃÂ¤ÃÂÃÂ·&ÃÂ©ÃÂÃÂ¿\rÃÂ¶%ÃÂÃÂ¢ÃÂÃÂÃÂ¹ÃÂ¶ÃÂ°WÃÂCÃÂÃÂPoÃÂ ÃÂ£ÃÂÃÂÃÂ½ÃÂ«ÃÂj.jÃÂ¶ÃÂ¤ÃÂf}ÃÂÃÂ¨ÃÂºÃÂªzvÃÂÃÂqÃÂMqÃÂ^sÃÂ·{ÃÂÃÂ¥ÃÂQÃÂªFÃÂÃÂ¸0ÃÂÃÂeÃÂTFÃÂ¢>|E%=xÃÂ¿\0,`ÃÂ½+XÃÂ·ÃÂk_j4ÃÂ©[ÃÂÃÂ¸ÃÂÃÂºÃÂ²ÃÂ¶_s[ÃÂµ}ÃÂÃÂ§c(ÃÂÃÂ~~ÃÂ¸\Z+ÃÂ¾ÃÂÃÂÃÂ¤ÃÂÃÂÃÂ¹ÃÂ±ÃÂ9ÃÂ!ÃÂ`8!\0d|gÃÂ©ÃÂ¿\0ÃÂ}ÃÂ¥ÃÂ©ÃÂ&ÃÂÃÂ0ÃÂY/rxÃÂÃÂ¥/ÃÂ¡ÃÂ±ÃÂ½BÃÂµ=FÃÂ£ÃÂ¥ÃÂ½HÃÂ¬.9XÃÂ¥.WÃÂjwNÃÂÃÂn$ÃÂZKÃÂ/ÃÂÃÂÃÂ¸(ÃÂ§ÃÂ¡ÃÂ¶>ÃÂ¸ÃÂºÃÂ/ÃÂªÃÂ´ÃÂ»[JÃÂ®ÃÂ­ÃÂÃÂÃÂ¼ÃÂÃÂ¾&ÃÂuÃÂÃÂ¨ÃÂ¸ÃÂµÃÂÃÂ¶ÃÂ«ÃÂÃÂ²ÃÂ»dmÃÂÃÂÃÂ§ÃÂQV=ÃÂ°ÃÂ¢QÃÂ¸ÃÂ¸zYÃÂ§ÃÂÃÂÃÂ«QÃÂÃÂ¸NÃÂ§pÃÂzÃÂÃÂ­T7ÃÂ.ÃÂÃÂ¬ÃÂqÃÂ,ÃÂ¯ÃÂ§ÃÂÃÂiÃÂª~ÃÂ:EÃÂ.wÃÂ*ÃÂ¹0)8W\'ÃÂ°[ÃÂ´h6?ÃÂ`6ÃÂmÃÂÃÂ^I5P@PB@M\nÃÂ¾\'ÃÂÃÂ·o=ÃÂÃÂµ^ÃÂÃÂ°ÃÂÃÂÃÂuÃÂ¸ÃÂ¿,ÃÂ¦ÃÂ¢eÃÂÃÂ~ÃÂ½+tÃÂÃÂÃÂ$ÃÂÃÂ§ÃÂh=o~3ÃÂJÃÂÃÂ­ÃÂÃÂÃÂ¤ÃÂªÃÂ£q{ÃÂ®/6ÃÂ¿\0VÃÂeÃÂ¦ÃÂ¡ÃÂ®kmÃÂI\0wÃÂÃÂ°ÃÂ§=@ÃÂºÃÂµÃÂ¯ÃÂ¾ÃÂÃÂHÃÂ¹ÃÂ´ÃÂ¥ÃÂÃÂÃÂ~ÃÂ¥ÃÂ»ÃÂ·ÃÂ«9ÃÂQÃÂ¦ÃÂ±ÃÂ½ÃÂÃÂwKÃÂ§ÃÂ¿qÃÂ ÃÂ¶>ÃÂ«ÃÂI~+ÃÂ¥ÃÂ°ÃÂ0ÃÂ ÃÂÃÂÃÂ«ÃÂ¶ÃÂ¬ÃÂ¯GÃÂÃÂ/s]rÃÂ±ÃÂ¿ÃÂÃÂ¬ÃÂÃÂÃÂªRÃÂ²ÃÂÃÂ¬ÃÂ­%ÃÂ\ZÃÂ®ÃÂ±ÃÂÃÂ¾ÃÂ«eÃÂ¹4ÃÂ·ÃÂÃÂ=ÃÂZÃÂÃÂªÃÂÃÂ¯\n	_ÃÂÃÂÃÂ¿\0ÃÂÃÂµÃÂÃÂ¨WÃÂ\nÃÂ®ÃÂ¤ÃÂPÃÂÃÂÃÂÃÂcÃÂ¤9UJÃÂ¥ÃÂÃÂ­.ÃÂ©IcÃÂÃÂ²ÃÂ»p4ÃÂºÃÂQÃÂ·9RÃÂ ÃÂ§@ZÃÂ²FÃÂÃÂ²ÃÂ­sWÃÂ:ÃÂªÃÂ¿\0MbOÃÂÃÂÃÂ·8ÃÂÃÂ¤*(=ÃÂ¹BYÃÂÃÂ¥ÃÂÃÂ¶ÃÂÃÂ(ÃÂ¤ÃÂjÃÂÃÂÃÂ±ÃÂ³ÃÂ®bÃÂÃÂÃÂÃÂOÃÂÃÂÃÂmÃÂ¤ÃÂÃÂ»ÃÂÃÂÃÂ£4{yWÃÂ­ÃÂÃÂ«1ÃÂÃÂ¢3ÃÂÃÂ\\ÃÂWÃÂÃÂ´ÃÂ¬ÃÂ5IÃÂµÃÂÃÂ£\"ÃÂµÃÂÃÂ¡KÃÂÃÂÃÂ¥ÃÂ¡ÃÂmÃÂ°ÃÂÃÂ¶ÃÂb$VÃÂÃÂfKM6ÃÂÃÂÃÂ$a }\0ÃÂ¨<ÃÂ\"ÃÂÃÂ³.dxÃÂÃÂ%ÃÂ¶ÃÂ£ÃÂhr[ÃÂ®ÃÂ¬%	ÃÂ¤ÃÂÃÂÃÂaÃÂ·#ÃÂ¶NÃÂÃÂ\"Tk\"\\ÃÂÃÂ³ÃÂH.*1ÃÂ¡ÃÂIKpÃÂ¾_ÃÂ¡ÃÂÃÂÃÂ\"ÃÂÃÂ¨ÃÂ¶ÃÂÃÂÃÂºÃÂµ+ÃÂ2ÃÂ°-ÃÂ±JÃÂÃÂ}ÃÂ­]ÃÂ~]\\ÃÂ_I8ÃÂ¥*\'ÃÂ ZÃÂÃÂ23zÃÂ\nÃÂºYfÃÂÃÂ}ÃÂÃÂ4ÃÂ«.ÃÂÃÂ¨ÃÂ¸RÃÂÃÂ¸V\nÃÂ¸(\'\0ÃÂK5=(ÃÂ*k=ÃÂ½ÃÂh}ÃÂXÃÂ¹ÃÂ¸ÃÂÃÂ¥ÃÂÃÂ¿\0\Z0	ÃÂºÃÂ¤!ÃÂÃÂÃÂ¤jÃÂ07rÃÂ¬ÃÂ¥SÃÂÃÂIÃÂ³ÃÂ°ÃÂ´PÃÂ»zÃÂ-&\\ÃÂISyÃÂÃÂ\rz\"ÃÂa2ÃÂ²ÃÂ¨K\\^}@ÃÂ³ÃÂ¿\0ÃÂµ]ÃÂ·ÃÂ«ÃÂº;yBÃÂs,ÃÂ¶ÃÂ¾ÃÂ§\\ÃÂÃÂ½]NÃÂµÃÂ%tÃÂ½ÃÂ¸(ÃÂ´ÃÂÃÂ§ÃÂÃÂ­ÃÂµÃÂ§ÃÂ¡ÃÂÃÂ®#ÃÂ³JÃÂ¹E(	\0ÃÂºÃÂÃÂÃÂÃÂ§ÃÂÃÂ¥ÃÂÃÂµÃÂ´ÃÂ½NÃÂ­ÃÂJÃÂ¬ÃÂ°ÃÂ³ÃÂ?sÃÂÃÂµÃÂÃÂkg_ÃÂÃÂ´YÃÂ«]IÃÂ§ÃÂ·|vÃÂ¹ÃÂ½ÃÂÃÂÃÂ®\0(cÃÂ¦=ÃÂªÃÂ¥ZÃÂDÃÂÃÂ¹ÃÂÃÂ©ÃÂ¬ÃÂºÃÂÃÂÃÂÃÂTÃÂ}ÃÂ2ÃÂ ÃÂÃÂ¤ÃÂ»ÃÂÃÂ)ÃÂ¬ÃÂ£ÃÂ¤ÃÂ¶(ÃÂ¤ÃÂÃÂ;ÃÂ¥ÃÂ¹:)ÃÂ°ÃÂÃÂA}ÃÂÃÂIÃÂ­ÃÂkÃÂ--mÃÂ¢ÃÂ¹ÃÂÃÂTÃÂ¯<}RÃÂÃÂ¿\0RÃÂ°\"ÃÂÃÂ¬ÃÂÃÂ\ZÃÂxÃÂÃÂÃÂ/ÃÂÃÂ¿\0ÃÂ¬uÃÂªÃÂphÃÂ»BÃÂ®ÃÂÃÂ£ÃÂÃÂSÃÂ¬ÃÂºoÃÂ¶ÃÂw\\ÃÂ^XÃÂsÃÂÃÂ	ÃÂ±ÃÂºÃÂÃÂº@B=gÃÂºÃÂºÃÂpÃÂ¤ÃÂuÃÂ¡ÃÂ¹ÃÂ(ÃÂÃÂ7ÃÂ¼-ÃÂÃÂ½zÃÂÃÂ­\0ÃÂÃÂºrkÃÂJ$6y2ÃÂ«]AÃÂ·IÃÂ¿\0ÃÂCÃÂÃÂÃÂ¢ÃÂ¢ÃÂÃÂÃÂÃÂÃÂ©(cÃÂVR<ÃÂpÃÂµdÃÂ\\$ÃÂ ÃÂ£ÃÂ ÃÂªÃÂÃÂ¼ÃÂÃÂÃÂ¦4ÃÂ¸iiDÃÂ¨6QÃÂ^ÃÂ$ÃÂÃÂ¯ÃÂÃÂO.iÃÂ:UÃÂvZÃÂ\nÃÂ!AÃÂ¶ÃÂÃÂ·ÃÂQÃÂoÃÂÃÂ08g)mÃÂX8$yPÃÂÃÂÃÂ½ÃÂ¥!\\P_	-ÃÂ­AjDÃÂÃÂ¨ÃÂ°ÃÂÃÂÃÂÃÂ¨ÃÂÃÂ?ÃÂPÃÂ%;ÃÂ®ÃÂÃÂ-nÃÂµÃÂ³QÃÂ*ÃÂ²RSÃÂ)\'ÃÂªAÃÂºÃÂÃÂzÃÂ£\r&ÃÂÃÂ!ÃÂ°iÃÂ¢ÃÂ³)ÃÂªNxÃÂ½@ÃÂ´ÃÂ»TCÃÂ ÃÂZÃÂ¤ÃÂÃÂÃÂxÃÂÃÂ¶\\ÃÂÃÂÃÂÃÂº_OcVÃÂT.BÃÂ©ÃÂ ÃÂdÃÂ}+ÃÂÃÂ¶ÃÂ©JÃÂµTÃÂ®~ÃÂÃÂÃÂ¥ÃÂÃÂ£ÃÂ¤PDÃÂ±ÃÂµÃÂ2ÃÂ¹ÃÂÃÂ¬ÃÂ¸ÃÂ<ÃÂ°U^ÃÂÃÂ§m\ZTÃÂZK	~ÃÂ¾ÃÂ´ÃÂ¨ÃÂ¶ÃÂÃÂ«V3ÃÂ¨ÃÂ¶O?ÃÂÃÂÃÂ¸;oÃÂ°ÃÂÃÂÃÂÃÂ·]ÃÂ,ÃÂ,ÃÂ·WMVÃÂ»ÃÂÃÂ©ÃÂÃÂ9ÃÂÃÂ°ÃÂÃÂ´\r!ÃÂ»ÃÂÃÂµdÃÂ°ÃÂ°kW5ÃÂÃÂiÃÂÃÂÃÂ¼ÃÂdÃÂ±ÃÂ©1ÃÂoÃÂ°ÃÂÃÂ\\iÃÂÃÂÃÂ«N$ÃÂ¡hXÃÂTB>`ÃÂ»PS};\ZÃÂ·pnUÃÂ§oÃÂ¸ÃÂÃÂ|nYJÃÂ[YÃÂµ,(ÃÂ´AÃÂ½ÃÂÃÂ¡ÃÂ¶)ÃÂ !mÃÂÃÂ6ÃÂqÃÂÃÂ£ÃÂ¨SXYmÃÂ¦$ ÃÂ¡ÃÂ(z(ÃÂ ÃÂ¾ÃÂ´ÃÂ¹r~ÃÂ´	ÃÂ&ÃÂT5ÃÂ£ÃÂÃÂ³ÃÂ0ÃÂªy2ÃÂ§ÃÂ¿$ÃÂ»ÃÂ½FÃÂ¾jSÃÂ4NÃÂ¼ÃÂÃÂ©-ÃÂBV$ÃÂÃÂÃÂÃÂÃÂÃÂ¬ÃÂÃÂ¥ÃÂªÃÂÃÂ¯ÃÂÃÂÃÂ­iÃÂ¤ÃÂ§ÃÂ7pÃÂµÃÂ©ÃÂÃÂ!ÃÂµÃÂ¼ÃÂµÃÂ©	m=NxÃÂ¡]BTÃÂ|ÃÂ}GÃÂÃÂªpkÃÂm\\4ÃÂ³1ÃÂ´%ÃÂ¨ÃÂÃÂ©RÃÂÃÂ:>ÃÂ ÃÂÃÂ$GÃÂd}ÃÂ@MÃÂÃÂEÃÂ¡bJ ÃÂ¥ÃÂ¤ÃÂ­MÃÂ¨ÃÂ§%`ÃÂÃÂ®~EÃÂ«\nÃÂ\ZÃÂ«ÃÂÃÂ¨OIR~FÃÂºÃÂ»ÃÂ¤ÃÂ¦ÃÂJÃÂÃÂÃÂ½ÃÂ£xÃÂÃÂ¼ÃÂ¹\'ÃÂ¿\0ÃÂ=E`ÃÂ$ÃÂ¿ÃÂµ;gyÃÂÃÂÃÂÃÂÃÂºJÃÂt^n1ÃÂ­ÃÂZHi.ÃÂ¸ÃÂ¥@yÃÂ½*ÃÂ§ÃÂ¹>ÃÂÃÂÃÂ­ÃÂ ÃÂ¿NÃÂ½JIÃÂ¨KM~y=!ÃÂlÃÂ±4ÃÂ¥ÃÂÃÂiÃÂÃÂbÃÂ­ÃÂÃÂÃÂÃÂ²ChHJGÃÂVÃÂ}\0P\0ÃÂÃÂ¯\'gÃÂ½/ÃÂ¼ÃÂÃÂ¢ÃÂÃÂ\'vmcÃÂÃÂ£$ÃÂÃÂ³ÃÂWÃÂ¢ÃÂÃÂÃÂÃÂ¯ÃÂ±ÃÂ­ÃÂMÃÂ¡ÃÂ}MÃÂ²ÃÂ^ÃÂªÃÂ·ÃÂ¿muXÃÂtÃÂ	ÃÂÃÂ·ÃÂ|ÃÂÃÂ¯ÃÂW_lÃÂÃÂ´UqÃÂÃÂ  y\nzÃÂ¢ÃÂ©ZTÃÂ}\rÃÂWHaÃÂ´ÃÂÃÂÃÂ=ÃÂ$!ÃÂÃÂ©D.0ÃÂ²*HIGÃÂ½zÃÂµR~H6ÃÂ²W\ZÃÂ¤$ÃÂÃÂ!sÃÂÃÂ¦ÃÂÃÂLJÃÂ¸ÃÂ¼ÃÂÃÂ$	ÃÂ \0ÃÂ¼)\0ÃÂÃÂ¾~u_$#S~}ÃÂ>ÃÂÃÂ¡ÃÂÃÂ!axÃÂ¤ÃÂAaÃÂ£ÃÂÃÂÃÂ uÃÂµÃÂ§ÃÂÃÂ¾FÃÂ§d;3ÃÂ®7j;ÃÂ#iÃÂ»{ÃÂÃÂ&ÃÂBf]ÃÂ¥ÃÂ«ÃÂhGÃÂºÃÂÃÂÃÂºÃÂ¯dÃÂ«ÃÂ¯ÃÂ ÃÂ«VÃÂÃÂ+cÃÂ­ÃÂ½ÃÂ;+ÃÂ¨ÃÂÃÂ\Z`[ÃÂ´ÃÂ¼a*ÃÂ¬ÃÂ³iLÃÂ«ÃÂÃÂ­ÃÂÃÂ¼ÃÂaÃÂ¹ÃÂ|#ÃÂ®TzÃÂ<ÃÂ@@ÃÂ®ÃÂnÃÂÃÂÃÂ©6ÃÂÃÂ¬&.ÃÂ¹(ÃÂ®ÃÂÃÂ%ÃÂ°ÃÂ´->ÃÂ\ZvÃÂÃÂ¬)rÃÂ°ÃÂ¢]ÃÂ¿\0nPÃÂµÃÂÃÂ2ÃÂ·lJ%rXÃÂ½ÃÂ?ÃÂ§SÃÂ»ÃÂ§ÃÂ=9PVÃÂ°ÃÂÃÂ®ÃÂ¶ÃÂªÃÂÃÂQBÃÂÃÂ´ÃÂÃÂ¤ÃÂpAÃÂÃÂÃÂ¨hÃÂÃÂ¥ÃÂ ÃÂÃÂ©6ÃÂ«ÃÂÃÂºEÃÂ¹ÃÂÃÂ ÃÂaÃÂ©ÃÂ¼WÃÂ¼ÃÂºÃÂ¿\0ÃÂ´ÃÂpÃÂ\0ÃÂ9ÃÂÃÂ¥ÃÂÃÂÃÂ­ÃÂ8ÃÂ»4ÃÂ¼8.ÃÂÃÂ\\]_ÃÂ¼k~4cÃÂÃÂÃÂ¥dHpÃÂ£ÃÂ¿?ÃÂ¨ÃÂÃÂ»ÃÂÃÂÃÂ¯ÃÂÃÂÃÂÃÂÃÂ=ÃÂ§mÃÂRÃÂÃÂgÃÂÃÂnÃÂÃÂÃÂ1bÃÂ¶m\0{ÃÂ¾\r@64@@@@GnÃÂÃÂ½ÃÂÃÂ´ÃÂ¦ÃÂ¼GÃÂtÃÂÃÂMÃÂ«$ÃÂ¦ÃÂ¨ÃÂynIIÃÂÃÂÃÂ¸ÃÂÃÂ§1ÃÂ¢ÃÂ¤PIÃÂ¶0ÃÂHÃÂÃÂ¼tÃÂ¼ÃÂ½ÃÂ¤ÃÂ29ÃÂÃÂ«ÃÂÃÂÃÂ­	ÃÂÃÂÃÂ®ÃÂ¸ÃÂ¤ÃÂ¥cÃÂ·0WÃÂÃÂÃÂ@t{g;5YÃÂ¶ÃÂ¡qnÃÂ·yÃÂ]TÃÂDÃÂ¹ÃÂ0ÃÂ¹cÃÂbÃÂ´IÃÂ®ÃÂ²\0dÃÂU`ÃÂO*\0ÃÂ \n\0ÃÂ \n\0ÃÂ \n\0ÃÂ \n\0ÃÂ \nÃÂÃÂ +@@@ÃÂ¿ÃÂ',67.655,0,'C:\\Users\\SENA\\Documents\\NetBeansProjects\\Tienda-Com\\target\\classes\\productos\\portatillnovo.jpg'),(23,'mouse','eacdfs',0,_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�/\nPhotoshop 3.0\08BIM\0\0\0\0\0,Z\0%G\0\0B�7\020200721<\0124448+00008BIM%\0\0\0\0\0lD�.w�@q&���\'ǐ8BIM:\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0printOutput\0\0\0\0\0\0\0PstSbool\0\0\0\0Inteenum\0\0\0\0Inte\0\0\0\0Clrm\0\0\0printSixteenBitbool\0\0\0\0printerNameTEXT\0\0\0\0\0\0\0\0printProofSetupObjc\0\0\0\0A\0j\0u\0s\0t\0e\0 \0d\0e\0 \0p\0r\0u\0e\0b\0a\0\0\0\0\0\nproofSetup\0\0\0\0\0\0\0Bltnenum\0\0\0builtinProof\0\0\0	proofCMYK\08BIM;\0\0\0\0-\0\0\0\0\0\0\0\0\0\0\0printOutputOptions\0\0\0\0\0\0\0Cptnbool\0\0\0\0\0Clbrbool\0\0\0\0\0RgsMbool\0\0\0\0\0CrnCbool\0\0\0\0\0CntCbool\0\0\0\0\0Lblsbool\0\0\0\0\0Ngtvbool\0\0\0\0\0EmlDbool\0\0\0\0\0Intrbool\0\0\0\0\0BckgObjc\0\0\0\0\0\0\0\0\0RGBC\0\0\0\0\0\0\0Rd  doub@o\�\0\0\0\0\0\0\0\0\0Grn doub@o\�\0\0\0\0\0\0\0\0\0Bl  doub@o\�\0\0\0\0\0\0\0\0\0BrdTUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Bld UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0RsltUntF#Pxl@R\0\0\0\0\0\0\0\0\0\nvectorDatabool\0\0\0\0PgPsenum\0\0\0\0PgPs\0\0\0\0PgPC\0\0\0\0LeftUntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Top UntF#Rlt\0\0\0\0\0\0\0\0\0\0\0\0Scl UntF#Prc@Y\0\0\0\0\0\0\0\0\0cropWhenPrintingbool\0\0\0\0cropRectBottomlong\0\0\0\0\0\0\0cropRectLeftlong\0\0\0\0\0\0\0\rcropRectRightlong\0\0\0\0\0\0\0cropRectToplong\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\08BIM\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\08BIM0\0\0\0\0\0\08BIM-\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0[\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0I\0M\0G\0_\02\00\02\00\00\07\02\01\0_\01\02\04\04\04\07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0 \0\0\0\0Rghtlong\0\0 \0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\n8BIM\0\0\0\0!\�\0\0\0\0\0\0�\0\0\0�\0\0\�\0,\0\0\0!�\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\�8BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\06\0\0\0\08BIM\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\0(\�\�\0��\�\0(\�\�\0��\�\0(\�\�\0\0�N\�\0,\�\�\0��\�\0(v\'\0��\�\0(v\'\0\0��;\0*��\0��;\0*��\0��;\0*��\0\0�\�N\09��\0�\�N\09��\0�\�N\09��\0\0�؝\09��\0�؝\09��\0�؝\09��\0\0��;\0:\0\0\0��;\0:\0\0\0��;\0:\0\0\0\0�\0\0\0;�;\0�\0\0\0;�;\0�\0\0\0;�;\0\0�;\0=bv\0�;\0=bv\0�;\0=bv\0\0��\0>��\0��\0>��\0��\0>��\0\0�\�N\0?��\0�\�N\0?��\0�\�N\0?��\0\0�؝\0A\�N\0�؝\0A\�N\0�؝\0A\�N\0\0�؝\0F\'b\0�؝\0F\'b\0�؝\0F\'b\0\0\�N\�\0I�\0\�N\�\0I�\0\�N\�\0I�\0\0ű;\0O�;\0ű;\0O�;\0ű;\0O�;\0\0\��\0W�\�\0\��\0W�\�\0\��\0W�\�\0\0\�;\0d��\0\�;\0d��\0\�;\0d��\0\0\�bv\0t��\0\�bv\0t��\0\�bv\0t��\0\0\�N\�\0�bv\0\�N\�\0�bv\0\�N\�\0�bv\0\0\�\�N\0�\'b\0\�\�N\0�\'b\0\�\�N\0�\'b\0\0\�\�N\0�;\0\�\�N\0�;\0\�\�N\0�;\0\0�D\�\0�I\�\0��\�\0�;\0��\�\0�;\0\0�bv\0�\'b\0�bv\0�\'b\0�bv\0�\'b\0\0�؝\0�\�N\0���\0�v\'\0���\0�v\'\0\0�؝\0\�N\�\0��\�\0ǉ\�\0��\�\0ǉ\�\0\0��;\0\�\�\�\0~�\�\0Ɲ�\0~�\�\0Ɲ�\0\0h\�N\0\�\�\�\0b;\0�;\0b;\0�;\0\0Xbv\0���\0T\0\0\0���\0O��\0���\0\0V؝\0y��\0X\'b\0v\0\0\0X\'b\0v\0\0\0\0X؝\0u�\0X؝\0u�\0X؝\0u�\0\0X\0\0\0s�\�\0X\0\0\0s�\�\0X\0\0\0s�\�\0\0Xbv\0q��\0Xbv\0q��\0Xbv\0q��\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0Zv\'\0l\0\0\0\0h�\�\0I��\0v\0\0\0>\�N\0v\0\0\0>\�N\0\0x�\0>\0\0\0x�\0>\0\0\0x�\0>\0\08BIM\0\0\0\0\0\0\0\0\0\0�\�%\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\�\0\0\0\0\0\0\0\�(\0\0\0\0\0\0\01\0\0\0\0\0\0\0�2\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0ipp\0�i\0\0\0\0\0\0(\0\0�\0\0\0HUAWEI\0JKM-LX3\0\0\0\0H\0\0\0\0\0\0H\0\0\0Adobe Photoshop CS6 (Windows)\02020:07:21 13:18:42\0\0\0\0\0(��\0\0\0\0\0\0��\0\0\0\0\0\0�\"\0\0\0\0\0\0\0�\'\0\0\0\0�\0\0�\0\0\0\0\00210�\0\0\0\0\0\0�\0\0\0\0\0\02�\0\0\0\0\0�\0\0\0\0\0\0F�\0\n\0\0\0\0\0N�\0\0\0\0\0\0V�\0\n\0\0\0\0\0^�\0\n\0\0\0\0\0f�\0\0\0\0\0\0n�\0\0\0\0\0\0\0�\0\0\0\0\0�\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0v��\0\0\0\0\0\0~��\0\0\0\0\0\0���\0\0\0\0\0\0��\0\0\0\0\00100�\0\0\0\0\0\0\0�\0\0\0\0\0\0 �\0\0\0\0\0\0 �\0\0\0\0\0\0��\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0��\0\0\0\0\0\Z\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0�	\0\0\0\0\0\0\0\0�\n\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0��\0;�\�\0\0\0\0�\0\0\0d2020:07:21 12:44:48\02020:07:21 12:44:48\0\0\0\0_\0\0\0d\0�\�\0\0\'\0\0\0�\0\0\0d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0�\0\0\0d\0\0$\0\0\�354642\0354642\0354642\0\0\0\0d\0\0\0d\0\0\0\0\0\0\0R98\0\0\0\0\0\00100\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\n\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0!�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0�T�I%)$�IJI$�R�I$���I%)$�IJI$�R�I$���I%)$�IO�\��T�I%)$�IJI$�R�I$���I%)%_3?�W7\"�j�>絀�\�V%�\0\�\�N\�^S�\�\�k{���Zڿ�D��i.J\��\�\Z�\�S{��C\0�\0ώV���\�\�K\�{���\0\�ҥ=\ZK3\�\'Dȍ�u��\����kV�\\\�\0\�ZujIK��I)I$�J�\��T�I%)$�IJI$;���\�m\�mu�W=\�\0�\�RD�\�L\Z��s1\�gҲ\��\�r\�:\��ʢ�\�:%c!\�AʲEC�*�w�.�uN�\�rve�ge\�\�^=|������{+\�\��bJ{ί�3\�m�f\�X�˵\�k/�85\�\�(Ĭ}�\'����[/\�\�\��.\����M�s\0�M��z�c�5\�����*��\�+������2\�\�\��O\���r���&\�\�\��\�2^\���\0e-\�m�Ѭo\�o�\�\�\�\�eT��\�6��\�u\�\�6e\�\\v���۞\���s�\��-��\��V��\�W�SCꖏ\�,���\0\��?���/T\�\�ֺک�\�ikݐ\���9�\�]�[�\�����\0\�*�t\���5��8\�\�}\�ѱ������QHs+��]\�\�r?\�~�V��\���1\�e\�\�Ǽ��l,�{\�õ\�\�\�k\�\��\0\�ت��q\�)u.��Ԭ\�{�ki�\�f�o����꟭\Z���\�\�\�uP\Zt]\'D�\�~ֳJ\�\\Ѥ����·1\�V��;�?b��� �p�.�\0�۵>Ӂ��.7MA\�w\��yC��\0Al�#�������?Cc\�\�\�\�\�\�m�Gw���f�+cg\�u\��?�����\0�\�S��I$��\��T�I%)$�;�\�\�eW�]qoQɟB��o\�d[��3\��\0.Ĕ�\�ּ�Ykϩ�~�C�:��\�?�sү��\��\�_\�}n\�\��}�\�\�\��\0\\�qgYnF]\�\�\�y�גK��;��\�(� h�Q��t��e亲Sp�8F`���\�^��\0���\��u^\��J��sr:�9�ۄ,\�m�퍶��;�\�\�\�\�?��\0�x]3+�\��Ex\��$���\���\�r,o�\�K+\�\�U2멘�\0;���G�\�qn\�2sv�\�1\��?IO�U4�����\"�מ�\�1\�\�\���~&\rd�^��e���s\�}T\�m�ǿ}��W��`\�ش\�:vef��Ĳ\�mu\��c+;\��-����\0ξ\��I)\�\�ů��Y\�۳����\�\0\�:�i��ߧ�\���W�[1�\0D��2rr���c�ȴ\�\�w\'�\Z}7\�\�[=��G�lܛ_q\�\�ʶ\�Yg\�\�\�\�^�\0Z\�]�\0E����=N������\�fd��5S�]E�9�%9x�Yy66��\��\0A��\�\�h[G�t\�=N��\�Kz}�\�ɶ\�{1�\�\�U�>�\�\�ߋ\�\�=7\�>�\��v�\�\'7M��8��lYI���3撛3ib\�kѺ�X���\�\���\�}_ķ�g�K���\0I�\�\�k\�\��q?G�\��\0\��\0��\��\0��j�Ⱦ�1\�m�\�UX�\�\����\Z�����\�p�\��X\�5�Y�amb\�\��O�\�n��ݔ\����\��\0��T:OV\��MxV\�\�X\Z\����f\�[W�	��!}T\�y�}FϪX\�\���\�%;�\�\����\�z~�{\�W��OR��\�[Q8�%�\�Zp�?�Sc�Y�f�k��#\�S�30^2�-i��05\�ǟ�&��MH)\�.6PX\���\�\�{Ƭw��-VW\'�3���c�d6\����egk��\0&\�Sr\�S�\��T�X[��\�}\\\�\�B�F.4�\�]C�\���\0\�\�IL~�}n\����\Z\�/\�W��\\Y�z�ǹ���\0\�\�T��\���\�δߕ{�[k��\�Z\��u3�M�\n\�e�\�s��7\�^wYa\���`�\0UF��\01\Z��AI+b�\�k��\�\r�\�\��\0)\�LkZ\�e�mm\�:�P�.\�E:4H�\�wg��\0һ���Y\�e�\�ϝ�u�2Ƿ�}\n?{�o�\0�&6�[�[��&\�\�\\\�\�nZy\�t����^C!�\0N�\�z���\�\��\�%�Y�5~\�\Zw\�\�\�v�\��c���\�0\�H�3\\\\N\�\�g�7}-�����\Z4\0<�N\Z\�41�\Z8LQR΃\�B@\�O�r�JHQ)7s�J�\����y�o����jǫ��:T\�E��\0M�\�\�W�\0^��Jw��t2�ծdۑ5\�5>\�r���\�i�\0��\0�ad�g\�G��z�n\�\�\�N\�[u\��\�\��h�\0����\0�]_מ�:?Mf	mY�\���\�\�\�h����\��T\��\0�z\�,�\��ls��\�k\�X\�j�ʩ�\0�ϸ\��\0���\�\�\�\��鮫,�^\�5�����\�\��\�\�\�\�h����{\�\�kwY��=n���\0s\�K\�|L�\0\�ܵ�\���\�\�\�ly�\��\0A%<o\�N�ޝ�\�\�JM\�\�\r\Z	;���\0E�Z^\��o\�\\|�u��2�|��\�^��\��U\�\�\��\�\�\�mtX\�$\�vz{?�\�\�k���1�\0T�������\��m��\0&��J�@\�Z��\�q���\\O\0\\T��\��\0<�\�:�Ӊ�AcO�\�P�\��Mn�\�A(��e��5�\�\�>\�K�$�\0�w\�=\��\�\���\�c\�_H\�Ʒ�}{6��Ü\��3_O�?F\����ut?R��;�c��1���%��Un�z_�\�},��g�\"\��/\��Ƴ3&\�C�\�\�\�C[��X\�eU�\0��%>[\�3\�ͯ�\�6۶�Yw>�?6�\��\�s�K�5�TY[kn\��ܞI�\�-.�\�2:\�s�\�o�S}�\��El�QoӺϧ}���\0\�\�����Tʃ�S!�7��ּ5�3\�C<Lw\��Z\�X\�82�\�%\�{�\�\�cG\�9\�\�\�\��\��N��e�E\�k\�ߴ��\�\�[E;ϻ\��bb3�%��\�\�>�\�Γ\�:V��8��4^\�k��gd�\0_\���k�5+\�\�\�\�=;oY����\�mn�7�\0�3{�s��_Π��\�fW֎��\�z�c�VI,\r�lm\�쮯}�\0�<�\�R\�:�Halٺ\��\�ZCZ\�\�eM}��\�\��h�ǫ+\�2ב�\�}\�\�?�W]�ޟ�Ǯ�\�N\�x�׺^[%�\�.|{Cy\�rJe��\�V^\���\�{y���_�g\\,��\��\�`���\��\0Ihf��͢�}ն^gBcf\��S�E\�}y\����\�;2\�P߄���\0Ч��Jy�\�7?�W�\�j\�h���_@����fo֎��_#)�����\0�?�\0<�{E�\��U\��\0_)�z�:}F\��\����\��\0_�\�X�S*Ƹ:\�5�\�\�v\�\�\��E��?\�Z����1�\�c9��x�cH�d8�����\��_Q~�3��\�۶х��cH/s�7#\��~�\���\��\0Ū��\�\�f=��:�\�۳�I.�,����\�\r~\�6��\�,�s\�GQ�*�]M\�\�\�Xv9��C�6��\�kma�\���\0�\�q��=\�{\�~�Zߦ\�\�Z���\�\�\�:f3��=W��c�՟\�\��\0��\�g\�U\�=0tˋ%\�}�%�m��}k���\�{\�s?��\�=N}$�	��%%,P\�T�T�x[;\0��N\�\����`c�?���\�-�����R�-�\�\�r\r�U\�9��8l�\0�-LL\�ى��g����\�v��X\�\�}�\��Y��\�6�\0��K?ìl��ߐf���sN�̐7��>�\�\�o\��?\�=\Z?­J��X�\Z\'.���{�;,��\�c\�u��o\�\�ǭ�\�t ��7\'m-�6\Z\�tc=�u��\�\�I�\0\�-[\�~�OE�eۨvs\�\�\�(\'\�w�c�\'���\�:[*1\�\��O�\�\�ξ\�}��ߢ���E��e�q�.�\0h.�\0�Z*r��ʥη�d��\�\0���џ�\�\�h��c\�4\�_�g�e�\��\0��ʿ\�\�\��v\�\��\�Qc\�7=\�>\0\'\�Iڼ�&\�\�srݏA\�\��O�=\r6\0\\}6�\�몆�\��\07ZJ{�?ы�3z\�\�X�1\���۲���\�\�\��\0�Ef�]\�\�t>��\�\�;�\�\\X�\0߱\�Ծ\�\�\\\�i\"��\��U���\�gF\�\��\�\�\�\�\��@ݤ9�m��\�\�1��\0;��譭o����~�}S\��-\��\Z�Qc��\�d\�d{+i�T9�Cҷ�\��O���qw�^\�5�\�A�\��\�??�\��\�\�S�K辶\�M�-���湧G1\�w�\�r�o�\�\��;�\�wP\�\�\r���SH���K\�\r�\'�U.v׽��\��_�\�$���I\'Ru%)U��h��U<z�\'\�b�.���\��\�Su-�<4��+<\�\�y��\0-?\"��w\�.w\�\�:F�{�����3\�1\�Z��\��\���q\�0=I�J%v�ϵ���?�\�W�\�\�z\�y\�6��>��:\�Q\�q�\�n;���C\�\0���ݫ5��on\�aku�\��\0By�\���J{��P98�b�\�H;\�\Z�e��\0��3�\�w�k?E�\�\�\�8W\�\�p�SM�W�#.ã�\��\�g�+���K�\0\�U/�\�-\�f�\\\�\�z�\�3\�P\�>\�F\�\��z_\��\0/\��N��\�L:\�T\�\�G�w9\�\����\�.SzWH\�V\��;C\�\�i�\��m�~\�\rݻ�?\�[��k\�\�\�ecW~�݌�5\�QaOc�\�^[�0�z\�Y\�V\�\���\�p\\]t/�7���?���{7Q�/\�\����\�G\\\��Ҳ��\�\�1�\��;dc��o~��\�]�\�C�*h1��o��\0\�?�\�NV�\�׽�UmR�,{�Y[?:\�g\��}=J�\�\�\�R�I$��\0�\��T�I%)$�IMl���Ա\�/Pǯ*�jk��\�x\�\�\�Eퟦ�\�\��=�_\"\�f-�8-\"=\Z\��\�>\�˭�\0��v�J|\�\�\�O��\�\�\�ka�-P?\�K�W�|hi�\0ы\�RIO�\�#On��\0��o��M�\0��_�r\����]z�I)��d��\0˗�\0\�;�����&:\Z>՛�s\�;\ru��\0gұ�\0�*��SG�t^�\�0\��m^�;	tIq.w\�{\��\�\�X?Y���\�_\�:s\���J��h��ʱ��}~�n\�vg�*�\0C��׿�\\oֿ�}�S=\�s�f?�u��\�U�\�7~\�\�Q\�mL�\�S\�\��LkS�1=��v�`\r���\��-ݳ\�[X�u^�\��3<�\rCu�́f�5���v۷\�]�\�ԡ�ֲ�V]}\�V�vM�\"�ꙺ�K�.��\�\�\�u�\�0\��\0�B\�G=\"���YgH\�t��Wk\�<s�������\0^\��R��\�)6��\0\�\�\�\�WW\��f�\�\�t\�=@�?����:\��~\�n\�5�\0\�\�-c!�\r�\0F�;�\�\�8\�RE\nI$�S�\��T�I%)$�IJI$�R�I$���I%)$�IJI$�S_7>��\�Q^M2\�\�\��\�E\�_�\�GkZƆ���\ZѠ\0v	\�IJI$�R�I$��\0�\��\�XICC_PROFILE\0\0\0HLino\0\0mntrRGB XYZ \�\0\0	\0\01\0\0acspMSFT\0\0\0\0IEC sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-HP  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0cprt\0\0P\0\0\03desc\0\0�\0\0\0lwtpt\0\0�\0\0\0bkpt\0\0\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0,\0\0\0bXYZ\0\0@\0\0\0dmnd\0\0T\0\0\0pdmdd\0\0\�\0\0\0�vued\0\0L\0\0\0�view\0\0\�\0\0\0$lumi\0\0�\0\0\0meas\0\0\0\0\0$tech\0\00\0\0\0rTRC\0\0<\0\0gTRC\0\0<\0\0bTRC\0\0<\0\0text\0\0\0\0Copyright (c) 1998 Hewlett-Packard Company\0\0desc\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0sRGB IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0�Q\0\0\0\0\�XYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�desc\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0IEC http://www.iec.ch\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0.IEC 61966-2.1 Default RGB colour space - sRGB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0desc\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0,Reference Viewing Condition in IEC61966-2.1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0view\0\0\0\0\0��\0_.\0\�\0\�\�\0\0\\�\0\0\0XYZ \0\0\0\0\0L	V\0P\0\0\0W\�meas\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0sig \0\0\0\0CRT curv\0\0\0\0\0\0\0\0\0\0\0\n\0\0\0\0\0#\0(\0-\02\07\0;\0@\0E\0J\0O\0T\0Y\0^\0c\0h\0m\0r\0w\0|\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0\�\0�\0�\0�\r%+28>ELRY`gnu|���������\�\�\�\�\���&/8AKT]gqz�������\�\�\�\��\0!-8COZfr~�����\�\�\�\�� -;HUcq~����\�\�\���\r+:IXgw����\�\�\��\'7HYj{����\�\��+=Oat����\�\��2FZn����\�\��		%	:	O	d	y	�	�	�	\�	\�	�\n\n\'\n=\nT\nj\n�\n�\n�\n\�\n\�\n�\"9Qi���\�\��*C\\u���\��\r\r\r&\r@\rZ\rt\r�\r�\r\�\r\�\r�.Id��\�\�	%A^z��\�\�	&Ca~��\��1Om��\�\�&Ed��\�\�#Cc��\�\�\'Ij��\��4Vx��\�&Il��\��Ae��\��@e��\�� Ek��\�\Z\Z*\ZQ\Zw\Z�\Z\�\Z\�;c��\�*R{�\��Gp�\�\�@j��\�>i��\�  A l � \� �!!H!u!�!\�!�\"\'\"U\"�\"�\"\�#\n#8#f#�#\�#�$$M$|$�$\�%	%8%h%�%\�%�&\'&W&�&�&\�\'\'I\'z\'�\'\�(\r(?(q(�(\�))8)k)�)\�**5*h*�*\�++6+i+�+\�,,9,n,�,\�--A-v-�-\�..L.�.�.\�/$/Z/�/\�/�050l0�0\�11J1�1�1�2*2c2�2\�3\r3F33�3�4+4e4�4\�55M5�5\�5�676r6�6\�7$7`7�7\�88P8�8\�99B99�9�:6:t:�:\�;-;k;�;\�<\'<e<�<\�=\"=a=�=\�> >`>�>\�?!?a?�?\�@#@d@�@\�A)AjA�A\�B0BrB�B�C:C}C�DDGD�D\�EEUE�E\�F\"FgF�F�G5G{G�HHKH�H\�IIcI�I�J7J}J\�KKSK�K\�L*LrL�MMJM�M\�N%NnN�O\0OIO�O\�P\'PqP�QQPQ�Q\�R1R|R\�SS_S�S�TBT�T\�U(UuU\�VV\\V�V�WDW�W\�X/X}X\�Y\ZYiY�ZZVZ�Z�[E[�[\�\\5\\�\\\�]\']x]\�^\Z^l^�__a_�``W`�`�aOa�a�bIb�b�cCc�c\�d@d�d\�e=e�e\�f=f�f\�g=g�g\�h?h�h\�iCi�i�jHj�j�kOk�k�lWl�mm`m�nnkn\�ooxo\�p+p�p\�q:q�q�rKr�ss]s�ttpt\�u(u�u\�v>v�v�wVw�xxnx\�y*y�y\�zFz�{{c{\�|!|�|\�}A}�~~b~\�#�\�G���\n�k�͂0����W������\�G����r�ׇ;����i�Ή3�����d�ʋ0�����c�ʍ1�����f�Ώ6����n�֑?����z�\�M��� �����_�ɖ4���\n�u�\��L���$�����h�՛B��������d�Ҟ@��������i�ءG���&����v�\�V�ǥ8���\Z�����n�\�R�ĩ7�������u�\�\\�ЭD���-������\0�u�\�`�ֲK�³8���%�������y��h�\�Y�ѹJ�º;���.���!������\n�����z���p�\��g�\�\�_\�\�\�X\�\�\�Q\�\�\�K\�\�\�F\�\�\�Aǿ\�=ȼ\�:ɹ\�8ʷ\�6˶\�5̵\�5͵\�6ζ\�7ϸ\�9к\�<Ѿ\�?\��\�D\�\�\�I\�\�\�N\�\�\�U\�\�\�\\\�\�\�d\�\�\�l\��\�v\��ۀ\�܊\�ݖ\�ޢ\�)߯\�6\�\�D\�\�\�S\�\�\�c\�\�\�s\��\�\�\r\�\�\�\�2\�\�F\�\�\�[\�\�\�p\��\�\�\�\�(\�\�@\�\��X�\��r������4�\��P�\��m��������8�\��W�\��w����)���K�\��m���\��http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.3-c011 66.145661, 2012/02/06-14:56:27        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:stEvt=\"http://ns.adobe.com/xap/1.0/sType/ResourceEvent#\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmp:CreatorTool=\"JKM-LX3 9.1.0.297(C605E4R1P1)\" xmp:ModifyDate=\"2020-07-21T13:18:42-05:00\" xmp:CreateDate=\"2020-07-21T12:44:48\" xmp:MetadataDate=\"2020-07-21T13:18:42-05:00\" photoshop:DateCreated=\"2020-07-21T12:44:46.159714432\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"sRGB IEC61966-2.1\" xmpMM:DocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" xmpMM:InstanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" xmpMM:OriginalDocumentID=\"B69526C8C742577A2B78BAC460C37BC2\" dc:format=\"image/jpeg\"> <photoshop:DocumentAncestors> <rdf:Bag> <rdf:li>EF49E2B666BC92677C1DC613BA9393A7</rdf:li> </rdf:Bag> </photoshop:DocumentAncestors> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AB5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> <rdf:li stEvt:action=\"saved\" stEvt:instanceID=\"xmp.iid:AC5FEF8F7DCBEA11B26980AEB6B74891\" stEvt:when=\"2020-07-21T13:18:42-05:00\" stEvt:softwareAgent=\"Adobe Photoshop CS6 (Windows)\" stEvt:changed=\"/\"/> </rdf:Seq> </xmpMM:History> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�\0C\0�\�\0C��\0\0h\0h\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0	\n�\�\09\0\0	\0\0\0\0\0	!1\nA\"Q#2qa�Br����\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0/\0\0\0\0\0\0\0\0!1A�Qaq�\"2����\��B\�b�\�\0\0\0?\0\�ƀ4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@\Z\0\��4�\r\0h@:�\�ۛ\�\�\�\��\��Ï�%xH�ڼ�\�#\�\�J\n��0Q*�/,.�S\0�,[�W�\�\�t3n\�N\�刢\��\0�Rw\�\�Ydb��i�kN+5\��.u�K�A$zq��$\�s�ͤ����=THcu�p\�/\�\n����75z�~L\'�(���\�\�Q�\\��eZ�\'\0\r\�JV#�#\�zA:~�\0�\��%\r_�	d��\�\�c��Ws\�=2\�64��Q\�1�\�@�\�R]TUn�G��d\�MtWEB*p:j\"r\0\��\0�\�u\�B���E�m\�\�/�\�GQ���%`�A\'r��a=F)�r�\�\r:\�\�U2��� ����\��\0\�� ��\�\�n!\�د:V�Z���.\��N@I(A�\���1T)D�\�\�@�a/�d\�N�%4�C��$4�\r\0hs8nm��#�3�E�\�tjj�I[� �Ւ(\�\�G$u9&n\�4Ee�&\0jKVJM茕\�\�X�I��Uv[U&;�4E\�]\�L�\�F\�\�7�!P�/겭&)����o~\�@J!\�N\0+\�zd���ϟ379�0\�_��ʛ��\�d��rb߽\�r\�[\�bZ��\�|ʹ\�\'(���\�9D�4\�,EA�Ȣf��\n߅�ֺQ=��,$-ƹ\'�)o\�ƭ\�=)��O��\�m��jѬ��n��\�ceY\0*���?;�\�-\�nổOO-�(w/��P���p]Jf�\��+�3lm�\�y^g�i\�/�J\��\�cwN�_g �9��\�*�wmT,��2m��k2�m��-�\�\�C<\\$\�A�\�\�g\ZW\Z:,%\��\�G�N(7;\�TH0�e\�Xܨ�\�vRj�Ԅ�AyJ\�S�|�q�k�\�\�c�\�51IU�²E0O@�LoLJ\0 \" \Z�\�k8�(k{��n�%ę5�Ka��Z(HF�g�����N\�J�Ą\�I��y\�	Nt\�Y2��)�s\�\�O5\�*o~sB�4\�<�\�΀�i\��\�5���\�IIA#-fhf\�ei`TRYE�e�#U��@E�\�m{@����@\Z\0\�1\�\'��0\�\�Ea�Lo[��1Y|�Rz�Uk\�\�]-i$��ʮG\�ǂ��Q4�>�\�Ybbt*_-ߑ�\�\�\�k>n��\�)n�-n�p��DE*�ҭ\�Y�s\nq\�\�4�B5�\0��2�ݾD�=�̦\�\�\��\�\�VU\�\�|�ow�\�c�ig�I���\�Ж\"\�\�p,��@K��k��L዗,n�`2�82e(��\Z\��Qy��o[;\�V1\��s�f<���m�m\�\�\� \�\\��\�\�b$S=\�\"f\\h��3\�D��FB:	*���9\�)ٳ-z�m���.~y�:�b��m.�r\�\�&B\�u0�J�\�lX��\�q$\�뒝H�nV��+�P.\�\"/�d�\�鑓h�m�~\�guٕIA�Y�qV;�㷲�\��,���򈴯B���.\���:�U�e)\nR�ˤǵ4\�1l����U\Z�%���ݥm\�ҙYOt\�-�}3ۭ�\��`XI��[X�\��SP9*\��\0�XJF�\�\�M�rVҵ��,\����4mj�\�\�Eʶu\�&F����+ٵ�/)\"\�)$���1`G\�^$\�4�7ar$�\0$Aѵ��=\�*N\�\�\�\�`O�V8�!�D\��K��f�\�Q�]>\�\�٣,����\�%7\�99U޻+�Q3\�%\�\�.�L\�\�)d�\��ߨ�\�\�roӿ6-�9I��\�nӶ;\�\�e��J�\�l�HJ^6\�o�EAN�\�	��u�e\�1S3�G `)-	�\�N\�!ŧ\�kB.E�\�l|�r\�q&ɤ���ٽn���ϒ�S0���?v�����S�7M�N�\�ď�\����X[����˄DZ�w��\�Ej�1�vr{�@^Er�d`ʊ�\�9\�Ax�F6�{�(e�\�e\�vw\���ܝ~�,�\�\��褐z1�p1i�W�d	���n\0�F\��(eUS��&\�vٲIhy�\�\\\�\�wֻ[\��j��؇1J�\�\� \�H8\�K\�b�����C�C\�+\�\\��I��_\�%�X\��m�j�È�\�\�)J�G(Tb%��RIND��F�h�TT���\�5Pº\��ꔽ�O\\Ģ\�Cr�\���\�f�n\�1\�\n\�k�e8DA^\re��.c?�n\�h�YF-��\��R$�&\����Qk|��\�[�\�qR�	�\�ϕXK\�\'$�\�g\�r\r�5\�6I��Ĭ�\�BW�J]\�\�e\�!�8�v�-)v4\�Q��]\�l�E\�l���qq�{��{]\�vn���JW�\�^=3F\�@x\\��\0\"\Z��H�y;�_��IӇ\n��\�DC�DD\�0�)@90�\0\0<�\Z\�\�K%z��\�R�\�\�\ZZ\�f�\�g~�;��̶\�\�-�=M\�9�*͉\�$�ա��z�l���\�V2�P;:\�jN�\�D^�����K�9߱t�WY\�\�\��H^��\r\�\�c#�w\'s��G䛥��E��U\�\�1�R�Y�k\r�1�r��Lb R�gH%�2�ʛ\�@�����|uM��h��D����\\���\�C�M\�\�\�\�\�]9* �@t\�O\�mʮ\��Ȇ�ﯯ\�\�7L\�]\�ll9X\�w��ƌ e�L&1&�ϟ\�%@\��\�|\�/ߵR�\�^��\�o�r{C\�\�7\'[���g��;��\�S\�H�)���\��MYG\�$u�h/�\�Ң_]F�\�$\�J�\�`��L[։J\�ZY\�+%e����\�t\�~�=�d\�䈾��xI�&�\�\�\�V\�qE0�^�\�3o߄Z�A\�.�\�\�&\�\�\�f����\\5R�[��Z�:�\n��C�\�MW���2L��\0��=3|�iC���4\�:�&֋/\���o��˅�&R���\���Ɵ����klV�%\�a�>\� �� VˮqVI\�`ٲ�ETCH\�N���d&�_9\�{[\�y%n\�5��\\U\n\�:0Y\�K�\ns�\�\Z\�w\'*\"B�ƿ\"\rZ\�ق\�Ag+�\�\�\ZY�l���d��x��1d܍Y4H��\�\"�I��?\�\��\"<��D\�\"#έv�\�y�5^&dG��|��\�\�<~�\0�\�\�OF7��1�nDD�o����j�s7{�U\�W�,\��w!��\�?\'x\�\�L�����]ʣM\�h�;e\��L\\{�)�F�1r\�6c����Z^F���\�а\�\�]\�z�o��\"\�K�u�M�X\r\�Z5d\�S�[��ZfY*\�1l渙���B����70\�D�E��[\�K�׺\�\�]\�9ػ�e�I;:\�:�\�1�V\�Q��\�H�u\�\�#!.TS)J�^ͬ�\��ڸA\0\0M�\n9?$I:\�ۙU6e�\�<\0�Փq}E>\����\�H_�*z%0�\0%UL\�v�\�\��ήJ�JOLבy\�N\�\�=*pJGS\���\�\�Њr&\�o/�~\0\r\�x\�8\�y�`�����lsx5\�ɕVқf\�蘆\�\�O\�] n>\�Uۤ`��P\�U�p��%j�n�\�V݌;�=�\�x\Z\�$g\�ү��ՋQ\"�,�����H�@\�UC�\"�9J<��u\�\��\�\\��nQ:<sI��\�0\�֯2�qU��\���ƚ\�\�!\�6�\�j\'x�D\�\�=�����\�\��+Ћn֞&���%���\�%V��P.4c\�\�J�\�<��Y\�\�\��\�Z1\�e��4R]\�EDǷ;��.Tn��\�˪\�-F#,��\�\�\�O\'	]��rbB`+\�\�\�UaEڎ��,�P*��%1Ψ�0:\�(������wC-ߑ&\�8y�\�<���<��\0���o<�\"Y^\�~�\0>x|}�����w�I=+[��\�d[3d\�ju��t�.�1\\81�\�4?���jq��x�\�\Z\�B7�&8jMW\�\�\�в��[����V!3<w�\�\�ZM~�Y7��\�I-ڽ�Wq|\�#�\�opJ���EQ�Q�&8�@\�28X�\�P�Sz�����N���iFQ�V[�\�\�{;?\�t6�Q��.���4W����r��)8V��\"\�`\"�t�\�9Q�A�&\"a9\�G)K\\\�,�;�3PPNQ\�gm��ew�J\�G6	��8{�`���	H\�%L\�Wi\�U�h�iο�β.\�11ݘ����\�\"\'Pyn3\'L����T�QV\�\��\�<:\��uu��ކ\�:\�K&\Z\�O�\�形�l�j�X�f�5���n6<�\�rrG�Z!�@7�S��5\�P��\�k[\�\�\��PI\��W�c�;�C�Ub�\��\�&P!y�\�iBM\�D�m#�.\�\�\�\�i�\�\�#[��),G�����!Y�u`�h\�S��@�%�a\'%w)$\n���\�aҕe�g\'t\�D\�\�\�\�+k�/\�0.\\�-��Rd\�F���\�\�\�+xɕY4\�ʴ\��R��3r�k%�\�Dj\�X�LX7+�K\�L�;��\�\�^�\�\�R�BΛ�\n|YW�F:>�*$�AT\�,d\�\�yk�X�<�zP\0p\�J�\\3f\�2UE,�\�.\�+TK\�!����\�!\�\��\0�X��+�J �㏁��\�\�\�W�\��Y��)&��\�V���ѩz�*}4SUuD?�\'\�c\�\�\�\Z�j	Y\�,\�~\�\�[V*LZ�qm\�\�٬�䓃&�)$+=�p��� \��c����|�5\�\�M\�m�\�5�ӛ�M\�&.\�\\\�[Q�u�b\�kp0m�E�uaJ�1��IU\\_\�\ZI\�\'PL��x\��d�M\�\���R[�y�\"Y\�\�>v�}u/�<a*�\�\�\�H�?Q�-�v\�x�\�t��@H4ZR\��\�%Z1@��VX��5X\�$|C��OSm�]\��7�\�֎y\�Q\\�\��3R�\�\�r��\�\�I��s�ym�\�;vqE\"�\�ۀ,s^N\0TY Ͳd�R��58��W<^oĈ���b\Z\'n\�}Z:\�\�\�Q�S�\�����,HC92\�jW\�;\�!.�7��dY�6n�10	�yl��9\Z\��UJ�̤�Y�:�\�Ʊ��aɴllc6���̑I�6Y �flZ7D�D\"\�$�L�\0)H�\0\0\0k���\�8�g<ms\�YV�\�\�2\�Ͷ� �����HS]2<`\�\'1\�n\�[�j�.�8E7\r�Id\�r\�I�j\�\0�\��/ۊ\�%��t>�\�8R�\�\�\�ܨ�n����<\�.U�\�C6\�\�(\�\�G3+\"���A�\�\�uu^���sĜ�l\�V-\�\�hЎ�:�\�\� \�\�\�\n�9���v��\�x;�TT\�;8��\"(��7?4\�Ut��ן\"t\�\�9����3(�\��-y\��9zѰ�U`<�\�T$ռ�ی��Uy��\�\�u4�)�0�0r�z�<�D\��\�R�*\��\�\�9]m^�a6�\�M)����\�(������O�(�T\��\07��\�EL�\��\�\�,(��@5u%\nC{�CX�\�Ux\�f����|�E\�(���M4W������\�\�\�И\�->�\��\�wIf�\�T\�@\�F�;�\�1v��<T\�U~U־\�~]�+��	\�ҐE�F\�Ie�ޒ�\�\�\�\�c)�\�-?�K\��(��T;ڞeγ�Jx\�[\"�i\�W[W%+\n!pO\�gA$��/\�90\�\�FGJ�	8t\�\�\�\�\�v\��\�cI\�1\�\\��\�^\�j�{�\�T]\�Xm��-dG\��x\�v�\���w@\�(Xq\�yDѮтX�7D�9 e\�R5\"�zd�\�-:��\�,I;�u>\�\�\��8\�su�цHۥ\�\�\�m$@���Cȳ`\�J�1��\�bm2�}X�&�\"\"\0�r\�Z]�s���\�l��M�10�\\�\"\�\�X�\Z\�\�S������lrըF�͔��\���\�\�\�&Ғ\�P-H\r\0\0���>|����\0�\0MB���u6�쌖Y�C\"\��\�Չ��өU+s\�p�\�K5��#Nz����^�|�.�ȓ\�.)��(\�۪�m�2��o�\�4\�b\�\�Vm\�\�u�:YزuuRcd	&b��S0\�B\�\�\�(tT\n\�\�)�@\��\�(Y* �n>�\�H��X�:\�G�k�ʚe?\�Ls��\0��`Ҿ@��UzϘDG\���G�Cr�\��qǪp��\0�+\�)}*\�f\�\�\�\�@y)�q\�\�@\0D;T\�\���\��A/v����T�\�8\�\"\�\�[_��\�5ko���L\�;�\�4�;�5��Xه�M��-\�ʠ��US/&\n\�.Qq\�>\�M=h\�D��ߺZmf6BE4\�\rX�Ad\\\���,L\�\�JHJJ9\�d\�c+%+$\�E�\\TJ\�Sa�`�p��d���\�!cN��o���-Y��\�mz?Y^��\Z1�� 9��R�A]8�S!  Q��W�E�\�cb\Z0l�Y6\�x�Tq\"��k.��\��N7�u_��\0\�oݝ?ÅJ=�\�Ԭ��m�}�l\�o����8�g�<�],s��u\�3x�\n[[c[�3\�VX�������|���NM��|ı�Q\�\�H��b�Ҧ�g.&\�i]���Դ��\�Ǔq��=\�\�\�~��\Z\�\��\��4�\r\0h@\Z\0\��}[�}B�\�l5��[\�4����\�\�\�9�IѲF-ȱ1�q1W�5�8LF\�hFMK!\�l�=t���Y��CV�\�\n�t\�ꕷ���\�6%\�\��/*l{�\�wq\�E\��\�rW{�\�\�p�9Et��\�d�Tri7эP�+d\����}�-���]\����7�<�jN\�z�2\�\�qN\�i��TR2�Ւ|\��瘱s��M�u\�yKM�\�c�E˅_˶n�3*\�ɚL�5j�h��Ê�tF2���������\r\0h@\Z\0\��4�\r\0p��!�?�\�\�\�\�@\Z\0\���\�',0,1,'D:\\2\\Proyecto-Tienda-Com-master\\target\\classes\\productos\\mauseinalam.jpg');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_factura`
--

DROP TABLE IF EXISTS `producto_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_factura` (
  `idproducto_factura` int NOT NULL AUTO_INCREMENT,
  `idproducto` int NOT NULL,
  `idfactura` int NOT NULL,
  `cantidad` int NOT NULL,
  `descuento` float NOT NULL,
  `totalventas` float unsigned NOT NULL,
  PRIMARY KEY (`idproducto_factura`),
  KEY `idproducto_idx` (`idproducto`),
  KEY `idfactura_idx` (`idfactura`),
  CONSTRAINT `idfactura` FOREIGN KEY (`idfactura`) REFERENCES `factura` (`idfactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idproducto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_factura`
--

LOCK TABLES `producto_factura` WRITE;
/*!40000 ALTER TABLE `producto_factura` DISABLE KEYS */;
INSERT INTO `producto_factura` VALUES (1,1,1,3,0.19,213),(7,3,6,5,0.19,243);
/*!40000 ALTER TABLE `producto_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL AUTO_INCREMENT,
  `idsexo` int NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `tipodepersona` varchar(45) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idProveedor`),
  KEY `idproveedor_sexo_idx` (`idsexo`),
  CONSTRAINT `idproveedor_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,2,'Cedula','camila','camila@gmail.com','5345435','bahia','Juridica','2000-02-02',1),(2,1,'Tarjeta de Identidad','jarinson','jarinson@gmail.com','342556','palenque','natural','1000-10-12',1),(3,2,'cedula','Esteban','esteban@gmail.com','543267','minercol','juridica','0500-10-10',1),(4,1,'Tarjeta de identidad','pedro','pedro@gmail.com','543672','bahia','natural','2000-03-04',1),(5,2,'cedula','Ana','Ana@gmail.com','564372','las mercedes','juridica','2002-05-08',1),(6,1,'Tarjeta de identidad','maria','maria@gmail.com','564738','jardin','natural','2007-07-02',1),(29,1,'Cedula','jhon','jhon@gmail.com','32415231','las mil','Natural','2023-12-12',1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `condicion` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador','1'),(2,'usuario','1'),(3,'invitado','1');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `idsexo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  PRIMARY KEY (`idsexo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1),(2,'Femenino',1),(3,'Otros',1);
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `idsexo` int NOT NULL,
  `idcargo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `condicion` tinyint NOT NULL,
  `login` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `tipodedocumento` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idusario_sexo_idx` (`idsexo`),
  KEY `idusuario_cargo_idx` (`idcargo`),
  CONSTRAINT `idusuario_cargo` FOREIGN KEY (`idcargo`) REFERENCES `cargo` (`idcargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idusuario_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`idsexo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'Jarinson','321357','jarinson@gmail.com','palenque',1,'12','12','2001-01-04','cedula'),(2,2,3,'Ana','322456','Ana@gmail.com','las mercedes',1,'123','123','2023-11-15','Cedula'),(3,1,3,'Junior','310247','Junior@gmail.com','los rosales',1,'11','11','2023-11-02','Cedula'),(4,1,1,'Jhon','321421','Jhon@gmail.com','minercol',1,'13','13','2023-11-16','Tarjeta de Identidad'),(5,1,3,'eduar','311654','eduarl@gmail.com','los castillos',1,'10','10','2023-11-08','Tarjeta de Identidad');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tienda_com'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar producto`( nom varchar(45), in descrip varchar(250), in img longblob)
BEGIN
update producto set nombre = nom, decripcion = descrip, imagem = img;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Cliente`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipodedoc varchar(45))
BEGIN
update cliente set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodedocumento = tipodedoc where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Factura_Compra`(in fact_compa int, in idprov int, in iduser int,in typeofpay varchar(45) )
BEGIN
update fact_comp set idProveedor = idprov, idusu = iduser,tipodepago = typeofpay where idfact_comp = fact_compa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_fact_comp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_fact_comp`(in idfact_comp int, in fecha date, in rang int, in total_comp int, in descuento float, in tipodepago varchar (45))
BEGIN
update fact_comp set fecha= fecha, rango= rang, total_comp= total_comp, descuento= descuento, tipodepago= tipodepago where idfact_comp= idfact_comp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Producto`(in idproduc int, in nombe varchar(45), in descripcin varchar(45), in image longblob, in route varchar(500))
BEGIN
update producto set nombre = nombe, descripcion = descripcin, imagen = image, ruta = route where idproducto = idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Provedor`(in idpro int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date, in sexo int, in tipoofperson varchar(45),in tipodedocu varchar(45))
BEGIN
update proveedor set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, tipodepersona = tipoofperson,tipodedocumento = tipodedocu where idProveedor = idpro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_proveedor`(in idprovee int, in tipo_documento varchar(45), in nom varchar (45), in correo varchar (45), in telef varchar (45),in direc varchar (45), in tipo_persona varchar (45), in fecha_nacimiento date )
BEGIN
update proveedor set tipo_documento= tipo_documento, nombre= nom, correo= correo, telefono= telef, direccion= direc, tipo_persona= tipo_persona, fecha_nacimiento= fecha_nacimiento where idProveedor= idprovee;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Usuario`(in ced int, in nom varchar(45), in tele varchar(45), in corr varchar(45), in dire varchar(45), in fecha date,in clav varchar(200), in sexo int, in cargo int)
BEGIN
update usuario set nombre = nom, telefono = tele, correo = corr, direccion = dire, fechadenacimiento = fecha, idsexo = sexo, idcargo = cargo, clave = clav where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Actualizar_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Venta`(in idfact int, in tipodepago varchar(45), in identificadorusuario int, in idcliente int)
BEGIN
update factura set tipopago = tipodepago, idusuario = identificadorusuario, cedula = idcliente where idfact = idfactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actu_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actu_cliente`(in idcliente int, in tipodocu varchar(45),in nom varchar(250),in tele int,in correo varchar(100),in dire varchar(250), in sexcli int, in fechanacimiento date )
BEGIN
update cliente set tipodocumento=tipodocu,nombre=nom,telefono=tele,correo=correo,direccion=dire,sexo_cli=sexcli, fecha_nacimiento=fecha_naci where idcliente=idcli;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actu_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actu_Producto`(in idproduct int, in nom varchar(45), in descrip varchar(250), in cantid int, in imag longblob, in ruta varchar(450), in precio float, in condicion tinyint)
BEGIN
update producto set nombre=nom, descripcion=descrip, cantidad=cantid, imagen=imag, precio=precio, condicion=condi where idproducto= idproduc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actu_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actu_usuario`(in idus int, in nom varchar(250), in rang varchar (250), in tele int, in correo varchar(100),
in sex int, in fech_naci date, in dire varchar(250), in clav varchar(25))
BEGIN
update usuario set nombre=nom,telefono=tel,correo=cor,direccion=dir,fecha=fec,sexo=sex,rol=rang,clave=cl where idusuario=ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistroActualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistroActualizar`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Cliente`(in idcli int)
BEGIN
select * from cliente where idcli = cedula;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Factura_Compra`(in idfactcom int)
BEGIN
select * from fact_comp where idfact_comp = idfactcom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Producto`(in valor int)
BEGIN
select * from producto where valor = idproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Provedor`(in idpro int)
BEGIN
select * from proveedor where idpro = idproveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Usuario`(in idusu int)
BEGIN
select * from usuario where idusuario = idusu;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuscarRegistro_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarRegistro_Venta`(in idventa int)
BEGIN
select * from factura where idventa = idfactura;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente`(in idcliente int, in nombre varchar(250), in telefono int, in correo varchar(100), in direccion varchar(250), in sexo int, in fecha_nacimiento date, in cargo varchar(45), in condicion tinyint )
BEGIN
insert into cliente values(idcliente, nom, telef, corre, direc, sex, fecha_naci, condi  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_cliente`(in valor varchar(45))
BEGIN
select * from mostrar_cliente where cedula like concat ('%',valor,'%') || nombre like concat('%',valor,'%') ||telefono like concat('%',valor,'%') ||correo like concat('%',valor,'%') ||direccion like concat('%',valor,'%') ||fecha_nacimiento like concat('%',valor,'%')|| tipo_documento like concat('%',valor,'%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_fact_comp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_fact_comp`(in valor varchar(45))
BEGIN
select * from consultar_fact_comp where idfact_comp like concat('%',valor,'%') || fecha like concat('%',valor,'%') ||rango like concat('%',valor,'%') || total_comp like concat('%',valor,'%') ||descuento like concat('%',valor,'%') || tipodepago like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_producto`(in valor varchar(45))
BEGIN
select * from mostrar_producto  where idProducto  like concat ('%',valor,'%') || nombre like concat('%',valor,'%') ||descripcion like concat('%',valor,'%') ||cantidad like concat('%',valor,'%') ||imagen like concat('%',valor,'%') || precio like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_proveedor`(in valor varchar (45))
BEGIN
select * from mostrar_proveedor where idProveedor  like concat ('%',valor,'%') || tipo_documento like concat('%',valor,'%')|| nombre like concat('%',valor,'%') ||correo like concat('%',valor,'%') ||telefono like concat('%',valor,'%') ||direccion like concat('%',valor,'%') ||tipo_persona like concat('%',valor,'%') ||fecha_nacimiento like concat('%',valor,'%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultar_usuario`(in valor varchar (45))
BEGIN
select * from mostrar_usuario where idusuario like concat ('%',valor,'%') || nombre like concat('%',valor,'%') ||telefono like concat('%',valor,'%') ||correo like concat('%',valor,'%') ||direccion like concat('%',valor,'%') || login like concat('%',valor,'%') ||   clave like concat('%',valor,'%')||fecha_nacimiento like concat('%',valor,'%')|| tipo_documento like concat('%',valor,'%');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Cliente`(in ced int)
BEGIN
update cliente set condicion = '0' where cedula = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Factura_Compra`(in idfactucom int)
BEGIN
update fact_comp set condicion = '0' where idfact_comp = idfactucom;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_fact_comp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_fact_comp`(in idfact_comp int)
BEGIN
update factura_compra set condicion= '0' where idfact_comp= idfact_comp ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Producto`(in idproduto int)
BEGIN
update producto set condicion = '0' where idproducto = idproduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Provedor`(in ced int)
BEGIN
update proveedor set condicion = '0' where idProveedor = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_proveedor`(in idprovee int)
BEGIN
update proveedor set condiccion= '0'  where proveedor= idprovee;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Eliminar_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Usuario`(in ced int)
BEGIN
update usuario set condicion = '0' where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `elimi_usu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `elimi_usu`(in ced int)
BEGIN
Update usuario set condicion='0'where idusuario = ced;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Cliente`(in valor varchar(45))
BEGIN
select * from mostrar_cliente where Cedula like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Factura_Compra`(in valor varchar(45))
BEGIN
select * from mostrar_factura_compra where Identificador like concat('%',valor,'%') || idProveedor like concat('%',valor,'%') || IdUsuario like concat('%',valor,'%') || Fecha like concat('%',valor,'%') || TotalCompra like concat('%',valor,'%') || Descuento like concat('%',valor,'%') || TipoDePago like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Producto`(in valor varchar(45))
BEGIN
select * from mostrar_producto where Identificador like concat('%',valor,'%') || NombreDelProducto like concat('%',valor,'%') || DescripcionDelProducto like concat('%',valor,'%') || Precio like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Provedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Provedor`(in valor varchar(50))
BEGIN
select * from mostrar_proveedor where Identificacion like concat('%',valor,'%') || Genero like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || TipoDePersona like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Filtro_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Filtro_Usuario`(in valor varchar(45))
BEGIN
select * from mostrar_usuario where Identificador like concat('%',valor,'%') || Genero like concat('%',valor,'%') || Cargo like concat('%',valor,'%') || Nombre like concat('%',valor,'%') || Telefono like concat('%',valor,'%') || Correo like concat('%',valor,'%') || Direccion like concat('%',valor,'%') || FechaDeNacimiento like concat('%',valor,'%') || TipoDeDocumento like concat('%',valor,'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Cliente`(in cedulaID int, in idsex int, in persons_name varchar(45), in phone_number varchar(15), in gmail varchar(45), in direzion varchar(45), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into cliente values (cedulaID, idsex, persons_name, phone_number, gmail, direzion, '1', dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura`(in tipodepago varchar(45), in CC int, in iduser int, in numerocomprobante int)
BEGIN
insert into factura (fecha, tipopago, impuesto, totalfactura, cedula, idusuario, condicion, numerodecomprobante) values (current_date(),tipodepago, '0.19','1', CC, iduser, '1', numerocomprobante);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra`(in idProve int, in idusuario int, in typeofpayment varchar(45), in numerocomprobante int)
BEGIN
insert into fact_comp (idProveedor, idusu, fecha, total_comp, descuento, tipodepago, condicion, numerodecomprobante) values (idProve, idusuario, current_date(), '0', '0.19', typeofpayment, '1', numerocomprobante);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Factura_Compra_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Factura_Compra_Producto`(in idfactura_com int, in idprodu int, in cantidad_compr int, in precio_unitario int)
BEGIN
insert into fact_com_prod (idfact_com, idpro, cantidad_com, pre_uni, pre_total) values (idfactura_com, idprodu, cantidad_compr, precio_unitario, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto`(in namez varchar(45), in descr varchar(45), in image longblob, in route varchar(500))
BEGIN
insert into producto(nombre, descripcion, cantidad, imagen, precio, condicion, ruta) values (namez,descr,'0',image,'0','1', route);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Producto_Factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Producto_Factura`(in producto_id int, in factura_id int, in stock int, in discount float)
BEGIN
insert into producto_factura (idproducto, idfactura, cantidad, descuento, totalventas) values (producto_id, factura_id, stock, discount, '0'); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Proveedor`(in idsex int, in typeofdocument varchar(45), in namez varchar(45), in gmail varchar(45), in phone_number varchar(45), in direction varchar(45), in typeofperson varchar(45), in dateofbirth date)
BEGIN
insert into proveedor (idsexo, tipodedocumento, nombre, correo, telefono, direccion, tipodepersona, fechadenacimiento, condicion) values (idsex, typeofdocument, namez, gmail, phone_number, direction, typeofperson, dateofbirth, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insersion_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insersion_Usuario`(in iduser int, in idsex int, in idcarg int, in namez varchar(45), in phone varchar(45), in gmail varchar(45), in direction varchar(45), in loyin varchar(200), in contra varchar(200), in dateofbirth date, in tipodedoc varchar(45))
BEGIN
insert into usuario  values (iduser, idsex, idcarg, namez, phone, gmail, direction, "1", loyin, contra, dateofbirth, tipodedoc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_cargo`(in idcar int, in nomc varchar(45))
BEGIN
insert into cargo values ( idcar, nomc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_detalle_factura_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_detalle_factura_compra`(in id_factcomp int, in id_produ int, in cant_compra int, in pre_unita_compr float)
BEGIN
insert into detalle_factura_compra (id_factcompra, id_producto, cantidad_comprada, precio_unitario_compra, precio_total_compra) values (id_factcomp, id_produ, cant_compra, pre_unita_compr, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_factura`(in id_cli int, in id_usu int, in tip_pago varchar (100), in impu float)
BEGIN
insert into factura(fecha, cliente, usuario, tipo_pago, impuesto, total_factura) values (current_date(), id_cli, id_usu, tip_pago, impu, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_factura_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_factura_compra`(in id_provee int, in id_usua int, in tip_pago varchar(100), in descue float)
BEGIN
insert into factura_compra (id_proveedor, id_usuario, tipo_pago, descuento, total_compra, fecha_compra) values (id_provee, id_usua, tip_pago, descue, '0', current_date());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_producto`(in nom varchar(45), in descrip varchar(250), in cant int, in img varchar(45),
 in preci float )
BEGIN
insert into producto (nombre, descripcion, cantidad, imagen, precio, condicion) values (nom, descrip, cant, '', '0', '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_producto_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_producto_factura`(in id_produc int, in id_fact int, in cant int, in descu float)
BEGIN
insert into producto_factura (producto, factura, cantidad, descuento,total_venta) values (id_produc, id_fact, cant, descu, '0');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_proveedor`(in idproveedor int, in nom varchar(150), in tele int, in correo varchar(100), 
in dire varchar(250), in tipo_per varchar(100), in sexo_pro int, in fecha_nacimi date)
BEGIN
insert into proveedor values (idproveedor, nom, tele, correo, dire, tipo_per, sexo_pro, fecha_nacimi, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inst_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inst_usuario`(in idus int, in nom varchar(250), in rang varchar (250), in tele int, in correo varchar(100),
in sex int, in fech_naci date, in dire varchar(250),in log varchar(45), in clav varchar(45))
BEGIN
insert into usuario values (idus, nom, rang, tele, correo, sex,fech_naci,dire, log, clav, '1');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in log varchar(200), in pass varchar(200))
BEGIN
select login, clave from usuario where login = log && clave = pass && condicion = '1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(in valor int)
BEGIN
SELECT f.idfactura_compra,prov.nombre'proveedor',usu.nombre'usuario',f.tipo_pago,descuento,total_compra,fecha_compra 'producto', det.id_producto,det.cantidad_comprada,det.precio_unitario_compra,det.precio_total_compra from factura_compra f inner join proveedor prov on f.id_proveedor=prov.idproveedor inner join usuario usu on f.id_usuario=usu.idusuario inner join detalle_factura_compra det on f.idfactura_compra= det.id_factcompra where f.idfactura_compra = valor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verdetalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verdetalle`(in valor int)
BEGIN
select f.idfact_comp, prov.nombre'proveedor', usua.nombre'usuario',f.fecha,f.total_comp,f.descuento,f.tipodepago,f.numerodecomprobante,f.condicion,fc.idpro,prod.nombre'producto',prod.descripcion,f.descuento,fc.cantidad_com,fc.pre_uni,fc.pre_total  from fact_comp f inner join proveedor prov on f.idProveedor=prov.idProveedor inner join usuario usua on f.idusu = usua.idusuario inner join fact_com_prod fc on f.idfact_comp= fc.idfact_com inner join producto prod on fc.idpro=prod.idproducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `mostrar_cargo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cargo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cargo` AS select `cargo`.`idcargo` AS `idcargo`,`cargo`.`nombre` AS `nombre` from `cargo` where (`cargo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_cliente`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_cliente` AS select `cliente`.`cedula` AS `Cedula`,`sexo`.`nombre` AS `Genero`,`cliente`.`nombre` AS `Nombre`,`cliente`.`telefono` AS `Telefono`,`cliente`.`correo` AS `Correo`,`cliente`.`direccion` AS `Direccion`,`cliente`.`fechadenacimiento` AS `FechaDeNacimiento`,`cliente`.`tipodedocumento` AS `TipoDeDocumento` from (`cliente` join `sexo` on((`cliente`.`idsexo` = `sexo`.`idsexo`))) where (`cliente`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_detalle_factura`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_detalle_factura` AS select `fact_comp`.`idfact_comp` AS `IdentificadorFacturaCompra`,`producto`.`nombre` AS `Producto`,`fact_com_prod`.`cantidad_com` AS `CantidadComprada`,`fact_com_prod`.`pre_uni` AS `PrecioUnitario`,`fact_com_prod`.`pre_uni` AS `PrecioTotal` from ((`fact_com_prod` join `producto` on((`fact_com_prod`.`idpro` = `producto`.`idproducto`))) join `fact_comp` on((`fact_com_prod`.`idfact_com` = `fact_comp`.`idfact_comp`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_detalle_factura_compra`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_detalle_factura_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_detalle_factura_compra` AS select `detalle_factura_compra`.`iddetalle_factura_compra` AS `Nº_Detalle_Factura_Compra`,`detalle_factura_compra`.`id_factcompra` AS `Nº_Factura_Compra`,`producto`.`nombre` AS `Producto`,`detalle_factura_compra`.`cantidad_comprada` AS `Cantidad`,`detalle_factura_compra`.`precio_unitario_compra` AS `Precio_Unitario`,`detalle_factura_compra`.`precio_total_compra` AS `Precio_Total` from (`detalle_factura_compra` join `producto` on((`producto`.`idproducto` = `detalle_factura_compra`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_factura_compra`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_factura_compra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_factura_compra` AS select `fact_comp`.`idfact_comp` AS `Identificador`,`proveedor`.`nombre` AS `IdProveedor`,`usuario`.`nombre` AS `IdUsuario`,`fact_comp`.`fecha` AS `Fecha`,`fact_comp`.`total_comp` AS `TotalCompra`,`fact_comp`.`descuento` AS `Descuento`,`fact_comp`.`tipodepago` AS `TipoDePago`,`fact_comp`.`numerodecomprobante` AS `NumeroDeComprobante` from ((`fact_comp` join `proveedor` on((`proveedor`.`idProveedor` = `fact_comp`.`idProveedor`))) join `usuario` on((`fact_comp`.`idusu` = `usuario`.`idusuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_producto`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_producto` AS select `producto`.`idproducto` AS `Identificador`,`producto`.`nombre` AS `NombreDelProducto`,`producto`.`descripcion` AS `DescripcionDelProducto`,`producto`.`cantidad` AS `Existencias`,`producto`.`imagen` AS `ImagenDelProducto`,`producto`.`precio` AS `Precio` from `producto` where (`producto`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_proveedor` AS select `proveedor`.`idProveedor` AS `Identificacion`,`sexo`.`nombre` AS `Genero`,`proveedor`.`tipodedocumento` AS `TipoDeDocumento`,`proveedor`.`nombre` AS `Nombre`,`proveedor`.`correo` AS `Correo`,`proveedor`.`telefono` AS `Telefono`,`proveedor`.`direccion` AS `Direccion`,`proveedor`.`tipodepersona` AS `TipoDePersona`,`proveedor`.`fechadenacimiento` AS `FechaDeNacimiento` from (`proveedor` join `sexo` on((`proveedor`.`idsexo` = `sexo`.`idsexo`))) where (`proveedor`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_sexo`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_sexo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_sexo` AS select `sexo`.`idsexo` AS `idsexo`,`sexo`.`nombre` AS `nombre` from `sexo` where (`sexo`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_usuario`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_usuario` AS select `usuario`.`idusuario` AS `Identificador`,`sexo`.`nombre` AS `Genero`,`cargo`.`nombre` AS `Cargo`,`usuario`.`nombre` AS `Nombre`,`usuario`.`telefono` AS `Telefono`,`usuario`.`correo` AS `Correo`,`usuario`.`direccion` AS `Direccion`,`usuario`.`fechadenacimiento` AS `FechaDeNacimiento`,`usuario`.`tipodedocumento` AS `TipoDeDocumento` from ((`usuario` join `sexo` on((`sexo`.`idsexo` = `usuario`.`idsexo`))) join `cargo` on((`usuario`.`idcargo` = `cargo`.`idcargo`))) where (`usuario`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mostrar_venta`
--

/*!50001 DROP VIEW IF EXISTS `mostrar_venta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mostrar_venta` AS select `factura`.`idfactura` AS `Identificador`,`factura`.`fecha` AS `Fecha`,`factura`.`tipopago` AS `TipoDePago`,`factura`.`impuesto` AS `Impuesto`,`factura`.`totalfactura` AS `TotalFactura`,`cliente`.`nombre` AS `Cedula`,`usuario`.`nombre` AS `IDUsuario`,`factura`.`numerodecomprobante` AS `NumeroDeComprobante` from ((`factura` join `cliente` on((`factura`.`cedula` = `cliente`.`cedula`))) join `usuario` on((`factura`.`idusuario` = `usuario`.`idusuario`))) where (`factura`.`condicion` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 13:58:08
