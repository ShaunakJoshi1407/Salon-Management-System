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
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schedule` (
  `appt_time` time NOT NULL,
  `appt_date` date NOT NULL,
  `salon_email` varchar(100) NOT NULL,
  `noOfSeats` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`salon_email`,`appt_date`,`appt_time`),
  KEY `sal_email_idx` (`salon_email`),
  CONSTRAINT `salon_email` FOREIGN KEY (`salon_email`) REFERENCES `salon` (`sal_email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('10:00:00','2019-10-11','barbernation@gmail.com',3),('11:00:00','2019-10-11','barbernation@gmail.com',3),('12:00:00','2019-10-11','barbernation@gmail.com',3),('13:00:00','2019-10-11','barbernation@gmail.com',0),('14:00:00','2019-10-11','barbernation@gmail.com',2),('15:00:00','2019-10-11','barbernation@gmail.com',3),('16:00:00','2019-10-11','barbernation@gmail.com',3),('17:00:00','2019-10-11','barbernation@gmail.com',3),('01:00:00','2019-10-12','barbernation@gmail.com',3),('02:00:00','2019-10-12','barbernation@gmail.com',3),('03:00:00','2019-10-12','barbernation@gmail.com',1),('04:00:00','2019-10-12','barbernation@gmail.com',1),('05:00:00','2019-10-12','barbernation@gmail.com',3),('10:00:00','2019-10-12','barbernation@gmail.com',0),('11:00:00','2019-10-12','barbernation@gmail.com',2),('12:00:00','2019-10-12','barbernation@gmail.com',1),('10:00:00','2019-10-13','barbernation@gmail.com',3),('11:00:00','2019-10-13','barbernation@gmail.com',3),('12:00:00','2019-10-13','barbernation@gmail.com',3),('13:00:00','2019-10-13','barbernation@gmail.com',1),('14:00:00','2019-10-13','barbernation@gmail.com',3),('15:00:00','2019-10-13','barbernation@gmail.com',0),('16:00:00','2019-10-13','barbernation@gmail.com',3),('17:00:00','2019-10-13','barbernation@gmail.com',3),('10:00:00','2019-10-14','barbernation@gmail.com',3),('11:00:00','2019-10-14','barbernation@gmail.com',2),('12:00:00','2019-10-14','barbernation@gmail.com',0),('13:00:00','2019-10-14','barbernation@gmail.com',0),('14:00:00','2019-10-14','barbernation@gmail.com',3),('15:00:00','2019-10-14','barbernation@gmail.com',3),('16:00:00','2019-10-14','barbernation@gmail.com',2),('17:00:00','2019-10-14','barbernation@gmail.com',3),('22:00:00','2019-10-15','barbernation@gmail.com',3),('10:00:00','2019-10-16','barbernation@gmail.com',3),('11:00:00','2019-10-16','barbernation@gmail.com',3),('12:00:00','2019-10-16','barbernation@gmail.com',3),('13:00:00','2019-10-16','barbernation@gmail.com',2),('14:00:00','2019-10-16','barbernation@gmail.com',3),('15:00:00','2019-10-16','barbernation@gmail.com',3),('16:00:00','2019-10-16','barbernation@gmail.com',3),('17:00:00','2019-10-16','barbernation@gmail.com',3),('10:00:00','2019-10-18','barbernation@gmail.com',3),('11:00:00','2019-10-18','barbernation@gmail.com',3),('12:00:00','2019-10-18','barbernation@gmail.com',3),('13:00:00','2019-10-18','barbernation@gmail.com',2),('14:00:00','2019-10-18','barbernation@gmail.com',2),('15:00:00','2019-10-18','barbernation@gmail.com',3),('16:00:00','2019-10-18','barbernation@gmail.com',3),('17:00:00','2019-10-18','barbernation@gmail.com',3),('10:00:00','2019-10-22','barbernation@gmail.com',3),('11:00:00','2019-10-22','barbernation@gmail.com',3),('12:00:00','2019-10-22','barbernation@gmail.com',3),('13:00:00','2019-10-22','barbernation@gmail.com',2),('14:00:00','2019-10-22','barbernation@gmail.com',3),('15:00:00','2019-10-22','barbernation@gmail.com',3),('16:00:00','2019-10-22','barbernation@gmail.com',3),('17:00:00','2019-10-22','barbernation@gmail.com',3),('10:00:00','2019-10-15','elegance@gmail.com',3),('11:00:00','2019-10-15','elegance@gmail.com',3),('12:00:00','2019-10-15','elegance@gmail.com',3),('13:00:00','2019-10-15','elegance@gmail.com',3),('14:00:00','2019-10-15','elegance@gmail.com',3),('15:00:00','2019-10-15','elegance@gmail.com',3),('16:00:00','2019-10-15','elegance@gmail.com',3),('17:00:00','2019-10-15','elegance@gmail.com',3),('10:00:00','2019-10-13','javed@gmail.com',3),('11:00:00','2019-10-13','javed@gmail.com',3),('12:00:00','2019-10-13','javed@gmail.com',3),('13:00:00','2019-10-13','javed@gmail.com',0),('14:00:00','2019-10-13','javed@gmail.com',2),('15:00:00','2019-10-13','javed@gmail.com',3),('16:00:00','2019-10-13','javed@gmail.com',3),('17:00:00','2019-10-13','javed@gmail.com',3),('10:00:00','2019-10-22','javed@gmail.com',3),('11:00:00','2019-10-22','javed@gmail.com',3),('12:00:00','2019-10-22','javed@gmail.com',3),('13:00:00','2019-10-22','javed@gmail.com',3),('14:00:00','2019-10-22','javed@gmail.com',3),('15:00:00','2019-10-22','javed@gmail.com',3),('16:00:00','2019-10-22','javed@gmail.com',3),('17:00:00','2019-10-22','javed@gmail.com',3);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 11:57:24
