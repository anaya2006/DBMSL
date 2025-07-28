-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: db1
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACCOUNT`
--

DROP TABLE IF EXISTS `ACCOUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCOUNT` (
  `accno` int NOT NULL,
  `brname` varchar(15) DEFAULT NULL,
  `bal` int DEFAULT NULL,
  PRIMARY KEY (`accno`),
  KEY `brname` (`brname`),
  CONSTRAINT `ACCOUNT_ibfk_1` FOREIGN KEY (`brname`) REFERENCES `BRANCH` (`brname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOUNT`
--

LOCK TABLES `ACCOUNT` WRITE;
/*!40000 ALTER TABLE `ACCOUNT` DISABLE KEYS */;
INSERT INTO `ACCOUNT` VALUES (1,'AKURDI',10000),(2,'AKURDI',15000),(3,'NIGDI',5000),(4,'VASHI',25000),(5,'DECCAN',13000);
/*!40000 ALTER TABLE `ACCOUNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BORROWER`
--

DROP TABLE IF EXISTS `BORROWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BORROWER` (
  `custname` varchar(20) DEFAULT NULL,
  `loanno` int DEFAULT NULL,
  KEY `custname` (`custname`),
  KEY `loanno` (`loanno`),
  CONSTRAINT `BORROWER_ibfk_1` FOREIGN KEY (`custname`) REFERENCES `CUSTOMER` (`custname`),
  CONSTRAINT `BORROWER_ibfk_2` FOREIGN KEY (`loanno`) REFERENCES `LOAN` (`loanno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BORROWER`
--

LOCK TABLES `BORROWER` WRITE;
/*!40000 ALTER TABLE `BORROWER` DISABLE KEYS */;
INSERT INTO `BORROWER` VALUES ('PRIYA',10),('AMIT',30),('ROHAN',40),('POOJA',50);
/*!40000 ALTER TABLE `BORROWER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BRANCH`
--

DROP TABLE IF EXISTS `BRANCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BRANCH` (
  `brname` varchar(15) NOT NULL,
  `brcity` varchar(15) DEFAULT NULL,
  `assests` int DEFAULT NULL,
  PRIMARY KEY (`brname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BRANCH`
--

LOCK TABLES `BRANCH` WRITE;
/*!40000 ALTER TABLE `BRANCH` DISABLE KEYS */;
INSERT INTO `BRANCH` VALUES ('AKURDI','PUNE',200),('DECCAN','PUNE',170),('NIGDI','PUNE',150),('VASHI','MUMBAI',180);
/*!40000 ALTER TABLE `BRANCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `custname` varchar(20) NOT NULL,
  `custstr` varchar(20) DEFAULT NULL,
  `custcity` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`custname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES ('AMIT','S4','DELHI'),('POOJA','S5','PUNE'),('PRIYA','S1','PUNE'),('RAJ','S6','MUMBAI'),('ROHAN','S2','PUNE'),('SNEHA','S3','MUMBAI');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPOSITOR`
--

DROP TABLE IF EXISTS `DEPOSITOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPOSITOR` (
  `custname` varchar(20) DEFAULT NULL,
  `accno` int DEFAULT NULL,
  KEY `custname` (`custname`),
  KEY `accno` (`accno`),
  CONSTRAINT `DEPOSITOR_ibfk_1` FOREIGN KEY (`custname`) REFERENCES `CUSTOMER` (`custname`),
  CONSTRAINT `DEPOSITOR_ibfk_2` FOREIGN KEY (`accno`) REFERENCES `ACCOUNT` (`accno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPOSITOR`
--

LOCK TABLES `DEPOSITOR` WRITE;
/*!40000 ALTER TABLE `DEPOSITOR` DISABLE KEYS */;
INSERT INTO `DEPOSITOR` VALUES ('PRIYA',1),('ROHAN',2),('SNEHA',3),('AMIT',4),('RAJ',5);
/*!40000 ALTER TABLE `DEPOSITOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOAN`
--

DROP TABLE IF EXISTS `LOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOAN` (
  `loanno` int NOT NULL,
  `brname` varchar(20) DEFAULT NULL,
  `amt` int DEFAULT NULL,
  PRIMARY KEY (`loanno`),
  KEY `brname` (`brname`),
  CONSTRAINT `LOAN_ibfk_1` FOREIGN KEY (`brname`) REFERENCES `BRANCH` (`brname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOAN`
--

LOCK TABLES `LOAN` WRITE;
/*!40000 ALTER TABLE `LOAN` DISABLE KEYS */;
INSERT INTO `LOAN` VALUES (10,'AKURDI',15000),(30,'AKURDI',20000),(40,'VASHI',8000),(50,'DECCAN',12000);
/*!40000 ALTER TABLE `LOAN` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-28 12:16:40
