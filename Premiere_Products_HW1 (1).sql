CREATE DATABASE  IF NOT EXISTS `Premiere_Products` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `Premiere_Products`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: Premiere_Products
-- ------------------------------------------------------
-- Server version	8.0.14

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Customer` (
  `CustomerNum` int(11) NOT NULL,
  `CustomerName` varchar(35) NOT NULL,
  `Street` varchar(15) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  `Balance` decimal(8,2) DEFAULT NULL,
  `CreditLimit` decimal(8,2) DEFAULT NULL,
  `RepNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerNum`),
  KEY `RepNum_idx` (`RepNum`),
  CONSTRAINT `RepNum` FOREIGN KEY (`RepNum`) REFERENCES `rep` (`RepNum`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (148,'Al\'s Appliance and Sport','2837\n\nGreenway','Fillmore','FL','33336',6550.00,7500.00,20),(282,'Brookings Direct','3827\n\nDevon','Grove','FL','33321',431.50,10000.00,35),(356,'Ferguson\'s','382\n\nWildwood','Northfield','FL','33146',5785.00,7500.00,65),(408,'The Everything Shop','1828\n\nRaven','Crystal','FL','33503',5285.25,5000.00,35),(462,'Bargains Galore','3829\n\nCentral','Grove','FL','33321',3412.00,10000.00,65),(524,'Kline\'s','838\n\nRidgeland','Fillmore','FL','33336',12762.00,15000.00,20),(608,'Johnson\'s Department Store','372\n\nOxford','Sheldon','FL','33553',2106.00,10000.00,65),(687,'Lee\'s Sport and Appliance','282\n\nEvergreen','Altonville','FL','32543',2851.00,5000.00,35),(725,'Deerfield\'s Four Seasons','282\n\nColumbia','Sheldon','FL','33553',248.00,7500.00,35),(842,'All Season','28\n\nLakeview','Grove','FL','33321',8221.00,7500.00,20);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderLine`
--

DROP TABLE IF EXISTS `OrderLine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `OrderLine` (
  `OrderNum` int(11) NOT NULL,
  `PartNum` char(4) NOT NULL,
  `NumOrdered` decimal(3,0) DEFAULT NULL,
  `QuotedPrice` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`OrderNum`,`PartNum`),
  KEY `PartNum_idx` (`PartNum`),
  CONSTRAINT `OrderNum` FOREIGN KEY (`OrderNum`) REFERENCES `orders` (`OrderNum`) ON UPDATE CASCADE,
  CONSTRAINT `PartNum` FOREIGN KEY (`PartNum`) REFERENCES `part` (`PartNum`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderLine`
--

LOCK TABLES `OrderLine` WRITE;
/*!40000 ALTER TABLE `OrderLine` DISABLE KEYS */;
INSERT INTO `OrderLine` VALUES (21608,'AT94',11,21.95),(21610,'DR93',1,495.00),(21610,'DW11',1,399.99),(21613,'KL62',4,329.95),(21614,'KT03',2,595.00),(21617,'BV06',2,794.95),(21617,'CD52',4,150.00),(21619,'DR93',1,495.00),(21623,'KV29',2,1290.00);
/*!40000 ALTER TABLE `OrderLine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Orders` (
  `OrderNum` int(11) NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `CustomerNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderNum`),
  KEY `CustNum_idx` (`CustomerNum`),
  CONSTRAINT `CustomerNum` FOREIGN KEY (`CustomerNum`) REFERENCES `customer` (`CustomerNum`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (21608,'2007-10-20',148),(21610,'2007-10-20',356),(21613,'2007-10-21',408),(21614,'2007-10-21',282),(21617,'2007-10-23',608),(21619,'2007-10-23',148),(21623,'2007-10-23',608);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Part`
--

DROP TABLE IF EXISTS `Part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Part` (
  `PartNum` char(4) NOT NULL,
  `Description` varchar(15) DEFAULT NULL,
  `OnHand` decimal(4,0) DEFAULT NULL,
  `Class` char(2) DEFAULT NULL,
  `Warehouse` int(11) DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`PartNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Part`
--

LOCK TABLES `Part` WRITE;
/*!40000 ALTER TABLE `Part` DISABLE KEYS */;
INSERT INTO `Part` VALUES ('AT94','Iron',50,'HW',3,24.95),('BV06','Home Gym',45,'SG',2,794.95),('CD52','Microwave Oven',32,'AP',1,165.00),('DL71','Cordless Drill',21,'HW',3,129.95),('DR93','Gas Range',8,'AP',2,495.00),('DW11','Washer',12,'AP',3,399.99),('FD21','Stand Mixer',22,'HW',3,159.95),('KL62','Dryer',12,'AP',1,349.95),('KT03','Dishwasher',8,'AP',3,595.00),('KV29','Treadmill',9,'SG',2,1390.00);
/*!40000 ALTER TABLE `Part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rep`
--

DROP TABLE IF EXISTS `Rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Rep` (
  `RepNum` int(11) NOT NULL,
  `LastName` varchar(15) DEFAULT NULL,
  `FirstName` varchar(15) DEFAULT NULL,
  `Street` varchar(15) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  `Commission` decimal(7,2) DEFAULT NULL,
  `Rate` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`RepNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rep`
--

LOCK TABLES `Rep` WRITE;
/*!40000 ALTER TABLE `Rep` DISABLE KEYS */;
INSERT INTO `Rep` VALUES (20,'Kaiser','Valerie','624\n\nRandall','Grove','FL','33321',20542.50,0.05),(35,'Hull','Richard','532\n\nJackson','Sheldon','FL','33553',39216.00,0.07),(65,'Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);
/*!40000 ALTER TABLE `Rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Premiere_Products'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-02 21:45:42
