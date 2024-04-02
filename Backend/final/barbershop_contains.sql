-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: barbershop
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contains` (
  `appt_id` int(11) NOT NULL,
  `service` varchar(45) NOT NULL,
  `cost` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`appt_id`,`service`),
  KEY `appt_id_idx` (`appt_id`),
  KEY `service_idx` (`service`),
  CONSTRAINT `appt_id` FOREIGN KEY (`appt_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE,
  CONSTRAINT `service` FOREIGN KEY (`service`) REFERENCES `services` (`service_name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (1,'Haircut',200,60),(1,'Shave',100,30),(2,'Haircut',200,60),(3,'Shave',100,30),(4,'Shave',100,30),(5,'Shave',100,30),(8,'Haircut',200,60),(8,'Shave',100,30),(9,'Haircut',200,60),(10,'Haircut',200,60),(11,'Haircut',200,60),(12,'Haircut',200,60),(12,'Shave',100,30),(13,'Haircut',200,60),(13,'Shave',100,30),(14,'Haircut',200,60),(15,'Haircut',200,60),(16,'Haircut',200,60),(19,'Haircut',200,60),(19,'Shave',100,30),(20,'Haircut',200,60),(20,'Shave',100,30),(21,'Haircut',200,60),(21,'Shave',100,30),(22,'Haircut',200,60),(22,'Shave',100,30),(23,'Shave',100,30),(24,'Haircut',200,60),(24,'Shave',100,30),(25,'Haircut',200,60),(26,'Haircut',200,60),(26,'Shave',100,30),(27,'Haircut',200,60),(27,'Shave',100,30),(28,'Haircut',200,60),(28,'Shave',100,30),(29,'Haircut',200,60),(31,'Foot Massage',200,30),(31,'Haircut',200,60);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 11:57:26
