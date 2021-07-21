-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: user_management
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `userstatus`
--

DROP TABLE IF EXISTS `userstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activeTime` varchar(255) DEFAULT NULL,
  `blockTime` varchar(255) DEFAULT NULL,
  `userStatus` varchar(255) DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstatus`
--

LOCK TABLES `userstatus` WRITE;
/*!40000 ALTER TABLE `userstatus` DISABLE KEYS */;
INSERT INTO `userstatus` VALUES (1,'2020-06-08 05:19:48','2020-06-08 01:23:26','active',4,'Rami Malek'),(2,'2020-06-08 05:19:48','2020-06-08 01:25:34','active',4,'Rami Malek'),(3,'2020-06-08 05:19:48','2020-06-08 01:32:51','active',4,'Rami Malek'),(4,'2020-06-08 05:19:48','2020-06-08 01:46:50','active',4,'Rami Malek'),(5,'2020-06-08 05:19:48','2020-06-08 02:02:58','active',4,'Rami Malek'),(6,'2020-06-08 05:19:48','2020-06-08 04:44:44','active',4,'Rami Malek'),(7,'still blocked','2020-06-08 11:26:13','block',6,'Lady Gaga');
/*!40000 ALTER TABLE `userstatus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-09 17:03:58
