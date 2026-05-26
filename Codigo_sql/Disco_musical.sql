-- MySQL dump 10.13  Distrib 9.7.0, for Linux (x86_64)
--
-- Host: localhost    Database: Disco_musicales
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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a986bb22-40ed-11f1-8921-c2bf4e2e6c70:1-156';

--
-- Table structure for table `Cancion`
--

DROP TABLE IF EXISTS `Cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cancion` (
  `id_cancion` varchar(10) NOT NULL,
  `titulo_cancion` varchar(26) NOT NULL,
  PRIMARY KEY (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cancion`
--

LOCK TABLES `Cancion` WRITE;
/*!40000 ALTER TABLE `Cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cantante`
--

DROP TABLE IF EXISTS `Cantante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cantante` (
  `id_cantante` varchar(10) NOT NULL,
  `nombre` varchar(26) NOT NULL,
  `pais` varchar(18) NOT NULL,
  `codigo_disco` varchar(10) NOT NULL,
  PRIMARY KEY (`id_cantante`),
  KEY `codigo_disco` (`codigo_disco`),
  CONSTRAINT `Cantante_ibfk_1` FOREIGN KEY (`codigo_disco`) REFERENCES `Disco` (`id_disco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cantante`
--

LOCK TABLES `Cantante` WRITE;
/*!40000 ALTER TABLE `Cantante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cantante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disco`
--

DROP TABLE IF EXISTS `Disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disco` (
  `id_disco` varchar(10) NOT NULL,
  `titulo` varchar(26) NOT NULL,
  `precio` double NOT NULL,
  `codigo_genero` int NOT NULL,
  PRIMARY KEY (`id_disco`),
  KEY `codigo_genero` (`codigo_genero`),
  CONSTRAINT `Disco_ibfk_1` FOREIGN KEY (`codigo_genero`) REFERENCES `Genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disco`
--

LOCK TABLES `Disco` WRITE;
/*!40000 ALTER TABLE `Disco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero` (
  `id_genero` int NOT NULL,
  `nombre` varchar(26) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disco_cancion`
--

DROP TABLE IF EXISTS `disco_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco_cancion` (
  `codigo_disco` varchar(10) NOT NULL,
  `codigo_cancion` varchar(10) NOT NULL,
  KEY `codigo_disco` (`codigo_disco`),
  KEY `codigo_cancion` (`codigo_cancion`),
  CONSTRAINT `disco_cancion_ibfk_1` FOREIGN KEY (`codigo_disco`) REFERENCES `Disco` (`id_disco`),
  CONSTRAINT `disco_cancion_ibfk_2` FOREIGN KEY (`codigo_cancion`) REFERENCES `Cancion` (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disco_cancion`
--

LOCK TABLES `disco_cancion` WRITE;
/*!40000 ALTER TABLE `disco_cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `disco_cancion` ENABLE KEYS */;
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

-- Dump completed on 2026-05-26  1:48:20
