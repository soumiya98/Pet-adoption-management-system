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
-- Table structure for table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adoption` (
  `userid` int(11) NOT NULL,
  `aid1` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mid` int(11) NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`,`aid1`,`bid`,`gid`,`mid`,`name`),
  KEY `a.id1_idx` (`aid1`) /*!80000 INVISIBLE */,
  KEY `b.id_idx` (`bid`),
  KEY `g.id_idx` (`gid`),
  KEY `user.id_idx` (`userid`) /*!80000 INVISIBLE */,
  KEY `mid_idx` (`mid`),
  CONSTRAINT `aid1` FOREIGN KEY (`aid1`) REFERENCES `animal` (`aid`),
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `breed` (`bid`),
  CONSTRAINT `gid` FOREIGN KEY (`gid`) REFERENCES `gender` (`gid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `medical` (`mid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `registratio` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption`
--

LOCK TABLES `adoption` WRITE;
/*!40000 ALTER TABLE `adoption` DISABLE KEYS */;
INSERT INTO `adoption` VALUES (31,2,1,'brown',2,1,100.00,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\imagessssss.jpg',21,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\ex.mp4','pinu'),(37,2,1,'brown',1,1,3000.00,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\imagess.jpg',4,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\ex.mp4','Browny'),(49,1,2,'grey',13,1,100.00,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\animal-pet-cute-126407.jpg',27,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\ex.mp4','winny'),(49,1,2,'white',2,1,200.00,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\japanese-bobtail-catkitten-walking-on-a-meadow-BMJY2E.jpg',28,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\ex.mp4','minni'),(51,1,2,'White',4,2,200.00,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\downloads.jpg',14,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\ex.mp4','Whitey'),(54,1,2,'white',2,1,200.00,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\images.jpg',20,'C:\\Users\\sukum_000\\Pictures\\Screenshots\\ex.mp4','Chetu');
/*!40000 ALTER TABLE `adoption` ENABLE KEYS */;
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
