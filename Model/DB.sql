-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: 2entral
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `inventory_logs`
--

DROP TABLE IF EXISTS `inventory_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_logs` (
  `LogsID` int NOT NULL AUTO_INCREMENT,
  `LogsDetails` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `ProductID` char(10) NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`LogsID`),
  KEY `ProductID_idx` (`ProductID`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `Product` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  CONSTRAINT `User` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_logs`
--

LOCK TABLES `inventory_logs` WRITE;
/*!40000 ALTER TABLE `inventory_logs` DISABLE KEYS */;
INSERT INTO `inventory_logs` VALUES (1,'Update New Product','2025-11-26 14:29:33','Active','25BAD00001',2),(2,'Update New Product','2025-11-26 14:29:33','Active','25BAD00002',2),(3,'Update New Product','2025-11-26 14:29:33','Active','25BAD00003',2),(4,'Update New Product','2025-11-26 14:29:33','Active','25STR00004',2),(5,'Update New Product','2025-11-26 14:29:33','Active','25SHO00005',2);
/*!40000 ALTER TABLE `inventory_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` char(10) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Stock` int NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `LowStockAlert` int NOT NULL,
  `ImagePath` varchar(100) NOT NULL,
  `IsActive` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ImagePath_UNIQUE` (`ImagePath`),
  KEY `SupplierID_idx` (`SupplierID`),
  CONSTRAINT `SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('25BAD00001','LI-NING HALBERTEC 8000 BADMINTON RACQUECT BLUE/PINK','6.8mm slim shaft for faster swings and reduced drag High Modulus Carbon Fibre for strength and responsiveness.','Racquet',30,899.00,5,'img.png','Active',3),('25BAD00002','YONEX NANOFLARE 800 PRO	','ISOMETRIC technology continues to help the world’s greatest players achieve global success.','Racquet',15,859.00,5,'img1.png','Active',1),('25BAD00003','YONEX ASTROX 100ZZ','For advanced players looking for immediate access to power to maintain a relentless attack','Racquet',15,950.00,5,'img2.png','Active',1),('25SHO00005','VICTOR A970TD BADMINTON SHOES','HYPEREVA + ENERGYMAX3.0 + TPU','Shoes',40,420.00,15,'img4.png','Active',2),('25STR00004','YONEX STRING AEROBITE','Mains - 0.67 mm; Crosses - 0.61 mm','String',100,56.00,30,'img3.png','Active',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_details` (
  `DetailID` int NOT NULL AUTO_INCREMENT,
  `Quantity` int NOT NULL,
  `Subtotal` decimal(7,2) NOT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `ProductID` char(10) NOT NULL,
  `PurchaseID` char(10) NOT NULL,
  PRIMARY KEY (`DetailID`),
  KEY `ProductID_idx` (`ProductID`),
  KEY `PurchaseID_idx` (`PurchaseID`),
  CONSTRAINT `ProductID` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  CONSTRAINT `PurchaseID` FOREIGN KEY (`PurchaseID`) REFERENCES `purchase_order` (`PurchaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_details`
--

LOCK TABLES `purchase_details` WRITE;
/*!40000 ALTER TABLE `purchase_details` DISABLE KEYS */;
INSERT INTO `purchase_details` VALUES (21,5,4495.00,'2025-11-26 14:35:24','Active','25BAD00001','25PUR00001'),(22,5,4495.00,'2025-11-26 14:35:24','Active','25BAD00002','25PUR00002'),(23,5,4750.00,'2025-11-26 14:35:24','Active','25BAD00003','25PUR00002'),(24,10,8990.00,'2025-11-26 14:35:24','Active','25BAD00001','25PUR00003'),(25,30,1680.00,'2025-11-26 14:35:24','Active','25STR00004','25PUR00004'),(26,10,8590.00,'2025-11-26 14:35:24','Active','25BAD00002','25PUR00004'),(27,15,13485.00,'2025-11-26 14:35:24','Active','25BAD00001','25PUR00005'),(28,10,9500.00,'2025-11-26 14:35:24','Active','25BAD00003','25PUR00006'),(29,70,3920.00,'2025-11-26 14:35:24','Active','25STR00004','25PUR00007'),(30,40,16900.00,'2025-11-26 14:35:24','Active','25SHO00005','25PUR00008');
/*!40000 ALTER TABLE `purchase_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `PurchaseID` char(10) NOT NULL,
  `TotalAmount` decimal(7,2) NOT NULL,
  `Status` enum('Pending','Approved','Shipping','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsActive` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `UserID` int NOT NULL,
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `UserID_idx` (`UserID`),
  KEY `SupplierID_idx` (`SupplierID`),
  CONSTRAINT `OrderToSupplier` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`),
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('25PUR00001',4495.00,'Pending','2025-11-26 13:46:05','Active',1,3),('25PUR00002',9245.00,'Pending','2025-11-26 13:46:05','Active',1,1),('25PUR00003',8990.00,'Pending','2025-11-26 13:46:05','Active',2,3),('25PUR00004',10270.00,'Pending','2025-11-26 13:46:05','Active',3,1),('25PUR00005',13485.00,'Pending','2025-11-26 13:46:05','Active',2,3),('25PUR00006',9500.00,'Pending','2025-11-26 13:46:05','Active',2,1),('25PUR00007',3920.00,'Pending','2025-11-26 13:46:05','Active',3,1),('25PUR00008',16900.00,'Pending','2025-11-26 14:35:07','Active',1,2);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL DEFAULT '^[a-zA-Z0-9._%+-]+@gmail\\.com$',
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ImagePath` varchar(100) NOT NULL,
  `IsActive` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `ImagePath_UNIQUE` (`ImagePath`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Sunrise-Sports SDN BHD','sunyonex@gmail.com','2025-11-26 13:42:19','images1.png','Active'),(2,'MERU SPORT SDN BHD','meruvictor@gmail.com','2025-11-26 13:42:19','images2.png','Active'),(3,'Sunlight Galaxy SDN BH','liningmy@gmail.com','2025-11-26 13:42:19','images3.png','Active');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(80) NOT NULL,
  `Email` varchar(100) NOT NULL DEFAULT '^[a-zA-Z0-9._%+-]+@gmail\\.com$',
  `CreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Role` enum('Employee','Manager') NOT NULL DEFAULT 'Employee',
  `ImagePath` varchar(100) DEFAULT NULL,
  `IsActive` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `ImagePath_UNIQUE` (`ImagePath`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ter Kean Sen','huoyan0928@gmail.com','2025-11-23 20:02:18','Manager','images.jpeg','Active'),(2,'Chan Jun Di','chanjundi04@gmail.com','2025-11-26 13:40:01','Employee',NULL,'Active'),(3,'Ong Ei Jie','ong04@gmail.com','2025-11-26 13:40:01','Employee',NULL,'Active');
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

-- Dump completed on 2025-11-27 17:51:26
