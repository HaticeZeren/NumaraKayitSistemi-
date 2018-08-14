-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Kisiler`
--

DROP TABLE IF EXISTS `Kisiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kisiler` (
  `idKisiler` varchar(12) NOT NULL,
  `Isim` varchar(45) NOT NULL,
  `Soyisim` varchar(45) NOT NULL,
  PRIMARY KEY (`idKisiler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kisiler`
--

LOCK TABLES `Kisiler` WRITE;
/*!40000 ALTER TABLE `Kisiler` DISABLE KEYS */;
INSERT INTO `Kisiler` VALUES ('10','Aysenur','Kayabasi'),('11','melek','uzar'),('16','demet','uzar'),('17','hatice','zeren'),('18','Ayse','uzar'),('20','merve','zeren'),('22','aysenur','gol'),('23','zeynep','uzar'),('26','Hatice','Zeren'),('29','Duygu','Karalök'),('30','Fatmanur','KüçükAyvaz'),('37','Saban','Zeren'),('38','Yasemin','Uçar'),('39','Elif','Zeren'),('9','Dilek','Godek');
/*!40000 ALTER TABLE `Kisiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonlar`
--

DROP TABLE IF EXISTS `telefonlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonlar` (
  `kisiID` varchar(12) NOT NULL,
  `telefonNum` varchar(45) NOT NULL,
  PRIMARY KEY (`telefonNum`),
  KEY `fk_telefonlar_Kisiler_idx` (`kisiID`),
  CONSTRAINT `fk_telefonlar` FOREIGN KEY (`kisiID`) REFERENCES `Kisiler` (`idKisiler`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonlar`
--

LOCK TABLES `telefonlar` WRITE;
/*!40000 ALTER TABLE `telefonlar` DISABLE KEYS */;
INSERT INTO `telefonlar` VALUES ('16','222223'),('17','05587845'),('17','05436445454'),('18','654665656'),('20','565656565'),('22','51515156'),('23','26262626'),('26','05412564488'),('29','0536626262'),('29','053673389'),('30','05367331212'),('37','055161616'),('38','5656565655'),('39','56544545'),('9','11111111111');
/*!40000 ALTER TABLE `telefonlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomcat_roles`
--

DROP TABLE IF EXISTS `tomcat_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tomcat_roles` (
  `role_name` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomcat_roles`
--

LOCK TABLES `tomcat_roles` WRITE;
/*!40000 ALTER TABLE `tomcat_roles` DISABLE KEYS */;
INSERT INTO `tomcat_roles` VALUES ('dude'),('manager'),('user');
/*!40000 ALTER TABLE `tomcat_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomcat_users`
--

DROP TABLE IF EXISTS `tomcat_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tomcat_users` (
  `user_name` varchar(12) COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomcat_users`
--

LOCK TABLES `tomcat_users` WRITE;
/*!40000 ALTER TABLE `tomcat_users` DISABLE KEYS */;
INSERT INTO `tomcat_users` VALUES ('26','26'),('37','37'),('9','9'),('deron','deronpass'),('larry','buythecompetition');
/*!40000 ALTER TABLE `tomcat_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tomcat_users_roles`
--

DROP TABLE IF EXISTS `tomcat_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tomcat_users_roles` (
  `user_name` varchar(12) COLLATE utf8_turkish_ci NOT NULL,
  `role_name` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`user_name`,`role_name`),
  KEY `tomcat_users_roles_foreign_key_2` (`role_name`),
  CONSTRAINT `tomcat_users_roles_foreign_key_1` FOREIGN KEY (`user_name`) REFERENCES `tomcat_users` (`user_name`),
  CONSTRAINT `tomcat_users_roles_foreign_key_2` FOREIGN KEY (`role_name`) REFERENCES `tomcat_roles` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tomcat_users_roles`
--

LOCK TABLES `tomcat_users_roles` WRITE;
/*!40000 ALTER TABLE `tomcat_users_roles` DISABLE KEYS */;
INSERT INTO `tomcat_users_roles` VALUES ('deron','dude'),('larry','dude'),('9','manager'),('deron','manager'),('26','user'),('37','user');
/*!40000 ALTER TABLE `tomcat_users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-14  2:19:25
