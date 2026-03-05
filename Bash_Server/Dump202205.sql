-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db67
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `OrderDate` datetime NOT NULL,
  `OrderDeliveryDate` datetime NOT NULL,
  `OrderPickupPoint` int NOT NULL,
  `OrderCode` int NOT NULL,
  `OrderStatus` enum('Новый','Завершен') NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `OrderPickupPoint` (`OrderPickupPoint`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`OrderPickupPoint`) REFERENCES `PickupPoint` (`PickupPointID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,3,'2022-05-09 00:00:00','2022-05-15 00:00:00',25,611,'Новый'),(2,4,'2022-05-10 00:00:00','2022-05-16 00:00:00',26,612,'Завершен'),(3,9,'2022-05-11 00:00:00','2022-05-17 00:00:00',27,613,'Новый'),(4,10,'2022-05-12 00:00:00','2022-05-18 00:00:00',28,614,'Новый'),(5,20,'2022-05-13 00:00:00','2022-05-19 00:00:00',29,615,'Завершен'),(6,26,'2022-05-14 00:00:00','2022-05-20 00:00:00',30,616,'Новый'),(7,30,'2022-05-15 00:00:00','2022-05-21 00:00:00',31,617,'Новый'),(8,32,'2022-05-16 00:00:00','2022-05-22 00:00:00',32,618,'Новый'),(9,33,'2022-05-17 00:00:00','2022-05-23 00:00:00',33,619,'Новый'),(10,34,'2022-05-18 00:00:00','2022-05-24 00:00:00',34,620,'Новый');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderProduct`
--

DROP TABLE IF EXISTS `OrderProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderProduct` (
  `OrderID` int NOT NULL,
  `ProductArticleNumber` varchar(6) NOT NULL,
  `ProductCount` int NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductArticleNumber`),
  KEY `ProductArticleNumber` (`ProductArticleNumber`),
  CONSTRAINT `orderproduct_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`),
  CONSTRAINT `orderproduct_ibfk_2` FOREIGN KEY (`ProductArticleNumber`) REFERENCES `Product` (`ProductArticleNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderProduct`
--

LOCK TABLES `OrderProduct` WRITE;
/*!40000 ALTER TABLE `OrderProduct` DISABLE KEYS */;
INSERT INTO `OrderProduct` VALUES (1,'G892T6',3),(1,'А112Т4',3),(2,'F683T5',1),(2,'H936R5',1),(3,'K892T6',5),(3,'U933T6',5),(4,'G729T5',1),(4,'H792T5',3),(5,'K782T5',2),(5,'K902F4',2),(6,'D682R2',1),(6,'H782R4',2),(7,'B782T5',1),(7,'L726D4',1),(8,'K963R5',2),(8,'N826F5',1),(9,'L902F5',1),(9,'S672R5',2),(10,'N725R4',2),(10,'V627S4',1);
/*!40000 ALTER TABLE `OrderProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PickupPoint`
--

DROP TABLE IF EXISTS `PickupPoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PickupPoint` (
  `PickupPointID` int NOT NULL AUTO_INCREMENT,
  `PickupPointAddress` text NOT NULL,
  PRIMARY KEY (`PickupPointID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PickupPoint`
--

LOCK TABLES `PickupPoint` WRITE;
/*!40000 ALTER TABLE `PickupPoint` DISABLE KEYS */;
INSERT INTO `PickupPoint` VALUES (2,'344288, г. Саров, ул. Чехова, 1'),(3,'614164, г.Саров,  ул. Степная, 30'),(4,'394242, г. Саров, ул. Коммунистическая, 43'),(5,'660540, г. Саров, ул. Солнечная, 25'),(6,'125837, г. Саров, ул. Шоссейная, 40'),(7,'125703, г. Саров, ул. Партизанская, 49'),(8,'625283, г. Саров, ул. Победы, 46'),(9,'614611, г. Саров, ул. Молодежная, 50'),(10,'454311, г.Саров, ул. Новая, 19'),(11,'660007, г.Саров, ул. Октябрьская, 19'),(12,'603036, г. Саров, ул. Садовая, 4'),(13,'450983, г.Саров, ул. Комсомольская, 26'),(14,'394782, г. Саров, ул. Чехова, 3'),(15,'603002, г. Саров, ул. Дзержинского, 28'),(16,'450558, г. Саров, ул. Набережная, 30'),(17,'394060, г.Саров, ул. Фрунзе, 43'),(18,'410661, г. Саров, ул. Школьная, 50'),(19,'625590, г. Саров, ул. Коммунистическая, 20'),(20,'625683, г. Саров, ул. 8 Марта'),(21,'400562, г. Саров, ул. Зеленая, 32'),(22,'614510, г. Саров, ул. Маяковского, 47'),(23,'410542, г. Саров, ул. Светлая, 46'),(24,'620839, г. Саров, ул. Цветочная, 8'),(25,'443890, г. Саров, ул. Коммунистическая, 1'),(26,'603379, г. Саров, ул. Спортивная, 46'),(27,'603721, г. Саров, ул. Гоголя, 41'),(28,'410172, г. Саров, ул. Северная, 13'),(29,'420151, г. Саров, ул. Вишневая, 32'),(30,'125061, г. Саров, ул. Подгорная, 8'),(31,'630370, г. Саров, ул. Шоссейная, 24'),(32,'614753, г. Саров, ул. Полевая, 35'),(33,'426030, г. Саров, ул. Маяковского, 44'),(34,'450375, г. Саров ул. Клубная, 44'),(35,'625560, г. Саров, ул. Некрасова, 12'),(36,'630201, г. Саров, ул. Комсомольская, 17'),(37,'190949, г. Саров, ул. Мичурина, 26');
/*!40000 ALTER TABLE `PickupPoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductArticleNumber` varchar(6) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `ProductUnit` varchar(10) NOT NULL,
  `ProductCost` decimal(19,4) NOT NULL,
  `ProductDiscountMax` tinyint DEFAULT NULL,
  `ProductManufacturer` varchar(250) NOT NULL,
  `ProductSupplier` int NOT NULL,
  `ProductCategory` varchar(100) NOT NULL,
  `ProductDiscountAmount` tinyint DEFAULT NULL,
  `ProductQuantityInStock` int NOT NULL,
  `ProductDescription` text NOT NULL,
  `ProductPhoto` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ProductArticleNumber`),
  KEY `ProductSupplier` (`ProductSupplier`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ProductSupplier`) REFERENCES `Supplier` (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('A283F5','Пудра','шт.',3200.0000,25,'MAC',1,'Пудра',3,17,'Пудра для лица, MAC studio fix powder plus foundation',''),('B782T5','Пудра','шт.',3200.0000,15,'MAC',2,'Пудра',3,15,'Компактная пудра с эффектом сияния, MAC extra dimension skinfinish',''),('C672R4','Палетка','шт.',3200.0000,10,'DIOR',1,'Палетка для лица',3,12,'Палетка для сияния лица, DIOR BACKSTAGE glow face palette',''),('D672R5','Тушь для ресниц','шт.',500.0000,15,'VIVIENNE SABO',1,'Тушь',2,17,'Тушь для ресниц влагостойкая,VIVIENNE SABO cabaret latex',''),('D682R2','Скульптор лица','шт.',250.0000,5,'Estrade',2,'Скульптор',4,14,'Скульптор для лица, ESTRADE mon secret',''),('F683T5','Гель для бровей','шт.',149.0000,5,'VIVIENNE SABO',1,'Гель для бровей',2,6,'VIVIENNE SABO EYEBROW EXTRA STRONG FIXING GEL','F683T5.jpg'),('G729T5','Тушь для ресниц','шт.',400.0000,15,'VIVIENNE SABO',2,'Тушь',2,14,'Тушь для ресниц со сценическим эффектом, VIVIENNE SABO cabaret premiere','G729T5.jpg'),('G892T6','Гель для бровей','шт.',384.0000,15,'VIVIENNE SABO',2,'Гель для бровей',2,14,'VIVIENNE SABO HAUTE COUTURE FIXATEUR BROW&LASH FIXING GEL','G892T6.jpg'),('H198T5','Карандаш для губ','шт.',500.0000,15,'PUPA',1,'Карандаш для губ',2,16,'Карандаш для губ, PUPA true lips','H198T5.jpg'),('H782R4','Тушь для ресниц','шт.',300.0000,15,'Art-Visage',1,'Тушь',2,5,'Суперобъемная тушь для ресниц, ART-VISAGE chicago',''),('H792T5','Помада','шт.',1500.0000,25,'SIGMA',1,'Для губ',3,16,'Жидкая губная помада, SIGMA BEAUTY liquid lipstick','H792T5.jpg'),('H936R5','Тени для бровей','шт.',380.0000,20,'VIVIENNE SABO',2,'Тени',4,21,'VIVIENNE SABO BROW ARCADE EYEBROW SHADOW DUO','H936R5.jpg'),('J892T5','Крем','шт.',4000.0000,5,'ERBORIAN',2,'Крем для лица',4,7,'BB крем для лица, ERBORIAN bb creme',''),('K782T5','Подводка','шт.',3255.0000,30,'Art-Visage',2,'Подводка для глаз',3,7,'Подводка-фломастер для глаз, ART-VISAGE cat eyes','K782T5.jpg'),('K892T6','Тени для век','шт.',3630.0000,20,'CHANEL',1,'Тени',4,8,'ПАЛИТРА ТЕНЕЙ ДЛЯ ВЕК С ЭФФЕКТОМ ЕСТЕСТВЕННОГО СИЯНИЯ','K892T6.jpg'),('K902F4','Тени для век','шт.',3700.0000,10,'SIGMA',2,'Тени',3,25,'Палетка для контурирования лица, SIGMA BEAUTY sculpt highlight + contour palette',''),('K902R5','Пудра','шт.',1215.0000,15,'Darling',2,'Пудра',4,13,'Пудра-компакт, DARLING* plush air',''),('K921G6','Скульптор лица','шт.',700.0000,40,'NYX',1,'Скульптор',4,6,'Тройная палетка для скульптурирования, NYX PROFESSIONAL MAKEUP 3 steps to sculpt face sculpting palette',''),('K963R5','Масло для губ','шт.',180.0000,5,'Estrade',2,'Для губ',2,6,'Масло для губ, ESTRADE treatment lip oil',''),('L726D4','Румяна','шт.',2300.0000,15,'MAC',2,'Румяна для лица',2,9,'Румяна для лица, MAC sheertone blush',''),('L902F5','Румяна','шт.',324.0000,5,'Art-Visage',2,'Румяна для лица',3,9,'Кремовые румяна, ART-VISAGE cream blush',''),('M788G5','Румяна','шт.',2790.0000,30,'MAC',1,'Румяна для лица',2,23,'Румяна для лица, MAC mineralize blush',''),('N725R4','Карандаш для глаз','шт.',1990.0000,15,'MAC',2,'Карандаш для глаз',3,7,'Устойчивый карандаш для глаз, MAC kajal crayon',''),('N826F5','Минеральная пудра','шт.',1000.0000,10,'NYX',1,'Пудра',4,15,'Минеральная прозрачная пудра для фиксации макияжа, NYX PROFESSIONAL MAKEUP studio finishing powder shade',''),('S672R5','Масло для губ','шт.',2000.0000,15,'Darling',1,'Для губ',5,19,'Масло-тинт для губ, DARLING* lava lamp',''),('U933T6','Кисть для макияжа','шт.',1900.0000,30,'SIGMA',2,'Кисть для макияжа',2,15,'УНИВЕРСАЛЬНАЯ КИСТЬ КАБУКИ, SIGMA BEAUTY 3dhd® kabuki','U933T6.jpg'),('V627S4','Крем','шт.',1237.0000,5,'ERBORIAN',2,'Крем для лица',2,18,'CC крем \"Абсолютное совершенство\"\", cc color correcting cream\"',''),('V672S5','Жидкие тени','шт.',810.0000,30,'Darling',2,'Тени',4,15,'Жидкие тени-глиттер для век,DARLING* soul sisters',''),('Y276S4','Пудра','шт.',3190.0000,10,'MAC',1,'Пудра',2,15,'Перламутровая пудра, MAC mineralize skinfinish',''),('А112Т4','Тушь для ресниц','шт.',1400.0000,30,'SIGMA',1,'Тушь',4,6,'SIGMA BEAUTY sinuosity lash','А112Т4.jpg');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Клиент'),(2,'Менеджер'),(3,'Администратор');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(100) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Золотое яблоко'),(2,'Рив Гош');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserSurname` varchar(100) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `UserPatronymic` varchar(100) NOT NULL,
  `UserLogin` varchar(100) NOT NULL,
  `UserPassword` varchar(100) NOT NULL,
  `UserRole` int NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `UserRole` (`UserRole`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`UserRole`) REFERENCES `Role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Алексеев ','Владислав','Аркадьевич','loginDEbct2018','Qg3gff',1),(2,'Савельева ','Евфросиния','Арсеньевна','loginDEvtg2018','ETMNzL',3),(3,'Никонов ','Мэлс','Лукьевич','loginDEuro2018','a1MIcO',1),(4,'Горшкова ','Агафья','Онисимовна','loginDEpst2018','0CyGnX',1),(5,'Горбачёв ','Пантелеймон','Германович','loginDEpsu2018','Vx9cQ{',2),(6,'Ершова ','Иванна','Максимовна','loginDEzqs2018','qM9p7i',2),(7,'Туров ','Денис','Геласьевич','loginDEioe2018','yMPu&2',2),(8,'Носова ','Наина','Эдуардовна','loginDEcmk2018','3f+b0+',3),(9,'Куликов ','Андрей','Святославович','loginDEfsp2018','&dtlI+',1),(10,'Нестеров ','Агафон','Георгьевич','loginDExcd2018','SZXZNL',1),(11,'Козлов ','Геласий','Христофорович','loginDEvlf2018','O5mXc2',2),(12,'Борисова ','Анжелика','Анатольевна','loginDEanv2018','Xiq}M3',3),(13,'Суханов ','Станислав','Фролович','loginDEzde2018','tlO3x&',2),(14,'Тетерина ','Феврония','Эдуардовна','loginDEriv2018','GJ2mHL',2),(15,'Муравьёва ','Александра','Ростиславовна','loginDEhcp2018','n2nfRl',2),(16,'Новикова ','Лукия','Ярославовна','loginDEwjv2018','ZfseKA',2),(17,'Агафонова ','Лариса','Михаиловна','loginDEiry2018','5zu7+}',2),(18,'Сергеева ','Агата','Юрьевна','loginDEgbr2018','}+Ex1*',2),(19,'Колобова ','Елена','Евгеньевна','loginDExxv2018','+daE|T',2),(20,'Ситников ','Николай','Филатович','loginDEbto2018','b1iYMI',1),(21,'Белов ','Роман','Иринеевич','loginDEfbs2018','v90Rep',2),(22,'Волкова ','Алла','Лукьевна','loginDEple2018','WlW+l8',3),(23,'Кудрявцева ','Таисия','Игоревна','loginDEhhx2018','hmCHeQ',2),(24,'Семёнова ','Октябрина','Христофоровна','loginDEayn2018','Ka2Fok',2),(25,'Смирнов ','Сергей','Яковович','loginDEwld2018','y9HStF',2),(26,'Брагина ','Алина','Валерьевна','loginDEhuu2018','X31OEf',1),(27,'Евсеев ','Игорь','Донатович','loginDEmjb2018','5mm{ch',2),(28,'Суворов ','Илья','Евсеевич','loginDEdgp2018','1WfJjo',2),(29,'Котов ','Денис','Мартынович','loginDEgyi2018','|7nYPc',3),(30,'Бобылёва ','Юлия','Егоровна','loginDEmvn2018','Mrr9e0',1),(31,'Брагин ','Бронислав','Георгьевич','loginDEfoj2018','nhGc+D',3),(32,'Александров ','Владимир','Дамирович','loginDEuuo2018','42XmH1',1),(33,'Фокин ','Ириней','Ростиславович','loginDEhsj2018','s+jrMW',1),(34,'Воронов ','Митрофан','Антонович','loginDEvht2018','zMyS8Z',1),(35,'Маслов ','Мстислав','Антонинович','loginDEeqo2018','l5CBqA',1),(36,'Щербаков ','Георгий','Богданович','loginDExrf2018','mhpRIT',1),(37,'Кириллова ','Эмилия','Федосеевна','loginDEfku2018','a1m+8c',2),(38,'Васильев ','Серапион','Макарович','loginDExix2018','hzxtnn',3),(39,'Галкина ','Олимпиада','Владленовна','loginDEqrf2018','mI8n58',2),(40,'Яковлева ','Ксения','Онисимовна','loginDEhlk2018','g0jSed',1),(41,'Калашникова ','Александра','Владимировна','loginDEwoe2018','yOtw2F',3),(42,'Медведьева ','Таисия','Тихоновна','loginDExyu2018','7Fg}9p',1),(43,'Карпова ','Ольга','Лукьевна','loginDEcor2018','2cIrC8',1),(44,'Герасимов ','Мстислав','Дамирович','loginDEqon2018','YeFbh6',2),(45,'Тимофеева ','Ксения','Валерьевна','loginDEyfd2018','8aKdb0',1),(46,'Горбунов ','Вячеслав','Станиславович','loginDEtto2018','qXYDuu',2),(47,'Кошелева ','Кира','Владиславовна','loginDEdal2018','cJWXL0',2),(48,'Панфилова ','Марина','Борисовна','loginDEbjs2018','Xap2ct',2),(49,'Кудрявцев ','Матвей','Игоревич','loginDEdof2018','kD|LRU',2),(50,'Зуев ','Эдуард','Пантелеймонович','loginDEsnh2018','Xap3ct',2);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db67'
--

--
-- Dumping routines for database 'db67'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 19:01:01
