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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `sal_email` varchar(100) NOT NULL,
  `appt_date` date NOT NULL,
  `appt_time` time NOT NULL,
  `total_cost` int(5) DEFAULT '0',
  `status` varchar(45) DEFAULT 'notConfirm',
  `completed` varchar(10) DEFAULT 'NO',
  PRIMARY KEY (`appointment_id`),
  KEY `cust_email_idx` (`cust_email`),
  KEY `salon_email_idx` (`sal_email`),
  KEY `appointment_ibfk_2` (`sal_email`,`appt_date`,`appt_time`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`sal_email`, `appt_date`, `appt_time`) REFERENCES `schedule` (`salon_email`, `appt_date`, `appt_time`) ON DELETE CASCADE,
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`sal_email`, `appt_date`, `appt_time`) REFERENCES `schedule` (`salon_email`, `appt_date`, `appt_time`) ON DELETE CASCADE,
  CONSTRAINT `cust_email` FOREIGN KEY (`cust_email`) REFERENCES `customer` (`cust_email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'ishwar@gmail.com','barbernation@gmail.com','2019-10-14','16:00:00',300,'Confirm','NO'),(2,'ishwar@gmail.com','barbernation@gmail.com','2019-10-14','12:00:00',200,'Confirm','NO'),(3,'ishwar@gmail.com','barbernation@gmail.com','2019-10-14','12:00:00',100,'Confirm','NO'),(4,'saif@gmail.com','barbernation@gmail.com','2019-10-14','13:00:00',100,'Confirm','NO'),(5,'saif@gmail.com','barbernation@gmail.com','2019-10-14','13:00:00',100,'Confirm','NO'),(8,'saif@gmail.com','barbernation@gmail.com','2019-10-12','04:00:00',300,'Confirm','YES'),(9,'saif@gmail.com','barbernation@gmail.com','2019-10-12','03:00:00',200,'Confirm','YES'),(10,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','10:00:00',200,'Confirm','YES'),(11,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','12:00:00',200,'Confirm','YES'),(12,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','12:00:00',300,'Confirm','NO'),(13,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','10:00:00',336,'Confirm','NO'),(14,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','11:00:00',224,'Confirm','YES'),(15,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','11:00:00',224,'Confirm','NO'),(16,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','11:00:00',224,'Confirm','NO'),(17,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','03:00:00',0,'Confirm','NO'),(18,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','03:00:00',0,'Confirm','NO'),(19,'saif@gmail.com','barbernation@gmail.com','2019-10-11','13:00:00',336,'Confirm','YES'),(20,'saif@gmail.com','barbernation@gmail.com','2019-10-11','13:00:00',336,'Confirm','YES'),(21,'saif@gmail.com','barbernation@gmail.com','2019-10-11','13:00:00',336,'Confirm','YES'),(22,'saif@gmail.com','barbernation@gmail.com','2019-10-11','13:00:00',336,'Confirm','NO'),(23,'saif@gmail.com','barbernation@gmail.com','2019-10-11','14:00:00',112,'Confirm','YES'),(24,'saif@gmail.com','barbernation@gmail.com','2019-10-13','13:00:00',336,'Confirm','NO'),(25,'saif@gmail.com','barbernation@gmail.com','2019-10-13','13:00:00',224,'Confirm','NO'),(26,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-12','04:00:00',336,'Confirm','YES'),(27,'saif@gmail.com','barbernation@gmail.com','2019-10-18','14:00:00',336,'Confirm','NO'),(28,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-18','13:00:00',336,'Confirm','NO'),(29,'shindeeshwar2000@gmail.com','barbernation@gmail.com','2019-10-16','13:00:00',224,'Confirm','NO'),(30,'saif@gmail.com','barbernation@gmail.com','2019-10-15','22:00:00',200,'Confirm','NO'),(31,'saif@gmail.com','barbernation@gmail.com','2019-10-22','13:00:00',448,'Confirm','NO');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateComplete` BEFORE UPDATE ON `appointment` FOR EACH ROW BEGIN
	SELECT CAST(CURRENT_TIME() AS CHAR(50)) INTO @time_now;
	
	IF (@time_now < old.appt_time) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Can not update before the appointment time';
	END IF;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateSeats` BEFORE DELETE ON `appointment` FOR EACH ROW BEGIN
	update schedule set noOfSeats = noOfSeats + 1 where appt_date = old.appt_date and appt_time = old.appt_time and salon_email = old.sal_email;
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

-- Dump completed on 2019-10-16 11:57:23
