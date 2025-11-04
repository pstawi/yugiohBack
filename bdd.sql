-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yugiohmanager
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `attributcarte`
--

DROP TABLE IF EXISTS `attributcarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributcarte` (
  `idAttribut` int NOT NULL AUTO_INCREMENT,
  `libelleAttribut` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idAttribut`),
  UNIQUE KEY `libelleAttribut` (`libelleAttribut`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributcarte`
--

LOCK TABLES `attributcarte` WRITE;
/*!40000 ALTER TABLE `attributcarte` DISABLE KEYS */;
INSERT INTO `attributcarte` VALUES (7,'DIVIN'),(4,'EAU'),(3,'FEU'),(1,'LUMIERE'),(2,'TENEBRES'),(6,'TERRE'),(5,'VENT');
/*!40000 ALTER TABLE `attributcarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carte`
--

DROP TABLE IF EXISTS `carte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carte` (
  `idCarte` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `idType` int NOT NULL,
  `idAttribut` int DEFAULT NULL,
  `niveau` int DEFAULT NULL,
  `attaque` int DEFAULT NULL,
  `defense` int DEFAULT NULL,
  `idRarete` int NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codeEdition` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idCarte`),
  KEY `fk_carte_type` (`idType`),
  KEY `fk_carte_attribut` (`idAttribut`),
  KEY `fk_carte_rarete` (`idRarete`),
  KEY `fk_carte_edition` (`codeEdition`),
  CONSTRAINT `fk_carte_attribut` FOREIGN KEY (`idAttribut`) REFERENCES `attributcarte` (`idAttribut`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_carte_edition` FOREIGN KEY (`codeEdition`) REFERENCES `edition` (`codeEdition`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_carte_rarete` FOREIGN KEY (`idRarete`) REFERENCES `raretecarte` (`idRarete`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_carte_type` FOREIGN KEY (`idType`) REFERENCES `typecarte` (`idType`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carte`
--

LOCK TABLES `carte` WRITE;
/*!40000 ALTER TABLE `carte` DISABLE KEYS */;
/*!40000 ALTER TABLE `carte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection` (
  `idCollection` int NOT NULL AUTO_INCREMENT,
  `idUtilisateur` int NOT NULL,
  `nomCollection` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idCollection`),
  KEY `fk_collection_utilisateur` (`idUtilisateur`),
  CONSTRAINT `fk_collection_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectioncarte`
--

DROP TABLE IF EXISTS `collectioncarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collectioncarte` (
  `idCollection` int NOT NULL,
  `idCarte` int NOT NULL,
  `dateAcquisition` date DEFAULT NULL,
  PRIMARY KEY (`idCollection`,`idCarte`),
  KEY `fk_collectionCarte_carte` (`idCarte`),
  CONSTRAINT `fk_collectionCarte_carte` FOREIGN KEY (`idCarte`) REFERENCES `carte` (`idCarte`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_collectionCarte_collection` FOREIGN KEY (`idCollection`) REFERENCES `collection` (`idCollection`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectioncarte`
--

LOCK TABLES `collectioncarte` WRITE;
/*!40000 ALTER TABLE `collectioncarte` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectioncarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deck`
--

DROP TABLE IF EXISTS `deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deck` (
  `idDeck` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `dateCreation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUtilisateur` int NOT NULL,
  PRIMARY KEY (`idDeck`),
  KEY `fk_deck_utilisateur` (`idUtilisateur`),
  CONSTRAINT `fk_deck_utilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deck`
--

LOCK TABLES `deck` WRITE;
/*!40000 ALTER TABLE `deck` DISABLE KEYS */;
/*!40000 ALTER TABLE `deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deckcarte`
--

DROP TABLE IF EXISTS `deckcarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deckcarte` (
  `idDeck` int NOT NULL,
  `idCarte` int NOT NULL,
  `quantite` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idDeck`,`idCarte`),
  KEY `fk_deckCarte_carte` (`idCarte`),
  CONSTRAINT `fk_deckCarte_carte` FOREIGN KEY (`idCarte`) REFERENCES `carte` (`idCarte`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_deckCarte_deck` FOREIGN KEY (`idDeck`) REFERENCES `deck` (`idDeck`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deckcarte`
--

LOCK TABLES `deckcarte` WRITE;
/*!40000 ALTER TABLE `deckcarte` DISABLE KEYS */;
/*!40000 ALTER TABLE `deckcarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edition`
--

DROP TABLE IF EXISTS `edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edition` (
  `codeEdition` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomEdition` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateSortie` date DEFAULT NULL,
  `fabricant` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codeEdition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edition`
--

LOCK TABLES `edition` WRITE;
/*!40000 ALTER TABLE `edition` DISABLE KEYS */;
/*!40000 ALTER TABLE `edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raretecarte`
--

DROP TABLE IF EXISTS `raretecarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raretecarte` (
  `idRarete` int NOT NULL AUTO_INCREMENT,
  `libelleRarete` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idRarete`),
  UNIQUE KEY `libelleRarete` (`libelleRarete`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raretecarte`
--

LOCK TABLES `raretecarte` WRITE;
/*!40000 ALTER TABLE `raretecarte` DISABLE KEYS */;
INSERT INTO `raretecarte` VALUES (1,'Commune'),(2,'Rare'),(5,'Secrète'),(3,'Super Rare'),(4,'Ultra Rare');
/*!40000 ALTER TABLE `raretecarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleutilisateur`
--

DROP TABLE IF EXISTS `roleutilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleutilisateur` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `libelleRole` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idRole`),
  UNIQUE KEY `libelleRole` (`libelleRole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleutilisateur`
--

LOCK TABLES `roleutilisateur` WRITE;
/*!40000 ALTER TABLE `roleutilisateur` DISABLE KEYS */;
INSERT INTO `roleutilisateur` VALUES (2,'admin'),(1,'joueur');
/*!40000 ALTER TABLE `roleutilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typecarte`
--

DROP TABLE IF EXISTS `typecarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typecarte` (
  `idType` int NOT NULL AUTO_INCREMENT,
  `libelleType` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idType`),
  UNIQUE KEY `libelleType` (`libelleType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typecarte`
--

LOCK TABLES `typecarte` WRITE;
/*!40000 ALTER TABLE `typecarte` DISABLE KEYS */;
INSERT INTO `typecarte` VALUES (2,'Magie'),(1,'Monstre'),(3,'Piège');
/*!40000 ALTER TABLE `typecarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `idUtilisateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motDePasse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateInscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idRole` int NOT NULL,
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pseudo` (`pseudo`),
  KEY `fk_utilisateur_role` (`idRole`),
  CONSTRAINT `fk_utilisateur_role` FOREIGN KEY (`idRole`) REFERENCES `roleutilisateur` (`idRole`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 13:55:21
