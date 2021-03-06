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
-- Table structure for table `registeradd`
--

DROP TABLE IF EXISTS `registeradd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeradd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AdminCreatedDate` varchar(255) DEFAULT NULL,
  `JoinDate` varchar(255) DEFAULT NULL,
  `UserCreatedDate` varchar(255) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeradd`
--

LOCK TABLES `registeradd` WRITE;
/*!40000 ALTER TABLE `registeradd` DISABLE KEYS */;
INSERT INTO `registeradd` VALUES (1,'register','2020-06-08 01:10:44','future','Sachin Khadka'),(2,'register','2020-06-08 01:13:39','future','Unique Zyan'),(3,'register','2020-06-08 01:15:17','future','Murcury Freddie'),(4,'register','2020-06-08 01:17:27','future','Rami Malek'),(5,'2020-06-08 02:19:32','admin','admin','Hacker Sachin'),(6,'register','2020-06-08 02:23:37','future','Lady Gaga'),(7,'register','2020-06-08 11:22:58','future','Bardly Cooper'),(8,'register','2020-06-09 09:27:35','future','Supreme Chitrakar '),(9,'2020-06-09 09:58:14','admin','admin','Supreme Chitrakar '),(10,'register','2020-06-09 10:03:39','future','Steve Job');
/*!40000 ALTER TABLE `registeradd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-09 17:03:57
