CREATE DATABASE  IF NOT EXISTS `wkvenda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wkvenda`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: wkvenda
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_clientes` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOM_CLIENTE` varchar(65) DEFAULT NULL,
  `NOM_CIDADE` varchar(45) DEFAULT NULL,
  `NOM_UF` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  KEY `INDEX` (`NOM_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES (1,'MATHEUS DE OLIVEIRA MARQUES FIGUEREDO','JUSSARA','GO'),(2,'FABIO PEREIRA SILVA','GOIANIA','GO'),(3,'MARIA EDUARDA FARIA','ANAPOLIS','GO'),(4,'RIAN LEMOS GOMES','BRASILIA','DF'),(5,'EURIPEDES DA SILVA GOMES','FRUTAL','MG'),(6,'RICARDO ANDRADE','CUIABA','MT'),(7,'AMANDA RICELLE SILVA','PALMINOPOLIS','GO'),(8,'NAYARA SILVA','RIO DE JAINEIRO','RJ'),(9,'FABIA MARIA DE LIMA','SAO PAULO','SP'),(10,'JORGE MATHEUS SOUZA','BARRA DO GARÇAS','MT'),(11,'LUIZ VITOR SILVA','COSTA RICA','MS'),(12,'CESAR ALMEIDA JUNIOR','COCALINHO','MT'),(13,'EDSON JUNIOR SANTANA','LONDRINA','SC'),(14,'LEILA DE FATIMA E SOUZA','PALMEIRAS DE GOIAS','GO'),(15,'BRUNA STEFANY SILVA','PALMEIROPOLIS','TO'),(16,'ALINE PEREIRA SILVA','SANTA FÉ DE GOIAS','GO'),(17,'ESTER PEREIRA DE SOUZA','BARRETOS','SP'),(18,'GUMERCINO VICENTE SANTANA','MANAUS','AM'),(19,'VITORIA SOUZA E SOUZA','RECIFE','PE'),(20,'MARILIA BARBOSA LIMA','SALVADOR','BA'),(21,'STEFANY MARIA SILVA','SINOP','MT'),(22,'DANIELE SILVA SOUZA','GUARUJA','SP'),(23,'MARCELO FERNANDES FARIA','GOINESIA','GO'),(24,'MICHEL LEMES SOUZA','TURVANIA','GO'),(25,'MATHEUS DE SOUZA','SAO LUIZ','MA'),(26,'ENZO GABRIEL FERREIRA','EDEIA','GO');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-12 14:19:45
