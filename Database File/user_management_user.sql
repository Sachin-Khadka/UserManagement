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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_address` varchar(1500) DEFAULT NULL,
  `user_conform_password` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_pic` varchar(1500) DEFAULT NULL,
  `user_status` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,' Kapan, Kathmandu','sachin123','sachinkhadka001@gmail.com','Sachin Khadka','sachin123','9840439915','default.jpg','active','admin'),(2,' Bhaktapur','unique123','uniquezyan111@gmail.com','Unique Zyan','unique123','98493032202','default.jpg','active','normal'),(3,' America','freddie123','murcuryfreddie101@gmail.com','Murcury Freddie','freddie123','98303303403','default.jpg','active','normal'),(4,'London','rami123','ramimalek500@gmail.com','Rami Malek','rami123','940403223322','default.jpg','active','normal'),(5,'UK','hacker123','hackersachin111@gmail.com','Hacker Sachin','hacker123','9840439915','default.jpg','active','admin'),(6,' USA','lady123','ladygaga100%@gmail.com','Lady Gaga','lady123','93494943930','default.jpg','block','normal'),(7,'UK','sachin123','sachinkhadka222@gmail.com','Bardly Cooper','sachin123','9840439920','default.jpg','active','normal'),(9,' Basantapur','sachin123','suprim2212@gmail.com','Supreme Chitrakar ','sachin123','9843701503','default.jpg','active','admin'),(10,' America','steve123','stevefan22@gmail.com','Steve Job','steve123','9840998389','default.jpg','active','normal');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
