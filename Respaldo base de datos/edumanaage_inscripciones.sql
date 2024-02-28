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
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` varchar(36) NOT NULL,
  `id_alumno` varchar(36) DEFAULT NULL,
  `id_materia` varchar(36) DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `fk_inscripciones_alumnos` (`id_alumno`),
  KEY `fk_inscripciones_materia` (`id_materia`),
  CONSTRAINT `fk_inscripciones_alumnos` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  CONSTRAINT `fk_inscripciones_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumnos` (`id_alumno`),
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES ('62402e13-d65a-11ee-87bf-cc853680dedb','326914ee-d653-11ee-87bf-cc853680dedb','7452672a-d658-11ee-87bf-cc853680dedb','2024-02-28','Activo'),('62419e9b-d65a-11ee-87bf-cc853680dedb','edac7c25-d657-11ee-87bf-cc853680dedb','74538993-d658-11ee-87bf-cc853680dedb','2024-02-29','Activo'),('6242a412-d65a-11ee-87bf-cc853680dedb','edacf192-d657-11ee-87bf-cc853680dedb','745405b2-d658-11ee-87bf-cc853680dedb','2024-03-01','Inactivo'),('6243249f-d65a-11ee-87bf-cc853680dedb','edad6bba-d657-11ee-87bf-cc853680dedb','74545cd0-d658-11ee-87bf-cc853680dedb','2024-03-02','Activo'),('6243a375-d65a-11ee-87bf-cc853680dedb','edadca49-d657-11ee-87bf-cc853680dedb','7454c4f1-d658-11ee-87bf-cc853680dedb','2024-03-03','Inactivo'),('62441544-d65a-11ee-87bf-cc853680dedb','edae30c3-d657-11ee-87bf-cc853680dedb','745527ef-d658-11ee-87bf-cc853680dedb','2024-03-04','Activo'),('62447178-d65a-11ee-87bf-cc853680dedb','edae8966-d657-11ee-87bf-cc853680dedb','74559792-d658-11ee-87bf-cc853680dedb','2024-03-05','Inactivo'),('6244c0d4-d65a-11ee-87bf-cc853680dedb','edaee274-d657-11ee-87bf-cc853680dedb','74566e55-d658-11ee-87bf-cc853680dedb','2024-03-06','Activo'),('62452a1f-d65a-11ee-87bf-cc853680dedb','edaf2890-d657-11ee-87bf-cc853680dedb','74572e73-d658-11ee-87bf-cc853680dedb','2024-03-07','Activo'),('62458852-d65a-11ee-87bf-cc853680dedb','edaf697f-d657-11ee-87bf-cc853680dedb','74579423-d658-11ee-87bf-cc853680dedb','2024-03-08','Inactivo'),('6245de74-d65a-11ee-87bf-cc853680dedb','edafbea0-d657-11ee-87bf-cc853680dedb','7457edbb-d658-11ee-87bf-cc853680dedb','2024-03-09','Activo'),('624635c8-d65a-11ee-87bf-cc853680dedb','edb003ff-d657-11ee-87bf-cc853680dedb','a4a6f10e-d651-11ee-87bf-cc853680dedb','2024-03-10','Activo');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_cupos AFTER INSERT ON inscripciones
FOR EACH ROW
BEGIN
    UPDATE materia
    SET cupos = cupos - 1
    WHERE id_materia = NEW.id_materia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 11:03:12
