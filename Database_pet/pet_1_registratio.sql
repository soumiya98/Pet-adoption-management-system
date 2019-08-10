-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: pet_1
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `registratio`
--

DROP TABLE IF EXISTS `registratio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registratio` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registratio`
--

LOCK TABLES `registratio` WRITE;
/*!40000 ALTER TABLE `registratio` DISABLE KEYS */;
INSERT INTO `registratio` VALUES (26,'Sudhee','kookie','sud@gmail.com','9876543232'),(29,'Ramya','rapmonster','ram@gmail.com','8987652312'),(30,'vani','viaan','vani@gmail.com','9876567897'),(31,'Tejeswini','teju','teju@gmail.com','9876765654'),(32,'Keerthana','keer','keer@gmail.com','9876765465'),(34,'rakesh','rak','rak@gmail.com','9675554545'),(35,'Geetha','gee','gee@gmail.com','9876756434'),(36,'Preethi','puchhu','pre@gmail.com','9878765654'),(37,'Seetha','krishna','seetha@gmail.com','9878765656'),(38,'padma','padmavathi','padu@gmail.com','9786564543'),(49,'Raghu','appa','rag@gmail.com','7656787654'),(51,'Ritu','wonwoo','rit@gmail.com','9878765654'),(52,'admin','admin123','ad@gmail.com','9878765654'),(53,'Sangeetha','sanna','san@gmail.com','9898767654'),(54,'Taehyung','taetae','tae@gmail.com','7876765432'),(62,'Jungkook','kookie','kookie@gmail.com','9878765654');
/*!40000 ALTER TABLE `registratio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-29 11:52:10
