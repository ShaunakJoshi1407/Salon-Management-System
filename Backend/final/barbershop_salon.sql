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
-- Table structure for table `salon`
--

DROP TABLE IF EXISTS `salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salon` (
  `sal_name` varchar(50) NOT NULL,
  `sal_email` varchar(100) NOT NULL,
  `sal_type` varchar(45) NOT NULL,
  `sal_city` varchar(45) NOT NULL,
  `sal_contact` varchar(10) NOT NULL,
  `sal_address` varchar(200) NOT NULL,
  `sal_password` varchar(100) NOT NULL,
  `sal_img` varchar(255) DEFAULT NULL,
  `img_path` varchar(50) DEFAULT NULL,
  `noOfSeats` int(11) NOT NULL DEFAULT '0',
  `approved` varchar(20) DEFAULT 'NO',
  `rating` int(11) DEFAULT '0',
  `noOfRatings` int(11) DEFAULT '0',
  PRIMARY KEY (`sal_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
INSERT INTO `salon` VALUES ('Barberly ','barberly@gmail.com','male','Pune','9881409875','Katraj','968702eaecafb11bfa1961e874e08a77b2bfe496','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\sal7.jpg','sal7.jpg',4,'NO',0,0),('Barber Nation','barbernation@gmail.com','other','Pune','9881456230','Kothrud','681288e8eeaa0d6cb62ace038006655c1842d122','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\sal8.jpg','sal8.jpg',3,'YES',26,6),('Elegance Salon','elegance@gmail.com','other','Pune','8876541523','Swargate','b6693b8cac7ad1bc1090b19afb0c11487459c077','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\sal5.jpg','sal5.jpg',3,'YES',0,0),('Fashion Salon','fashion@gmail.com','male','Pune','9954123456','Katraj','ed421c35417f4de7c64a7ae212c0a721f6436e9b','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\sal6.jpg','sal6.jpg',3,'YES',0,0),('Favorites salon','favorites@gmail.com','female','Pune','8778451232','Kothrud','aee20c6a981fe6633c17340037ebb6472f1d8eb9','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\sal9.jpg','sal9.jpg',3,'YES',0,0),('Javed Habib Salon','javed@gmail.com','other','Pune','8876541232','FC Road','a03431d6667d3e8ecd7ee97cdbd0c0a02d7a9814','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\javed.jpg','javed.jpg',3,'YES',0,0),('Jupiter Salon','jupiter@gmail.com','male','Pune','7085641250','Shop No - 7, Nirmal Heights, Katraj, Pune','a2f7fcb5afeb7983ffbb6ce3d1a7e91edf321350','C:\\Users\\sai\\Documents\\NetBeansProjects\\BarberShop\\web\\images\\\\jupiter.jpg','jupiter.jpg',4,'NO',0,0);
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-16 11:57:21
