-- MySQL dump 10.13  Distrib 8.4.4, for Linux (x86_64)
--
-- Host: localhost    Database: sgbd
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `boleta`
--

DROP TABLE IF EXISTS `boleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boleta` (
  `venta_id` varchar(8) NOT NULL,
  `dni` varchar(8) NOT NULL,
  PRIMARY KEY (`venta_id`,`dni`),
  CONSTRAINT `fk_boleta_venta_id` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `check_boleta_dni_length` CHECK ((char_length(`dni`) = 8))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boleta`
--

LOCK TABLES `boleta` WRITE;
/*!40000 ALTER TABLE `boleta` DISABLE KEYS */;
INSERT INTO `boleta` VALUES ('1674f341','12345671'),('1678c251','12345672'),('167b5b60','12345673'),('167def43','12345674'),('168095df','12345675'),('1683368f','12345676'),('1686606d','12345677'),('1688f096','12345678'),('168bca88','12345679'),('168e4c63','12345670'),('1690ff3e','23456781'),('169398ce','23456782'),('1696123d','23456783'),('1698c235','23456784'),('169b4abc','23456785'),('169d9012','23456786'),('16a01e4a','23456787'),('16a2f1f2','23456788'),('16a68262','23456789'),('16a93fdf','23456780');
/*!40000 ALTER TABLE `boleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` varchar(8) NOT NULL DEFAULT (left(uuid(),8)),
  `nombre` varchar(32) NOT NULL,
  `apellido_paterno` varchar(32) NOT NULL,
  `apellido_materno` varchar(32) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('CLI00001','Elena','Quispe','Flores','987654321'),('CLI00002','Ricardo','Soto','Vega','912345678'),('CLI00003','Maria','Chavez','Rios','998877665'),('CLI00004','Jorge','Benites','Silva','965432109'),('CLI00005','Sofia','Castro','Mendoza','945678901'),('CLI00006','Luis','Ramirez','Guillen','932109876'),('CLI00007','Carmen','Herrera','Paredes','978901234'),('CLI00008','Andres','Morales','Cruz','923456789'),('CLI00009','Beatriz','Ortega','Reyes','956789012'),('CLI00010','Fernando','Jimenez','Navarro','989012345'),('CLI00011','Gabriela','Ruiz','Alvarez','911223344'),('CLI00012','Diego','Moreno','Romero','955667788'),('CLI00013','Valeria','Gil','Iglesias','999001122'),('CLI00014','Martin','Santos','Blanco','933445566'),('CLI00015','Paula','Pastor','Nuñez','977889900');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `venta_id` varchar(8) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  PRIMARY KEY (`venta_id`,`ruc`),
  CONSTRAINT `fk_factura_venta_id` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `check_factura_ruc_length` CHECK ((char_length(`ruc`) = 11))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES ('16abc474','10123456781'),('16ae5603','10123456782'),('16b0f998','10123456783'),('16b33baf','10123456784'),('16b5f726','10123456785'),('16b88603','20123456781'),('16bb1e34','20123456782'),('16bd7b37','20123456783'),('16c013e1','20123456784'),('16c267c8','20123456785');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_familia_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (13,'arroces'),(19,'bebidas'),(17,'cena'),(3,'ceviches'),(4,'chaufas'),(14,'chilcanos'),(11,'chupes'),(8,'criollos'),(1,'desayunos'),(6,'duos y trios'),(2,'especialidades'),(5,'frituras'),(10,'fuentes'),(9,'guarniciones'),(22,'infusiones'),(7,'menu piurano'),(15,'parihuelas'),(18,'piqueos'),(16,'sudados'),(12,'tortillas'),(20,'tragos'),(21,'vinos');
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(9) NOT NULL DEFAULT 'LIBRE',
  `inicio_reserva` datetime DEFAULT NULL,
  `fin_reserva` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `check_mesa_estado` CHECK ((`estado` in (_utf8mb4'RESERVADA',_utf8mb4'OCUPADA',_utf8mb4'LIBRE',_utf8mb4'INACTIVA')))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,'LIBRE',NULL,NULL),(2,'LIBRE',NULL,NULL),(3,'LIBRE',NULL,NULL),(4,'LIBRE',NULL,NULL),(5,'LIBRE',NULL,NULL),(6,'LIBRE',NULL,NULL),(7,'LIBRE',NULL,NULL),(8,'LIBRE',NULL,NULL),(9,'LIBRE',NULL,NULL),(10,'LIBRE',NULL,NULL),(11,'LIBRE',NULL,NULL),(12,'LIBRE',NULL,NULL),(13,'LIBRE',NULL,NULL),(14,'LIBRE',NULL,NULL),(15,'LIBRE',NULL,NULL),(16,'LIBRE',NULL,NULL),(17,'LIBRE',NULL,NULL),(18,'LIBRE',NULL,NULL),(19,'LIBRE',NULL,NULL),(20,'LIBRE',NULL,NULL),(21,'LIBRE',NULL,NULL),(22,'LIBRE',NULL,NULL),(23,'LIBRE',NULL,NULL),(24,'LIBRE',NULL,NULL),(25,'LIBRE',NULL,NULL),(26,'LIBRE',NULL,NULL),(27,'LIBRE',NULL,NULL),(28,'LIBRE',NULL,NULL),(29,'LIBRE',NULL,NULL),(30,'LIBRE',NULL,NULL),(31,'LIBRE',NULL,NULL),(32,'LIBRE',NULL,NULL),(33,'LIBRE',NULL,NULL),(34,'LIBRE',NULL,NULL),(35,'LIBRE',NULL,NULL),(36,'LIBRE',NULL,NULL),(37,'LIBRE',NULL,NULL),(38,'LIBRE',NULL,NULL),(39,'LIBRE',NULL,NULL),(40,'LIBRE',NULL,NULL),(41,'LIBRE',NULL,NULL),(42,'LIBRE',NULL,NULL),(43,'LIBRE',NULL,NULL),(44,'LIBRE',NULL,NULL),(45,'LIBRE',NULL,NULL),(46,'LIBRE',NULL,NULL),(47,'LIBRE',NULL,NULL),(48,'LIBRE',NULL,NULL),(49,'LIBRE',NULL,NULL),(50,'LIBRE',NULL,NULL);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mozo`
--

DROP TABLE IF EXISTS `mozo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mozo` (
  `id` varchar(8) NOT NULL DEFAULT (left(uuid(),8)),
  `nombre` varchar(32) NOT NULL,
  `apellido_paterno` varchar(32) NOT NULL,
  `apellido_materno` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mozo`
--

LOCK TABLES `mozo` WRITE;
/*!40000 ALTER TABLE `mozo` DISABLE KEYS */;
INSERT INTO `mozo` VALUES ('MOZO0001','Carlos','Gomez','Perez'),('MOZO0002','Lucia','Mendez','Rojas'),('MOZO0003','Pedro','Vargas','Luna'),('MOZO0004','Ana','Torres','Solis');
/*!40000 ALTER TABLE `mozo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) NOT NULL DEFAULT 'PENDIENTE',
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mozo_id` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido__mozo_id` (`mozo_id`),
  CONSTRAINT `fk_pedido__mozo_id` FOREIGN KEY (`mozo_id`) REFERENCES `mozo` (`id`),
  CONSTRAINT `check_pedido_estado` CHECK ((`estado` in (_utf8mb4'PENDIENTE',_utf8mb4'CANCELADO',_utf8mb4'COMPLETADO')))
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'PENDIENTE','2025-06-28 09:05:49','MOZO0001'),(2,'PENDIENTE','2025-06-28 09:05:49','MOZO0002'),(3,'PENDIENTE','2025-06-28 09:05:49','MOZO0003'),(4,'PENDIENTE','2025-06-28 09:05:49','MOZO0004'),(5,'PENDIENTE','2025-06-28 09:05:49','MOZO0001'),(6,'PENDIENTE','2025-06-28 09:05:49','MOZO0002'),(7,'PENDIENTE','2025-06-28 09:05:49','MOZO0003'),(8,'PENDIENTE','2025-06-28 09:05:49','MOZO0004'),(9,'PENDIENTE','2025-06-28 09:05:49','MOZO0001'),(10,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(11,'PENDIENTE','2025-06-28 09:05:50','MOZO0003'),(12,'PENDIENTE','2025-06-28 09:05:50','MOZO0004'),(13,'PENDIENTE','2025-06-28 09:05:50','MOZO0001'),(14,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(15,'PENDIENTE','2025-06-28 09:05:50','MOZO0003'),(16,'PENDIENTE','2025-06-28 09:05:50','MOZO0004'),(17,'PENDIENTE','2025-06-28 09:05:50','MOZO0001'),(18,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(19,'PENDIENTE','2025-06-28 09:05:50','MOZO0003'),(20,'PENDIENTE','2025-06-28 09:05:50','MOZO0004'),(21,'PENDIENTE','2025-06-28 09:05:50','MOZO0001'),(22,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(23,'PENDIENTE','2025-06-28 09:05:50','MOZO0003'),(24,'PENDIENTE','2025-06-28 09:05:50','MOZO0004'),(25,'PENDIENTE','2025-06-28 09:05:50','MOZO0001'),(26,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(27,'PENDIENTE','2025-06-28 09:05:50','MOZO0003'),(28,'PENDIENTE','2025-06-28 09:05:50','MOZO0004'),(29,'PENDIENTE','2025-06-28 09:05:50','MOZO0001'),(30,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(31,'PENDIENTE','2025-06-28 09:05:50','MOZO0003'),(32,'PENDIENTE','2025-06-28 09:05:50','MOZO0004'),(33,'PENDIENTE','2025-06-28 09:05:50','MOZO0001'),(34,'PENDIENTE','2025-06-28 09:05:50','MOZO0002'),(35,'PENDIENTE','2025-06-28 09:05:50','MOZO0003');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_mesa`
--

DROP TABLE IF EXISTS `pedido_mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_mesa` (
  `pedido_id` int NOT NULL,
  `mesa_id` int NOT NULL,
  PRIMARY KEY (`pedido_id`,`mesa_id`),
  KEY `fk_pedido_mesa_mesa_id` (`mesa_id`),
  CONSTRAINT `fk_pedido_mesa_mesa_id` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`id`),
  CONSTRAINT `fk_pedido_mesa_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_mesa`
--

LOCK TABLES `pedido_mesa` WRITE;
/*!40000 ALTER TABLE `pedido_mesa` DISABLE KEYS */;
INSERT INTO `pedido_mesa` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10),(6,11),(6,12),(7,13),(7,14),(8,15),(8,16),(9,17),(9,18),(10,19),(10,20),(11,21),(12,22),(13,23),(14,24),(15,25),(16,26),(17,27),(18,28),(19,29),(20,30),(21,31),(22,32),(23,33),(24,34),(25,35),(26,36),(27,37),(28,38),(29,39),(30,40),(31,41),(31,42),(32,43),(32,44),(33,45),(33,46),(34,47),(34,48),(35,49),(35,50);
/*!40000 ALTER TABLE `pedido_mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `familia_id` int NOT NULL,
  `descripcion` text,
  `precio` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_familia_id` (`familia_id`),
  CONSTRAINT `fk_producto_familia_id` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`),
  CONSTRAINT `check_producto_precio` CHECK ((`precio` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Pescado Frito + Café + Yuca',1,'(Pescado, café, yuca hervida, zarza)',15.00),(2,'Chilcano Económico',1,'(Pescado, Fumet, arroz, choros)',6.00),(3,'Costilla Frita de Cerdo',1,'(Costilla dorada, yuca, zarza criolla)',30.00),(4,'Chicharrón + Café',1,'(Porción de chicharrón de cerdo, café, zarza)',20.00),(5,'RONDA PIURANA',2,'Seco de chabelo, majado de yuca, cecina, chicharrón de chancho, ceviche de caballa, jarra de  chicha de jora.',80.00),(6,'ESPECIAL  \"PIURANO\"',2,'Ceviche de cachema, ceviche de caballa, seco de chabelo, chicharrón de pescado.',60.00),(7,'SECO DE CHABELO',2,'Crujiente cecina, plátano verde, crujiente cancha, zarza.',35.00),(8,'MAJADO DE YUCA',2,'Yuca chancada, cecina de chancho, chifle , cancha, zarza.',32.00),(9,'MAJARISCO',2,'Plátano verde, langostino, calamar, almejas.',38.00),(10,'CARNE SECA',2,'Cecina, chifles, platacones, zarza.',35.00),(11,'CARNE ALIÑIADA',2,'Carne oreada, chifles, platacones, zarza.',35.00),(12,'PASADITO POR AGUA CALIENTE',2,'Pescado caballa, yuca y zarza.',30.00),(13,'CANGREJO REVENTADO',2,'Cangrejo, papa sancochada.',40.00),(14,'GUISADA DE TOLLO',2,'Pez tollo en base de escabeche mas guarnición.',18.00),(15,'TOLLITO GUISADO',2,'Pez tollo sancochado, deshuesado con arroz.',30.00),(16,'PATASQUITA PIURANA',2,'Mote, mondonguito, pellejito de chancho, fumet.',20.00),(17,'CAUSA NORTEÑA',2,'Puré de papa, pescado encebollado, choiclo, camote, plátano sancochado, yuca.',40.00),(18,'CAZUELA DE LANGOSTINOS Y PULPO',2,'Langostino, pulpo, fumet.',40.00),(19,'CEVICHE MIXTO \"PIURANO\"',2,'Zumo de limón, ceviche cabrilla, ceviche conchas negras, ceviche caballa.',60.00),(20,'SOPA DE NOVIOS',2,'Fumet, fideo, aceituna, pasas, (cabrito o pato)',30.00),(21,'Ceviche Simple',3,'(Pescado, zumo de limón, sal, cebolla, guarniciones)',30.00),(22,'Ceviche Mixto',3,'(Pescado, zumo de limón, sal, cebolla, mariscos, guarniciones)',32.00),(23,'Ceviche Mariscos',3,'(Mariscos, zumo de limón, sal, cebolla, guarniciones)',32.00),(24,'Ceviche Pulpo',3,'(Pulpo, zumo de limón, sal, cebolla, guarniciones)',33.00),(25,'Ceviche Langostinos',3,'(Langostinos, zumo de limón, sal, cebolla, guarniciones)',34.00),(26,'Ceviche Corvina',3,'(Pez corvina, zumo de limón, sal, cebolla, guarniciones)',40.00),(27,'Ceviche Cachema',3,'(Pez cachema, zumo de limón, sal, cebolla, guarniciones)',30.00),(28,'Ceviche Ojo de Uva',3,'(Pez Ojo de Uva, zumo de limón, sal, cebolla, guarniciones)',40.00),(29,'Ceviche de Cangrejos',3,'(Cangrejos, zumo de limón, sal, cebolla, guarniciones)',30.00),(30,'Ceviche de Caballa',3,'(Caballa salpresa, zumo de limón, sal, cebolla, tomate, guarniciones)',25.00),(31,'Choros a la Chalaca',3,'(Choros, zumo de limón, sal, cebolla, tomate, guarnición)',25.00),(32,'Tiradito Clásico',3,'(Láminas de pescado, salsa de ajíes peruanos)',30.00),(33,'Leche de Tigre',3,'(Pescado, leche de tigre de ají limo, cebolla)',15.00),(34,'Chaufa de Mariscos',4,'Arroz, mariscos, huevo',28.00),(35,'Chaufa de Pescado',4,'Arroz, pescado, huevo',30.00),(36,'Chaufa de Langostinos',4,'Arroz, langostinos, huevo',30.00),(37,'Chaufa de Pulpo',4,'Arroz, pulpo, huevo',33.00),(38,'Chaufa Especial',4,'Arroz, tocino, mariscos',30.00),(39,'Chaufa de Pollo',4,'Arroz, pollo, huevo',28.00),(40,'Chicharrón Simple',5,'Pescado empanizado, yuca frita y zarza.',30.00),(41,'Chicharrón Mixto',5,'Pescado empanizado, mariscos empanizados, yuca frita y zarza.',32.00),(42,'Chicharrón de Mariscos',5,'Mariscos empanizados, yuca frita y zarza.',32.00),(43,'Chicharrón de Pulpo',5,'Pulpo empanizado, yuca frita y zarza.',35.00),(44,'Chicharrón de Langostinos',5,'Langostinos empanizados, yuca frita y zarza.',35.00),(45,'Chicharrón de Calamar',5,'Calamar empanizado, yuca frita y zarza.',32.00),(46,'Cachema Encebollada',5,'Cachema, cebolla, tomate, camote y chifles.',30.00),(47,'Jalea Mixta',5,'Filete de pescado apanado, chicharrón de pescado con mariscos, yuca frita y zarza.',38.00),(48,'Chita Frita',5,'Pez Chita frita, zarza criolla, yuca y/o arroz.',40.00),(49,'Mero Frito',5,'Pez Mero frito, zarza criolla, yuca y/o arroz.',40.00),(50,'Cachema Frita',5,'Pez Cachema frita, zarza criolla, yuca y/o arroz.',30.00),(51,'Corvina Frita',5,'Pez Corvina frita, zarza criolla, yuca y/o arroz.',40.00),(52,'Corvina Frita \"Filete\"',5,'Pez Corvina frita filete, zarza criolla, yuca y/o arroz.',40.00),(53,'Apanado de Corvina Frita',5,'Pez Corvina apanado, zarza, arroz, yuca frita.',40.00),(54,'Tollo Apanado',5,'Pez Tollo apanado, zarza, arroz, yuca frita.',25.00),(55,'Escabeche de Pescado',5,'Pescado frito, cebolla agria, yuca frita.',25.00),(56,'Pescado a lo Macho',5,'Pescado frito, picante de mariscos, camote.',50.00),(57,'Pescado al Ajo',5,'Pescado frito, crema de ajo.',35.00),(58,'Pescado en Salsa de Langostinos',5,'Pescado frito, crema de langostinos',50.00),(59,'Dúos Marinos',6,'2 porciones a escoger: Arroz con mariscos, Chicharrón o Ceviche.',25.00),(60,'Tríos Marinos',6,'Ceviche, Arroz con mariscos y Chicharrón.',30.00),(61,'Menú Marino 1',7,'Chilcano, arroz con mariscos, vaso clarito.',15.00),(62,'Menú Marino 2',7,'Chilcano, arroz, pescado frito, vaso clarito.',15.00),(63,'Lomo Saltado',8,'Lomo, papa frita, arroz.',30.00),(64,'Pollo a la Plancha',8,'Pollo, papa frita, arroz.',25.00),(65,'Pato Guisado',8,'Pato, yuca, arroz menestra o yuca.',30.00),(66,'Cabrito',8,'Cabrito, yuca, arroz menestra o yuca.',30.00),(67,'Chifles',9,'Láminas de plátano',10.00),(68,'Patacones',9,'Rodaja chancada de plátano frito',10.00),(69,'Arroz blanco',9,'',5.00),(70,'Yuca o camote',9,'',5.00),(71,'Cancha',9,'',5.00),(72,'Ceviches',10,'',90.00),(73,'Chicharrones',10,'',90.00),(74,'Arroz Con Mariscos',10,'',90.00),(75,'Sudados',10,'',90.00),(76,'Chupe de Pescado',11,'Pescado, arroz, papa, huevo',25.00),(77,'Chupe de Cangrejos',11,'Cangrejo, arroz, papa, huevo',30.00),(78,'Chupe de Langostinos',11,'Langostinos, arroz, papa, huevo',30.00),(79,'Chupe de Camarones',11,'Camarones, arroz, papa, huevo',30.00),(80,'Chupe de Mero',11,'Pez Mero, arroz, papa, huevo',45.00),(81,'Chupe de Mariscos',11,'Mariscos, arroz, papa, huevo',32.00),(82,'Chupe de Ojo de Uva',11,'Pez Ojo de Uva, arroz, papa, huevo',40.00),(83,'Chupe de Corvina',11,'Pez Corvina, arroz, papa, huevo',40.00),(84,'Tortilla de Pescado',12,'Huevo, pescado, arroz',25.00),(85,'Tortilla de Mariscos',12,'Huevo, mariscos, arroz',25.00),(86,'Tortilla de Verduras',12,'Verduras, huevo, arroz',15.00),(87,'Tortilla de Langostinos',12,'Langostinos, huevo, arroz',30.00),(88,'Arroz con Mariscos',13,'Arroz, ajíes peruanos, mariscos',28.00),(89,'Arroz con Langostinos',13,'Arroz, ajíes peruanos, langostinos',30.00),(90,'Arroz con Choros',13,'Arroz, ajíes peruanos, pulpa de choros',25.00),(91,'Arroz con Camarones',13,'Arroz, ajíes peruanos, camarones',30.00),(92,'Arroz con Calamar',13,'Arroz, ajíes peruanos, calamar',30.00),(93,'Chilcano de Tollo',14,'Pez Tollo, fumet, arroz',15.00),(94,'Chilcano de Chita',14,'Pez Chita, fumet, arroz',30.00),(95,'Chilcano de Cabrilla',14,'Pez Cabrilla, fumet, arroz',28.00),(96,'Chilcano de Mero',14,'Pez Mero, fumet, arroz',35.00),(97,'Chilcano de Corvina',14,'Pez Corvina, fumet, arroz',35.00),(98,'Parihuela Mixta',15,'Pescado, mariscos, cangrejo, fumet',32.00),(99,'Parihuela de Chita',15,'Pez Chita, mariscos, cangrejo, ajíes peruanos, fumet',40.00),(100,'Parihuela de Mero',15,'Pez Mero, mariscos, cangrejo, ajíes peruanos, fumet',40.00),(101,'Parihuela de Corvina',15,'Pez Corvina, mariscos, cangrejo, ajíes peruanos, fumet',40.00),(102,'Parihuela Especial',15,'Filete Pescado, mariscos, cangrejo, ajíes peruanos, fumet',40.00),(103,'Pescado Frito + Café + Yuca',17,'Pescado, café, yuca zarza',15.00),(104,'Sopa de Novios',17,'Fumet, fideo, aceituna, pasas, cabrito o pato',30.00),(105,'Sopa de Novios con Gallina',17,'Fumet, fideo, aceituna, pasas, gallina',15.00),(106,'Sopa de Novios con Pollo',17,'Fumet, fideo, aceituna, pasas, pollo',12.00),(107,'Pasadito por agua caliente',17,'Caballa, yuca, zarza',30.00),(108,'Tamalitos Verdes',18,NULL,6.00),(109,'Brocheta de Langostino',18,NULL,20.00),(110,'Anticucho de Pescado',18,NULL,15.00),(111,'Anticucho de Pulpo',18,NULL,20.00),(112,'Anticucho Mixto',18,'Pulpo, Camarones',25.00),(113,'Alitas',18,'BBQ, Acevichadas, Maracuyá',20.00),(114,'Agua Personal',19,NULL,3.00),(115,'Gaseosa Personal',19,NULL,3.00),(116,'Gaseosa Gordita',19,NULL,6.00),(117,'Gaseosa 1 L',19,NULL,8.00),(118,'Gaseosa 2 L',19,NULL,15.00),(119,'Cerveza Cusqueña Negra',19,NULL,12.00),(120,'Cerveza Cusqueña Trigo',19,NULL,12.00),(121,'Cerveza Pilsen Trujillo',19,NULL,9.00),(122,'Cerveza Pilsen Callao',19,NULL,10.00),(123,'Cerveza Pilsen Callao 310 ml',19,NULL,6.00),(124,'Cerveza Heineken',19,NULL,9.00),(125,'Cerveza Corona',19,NULL,9.00),(126,'Cerveza Stella Artois',19,NULL,9.00),(127,'Jarra Frozen / Helado / Sin helar 1 L',19,'Mango Ciruelo, Tamarindo, Maracuyá, Chicha Morada, Limonada',15.00),(128,'Jarra Frozen / Helado 500 ml',19,'Mango Ciruelo, Tamarindo, Maracuyá, Chicha Morada, Limonada',9.00),(129,'Jarra Chicha Piurana 1 L',19,NULL,6.00),(130,'Jarra Chicha Piurana 500 ml',19,NULL,9.00),(131,'Derecho de Corcho',19,NULL,20.00),(132,'Calimocho',20,NULL,15.00),(133,'Machu Picchu',20,NULL,15.00),(134,'Mojito',20,NULL,15.00),(135,'Chilcano de Pisco',20,NULL,15.00),(136,'Cuba Libre',20,NULL,15.00),(137,'Pisco Sour',20,NULL,15.00),(138,'Vino Tinto Tabernero',21,NULL,35.00),(139,'Vino Gran Rose Tabernero',21,NULL,35.00),(140,'Vino Gran Blanco Tabernero',21,NULL,35.00),(141,'Vino Tinto Tacama',21,NULL,35.00),(142,'Vino Tinto Rose Tacama',21,NULL,35.00),(143,'Vino Blanco Tacama',21,NULL,35.00),(144,'Té',22,NULL,5.00),(145,'Manzanilla',22,NULL,5.00),(146,'Anís',22,NULL,5.00),(147,'Café',22,NULL,5.00),(148,'Hierva Luisa',22,NULL,5.00),(149,'Sudado de Tollo',16,'Fumet, pescado, encebollado',30.00),(150,'Sudado de Cabrilla',16,'Fumet, pescado, encebollado',30.00),(151,'Sudado de Chita',16,'Fumet, pescado, encebollado',40.00),(152,'Sudado de Corvina',16,'Fumet, pescado, encebollado',40.00),(153,'Sudado de Mero',16,'Fumet, pescado, encebollado',40.00),(154,'Sudado de Ojo de Uva',16,'Fumet, pescado, encebollado',40.00),(155,'Sudado de Tramboyo',16,'Fumet, pescado, encebollado',35.00);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_pedido`
--

DROP TABLE IF EXISTS `producto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_pedido` (
  `pedido_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`pedido_id`,`producto_id`),
  KEY `fk_producto_pedido_producto_id` (`producto_id`),
  CONSTRAINT `fk_producto_pedido_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_producto_pedido_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `check_producto_pedido_cantidad` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_pedido`
--

LOCK TABLES `producto_pedido` WRITE;
/*!40000 ALTER TABLE `producto_pedido` DISABLE KEYS */;
INSERT INTO `producto_pedido` VALUES (1,5,1),(1,140,2),(2,21,2),(2,35,1),(2,132,1),(3,7,1),(3,60,1),(3,126,4),(4,41,1),(4,80,1),(4,151,1),(5,50,1),(5,93,1),(5,120,2),(5,143,1),(6,67,1),(6,68,1),(6,122,1),(7,71,2),(7,103,2),(8,73,1),(8,127,3),(8,154,1),(9,2,1),(9,89,1),(9,152,2),(10,117,2),(10,139,2),(11,22,1),(11,120,1),(12,41,1),(12,120,1),(13,93,1),(13,126,1),(14,67,1),(14,120,1),(15,79,1),(15,132,1),(16,1,1),(16,152,1),(17,31,1),(17,119,1),(18,40,1),(18,120,1),(19,56,1),(19,127,2),(20,70,1),(20,120,1),(21,100,1),(21,126,1),(22,71,1),(22,103,1),(23,73,1),(23,154,1),(24,113,1),(24,142,1),(25,34,1),(25,131,1),(26,42,1),(26,120,1),(27,60,1),(27,119,2),(28,69,1),(28,126,1),(29,84,1),(29,152,1),(30,109,1),(30,139,1),(31,6,1),(31,71,2),(31,132,1),(32,5,1),(32,126,4),(32,131,2),(33,57,2),(33,119,2),(33,143,1),(34,76,1),(34,77,1),(34,121,2),(35,13,1),(35,26,1),(35,127,3);
/*!40000 ALTER TABLE `producto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `precio_adicional` decimal(6,2) DEFAULT NULL,
  `cliente_id` varchar(8) NOT NULL,
  `pedido_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_cliente_id` (`cliente_id`),
  KEY `fk_reserva_pedido_id` (`pedido_id`),
  CONSTRAINT `fk_reserva_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_reserva_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `check_reserva_precio_adicional` CHECK ((`precio_adicional` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2025-06-29 09:05:49','2025-06-29 11:05:49',10.00,'CLI00001',1),(2,'2025-06-30 09:05:49','2025-06-30 12:05:49',0.00,'CLI00002',2),(3,'2025-06-29 21:05:49','2025-06-30 00:05:49',5.00,'CLI00003',3),(4,'2025-07-01 09:05:49','2025-07-01 11:05:49',0.00,'CLI00004',4),(5,'2025-07-02 09:05:49','2025-07-02 13:05:49',15.00,'CLI00005',5),(6,'2025-07-03 09:05:49','2025-07-03 11:05:49',0.00,'CLI00006',6),(7,'2025-07-04 09:05:49','2025-07-04 11:05:49',0.00,'CLI00007',7),(8,'2025-07-05 09:05:49','2025-07-05 12:05:49',8.00,'CLI00008',8),(9,'2025-07-06 09:05:50','2025-07-06 10:05:50',0.00,'CLI00009',9),(10,'2025-07-07 09:05:50','2025-07-07 11:05:50',20.00,'CLI00010',10);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id` varchar(8) NOT NULL DEFAULT (left(uuid(),8)),
  `total` decimal(6,2) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_id` varchar(8) DEFAULT NULL,
  `pedido_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venta_cliente_id` (`cliente_id`),
  KEY `fk_venta_pedido_id` (`pedido_id`),
  CONSTRAINT `fk_venta_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `fk_venta_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `check_venta_total` CHECK ((`total` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES ('1674f341',96.00,'2025-06-28 09:05:50','CLI00001',1),('1678c251',98.00,'2025-06-28 09:05:50','CLI00002',2),('167b5b60',78.00,'2025-06-28 09:05:50','CLI00003',3),('167def43',86.00,'2025-06-28 09:05:50','CLI00004',4),('168095df',114.00,'2025-06-28 09:05:50','CLI00005',5),('1683368f',63.00,'2025-06-28 09:05:50','CLI00006',6),('1686606d',86.00,'2025-06-28 09:05:50','CLI00007',7),('1688f096',70.00,'2025-06-28 09:05:50','CLI00008',8),('168bca88',41.00,'2025-06-28 09:05:50','CLI00009',9),('168e4c63',64.00,'2025-06-28 09:05:50','CLI00010',10),('1690ff3e',35.00,'2025-06-28 09:05:50',NULL,11),('169398ce',33.00,'2025-06-28 09:05:50',NULL,12),('1696123d',37.00,'2025-06-28 09:05:50',NULL,13),('1698c235',33.00,'2025-06-28 09:05:50',NULL,14),('169b4abc',31.00,'2025-06-28 09:05:50',NULL,15),('169d9012',20.00,'2025-06-28 09:05:50',NULL,16),('16a01e4a',28.00,'2025-06-28 09:05:50',NULL,17),('16a2f1f2',31.00,'2025-06-28 09:05:51',NULL,18),('16a68262',45.00,'2025-06-28 09:05:51',NULL,19),('16a93fdf',33.00,'2025-06-28 09:05:51',NULL,20),('16abc474',37.00,'2025-06-28 09:05:51','CLI00011',21),('16ae5603',42.00,'2025-06-28 09:05:51','CLI00012',22),('16b0f998',35.00,'2025-06-28 09:05:51','CLI00013',23),('16b33baf',21.00,'2025-06-28 09:05:51','CLI00014',24),('16b5f726',24.00,'2025-06-28 09:05:51','CLI00015',25),('16b88603',35.00,'2025-06-28 09:05:51',NULL,26),('16bb1e34',36.00,'2025-06-28 09:05:51',NULL,27),('16bd7b37',39.00,'2025-06-28 09:05:51',NULL,28),('16c013e1',45.00,'2025-06-28 09:05:51',NULL,29),('16c267c8',30.00,'2025-06-28 09:05:51',NULL,30),('16c59a30',86.00,'2025-06-28 09:05:51','CLI00001',31),('16c708f1',134.00,'2025-06-28 09:05:51','CLI00002',32),('16c87238',155.00,'2025-06-28 09:05:51',NULL,33),('16c9affc',202.00,'2025-06-28 09:05:51',NULL,34),('16cafbff',97.00,'2025-06-28 09:05:51',NULL,35);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-28  9:38:00
