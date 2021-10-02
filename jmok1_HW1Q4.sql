-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: premiere_products
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerNum` int NOT NULL,
  `CustomerName` varchar(35) NOT NULL,
  `Street` varchar(15) DEFAULT NULL,
  `City` varchar(15) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  `Balance` decimal(8,2) DEFAULT NULL,
  `CreditLimit` decimal(8,2) DEFAULT NULL,
  `RepNum` int DEFAULT NULL,
  PRIMARY KEY (`CustomerNum`),
  KEY `RepNum_idx` (`RepNum`),
  CONSTRAINT `RepNum` FOREIGN KEY (`RepNum`) REFERENCES `rep` (`RepNum`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (148,'Al\'s Appliance and Sport','2837\n\nGreenway','Fillmore','FL','33336',6550.00,7500.00,20),(282,'Brookings Direct','3827\n\nDevon','Grove','FL','33321',431.50,10000.00,35),(356,'Ferguson\'s','382\n\nWildwood','Northfield','FL','33146',5785.00,7500.00,65),(408,'The Everything Shop','1828\n\nRaven','Crystal','FL','33503',5285.25,5000.00,35),(462,'Bargains Galore','3829\n\nCentral','Grove','FL','33321',3412.00,10000.00,65),(524,'Kline\'s','838\n\nRidgeland','Fillmore','FL','33336',12762.00,15000.00,20),(608,'Johnson\'s Department Store','372\n\nOxford','Sheldon','FL','33553',2106.00,10000.00,65),(687,'Lee\'s Sport and Appliance','282\n\nEvergreen','Altonville','FL','32543',2851.00,5000.00,35),(725,'Deerfield\'s Four Seasons','282\n\nColumbia','Sheldon','FL','33553',248.00,7500.00,35),(842,'All Season','28\n\nLakeview','Grove','FL','33321',8221.00,7500.00,20);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderline` (
  `OrderNum` int NOT NULL,
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
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
INSERT INTO `orderline` VALUES (21608,'AT94',11,21.95),(21610,'DR93',1,495.00),(21610,'DW11',1,399.99),(21613,'KL62',4,329.95),(21614,'KT03',2,595.00),(21617,'BV06',2,794.95),(21617,'CD52',4,150.00),(21619,'DR93',1,495.00),(21623,'KV29',2,1290.00);
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderNum` int NOT NULL,
  `OrderDate` date DEFAULT NULL,
  `CustomerNum` int DEFAULT NULL,
  PRIMARY KEY (`OrderNum`),
  KEY `CustNum_idx` (`CustomerNum`),
  CONSTRAINT `CustomerNum` FOREIGN KEY (`CustomerNum`) REFERENCES `customer` (`CustomerNum`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (21608,'2007-10-20',148),(21610,'2007-10-20',356),(21613,'2007-10-21',408),(21614,'2007-10-21',282),(21617,'2007-10-23',608),(21619,'2007-10-23',148),(21623,'2007-10-23',608);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `PartNum` char(4) NOT NULL,
  `Description` varchar(15) DEFAULT NULL,
  `OnHand` decimal(4,0) DEFAULT NULL,
  `Class` char(2) DEFAULT NULL,
  `Warehouse` int DEFAULT NULL,
  `Price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`PartNum`),
  KEY `Warehouse` (`Warehouse`),
  CONSTRAINT `part_ibfk_1` FOREIGN KEY (`Warehouse`) REFERENCES `warehousedetail` (`WarehouseNum`),
  CONSTRAINT `part_ibfk_2` FOREIGN KEY (`Warehouse`) REFERENCES `warehousedetail` (`WarehouseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES ('AT94','Iron',50,'HW',3,24.95),('BV06','Home Gym',45,'SG',2,794.95),('CD52','Microwave Oven',32,'AP',1,165.00),('DL71','Cordless Drill',21,'HW',3,129.95),('DR93','Gas Range',8,'AP',2,495.00),('DW11','Washer',12,'AP',3,399.99),('FD21','Stand Mixer',22,'HW',3,159.95),('KL62','Dryer',12,'AP',1,349.95),('KT03','Dishwasher',8,'AP',3,595.00),('KV29','Treadmill',9,'SG',2,1390.00);
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partinwarehouse`
--

DROP TABLE IF EXISTS `partinwarehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partinwarehouse` (
  `MyPartNum2` char(4) NOT NULL,
  `MyWarehouseNum2` int DEFAULT NULL,
  PRIMARY KEY (`MyPartNum2`),
  KEY `MyWarehouseNum2` (`MyWarehouseNum2`),
  CONSTRAINT `partinwarehouse_ibfk_1` FOREIGN KEY (`MyPartNum2`) REFERENCES `part` (`PartNum`),
  CONSTRAINT `partinwarehouse_ibfk_2` FOREIGN KEY (`MyWarehouseNum2`) REFERENCES `warehousedetail` (`WarehouseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partinwarehouse`
--

LOCK TABLES `partinwarehouse` WRITE;
/*!40000 ALTER TABLE `partinwarehouse` DISABLE KEYS */;
INSERT INTO `partinwarehouse` VALUES ('KV29',2),('AT94',3),('FD21',3);
/*!40000 ALTER TABLE `partinwarehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rep`
--

DROP TABLE IF EXISTS `rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rep` (
  `RepNum` int NOT NULL,
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
-- Dumping data for table `rep`
--

LOCK TABLES `rep` WRITE;
/*!40000 ALTER TABLE `rep` DISABLE KEYS */;
INSERT INTO `rep` VALUES (20,'Kaiser','Valerie','624\n\nRandall','Grove','FL','33321',20542.50,0.05),(35,'Hull','Richard','532\n\nJackson','Sheldon','FL','33553',39216.00,0.07),(65,'Perez','Juan','1626 Taylor','Fillmore','FL','33336',23487.00,0.05);
/*!40000 ALTER TABLE `rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehousedetail`
--

DROP TABLE IF EXISTS `warehousedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehousedetail` (
  `WarehouseNum` int NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`WarehouseNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehousedetail`
--

LOCK TABLES `warehousedetail` WRITE;
/*!40000 ALTER TABLE `warehousedetail` DISABLE KEYS */;
INSERT INTO `warehousedetail` VALUES (1,'New Haven, CT'),(2,'Boston, MA'),(3,'White Plains, NY');
/*!40000 ALTER TABLE `warehousedetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-02  3:38:00
