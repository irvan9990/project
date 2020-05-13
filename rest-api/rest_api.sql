-- MariaDB dump 10.17  Distrib 10.4.10-MariaDB, for osx10.14 (x86_64)
--
-- Host: localhost    Database: rest_api
-- ------------------------------------------------------
-- Server version	10.4.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nohp` char(9) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `jurusan` varchar(64) NOT NULL,
  `tgl_lahir` varchar(30) DEFAULT NULL,
  `alamat` varchar(205) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (1,'043040001','Doddy Ferdiansyah Ubah','doy@gmail.com','Teknik Mesin','20 April 2020','Jl. Raya Bogor','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(2,'023040123','Erik','erik@gmail.com','Teknik Industri','20 April 2020','Jl. Raya Bogor','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(3,'043040321','Rommy Fauzi','rommy@gmail.com','Teknik Planologi','20 April 2020','Jl. Margonda','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(4,'033040023','Fajar Darmawan','fajar@yahoo.com','Teknik Informatika','20 April 2020','Jl. Bekasi','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(5,'113040321','Ferry Mulyanto','ferry@yahoo.com','Manajemen','20 April 2020','Jl. Tangerang','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(50,'1234','uji1','uji1','Manajemen','20 April 2020','Jl. Tangerangg','42dd0a7fdcb47aad0f6bd98da39c42ba60c00dc0e01fcba36195c23b7f19143d'),(51,'122333333','uji3','uji3@mail.com','TI','03 May 2020','Jalan Raya ','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f'),(52,'12345609','uji1','uji1','Teknik Informatika','20 April 2020','Jl. Raya Kota Provinsi','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-07 14:16:25
