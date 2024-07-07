CREATE DATABASE  IF NOT EXISTS `eazydeals` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eazydeals`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: eazydeals
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Anirudh kumar','test@gmail.com','abc123','7755632012'),(4,'Ashish Kumar','test34@gmail.com','abc','8565452152');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_idx` (`uid`),
  KEY `pid_idx` (`pid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9,1,13,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Mobiles','mobiles.jpeg'),(2,'Appliances','appliances.png'),(3,'Laptops','newlaptop.jpeg'),(4,'Home & Furniture','home-furniture.png'),(5,'Books','books-.png'),(6,'Clothes & Fashion','cloths.png'),(7,'Electronics','electronics.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `paymentType` varchar(100) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'ORD-20230924105716','Order Placed','COD',1,'2023-09-24 05:27:16'),(2,'ORD-20230924110928','Order Placed','COD',1,'2023-09-24 05:39:28'),(3,'ORD-20230924111023','Order Placed','COD',1,'2023-09-24 05:40:23'),(4,'ORD-20230924111502','Order Placed','COD',1,'2023-09-24 05:45:02'),(5,'ORD-20230924112315','Order Placed','COD',1,'2023-09-24 05:53:15'),(6,'ORD-20230924115427','Order Placed','online',1,'2023-09-24 06:24:27'),(7,'ORD-20230924115652','Order Placed','online',1,'2023-09-24 06:26:52');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_product`
--

DROP TABLE IF EXISTS `ordered_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_product` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `orderid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `orderid_idx` (`orderid`),
  CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_product`
--

LOCK TABLES `ordered_product` WRITE;
/*!40000 ALTER TABLE `ordered_product` DISABLE KEYS */;
INSERT INTO `ordered_product` VALUES (1,'boAt Airdopes 161 with 40 Hours Playback',1,'1392.0','boat-airdopes.jpeg',3),(2,'OnePlus Y1S Pro 138 cm  Ultra HD (4K) LED Smart Android TV',1,'41000.0','tv1.jpeg',4),(3,'ASUS TUF Gaming A15',1,'57592.0','asus_tuf.jpeg',5),(4,'Men Printed Casual Jacket',1,'860.0','men_jacket.jpeg',6),(5,'LG 242 L Frost Free Double Door  Refrigerator',1,'26341.0','fridge1.jpeg',6),(6,'SAMSUNG Galaxy F14 5G',1,'14053.0','phone1.jpeg',7);
/*!40000 ALTER TABLE `ordered_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` varchar(20) NOT NULL,
  `quantity` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'SAMSUNG Galaxy F14 5G','The Samsung Galaxy F14 smartphone uses a segment-only 5nm processor that enables you with easy multitasking, gaming, and much more. It has a 6000 mAh battery that will last you for up to 2 days on a single charge.It has a large display of about 16.72 cm (6.5) full HD+ display that enables you with immersive viewing. The 12 GB of RAM with RAM Plus offers enough storage space to store all your data.','18490.0',9,24,'phone1.jpeg',1),(2,'LG 242 L Frost Free Double Door  Refrigerator','You can enjoy chilled drinks and popsicles during summer by keeping them stocked up in the LG 242 L Frost-free Double-door Refrigerator. Its Smart Inverter Compressor is designed to deliver energy-efficient performance, thus keeping a check on your electricity bills. Also, this refrigerator�s Door Cooling+ feature keeps the food items fresh and drinks chilled while rendering uniform rapid cooling.','37099.0',50,29,'fridge1.jpeg',2),(3,'OnePlus Y1S Pro 138 cm  Ultra HD (4K) LED Smart Android TV','Enjoy rich, clear, and authentic audiovisual content in its true form with the brilliant OnePlus TV that understands you and strives to keep you entertained constantly. This OnePlus TV\'s Smart Manager offers a number of enhancements for a smart and durable TV experience. Thanks to the sophisticated Gamma Engine, which intelligently adjusts the image for crystal-clear content and maximises display quality, every scene comes to life.','49999.0',1,18,'tv1.jpeg',2),(8,'Samsung Galaxy S23 5G','Brand	Samsung\r\nModel Name	Samsung Galaxy S23\r\nNetwork Service Provider	Unlocked for All Carriers\r\nOperating System	Android 13.0\r\nCellular Technology	5G','79999.0',10,17,'Samsung_Galaxy.jpg',1),(9,'ASUS TUF Gaming A15','15.6 inch Full HD, IPS, Anti-glare Display, Aspect Ratio: 16:9, Refresh Rate: 144 Hz, Viewing Angle: 85/85/85/85, Brightness: 250nits, Contrast Ratio: 1:1000, 45% NTSC, SRGB%: 62.5%, Adobe%: 47.34%, Adaptive-Sync\r\nLight Laptop without Optical Disk Drive\r\nPreloaded with MS Office','71990.0',11,20,'asus_tuf.jpeg',3),(10,'Men Printed Casual Jacket','Color\r\nBlack\r\nFabric\r\nPure Cotton\r\nPattern\r\nPrinted\r\nStyle code\r\nAvengers_Zipper\r\nIdeal for\r\nMen\r\nSleeve\r\nFull Sleeve\r\nCharacter\r\nSuperman\r\nClosure\r\nZipper\r\nPack of\r\n1\r\nSuitable for\r\nWestern Wear\r\nReversible\r\nNo\r\nHooded\r\nYes\r\nType\r\nCasual Jacket\r\nFabric care\r\nMachine Wash as per Tag\r\nFit\r\nRegular','1999.0',1,57,'men_jacket.jpeg',6),(12,'boAt Airdopes 161 with 40 Hours Playback','The Airdopes 161 TWS earbuds offer immersive listening experience with 10mm drivers and Bluetooth v5.1 wireless technology. With IWP tech and ASAP Charge, they provide up to 180 minutes of playtime in just 10 minutes. With an IPX5 water-resistant build, they offer flexibility for gym sessions and easy command playback and voice assistant activation.','2400.0',27,42,'boat-airdopes.jpeg',7),(13,'KURLON Natural Product, Firm Support, Rutile 5 inch Queen Coir Mattress ','Brand KURLON\r\nSupport Layer Coir\r\nComfort Layer PU Foam\r\nSize\r\nQueen\r\nColor\r\nMaroon\r\nMattress Top\r\nNormal Top\r\nComfort Level\r\nFirm\r\nUpholstery Material\r\nPolyester','8000.0',11,16,'mattress.jpeg',4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `registerdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Anirudh Kumar','test786@gmail.com','abc123','7546254260','Male','2023-09-24 05:22:11','KN nagar','Patna','401980','Bihar'),(3,'Amit','amt677@gmail.com','abc','8563201201','Male','2023-09-24 06:15:22','AJ','Banglore','865012','Karnataka');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `idwishlist` int NOT NULL AUTO_INCREMENT,
  `iduser` int DEFAULT NULL,
  `idproduct` int DEFAULT NULL,
  PRIMARY KEY (`idwishlist`),
  KEY `idproduct_idx` (`idproduct`),
  KEY `iduser_idx` (`iduser`),
  CONSTRAINT `idproduct` FOREIGN KEY (`idproduct`) REFERENCES `product` (`pid`),
  CONSTRAINT `iduser` FOREIGN KEY (`iduser`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (3,1,10);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-24 12:02:02
