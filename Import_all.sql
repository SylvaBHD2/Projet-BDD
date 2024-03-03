-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hrtyrthhrtrth
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `ID_adresse` int NOT NULL AUTO_INCREMENT,
  `numero_voie` varchar(50) NOT NULL,
  `voie` varchar(50) NOT NULL,
  `ID_ville` int NOT NULL,
  PRIMARY KEY (`ID_adresse`),
  KEY `adresse_ville_FK` (`ID_ville`),
  CONSTRAINT `adresse_ville_FK` FOREIGN KEY (`ID_ville`) REFERENCES `ville` (`ID_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'26','RUE DE MONTHOLON',1),(2,'22 B','RUE GEN DELESTRAINT',1),(3,'22','RUE GEN DELESTRAINT',1),(4,'3','RUE DES CHAMPAGNES',2),(5,'5','LOT LE BIOLAY',3),(6,'165','ALL DES LIBELLULES',4),(7,'9','RTE DU VIADUC',5),(8,'50','RUE DOC NODET',1),(9,'68','AV DE MACON',1),(10,'1724','RTE DE MONTLEGER',6),(11,'1250','RTE DE CUET',7),(12,'181','RTE DE VERNOUX',8),(13,'5575',' MOLARDOURY',9),(14,'544','RTE DE BOIS BRULE',10),(15,'5362',' LA MORANDIERE',11),(16,'8','ALL VINCENT BENONY',1),(17,'51','RUE CHAUDOUET',12),(18,'9 Z','RUE GABRIEL VICAIRE',13),(19,'1','RUE JOACHIN DU BELLAY',1),(20,'435','CHE DU POMMIER',12),(21,'437','CHE DU POMMIER',12),(22,'552','AV DE LYON',12),(23,'95','RUE DU MARTIN PECHEUR',14),(24,'1587','RTE DE CUISERY',15),(25,'7 B','RUE CHARLES GUILLON',1),(26,'6','RUE DE CUIRON',1),(27,'14 A','BD DE L HIPPODROME',1),(28,'14 B','BD DE L HIPPODROME',1),(29,'49','AV DE MACON',1),(30,'28','RUE BERNARD GANGLOFF',13),(31,'52','RUE DE MONTE CASSINO',1),(32,'36','AV DE LYON',1),(33,'6','RUE DE L EST',1),(34,'116','ALL DES GLANEUSES',1),(35,'37',' LES CHAMBARDS OUEST',16);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apparait`
--

DROP TABLE IF EXISTS `apparait`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apparait` (
  `ID_lot` int NOT NULL,
  `ID_propriete` int NOT NULL,
  PRIMARY KEY (`ID_lot`,`ID_propriete`),
  KEY `apparait_propriete0_FK` (`ID_propriete`),
  CONSTRAINT `apparait_lot_FK` FOREIGN KEY (`ID_lot`) REFERENCES `lot` (`ID_lot`),
  CONSTRAINT `apparait_propriete0_FK` FOREIGN KEY (`ID_propriete`) REFERENCES `propriete` (`ID_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apparait`
--

LOCK TABLES `apparait` WRITE;
/*!40000 ALTER TABLE `apparait` DISABLE KEYS */;
INSERT INTO `apparait` VALUES (128,1),(129,2),(130,3),(159,3),(131,8),(132,9),(160,9),(133,10),(153,10),(161,10),(134,18),(138,18),(162,18),(163,18),(135,19),(136,19),(137,20),(138,25),(162,25),(134,29),(139,29),(163,29),(140,30),(141,34),(148,34),(164,34),(167,34),(142,35),(143,36),(144,37),(165,37),(145,38),(146,39),(166,39),(147,40),(141,41),(148,41),(164,41),(167,41),(149,42),(150,43),(168,43),(151,44),(152,48),(153,49),(161,49),(169,49);
/*!40000 ALTER TABLE `apparait` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finalcsv`
--

DROP TABLE IF EXISTS `finalcsv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finalcsv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Date mutation` datetime DEFAULT NULL,
  `Nature mutation` text,
  `Valeur fonciere` int DEFAULT NULL,
  `Code postal` int DEFAULT NULL,
  `Commune` text,
  `Surface reelle bati` double DEFAULT NULL,
  `Nombre pieces principales` int DEFAULT NULL,
  `Surface terrain` double DEFAULT NULL,
  `1er lot` text,
  `2eme lot` text,
  `3eme lot` text,
  `4eme lot` text,
  `5eme lot` text,
  `Type local` text,
  `Adresse` text,
  `Voie_Complete` text,
  `Nature culture` text,
  `Surface Carrez du 1er lot` text,
  `Surface Carrez du 2eme lot` text,
  `Surface Carrez du 3eme lot` text,
  `Surface Carrez du 4eme lot` text,
  `Surface Carrez du 5eme lot` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finalcsv`
--

LOCK TABLES `finalcsv` WRITE;
/*!40000 ALTER TABLE `finalcsv` DISABLE KEYS */;
INSERT INTO `finalcsv` VALUES (1,'2019-01-04 00:00:00','Vente',37220,1000,'BOURG-EN-BRESSE',20,1,0,'8.0','','','','','Appartement','26','RUE DE MONTHOLON','','19,27','','','',''),(2,'2019-01-04 00:00:00','Vente',185100,1000,'BOURG-EN-BRESSE',0,0,0,'7.0','','','','','Dependance','22 B','RUE GEN DELESTRAINT','','','','','',''),(3,'2019-01-04 00:00:00','Vente',185100,1000,'BOURG-EN-BRESSE',62,3,0,'137.0','154.0','','','','Appartement','22','RUE GEN DELESTRAINT','','','61,51','','',''),(4,'2019-01-08 00:00:00','Vente',209000,1160,'PRIAY',90,4,940,'','','','','','Maison','3','RUE DES CHAMPAGNES','S','','','','',''),(5,'2019-01-07 00:00:00','Vente',134900,1370,'SAINT-ETIENNE-DU-BOIS',101,5,490,'','','','','','Maison','5','LOT LE BIOLAY','S','','','','',''),(6,'2019-01-03 00:00:00','Vente',192000,1340,'ATTIGNAT',88,4,708,'','','','','','Maison','165','ALL DES LIBELLULES','S','','','','',''),(7,'2019-01-08 00:00:00','Vente',45000,1250,'CIZE',39,2,631,'','','','','','Maison','9','RTE DU VIADUC','S','','','','',''),(8,'2019-01-04 00:00:00','Vente',65000,1000,'BOURG-EN-BRESSE',0,0,0,'317.0','','','','','Dependance','50','RUE DOC NODET','','','','','',''),(9,'2019-01-04 00:00:00','Vente',65000,1000,'BOURG-EN-BRESSE',69,3,0,'17.0','33.0','','','','Appartement','50','RUE DOC NODET','','','67,78','','',''),(10,'2019-01-04 00:00:00','Vente',37000,1000,'BOURG-EN-BRESSE',39,1,0,'107.0','16.0','','','','Appartement','68','AV DE MACON','','39,52','','','',''),(11,'2019-01-07 00:00:00','Vente',116000,1560,'MANTENAY-MONTLIN',100,1,2103,'','','','','','Maison','1724','RTE DE MONTLEGER','S','','','','',''),(12,'2019-01-08 00:00:00','Vente',266000,1340,'MONTREVEL-EN-BRESSE',0,0,1067,'','','','','','Dependance','1250','RTE DE CUET','S','','','','',''),(13,'2019-01-08 00:00:00','Vente',266000,1340,'MONTREVEL-EN-BRESSE',115,4,1067,'','','','','','Maison','1250','RTE DE CUET','S','','','','',''),(14,'2019-01-12 00:00:00','Vente',138100,1560,'COURTES',99,4,1500,'','','','','','Maison','181','RTE DE VERNOUX','S','','','','',''),(15,'2019-01-12 00:00:00','Vente',138100,1560,'COURTES',0,0,1500,'','','','','','Dependance','181','RTE DE VERNOUX','S','','','','',''),(16,'2019-01-09 00:00:00','Vente',15000,1560,'SAINT-TRIVIER-DE-COURTES',0,0,1063,'','','','','','Dependance','5575',' MOLARDOURY','S','','','','',''),(17,'2019-01-15 00:00:00','Vente',207000,1310,'MONTRACOL',123,4,1073,'','','','','','Maison','544','RTE DE BOIS BRULE','S','','','','',''),(18,'2019-01-07 00:00:00','Vente',75000,1240,'CERTINES',53,2,0,'36.0','45.0','','','','Appartement','5362',' LA MORANDIERE','','52,22','','','',''),(19,'2019-01-11 00:00:00','Vente',190000,1000,'BOURG-EN-BRESSE',0,0,0,'53.0','','','','','Dependance','8','ALL VINCENT BENONY','','','','','',''),(20,'2019-01-11 00:00:00','Vente',190000,1000,'BOURG-EN-BRESSE',0,0,0,'72.0','','','','','Dependance','8','ALL VINCENT BENONY','','','','','',''),(21,'2019-01-11 00:00:00','Vente',190000,1000,'BOURG-EN-BRESSE',91,4,0,'75.0','','','','','Appartement','8','ALL VINCENT BENONY','','90,02','','','',''),(22,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,1002,'','','','','','Dependance','51','RUE CHAUDOUET','S','','','','',''),(23,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,1002,'','','','','','Appartement','51','RUE CHAUDOUET','S','','','','',''),(24,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,1002,'','','','','','Appartement','51','RUE CHAUDOUET','S','','','','',''),(25,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,1002,'','','','','','Appartement','51','RUE CHAUDOUET','S','','','','',''),(26,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,1002,'','','','','','Appartement','51','RUE CHAUDOUET','S','','','','',''),(27,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,619,'','','','','','Dependance','51','RUE CHAUDOUET','AG','','','','',''),(28,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,619,'','','','','','Dependance','51','RUE CHAUDOUET','AG','','','','',''),(29,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,619,'','','','','','Dependance','51','RUE CHAUDOUET','AG','','','','',''),(30,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,619,'','','','','','Dependance','51','RUE CHAUDOUET','AG','','','','',''),(31,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,619,'','','','','','Dependance','51','RUE CHAUDOUET','AG','','','','',''),(32,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,619,'','','','','','Dependance','51','RUE CHAUDOUET','AG','','','','',''),(33,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,619,'','','','','','Appartement','51','RUE CHAUDOUET','AG','','','','',''),(34,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,619,'','','','','','Appartement','51','RUE CHAUDOUET','AG','','','','',''),(35,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,1002,'','','','','','Appartement','51','RUE CHAUDOUET','S','','','','',''),(36,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,1002,'','','','','','Appartement','51','RUE CHAUDOUET','S','','','','',''),(37,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,619,'','','','','','Appartement','51','RUE CHAUDOUET','AG','','','','',''),(38,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,1002,'','','','','','Dependance','51','RUE CHAUDOUET','S','','','','',''),(39,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,619,'','','','','','Appartement','51','RUE CHAUDOUET','AG','','','','',''),(40,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,1002,'','','','','','Dependance','51','RUE CHAUDOUET','S','','','','',''),(41,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,1002,'','','','','','Dependance','51','RUE CHAUDOUET','S','','','','',''),(42,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,619,'','','','','','Appartement','51','RUE CHAUDOUET','AG','','','','',''),(43,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',84,4,619,'','','','','','Appartement','51','RUE CHAUDOUET','AG','','','','',''),(44,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,1002,'','','','','','Dependance','51','RUE CHAUDOUET','S','','','','',''),(45,'2019-01-07 00:00:00','Vente',583000,1960,'PERONNAS',0,0,1002,'','','','','','Dependance','51','RUE CHAUDOUET','S','','','','',''),(46,'2019-01-04 00:00:00','Vente',4000,1160,'PONT-D AIN',0,0,0,'45.0','','','','','Dependance','9 Z','RUE GABRIEL VICAIRE','','','','','',''),(47,'2019-01-08 00:00:00','Vente',235000,1000,'BOURG-EN-BRESSE',196,9,388,'','','','','','Maison','1','RUE JOACHIN DU BELLAY','S','','','','',''),(48,'2019-01-03 00:00:00','Vente',140000,1960,'PERONNAS',73,4,1116,'','','','','','Maison','435','CHE DU POMMIER','S','','','','',''),(49,'2019-01-03 00:00:00','Vente',106000,1960,'PERONNAS',73,4,825,'','','','','','Maison','437','CHE DU POMMIER','S','','','','',''),(50,'2019-01-11 00:00:00','Vente',84000,1960,'PERONNAS',67,3,0,'1.0','36.0','','','','Appartement','552','AV DE LYON','','','67,08','','',''),(51,'2019-01-11 00:00:00','Vente',84000,1960,'PERONNAS',0,0,0,'44.0','','','','','Dependance','552','AV DE LYON','','','','','',''),(52,'2019-01-11 00:00:00','Vente',200000,1000,'SAINT-DENIS-LES-BOURG',103,5,860,'','','','','','Maison','95','RUE DU MARTIN PECHEUR','S','','','','',''),(53,'2019-01-16 00:00:00','Vente',172750,1190,'SAINT-BENIGNE',132,5,1776,'','','','','','Maison','1587','RTE DE CUISERY','AG','','','','',''),(54,'2019-01-16 00:00:00','Vente',172750,1190,'SAINT-BENIGNE',132,5,1000,'','','','','','Maison','1587','RTE DE CUISERY','S','','','','',''),(55,'2019-01-16 00:00:00','Vente',95000,1000,'BOURG-EN-BRESSE',72,3,0,'3.0','9.0','','','','Appartement','7 B','RUE CHARLES GUILLON','','','73,3','','',''),(56,'2019-01-16 00:00:00','Vente',95000,1000,'BOURG-EN-BRESSE',0,0,0,'18.0','','','','','Dependance','7 B','RUE CHARLES GUILLON','','','','','',''),(57,'2019-01-09 00:00:00','Vente',82000,1000,'BOURG-EN-BRESSE',0,0,0,'25.0','','','','','Dependance','6','RUE DE CUIRON','','','','','',''),(58,'2019-01-09 00:00:00','Vente',82000,1000,'BOURG-EN-BRESSE',74,4,0,'4.0','59.0','66.0','','','Appartement','6','RUE DE CUIRON','','','78,77','','',''),(59,'2019-01-15 00:00:00','Vente',133000,1000,'BOURG-EN-BRESSE',0,0,0,'84.0','','','','','Dependance','14 A','BD DE L HIPPODROME','','','','','',''),(60,'2019-01-15 00:00:00','Vente',133000,1000,'BOURG-EN-BRESSE',77,4,0,'79.0','91.0','','','','Appartement','14 B','BD DE L HIPPODROME','','','79,27','','',''),(61,'2019-01-16 00:00:00','Vente',9000,1000,'BOURG-EN-BRESSE',0,0,0,'152.0','','','','','Dependance','49','AV DE MACON','','','','','',''),(62,'2019-01-21 00:00:00','Vente',62500,1160,'PONT-D AIN',130,0,0,'3.0','9.0','','','','Local industriel. commercial ou assimile','28','RUE BERNARD GANGLOFF','','41,87','45,3','','',''),(63,'2019-01-21 00:00:00','Vente',62500,1160,'PONT-D AIN',0,0,0,'11.0','','','','','Dependance','28','RUE BERNARD GANGLOFF','','','','','',''),(64,'2019-01-10 00:00:00','Vente',102000,1000,'BOURG-EN-BRESSE',52,2,0,'24.0','43.0','','','','Appartement','52','RUE DE MONTE CASSINO','','52,6','','','',''),(65,'2019-01-10 00:00:00','Vente',102000,1000,'BOURG-EN-BRESSE',0,0,0,'103.0','','','','','Dependance','52','RUE DE MONTE CASSINO','','','','','',''),(66,'2019-01-10 00:00:00','Vente',390000,1000,'BOURG-EN-BRESSE',46,2,1060,'','','','','','Appartement','36','AV DE LYON','S','','','','',''),(67,'2019-01-10 00:00:00','Vente',390000,1000,'BOURG-EN-BRESSE',126,6,1060,'','','','','','Appartement','36','AV DE LYON','S','','','','',''),(68,'2019-01-10 00:00:00','Vente',390000,1000,'BOURG-EN-BRESSE',0,0,1060,'','','','','','Dependance','36','AV DE LYON','S','','','','',''),(69,'2019-01-17 00:00:00','Vente',108000,1000,'BOURG-EN-BRESSE',0,0,0,'61.0','','','','','Dependance','6','RUE DE L EST','','','','','',''),(70,'2019-01-17 00:00:00','Vente',108000,1000,'BOURG-EN-BRESSE',43,2,0,'16.0','28.0','','','','Appartement','6','RUE DE L EST','','','','','',''),(71,'2019-01-04 00:00:00','Vente',214500,1000,'BOURG-EN-BRESSE',108,5,342,'','','','','','Maison','116','ALL DES GLANEUSES','S','','','','',''),(72,'2019-01-04 00:00:00','Vente',135000,1290,'CRUZILLES-LES-MEPILLAT',48,2,935,'','','','','','Maison','37',' LES CHAMBARDS OUEST','S','','','','','');
/*!40000 ALTER TABLE `finalcsv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot` (
  `ID_lot` int NOT NULL AUTO_INCREMENT,
  `type_lot` varchar(50) NOT NULL,
  `surface_carre_lot` float NOT NULL,
  PRIMARY KEY (`ID_lot`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
INSERT INTO `lot` VALUES (128,'8.0',19),(129,'7.0',0),(130,'137.0',0),(131,'317.0',0),(132,'17.0',0),(133,'107.0',39),(134,'36.0',52),(135,'53.0',0),(136,'72.0',0),(137,'75.0',90),(138,'45.0',0),(139,'1.0',0),(140,'44.0',0),(141,'3.0',0),(142,'18.0',0),(143,'25.0',0),(144,'4.0',0),(145,'84.0',0),(146,'79.0',0),(147,'152.0',0),(148,'3.0',41),(149,'11.0',0),(150,'24.0',52),(151,'103.0',0),(152,'61.0',0),(153,'16.0',0),(159,'154.0',61),(160,'33.0',67),(161,'16.0',0),(162,'45.0',0),(163,'36.0',67),(164,'9.0',73),(165,'59.0',78),(166,'91.0',79),(167,'9.0',45),(168,'43.0',0),(169,'28.0',0),(174,'66.0',0);
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutation`
--

DROP TABLE IF EXISTS `mutation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mutation` (
  `ID_mutation` int NOT NULL AUTO_INCREMENT,
  `nature_mutation` varchar(50) NOT NULL,
  `date_mutation` date NOT NULL,
  `ID_propriete` int NOT NULL,
  PRIMARY KEY (`ID_mutation`),
  KEY `mutation_propriete_FK` (`ID_propriete`),
  CONSTRAINT `mutation_propriete_FK` FOREIGN KEY (`ID_propriete`) REFERENCES `propriete` (`ID_propriete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mutation`
--

LOCK TABLES `mutation` WRITE;
/*!40000 ALTER TABLE `mutation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mutation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureculture`
--

DROP TABLE IF EXISTS `natureculture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `natureculture` (
  `ID_natureCulture` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_natureCulture`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureculture`
--

LOCK TABLES `natureculture` WRITE;
/*!40000 ALTER TABLE `natureculture` DISABLE KEYS */;
INSERT INTO `natureculture` VALUES (1,''),(2,'S'),(3,'AG');
/*!40000 ALTER TABLE `natureculture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propriete`
--

DROP TABLE IF EXISTS `propriete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propriete` (
  `ID_propriete` int NOT NULL AUTO_INCREMENT,
  `valeur_fonciere` float NOT NULL,
  `type_local` varchar(50) NOT NULL,
  `surface_reelle` float NOT NULL,
  `nbr_piece` int NOT NULL,
  `surface_terrain` float NOT NULL,
  `ID_adresse` int NOT NULL,
  `ID_natureCulture` int DEFAULT NULL,
  PRIMARY KEY (`ID_propriete`),
  KEY `propriete_adresse_FK` (`ID_adresse`),
  KEY `propriete_natureculture0_FK` (`ID_natureCulture`),
  CONSTRAINT `propriete_adresse_FK` FOREIGN KEY (`ID_adresse`) REFERENCES `adresse` (`ID_adresse`),
  CONSTRAINT `propriete_natureculture0_FK` FOREIGN KEY (`ID_natureCulture`) REFERENCES `natureculture` (`ID_natureCulture`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propriete`
--

LOCK TABLES `propriete` WRITE;
/*!40000 ALTER TABLE `propriete` DISABLE KEYS */;
INSERT INTO `propriete` VALUES (1,37220,'Appartement',20,1,0,1,1),(2,185100,'Dependance',0,0,0,2,1),(3,185100,'Appartement',62,3,0,3,1),(4,209000,'Maison',90,4,940,4,2),(5,134900,'Maison',101,5,490,5,2),(6,192000,'Maison',88,4,708,6,2),(7,45000,'Maison',39,2,631,7,2),(8,65000,'Dependance',0,0,0,8,1),(9,65000,'Appartement',69,3,0,8,1),(10,37000,'Appartement',39,1,0,9,1),(11,116000,'Maison',100,1,2103,10,2),(12,266000,'Dependance',0,0,1067,11,2),(13,266000,'Maison',115,4,1067,11,2),(14,138100,'Maison',99,4,1500,12,2),(15,138100,'Dependance',0,0,1500,12,2),(16,15000,'Dependance',0,0,1063,13,2),(17,207000,'Maison',123,4,1073,14,2),(18,75000,'Appartement',53,2,0,15,1),(19,190000,'Dependance',0,0,0,16,1),(20,190000,'Appartement',91,4,0,16,1),(21,583000,'Dependance',0,0,1002,17,2),(22,583000,'Appartement',84,4,1002,17,2),(23,583000,'Dependance',0,0,619,17,3),(24,583000,'Appartement',84,4,619,17,3),(25,4000,'Dependance',0,0,0,18,1),(26,235000,'Maison',196,9,388,19,2),(27,140000,'Maison',73,4,1116,20,2),(28,106000,'Maison',73,4,825,21,2),(29,84000,'Appartement',67,3,0,22,1),(30,84000,'Dependance',0,0,0,22,1),(31,200000,'Maison',103,5,860,23,2),(32,172750,'Maison',132,5,1776,24,3),(33,172750,'Maison',132,5,1000,24,2),(34,95000,'Appartement',72,3,0,25,1),(35,95000,'Dependance',0,0,0,25,1),(36,82000,'Dependance',0,0,0,26,1),(37,82000,'Appartement',74,4,0,26,1),(38,133000,'Dependance',0,0,0,27,1),(39,133000,'Appartement',77,4,0,28,1),(40,9000,'Dependance',0,0,0,29,1),(41,62500,'Local industriel. commercial ou assimile',130,0,0,30,1),(42,62500,'Dependance',0,0,0,30,1),(43,102000,'Appartement',52,2,0,31,1),(44,102000,'Dependance',0,0,0,31,1),(45,390000,'Appartement',46,2,1060,32,2),(46,390000,'Appartement',126,6,1060,32,2),(47,390000,'Dependance',0,0,1060,32,2),(48,108000,'Dependance',0,0,0,33,1),(49,108000,'Appartement',43,2,0,33,1),(50,214500,'Maison',108,5,342,34,2),(51,135000,'Maison',48,2,935,35,2);
/*!40000 ALTER TABLE `propriete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ville` (
  `ID_ville` int NOT NULL AUTO_INCREMENT,
  `code_postal` int NOT NULL,
  `nom_ville` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` VALUES (1,1000,'BOURG-EN-BRESSE'),(2,1160,'PRIAY'),(3,1370,'SAINT-ETIENNE-DU-BOIS'),(4,1340,'ATTIGNAT'),(5,1250,'CIZE'),(6,1560,'MANTENAY-MONTLIN'),(7,1340,'MONTREVEL-EN-BRESSE'),(8,1560,'COURTES'),(9,1560,'SAINT-TRIVIER-DE-COURTES'),(10,1310,'MONTRACOL'),(11,1240,'CERTINES'),(12,1960,'PERONNAS'),(13,1160,'PONT-D AIN'),(14,1000,'SAINT-DENIS-LES-BOURG'),(15,1190,'SAINT-BENIGNE'),(16,1290,'CRUZILLES-LES-MEPILLAT');
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-03 23:08:05
