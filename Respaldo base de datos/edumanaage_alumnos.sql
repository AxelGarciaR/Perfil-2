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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `id_alumno` varchar(36) NOT NULL,
  `carnet_alumno` varchar(10) DEFAULT NULL,
  `nombre_alumno` varchar(100) DEFAULT NULL,
  `apellido_alumno` varchar(100) DEFAULT NULL,
  `edad_alumno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
INSERT INTO `alumnos` VALUES ('326914ee-d653-11ee-87bf-cc853680dedb','E97531','David','Miller',19),('edac7c25-d657-11ee-87bf-cc853680dedb','A12345','John','Doe',20),('edacf192-d657-11ee-87bf-cc853680dedb','B67890','Alice','Smith',22),('edad6bba-d657-11ee-87bf-cc853680dedb','C24680','Michael','Johnson',18),('edadca49-d657-11ee-87bf-cc853680dedb','D13579','Emily','Brown',21),('edae30c3-d657-11ee-87bf-cc853680dedb','E97531','David','Miller',19),('edae8966-d657-11ee-87bf-cc853680dedb','F24681','Sophie','Johnson',19),('edaee274-d657-11ee-87bf-cc853680dedb','G35792','Oliver','Smith',20),('edaf2890-d657-11ee-87bf-cc853680dedb','H46803','Isabella','Davis',21),('edaf697f-d657-11ee-87bf-cc853680dedb','I57914','Ethan','Wilson',18),('edafbea0-d657-11ee-87bf-cc853680dedb','J68025','Mia','Martinez',22),('edb003ff-d657-11ee-87bf-cc853680dedb','K79136','Noah','Anderson',19),('edb047e8-d657-11ee-87bf-cc853680dedb','L80247','Ava','Taylor',20),('edb09e18-d657-11ee-87bf-cc853680dedb','M91358','Liam','Thomas',21),('edb0f5ed-d657-11ee-87bf-cc853680dedb','N02469','Emma','Jackson',18),('edb138ff-d657-11ee-87bf-cc853680dedb','O13570','Lucas','White',22);
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
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
