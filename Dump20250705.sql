CREATE DATABASE  IF NOT EXISTS `flask01` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flask01`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: flask01
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `text` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `opd_required` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Dermatology',75),(2,'Dentistry',35),(3,'General Medicine',80),(4,'General Surgery',85),(5,'Gynaecology And Obstetrics',85),(6,'Orthopaedics',65),(7,'Pediatrics',70),(8,'Plastic Surgery',35),(9,'Psychiatry',65),(10,'Respiratory Medicine',72),(11,'Urology',40);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_settings`
--

DROP TABLE IF EXISTS `email_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_email` varchar(255) NOT NULL,
  `sender_password` varchar(255) NOT NULL,
  `recipient_emails` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_settings`
--

LOCK TABLES `email_settings` WRITE;
/*!40000 ALTER TABLE `email_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file1_path` varchar(255) NOT NULL,
  `file2_path` varchar(255) NOT NULL,
  `file3_path` varchar(255) NOT NULL,
  `file4_path` varchar(255) NOT NULL,
  `file5_path` varchar(255) NOT NULL,
  `file6_path` varchar(255) NOT NULL,
  `file7_path` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'uploads\\Daily Patient List - OPD (7).xlsx','uploads\\TestBasedInvestigationReport (5).xlsx','uploads\\OT Register (5).xlsx','uploads\\Departmnet wise statisctic Report (6).xlsx','uploads\\Bed Occupancy Report (1).xlsx','uploads\\IPD Patient Discharge List (7).xlsx','uploads\\RIS Register (8).xlsx','2025-06-01'),(2,'uploads\\Daily Patient List - OPD.xlsx','uploads\\TestBasedInvestigationReport.xlsx','uploads\\OT Register.xlsx','uploads\\Departmnet wise statisctic Report.xlsx','uploads\\Bed Occupancy Report.xlsx','uploads\\IPD Patient Discharge List.xlsx','uploads\\RIS Register.xlsx','2025-06-21');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `login_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES (1,1,'2025-01-10 10:35:08'),(2,3,'2025-01-10 10:53:06'),(3,3,'2025-01-10 10:53:13'),(4,1,'2025-01-10 10:53:16'),(5,1,'2025-01-10 10:53:24'),(6,4,'2025-01-10 10:58:52'),(7,5,'2025-01-10 10:59:05'),(8,1,'2025-01-10 10:59:11'),(9,1,'2025-01-10 11:23:47'),(10,1,'2025-01-10 12:20:41'),(11,1,'2025-01-10 12:30:14'),(12,4,'2025-01-10 16:09:55'),(13,1,'2025-01-10 16:10:07'),(14,1,'2025-01-10 16:29:10'),(15,8,'2025-01-10 16:33:43'),(16,1,'2025-01-10 16:33:54'),(17,1,'2025-01-10 16:42:34'),(18,1,'2025-01-10 17:15:51'),(19,1,'2025-01-10 17:16:03'),(20,4,'2025-01-10 17:16:17'),(21,1,'2025-01-10 17:19:55'),(22,1,'2025-01-10 17:24:15'),(23,1,'2025-01-10 17:24:20'),(24,1,'2025-01-11 10:56:12'),(25,1,'2025-01-11 11:06:39'),(26,1,'2025-01-11 11:42:58'),(27,1,'2025-01-11 11:53:15'),(28,1,'2025-01-13 10:45:41'),(29,1,'2025-06-23 12:27:16'),(30,1,'2025-06-23 12:34:19'),(31,13,'2025-06-23 12:42:45'),(32,1,'2025-06-23 12:47:46'),(33,13,'2025-06-23 12:47:52'),(34,13,'2025-06-23 12:48:28'),(35,1,'2025-06-23 12:49:58'),(36,13,'2025-06-23 13:52:19'),(37,13,'2025-06-23 15:26:12');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2b$12$WS0H7l0qkVvS/XkNLS/rneGpU.hZI.3diFD7CTVDx2BL01ScCnRQm','admin'),(2,'aziz','$2b$12$IFVf3ee4Z2yqpddu9/YfyuzSP8HEYLXsOUSarj9BlwoschVwIm/Ve','user'),(3,'Mir Abdul Aziz Khan','$2b$12$IaPhYOte5PmLh9ggJH9gyuZ.QHCWJGmPPoVu3dh27PkcRKwckG6da','user'),(4,'MOIZ','$2b$12$wtLvSH/89EzUTCNQeLW/4ugKPlaDYbawV6bHv6UNsRNa6iBUpzZku','user'),(5,'Khan','$2b$12$9qqZgxL9IKfQsNCdmsst4ue8ltIivb8Jid40Ac88RJWJvSzmkTSJK','admin'),(8,'	Mir Abdul Aziz Khan','$2b$12$/sM9APbdI4KjXvRMUs041.440OdmyqgucfOfR5EG5r6M5Jygsn5nu','user'),(10,'	Mir Abdul Aziz Khan ','$2b$12$VtfloYOg8IxsBPV6Eq9UrO8aJWLfttDGiJ6B.LC5DXML/ItzDIkB.','user'),(11,'123456','$2b$12$DLmVIMGlWFbMwsXCNlVv4OxMFcTi/XlTvjAHREaEWmxKYA2Z/JdIm','user'),(13,'haseeb','$2b$12$P/oV5Wnx6lL6ZFSXnfmP9ugQTUwvwSCOw2iVb.9sX7lGF/yixP23O','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-05 11:04:28
