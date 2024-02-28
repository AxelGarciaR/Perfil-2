-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edumanaage
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` varchar(36) NOT NULL,
  `nombre_materia` varchar(100) DEFAULT NULL,
  `grupo_materia` int(11) DEFAULT NULL,
  `id_profesor` varchar(36) DEFAULT NULL,
  `cupos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  KEY `fk_materia_profesores` (`id_profesor`),
  CONSTRAINT `fk_materia_profesores` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`),
  CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesores` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES ('7452672a-d658-11ee-87bf-cc853680dedb','Ciencias',2,'c3fa8bb1-d657-11ee-87bf-cc853680dedb',24),('74538993-d658-11ee-87bf-cc853680dedb','Historia',3,'c3fbaddb-d657-11ee-87bf-cc853680dedb',19),('745405b2-d658-11ee-87bf-cc853680dedb','Literatura',4,'c3fc1927-d657-11ee-87bf-cc853680dedb',14),('74545cd0-d658-11ee-87bf-cc853680dedb','Física',5,'c3fc62bf-d657-11ee-87bf-cc853680dedb',9),('7454c4f1-d658-11ee-87bf-cc853680dedb','Química',6,'c3fcb049-d657-11ee-87bf-cc853680dedb',11),('745527ef-d658-11ee-87bf-cc853680dedb','Geografía',7,'c3fcf6e7-d657-11ee-87bf-cc853680dedb',17),('74559792-d658-11ee-87bf-cc853680dedb','Inglés',8,'c3fd384c-d657-11ee-87bf-cc853680dedb',14),('74566e55-d658-11ee-87bf-cc853680dedb','Economía',9,'c3fd7ce9-d657-11ee-87bf-cc853680dedb',19),('74572e73-d658-11ee-87bf-cc853680dedb','Programación',10,'c3fd7ce9-d657-11ee-87bf-cc853680dedb',24),('74579423-d658-11ee-87bf-cc853680dedb','Arte',11,'c3fdc915-d657-11ee-87bf-cc853680dedb',9),('7457edbb-d658-11ee-87bf-cc853680dedb','Educación Física',12,'c3fe11a9-d657-11ee-87bf-cc853680dedb',14),('a4a6f10e-d651-11ee-87bf-cc853680dedb','Matemáticas',1,'31258e1e-d651-11ee-87bf-cc853680dedb',29);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 11:03:12
