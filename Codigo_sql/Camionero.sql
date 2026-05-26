-- MySQL dump 10.13  Distrib 9.7.0, for Linux (x86_64)
--
-- Host: localhost    Database: Camionero
-- ------------------------------------------------------
-- Server version	9.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a986bb22-40ed-11f1-8921-c2bf4e2e6c70:1-161';

--
-- Table structure for table `Camion`
--

DROP TABLE IF EXISTS `Camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camion` (
  `Matricula` varchar(9) NOT NULL,
  `Potencia` varchar(12) NOT NULL,
  `modelo` varchar(16) NOT NULL,
  `tipo` varchar(26) NOT NULL,
  PRIMARY KEY (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camion`
--

LOCK TABLES `Camion` WRITE;
/*!40000 ALTER TABLE `Camion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camionero`
--

DROP TABLE IF EXISTS `Camionero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camionero` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(26) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `salario` double NOT NULL,
  `poblacion` varchar(26) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camionero`
--

LOCK TABLES `Camionero` WRITE;
/*!40000 ALTER TABLE `Camionero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Camionero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paquete`
--

DROP TABLE IF EXISTS `Paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paquete` (
  `codigo` varchar(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `destinatario` varchar(26) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `cedula_camionero` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `cedula_camionero` (`cedula_camionero`),
  CONSTRAINT `Paquete_ibfk_1` FOREIGN KEY (`cedula_camionero`) REFERENCES `Camionero` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paquete`
--

LOCK TABLES `Paquete` WRITE;
/*!40000 ALTER TABLE `Paquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camionero_camion`
--

DROP TABLE IF EXISTS `camionero_camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionero_camion` (
  `id_camionero` varchar(10) NOT NULL,
  `id_camion` varchar(9) NOT NULL,
  PRIMARY KEY (`id_camionero`,`id_camion`),
  KEY `id_camion` (`id_camion`),
  CONSTRAINT `camionero_camion_ibfk_1` FOREIGN KEY (`id_camionero`) REFERENCES `Camionero` (`cedula`),
  CONSTRAINT `camionero_camion_ibfk_2` FOREIGN KEY (`id_camion`) REFERENCES `Camion` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camionero_camion`
--

LOCK TABLES `camionero_camion` WRITE;
/*!40000 ALTER TABLE `camionero_camion` DISABLE KEYS */;
/*!40000 ALTER TABLE `camionero_camion` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-26  2:01:07
