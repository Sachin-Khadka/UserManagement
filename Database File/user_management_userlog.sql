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
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `LoginTime` varchar(255) DEFAULT NULL,
  `LogoutTime` varchar(255) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
INSERT INTO `userlog` VALUES (1,'2020-06-08 01:18:52','2020-06-08 11:25:03',1,'Sachin Khadka'),(2,'2020-06-08 01:31:47','2020-06-08 11:25:03',1,'Sachin Khadka'),(3,'2020-06-08 01:46:00','2020-06-08 11:25:03',1,'Sachin Khadka'),(4,'2020-06-08 02:07:39','2020-06-08 11:25:03',1,'Sachin Khadka'),(5,'2020-06-08 02:36:51','2020-06-08 11:25:03',1,'Sachin Khadka'),(6,'2020-06-08 02:49:57','2020-06-08 11:25:03',1,'Sachin Khadka'),(7,'2020-06-08 03:10:19','2020-06-08 11:25:03',1,'Sachin Khadka'),(8,'2020-06-08 03:49:29','2020-06-08 11:25:03',1,'Sachin Khadka'),(9,'2020-06-08 04:21:12','2020-06-08 11:25:03',1,'Sachin Khadka'),(10,'2020-06-08 04:37:49','2020-06-08 11:25:03',1,'Sachin Khadka'),(11,'2020-06-08 11:23:31','2020-06-08 11:25:03',7,'Bardly Cooper'),(12,'2020-06-08 11:25:28','2020-06-08 11:25:03',1,'Sachin Khadka'),(13,'2020-06-09 12:14:05','Still Logged In',7,'Bardly Cooper'),(14,'2020-06-09 09:39:05','2020-06-09 09:51:31',8,'Supreme Chitrakar '),(15,'2020-06-09 09:54:10','Still Logged In',1,'Sachin Khadka'),(16,'2020-06-09 10:28:47','Still Logged In',9,'Supreme Chitrakar '),(17,'2020-06-09 10:29:25','Still Logged In',9,'Supreme Chitrakar ');
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
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
