-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: 201906hoso1cua
-- ------------------------------------------------------
-- Server version 	5.6.37
-- Date: Sun, 22 Mar 2020 15:23:55 +0700

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
-- Table structure for table `assign`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assign` (
  `ID_Assign` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Employee` int(11) NOT NULL,
  `ID_Procedure` int(11) NOT NULL,
  `duration` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL,
  `assign_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_9` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_10` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Assign`),
  KEY `ID_Employee` (`ID_Employee`),
  KEY `ID_Procedure` (`ID_Procedure`),
  CONSTRAINT `Assign_ibfk_2` FOREIGN KEY (`ID_Procedure`) REFERENCES `procedure` (`ID_Procedure`),
  CONSTRAINT `assign_ibfk_1` FOREIGN KEY (`ID_Employee`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign`
--

LOCK TABLES `assign` WRITE;
/*!40000 ALTER TABLE `assign` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `assign` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `assign` with 0 row(s)
--

--

-- Dumped table `backup` with 13 row(s)
--

--
-- Table structure for table `dossier`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossier` (
  `ID_Dossier` int(11) NOT NULL AUTO_INCREMENT,
  `Ma_Hoso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dossier_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `dossier_owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `owner_address` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `owner_email` varchar(110) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_phone` int(10) DEFAULT NULL,
  `owner_zalo_id` int(15) DEFAULT NULL,
  `time_received` datetime NOT NULL,
  `time_return` datetime NOT NULL,
  `ID_Procedure` int(11) NOT NULL,
  `id_sector` int(11) NOT NULL DEFAULT '0',
  `id_create` int(11) NOT NULL DEFAULT '0',
  `id_stepcurrent` int(11) DEFAULT '0',
  `is_actived` int(11) NOT NULL DEFAULT '1',
  `history_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_11` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_12` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_13` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_14` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_15` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_16` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_17` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_18` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_19` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dossier_20` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Dossier`),
  UNIQUE KEY `Ma_Hoso` (`Ma_Hoso`),
  KEY `ID_Procedure` (`ID_Procedure`),
  KEY `id_stepcurrent` (`id_stepcurrent`),
  CONSTRAINT `Dossier_ibfk_1` FOREIGN KEY (`ID_Procedure`) REFERENCES `procedure` (`ID_Procedure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossier`
--

LOCK TABLES `dossier` WRITE;
/*!40000 ALTER TABLE `dossier` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `dossier` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `dossier` with 0 row(s)
--

--
-- Table structure for table `dossier_process`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossier_process` (
  `ID_Process` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Dossier` int(11) NOT NULL,
  `ID_Step` int(11) NOT NULL,
  `ID_Assign` int(11) NOT NULL,
  `ID_thongbao` int(11) NOT NULL,
  `id_create` int(11) NOT NULL DEFAULT '0',
  `process_note` text COLLATE utf8_unicode_ci,
  `time_received` datetime NOT NULL,
  `time_return` datetime NOT NULL,
  `time_create` datetime NOT NULL,
  `process_description` text COLLATE utf8_unicode_ci,
  `process_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_9` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_10` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_11` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Process`),
  KEY `ID_Dossier` (`ID_Dossier`),
  KEY `ID_Assign` (`ID_Assign`),
  KEY `ID_thongbao` (`ID_thongbao`),
  KEY `ID_Step` (`ID_Step`),
  KEY `id_create` (`id_create`),
  CONSTRAINT `Dossier_Process_ibfk_1` FOREIGN KEY (`ID_Dossier`) REFERENCES `dossier` (`ID_Dossier`),
  CONSTRAINT `Dossier_Process_ibfk_2` FOREIGN KEY (`ID_Assign`) REFERENCES `users` (`id`),
  CONSTRAINT `Dossier_Process_ibfk_3` FOREIGN KEY (`ID_Step`) REFERENCES `list_step` (`ID_Step`),
  CONSTRAINT `Dossier_Process_ibfk_4` FOREIGN KEY (`id_create`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossier_process`
--

LOCK TABLES `dossier_process` WRITE;
/*!40000 ALTER TABLE `dossier_process` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `dossier_process` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `dossier_process` with 0 row(s)
--

--
-- Table structure for table `gs_menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gs_menu` (
  `ID_Menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `menu_note` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `menu_icon` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `menu_active` tinyint(1) NOT NULL,
  `menu_position` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL DEFAULT '0',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_level` int(11) NOT NULL DEFAULT '1',
  `menu_routename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_show` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Menu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gs_menu`
--

LOCK TABLES `gs_menu` WRITE;
/*!40000 ALTER TABLE `gs_menu` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gs_menu` VALUES (1,'Quản Lý Nhân Viên','Quản Lý Nhân Viên','<i class=\"fa fa-user fa-fw\"></i>',1,1,0,3,1,'user.index;user.create;user.store;user.edit;user.update;user.destroy;user.copy;',1),(2,'Quản lý Đơn vị','Quản lý đơn vị','<i class=\"fa fa-cubes\"></i>',1,1,0,2,1,'organization.index;organization.create;organization.store;organization.edit;organization.update;organization.destroy;',1),(3,'Quản lý Phản ánh','Quản lý phản ánh Dành cho Giám sát, Lãnh đạo','<i class=\"fa fa-bell-o\"></i>',1,1,0,1,1,'phananh.index;phananh.show;phananh.create;phananh.store;phananh.edit;phananh.update;phananh.destroy;phananh.copy;',1),(4,'Quản lý Phản ánh','Quản lý phản ánh Dành cho Nhân Viên','<i class=\"fa fa-bell-o\"></i>',1,1,0,1,1,'phananh.index_emp;phananh.show;phananh.create;phananh.store;phananh.edit;phananh.update;phananh.destroy;phananh.copy;',1);
/*!40000 ALTER TABLE `gs_menu` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gs_menu` with 4 row(s)
--

--
-- Table structure for table `gs_menu_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gs_menu_role` (
  `ID_Menurole` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Menu` int(11) NOT NULL,
  `ID_Role` int(11) NOT NULL,
  `menurole_actived` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Menurole`),
  KEY `ID_Menu` (`ID_Menu`),
  KEY `ID_Role` (`ID_Role`),
  CONSTRAINT `gs_Menu_Role_ibfk_1` FOREIGN KEY (`ID_Menu`) REFERENCES `gs_menu` (`ID_Menu`),
  CONSTRAINT `gs_Menu_Role_ibfk_2` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gs_menu_role`
--

LOCK TABLES `gs_menu_role` WRITE;
/*!40000 ALTER TABLE `gs_menu_role` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gs_menu_role` VALUES (5,1,2,1),(6,2,2,1),(7,3,2,1),(8,4,3,1);
/*!40000 ALTER TABLE `gs_menu_role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gs_menu_role` with 4 row(s)
--

--
-- Table structure for table `gs_phananh`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gs_phananh` (
  `phananh_id` int(11) NOT NULL AUTO_INCREMENT,
  `phananh_noidung` text COLLATE utf8_unicode_ci,
  `phananh_hinhanh` text COLLATE utf8_unicode_ci,
  `phananh_video` text COLLATE utf8_unicode_ci,
  `thongtinnguoigui` text COLLATE utf8_unicode_ci,
  `sector_id` int(11) DEFAULT NULL,
  `tinhtrangxuly_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `orglv1` int(11) DEFAULT NULL,
  `orglv2` int(11) DEFAULT NULL,
  PRIMARY KEY (`phananh_id`),
  KEY `phananh_createdby` (`createdby`),
  KEY `phananh_updatedby` (`updatedby`),
  KEY `phananh_orglv1` (`orglv1`),
  KEY `phananh_orglv2` (`orglv2`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gs_phananh`
--

LOCK TABLES `gs_phananh` WRITE;
/*!40000 ALTER TABLE `gs_phananh` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gs_phananh` VALUES (23,'phản ánh 1','/phananh/2019/Dec/23/IMG_0092.JPG;','/phananh/2019/Dec/23/PTAHOVDTAMA001_10ly3_930k (1).MOV;','aaaaa',6,1,1,NULL,1,'2019-12-10 15:38:30',1,'2019-12-10 16:08:40',9,NULL),(25,'phản ánh 3','/phananh/2019/Dec/25/IMG_0094.JPG;','/phananh/2019/Dec/25/PTAHOVDTAMA002_12ly3_1380k (2).MOV;','ggg',6,3,1,NULL,1,'2019-12-12 14:28:31',1,'2019-12-12 14:43:26',9,NULL),(26,'phản ánh 4','/phananh/2019/Dec/26/IMG_0094.JPG;','/phananh/2019/Dec/26/PTAHOVDTAMA001_10ly3_930k (4).MOV;','ggg',6,1,1,NULL,1,'2019-12-12 14:41:05',50,'2019-12-13 09:28:08',31,NULL),(27,'phản ánh 5','/phananh/2019/Dec/27/IMG_0093.JPG;','/phananh/2019/Dec/27/PTAHOVDTAMA002_12ly3_1380k (2).MOV;','ffff',6,3,1,NULL,NULL,'2019-12-12 15:35:17',1,'2019-12-13 08:31:14',9,NULL),(28,'phảnh anh2 4','/phananh/2019/Dec/28/IMG_0092.JPG;','/phananh/2019/Dec/28/PTAHOVDTAMA002_12ly3_1380k (5).MOV;','ffff',6,6,1,NULL,NULL,'2019-12-15 10:37:27',NULL,'2019-12-15 10:37:27',31,NULL),(29,'fdaadf','/phananh/2019/Dec/29/IMG_0093.JPG;','',NULL,6,3,1,NULL,NULL,'2019-12-15 10:38:33',27,'2019-12-15 14:58:20',9,NULL),(30,'sđà','/phananh/2019/Dec/30/IMG_0093.JPG;','',NULL,6,3,1,NULL,NULL,'2019-12-15 10:39:08',1,'2019-12-15 14:55:23',31,NULL),(31,'ầdsf','/phananh/2019/Dec/31/IMG_0092.JPG;','',NULL,12,7,1,NULL,NULL,'2019-12-15 10:39:34',1,'2019-12-15 15:07:37',9,NULL),(32,'Hợp tétt','/phananh/2019/Dec/32/20191224_215016.jpg;/phananh/2019/Dec/32/Screenshot_20191226-160902_Samsung Internet.jpg;','','0904585845',6,6,1,NULL,NULL,'2019-12-26 16:14:27',NULL,'2019-12-26 16:14:27',31,NULL),(33,'sádf','/phananh/2020/Jan/33/PTAHOVDTTOD001_12ly3_4450k  (1).JPG;','','ádfdf',7,6,1,NULL,1,'2020-01-05 16:38:41',1,'2020-01-05 16:38:41',9,NULL),(34,'ádfsdf','/phananh/2020/Jan/34/PTAHOVDTTOD001_12ly3_4450k  (5).JPG;','','àdf',16,6,1,NULL,1,'2020-01-05 16:38:58',1,'2020-01-05 16:38:58',9,NULL),(35,'Tét1','/phananh/2020/Jan/35/1578218813512956522271.jpg;','',NULL,12,6,1,NULL,NULL,'2020-01-05 17:07:02',NULL,'2020-01-05 17:07:02',9,NULL),(36,'Test2','/phananh/2020/Jan/36/15782193413601325948510.jpg;','','Rrr',14,6,1,NULL,NULL,'2020-01-05 17:15:55',NULL,'2020-01-05 17:15:55',36,NULL),(37,'Test3','/phananh/2020/Jan/37/15782193944411840825896.jpg;/phananh/2020/Jan/37/15782194147291882161344.jpg;/phananh/2020/Jan/37/15782194214181890003035.jpg;','','Ggg',14,6,1,NULL,NULL,'2020-01-05 17:17:21',NULL,'2020-01-05 17:17:21',31,NULL),(38,'tesst4','/phananh/2020/Jan/38/PTAHOVDTTOD001_12ly3_4450k  (3).JPG;/phananh/2020/Jan/38/PTAHOVDTTOD001_12ly3_4450k  (3).JPG;/phananh/2020/Jan/38/PTAHOVDTTOD001_12ly3_4450k  (1).JPG;','','ggg',7,6,1,NULL,1,'2020-01-05 17:18:15',1,'2020-01-05 17:18:15',31,NULL),(39,'tes5','/phananh/2020/Jan/39/IMG_0220.JPG;','','gg',16,6,1,NULL,1,'2020-01-05 17:27:01',1,'2020-01-05 17:27:01',31,NULL),(40,'Test6','/phananh/2020/Jan/40/15782200710651128613921.jpg;','/phananh/2020/Jan/40/VID_20200105_172742.mp4;','Yyy',14,6,1,NULL,NULL,'2020-01-05 17:28:11',NULL,'2020-01-05 17:28:11',36,NULL),(41,'tesst8','/phananh/2020/Jan/41/IMG_0092.JPG;','/phananh/2020/Jan/41/PTAHOVDTAMA002_12ly3_1380k (5).MOV;','fasdf',1,6,1,NULL,NULL,'2020-01-05 17:32:19',NULL,'2020-01-05 17:32:19',9,NULL),(42,'tesst11','/phananh/2020/Jan/42/IMG_0094.JPG;/phananh/2020/Jan/42/IMG_0095.JPG;/phananh/2020/Jan/42/IMG_0092.JPG;','/phananh/2020/Jan/42/IMG_0098.MOV;','tesst11',1,6,1,NULL,1,'2020-01-05 17:50:17',1,'2020-01-05 17:50:17',9,NULL),(43,'tesst10','/phananh/2020/Jan/43/IMG_0094.JPG;/phananh/2020/Jan/43/IMG_0093.JPG;/phananh/2020/Jan/43/IMG_0092.JPG;','/phananh/2020/Jan/43/PTAHOVDTAMA001_10ly3_930k (1).MOV;','tsss',16,6,1,NULL,1,'2020-01-05 18:18:34',1,'2020-01-05 18:18:34',9,NULL);
/*!40000 ALTER TABLE `gs_phananh` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gs_phananh` with 20 row(s)
--

--
-- Table structure for table `gs_tinhtrangxuly`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gs_tinhtrangxuly` (
  `tinhtrangxuly_id` int(11) NOT NULL AUTO_INCREMENT,
  `tinhtrangxuly_name` text COLLATE utf8_unicode_ci,
  `tinhtrangxuly_color` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  PRIMARY KEY (`tinhtrangxuly_id`),
  KEY `tinhtrangxuly_createdby` (`createdby`),
  KEY `tinhtrangxuly_updatedby` (`updatedby`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gs_tinhtrangxuly`
--

LOCK TABLES `gs_tinhtrangxuly` WRITE;
/*!40000 ALTER TABLE `gs_tinhtrangxuly` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gs_tinhtrangxuly` VALUES (1,'Tiếp nhận','#ff0000',0,1,1,'2019-11-26 14:42:00',1,'2019-12-10 15:13:49'),(3,'Đang xử lý','#ffff00',0,1,1,'2019-11-26 15:00:49',1,'2019-12-10 15:13:58'),(5,'Hoàn thành','#0000ff',2,1,1,'2019-11-26 15:00:59',1,'2019-12-10 14:50:34'),(6,'Chưa Xem','#400000',-1,1,1,'2019-12-10 15:09:15',1,'2019-12-11 21:25:54'),(7,'Sửa Lại thông tin','#800040',5,1,1,'2019-12-15 15:06:29',NULL,NULL);
/*!40000 ALTER TABLE `gs_tinhtrangxuly` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gs_tinhtrangxuly` with 5 row(s)
--

--
-- Table structure for table `gs_usersector`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gs_usersector` (
  `ID_UserSector` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) NOT NULL,
  `ID_Sector` int(11) NOT NULL,
  `actived` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_UserSector`),
  KEY `ID_User` (`ID_User`),
  KEY `ID_Sector` (`ID_Sector`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gs_usersector`
--

LOCK TABLES `gs_usersector` WRITE;
/*!40000 ALTER TABLE `gs_usersector` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gs_usersector` VALUES (3,87,17,1),(4,87,16,1),(5,89,17,1),(6,89,16,1),(19,27,20,1),(20,27,19,1),(21,27,6,1),(22,28,16,1),(23,54,6,1);
/*!40000 ALTER TABLE `gs_usersector` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gs_usersector` with 9 row(s)
--

--
-- Table structure for table `gs_xulyphananh`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gs_xulyphananh` (
  `xulyphananh_id` int(11) NOT NULL AUTO_INCREMENT,
  `phananh_id` int(11) NOT NULL,
  `xulyphananh_noidung` text COLLATE utf8_unicode_ci,
  `tinhtrangxuly_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `actived` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `orglv1` int(11) DEFAULT NULL,
  `orglv2` int(11) DEFAULT NULL,
  PRIMARY KEY (`xulyphananh_id`),
  KEY `xulyphananh_createdby` (`createdby`),
  KEY `xulyphananh_updatedby` (`updatedby`),
  KEY `xulyphananh_orglv1` (`orglv1`),
  KEY `xulyphananh_orglv2` (`orglv2`),
  KEY `xulyphananh_tinhtrangxulyphananh_id` (`tinhtrangxuly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gs_xulyphananh`
--

LOCK TABLES `gs_xulyphananh` WRITE;
/*!40000 ALTER TABLE `gs_xulyphananh` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `gs_xulyphananh` VALUES (4,23,'',6,NULL,NULL,0,'2019-12-10 15:38:30',NULL,NULL,NULL,NULL),(5,23,'tiếp nhận phản ánh',1,NULL,NULL,1,'2019-12-10 16:08:40',NULL,NULL,NULL,NULL),(7,25,'',6,NULL,NULL,0,'2019-12-12 14:28:31',NULL,NULL,NULL,NULL),(8,26,'',6,NULL,NULL,0,'2019-12-12 14:41:05',NULL,NULL,NULL,NULL),(9,25,'đa giá sử lý',3,NULL,NULL,1,'2019-12-12 14:43:26',NULL,NULL,NULL,NULL),(10,27,'',6,NULL,NULL,0,'2019-12-12 15:35:17',NULL,NULL,NULL,NULL),(11,27,'fasdfsdaf',3,NULL,NULL,1,'2019-12-13 08:31:14',NULL,NULL,NULL,NULL),(12,26,'Đã tiếp nhận',1,NULL,NULL,50,'2019-12-13 09:28:08',NULL,NULL,NULL,NULL),(13,28,'',6,NULL,NULL,0,'2019-12-15 10:37:27',NULL,NULL,NULL,NULL),(14,29,'',6,NULL,NULL,0,'2019-12-15 10:38:33',NULL,NULL,NULL,NULL),(15,30,'',6,NULL,NULL,0,'2019-12-15 10:39:08',NULL,NULL,NULL,NULL),(16,31,'',6,NULL,NULL,0,'2019-12-15 10:39:34',NULL,NULL,NULL,NULL),(17,31,'fasdf',1,NULL,NULL,1,'2019-12-15 14:49:05',NULL,NULL,NULL,NULL),(18,31,'fasdfd',1,NULL,NULL,1,'2019-12-15 14:49:22',NULL,NULL,NULL,NULL),(19,29,'fsadf',3,NULL,NULL,27,'2019-12-15 14:50:22',NULL,NULL,NULL,NULL),(20,29,'ffffff',5,NULL,NULL,27,'2019-12-15 14:53:05',NULL,NULL,NULL,NULL),(21,29,'ffffff',5,NULL,NULL,27,'2019-12-15 14:53:14',NULL,NULL,NULL,NULL),(22,29,'ffffff',5,NULL,NULL,27,'2019-12-15 14:53:35',NULL,NULL,NULL,NULL),(23,29,'ffffff',5,NULL,NULL,27,'2019-12-15 14:54:51',NULL,NULL,NULL,NULL),(24,30,'gadg',3,NULL,NULL,1,'2019-12-15 14:55:23',NULL,NULL,NULL,NULL),(25,29,'ádfsdf',1,NULL,NULL,27,'2019-12-15 14:55:37',NULL,NULL,NULL,NULL),(26,29,'ggggg',3,NULL,NULL,27,'2019-12-15 14:58:20',NULL,NULL,NULL,NULL),(27,31,'adfsdf',7,NULL,NULL,1,'2019-12-15 15:07:37',NULL,NULL,NULL,NULL),(28,32,'',6,NULL,NULL,0,'2019-12-26 16:14:28',NULL,NULL,NULL,NULL),(29,33,'',6,NULL,NULL,0,'2020-01-05 16:38:41',NULL,NULL,NULL,NULL),(30,34,'',6,NULL,NULL,0,'2020-01-05 16:38:58',NULL,NULL,NULL,NULL),(31,35,'',6,NULL,NULL,0,'2020-01-05 17:07:02',NULL,NULL,NULL,NULL),(32,36,'',6,NULL,NULL,0,'2020-01-05 17:15:55',NULL,NULL,NULL,NULL),(33,37,'',6,NULL,NULL,0,'2020-01-05 17:17:21',NULL,NULL,NULL,NULL),(34,38,'',6,NULL,NULL,0,'2020-01-05 17:18:15',NULL,NULL,NULL,NULL),(35,39,'',6,NULL,NULL,0,'2020-01-05 17:27:01',NULL,NULL,NULL,NULL),(36,40,'',6,NULL,NULL,0,'2020-01-05 17:28:11',NULL,NULL,NULL,NULL),(37,41,'',6,NULL,NULL,0,'2020-01-05 17:32:20',NULL,NULL,NULL,NULL),(38,42,'',6,NULL,NULL,0,'2020-01-05 17:50:17',NULL,NULL,NULL,NULL),(39,43,'',6,NULL,NULL,0,'2020-01-05 18:18:34',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `gs_xulyphananh` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `gs_xulyphananh` with 35 row(s)
--

--
-- Table structure for table `history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `tabletd` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_tabletd` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_history`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `history` VALUES (58,'dossier_process',161,15,'giám sát 1 TẠO quy trình. Mã quy trình=161. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: 1; ','2019-05-29 09:06:40','2019-05-29 09:06:40'),(59,'dossier',100,15,'giám sát 1 TẠO hồ sơ có Mã hồ sơ=1559096054100. Hồ sơ: Đăng ký khai sinh thông thường; phong1; dia chi1; ; ; ; 2019-05-29; 2019-05-29; ','2019-05-29 09:14:14','2019-05-29 09:14:14'),(60,'dossier_process',162,15,'giám sát 1 TẠO quy trình. Mã quy trình=162. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: 1; ','2019-05-29 09:14:14','2019-05-29 09:14:14'),(61,'dossier',101,15,'giám sát 1 TẠO hồ sơ có Mã hồ sơ=1559096441101. Hồ sơ: Đăng ký khai sinh thông thường; phong1; dia chi1; ; ; ; 2019-05-29; 2019-05-29; ','2019-05-29 09:20:41','2019-05-29 09:20:41'),(62,'dossier_process',163,15,'giám sát 1 TẠO quy trình. Mã quy trình=163. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: 1; ','2019-05-29 09:20:41','2019-05-29 09:20:41'),(63,'dossier',102,5,'user4 (1cua-tư pháp) TẠO hồ sơ có Mã hồ sơ=1559102811102. Hồ sơ: Đăng ký khai sinh quá hạn; phong1; dia chi1; phong2018@gmail.com; 099999; 099999; 2019-05-29; 2019-05-29; ','2019-05-29 11:06:51','2019-05-29 11:06:51'),(64,'dossier_process',166,5,'user4 (1cua-tư pháp) TẠO quy trình. Mã quy trình=166. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: ; ','2019-05-29 11:06:51','2019-05-29 11:06:51'),(65,'dossier',103,5,'user4 (1cua-tư pháp) TẠO hồ sơ có Mã hồ sơ=1559114162103. Hồ sơ: Đăng ký khai sinh cho trẻ em bị bỏ rơi; Lê Giang Phong; tổ 8, ấp 5 thạnh phú, vĩnh cửu, đồng nai; phong2018@gmail.com; 0971793662; 097793662; 2019-05-29; 2019-05-31; ','2019-05-29 14:16:02','2019-05-29 14:16:02'),(66,'dossier_process',172,5,'user4 (1cua-tư pháp) TẠO quy trình. Mã quy trình=172. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: 1; ','2019-05-29 14:16:02','2019-05-29 14:16:02'),(67,'dossier',104,5,'user4 (1cua-tư pháp) TẠO hồ sơ có Mã hồ sơ=1559114760001. Hồ sơ: Đăng ký khai sinh cho con ngoài giá thú có người nhận là cha; Lê Giang Phong1; Đồng Nai; phong2018@gmail.com; 0971793662; 099999; 2019-05-29; 2019-05-31; ','2019-05-29 14:26:00','2019-05-29 14:26:00'),(68,'dossier_process',174,5,'user4 (1cua-tư pháp) TẠO quy trình. Mã quy trình=174. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: 1; ','2019-05-29 14:26:00','2019-05-29 14:26:00'),(69,'dossier',104,15,'giám sát 1 XÓA hồ sơ có Mã hồ sơ=1559114760001','2019-05-29 14:40:36','2019-05-29 14:40:36'),(70,'dossier',105,5,'user4 (1cua-tư pháp) TẠO hồ sơ có Mã hồ sơ=1559176211105. Hồ sơ: Đăng ký khai sinh cho trẻ em bị bỏ rơi; phong1; dia chi1; phong2018@gmail.com; 099999; 1111; 2019-05-30; 2019-05-30; ','2019-05-30 07:30:11','2019-05-30 07:30:11'),(71,'dossier_process',181,5,'user4 (1cua-tư pháp) TẠO quy trình. Mã quy trình=181. Quy trình: Nhận Hồ Sơ; user4 (1cua-tư pháp); ; Gửi mail: 1; Gửi sms: ; ','2019-05-30 07:30:11','2019-05-30 07:30:11');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `history` with 14 row(s)
--

--
-- Table structure for table `ks_answer`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_idQuestion` int(11) DEFAULT NULL,
  `answer_description` text COLLATE utf8_unicode_ci,
  `answer_scores` int(11) DEFAULT NULL,
  `answer_order` int(11) NOT NULL DEFAULT '0',
  `answer_note1` text COLLATE utf8_unicode_ci,
  `answer_note2` text COLLATE utf8_unicode_ci,
  `answer_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`answer_id`),
  KEY `answer_idQuestion` (`answer_idQuestion`)
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_answer`
--

LOCK TABLES `ks_answer` WRITE;
/*!40000 ALTER TABLE `ks_answer` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_answer` VALUES (556,62,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/1.png\" style=\"width: 30px; height: 30px;\" />H&agrave;i L&ograve;ng</p>',3,1,NULL,NULL,NULL),(557,62,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/3.png\" style=\"width: 30px; height: 30px;\" />B&igrave;nh thường</p>',2,2,NULL,NULL,NULL),(558,62,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/5.png\" style=\"width: 30px; height: 30px;\" />Kh&ocirc;ng h&agrave;i l&ograve;ng</p>',1,3,NULL,NULL,NULL),(559,63,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/1.png\" style=\"width: 30px; height: 30px;\" />H&agrave;i L&ograve;ng</p>',3,1,NULL,NULL,NULL),(560,63,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/3.png\" style=\"width: 30px; height: 30px;\" />B&igrave;nh thường</p>',2,2,NULL,NULL,NULL),(561,63,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/5.png\" style=\"width: 30px; height: 30px;\" />Kh&ocirc;ng h&agrave;i l&ograve;ng</p>',1,3,NULL,NULL,NULL),(562,64,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/1.png\" style=\"width: 30px; height: 30px;\" />H&agrave;i L&ograve;ng</p>',3,1,NULL,NULL,NULL),(563,64,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/3.png\" style=\"width: 30px; height: 30px;\" />B&igrave;nh thường</p>',2,2,NULL,NULL,NULL),(564,64,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/5.png\" style=\"width: 30px; height: 30px;\" />Kh&ocirc;ng h&agrave;i l&ograve;ng</p>',1,3,NULL,NULL,NULL),(580,69,NULL,1,1,NULL,NULL,NULL),(581,69,NULL,2,2,NULL,NULL,NULL),(582,70,NULL,1,1,NULL,NULL,NULL),(583,70,NULL,2,2,NULL,NULL,NULL),(604,77,'<p>1111</p>',2,1,NULL,NULL,NULL),(605,77,'<p>1111</p>',21,2,NULL,NULL,NULL),(606,76,'<p>1111</p>',2,1,NULL,NULL,NULL),(607,76,'<p>1111</p>',21,2,NULL,NULL,NULL),(608,78,'<p>1111</p>',2,1,NULL,NULL,NULL),(609,78,'<p>1111</p>',21,2,NULL,NULL,NULL),(683,53,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/1.png\" style=\"width: 25px; height: 25px;\" />&nbsp;<span style=\"\"> H&agrave;i L&ograve;ng</span></p>',3,1,NULL,NULL,NULL),(684,53,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/3.png\" style=\"width: 25px; height: 25px;\" />&nbsp; <span style=\"\">B&igrave;nh thường</span></p>',2,2,NULL,NULL,NULL),(685,53,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/5.png\" style=\"width: 25px; height: 25px;\" />&nbsp;<span style=\"\">Kh&ocirc;ng h&agrave;i l&ograve;ng</span></p>',1,3,NULL,NULL,NULL),(692,60,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/1.png\" style=\"width: 25px; height: 25px;\" />&nbsp; <span style=\"\">H&agrave;i L&ograve;ng</span></p>',3,1,NULL,NULL,NULL),(693,60,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/3.png\" style=\"width: 25px; height: 25px;\" />&nbsp; <span style=\"\">B&igrave;nh thường</span></p>',2,2,NULL,NULL,NULL),(694,60,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/5.png\" style=\"width: 25px; height: 25px;\" />&nbsp;<span style=\"\">Kh&ocirc;ng h&agrave;i l&ograve;ng</span></p>',1,3,NULL,NULL,NULL),(695,61,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/1.png\" style=\"width: 25px; height: 25px;\" />&nbsp; <span style=\"\">H&agrave;i L&ograve;ng</span></p>',3,1,NULL,NULL,NULL),(696,61,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/3.png\" style=\"width: 25px; height: 25px;\" />&nbsp; <span style=\"\">B&igrave;nh thường</span></p>',2,2,NULL,NULL,NULL),(697,61,'<p><img alt=\"\" src=\"http://hoso1cua.caicach.vn/khaosathailong/public/photos/1/smile/5.png\" style=\"width: 25px; height: 25px;\" />&nbsp;<span style=\"\">Kh&ocirc;ng h&agrave;i l&ograve;ng</span></p>',1,3,NULL,NULL,NULL),(700,85,'<p>Th&aacute;i độ nhiệt t&igrave;nh, niềm nở</p>',3,1,NULL,NULL,NULL),(701,85,'<p>Th&aacute;i độ b&igrave;nh thường tr&ograve;n vai</p>',1,2,NULL,NULL,NULL),(702,85,'<p>Th&aacute;i độ k&eacute;m, mất lịch sự</p>',-3,3,NULL,NULL,NULL),(706,86,'<p>Quy tr&igrave;nh nhanh, tiện lợi</p>',3,1,NULL,NULL,NULL),(707,86,'<p>Quy tr&igrave;nh b&igrave;nh thường như nơi kh&aacute;c</p>',1,2,NULL,NULL,NULL),(708,86,'<p>Quy tr&igrave;nh thủ tục rườm r&agrave;</p>',-3,3,NULL,NULL,NULL),(712,87,'<p>B&aacute;c sĩ, nh&acirc;n vi&ecirc;n dặn d&ograve; chu đ&aacute;o</p>',3,1,NULL,NULL,NULL),(713,87,'<p>B&aacute;c sĩ, nh&acirc;n vi&ecirc;n dặn d&ograve; theo nhiệm vụ</p>',1,2,NULL,NULL,NULL),(714,87,'<p>B&aacute;c sĩ, nh&acirc;n vi&ecirc;n dặn d&ograve; hời hợt</p>',-3,3,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_answer` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_answer` with 37 row(s)
--

--
-- Table structure for table `ks_device`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_device` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `device_registerDate` datetime DEFAULT '0000-00-00 00:00:00',
  `device_giaodien` int(11) DEFAULT '0',
  `device_isActived` int(11) NOT NULL DEFAULT '0',
  `device_assign_userid` int(11) DEFAULT NULL,
  `device_orgid` int(11) DEFAULT '0',
  `device_note1` text COLLATE utf8_unicode_ci,
  `device_note2` text COLLATE utf8_unicode_ci,
  `device_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`device_id`),
  KEY `device_uid` (`device_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_device`
--

LOCK TABLES `ks_device` WRITE;
/*!40000 ALTER TABLE `ks_device` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_device` VALUES (33,'Laptop M4800','7KEPJ','2019-10-27 00:00:00',2,1,NULL,9,NULL,NULL,NULL),(40,'M4800 - FxScreen','I3RAO','2019-10-31 00:00:00',2,1,NULL,31,NULL,NULL,NULL),(44,'Kiosk Qui Đức - FXS','N67YJ','2019-10-31 00:00:00',2,1,NULL,31,NULL,NULL,NULL),(46,'Kiosk TLThuong FxScr','JHPXP','2019-11-02 00:00:00',2,1,NULL,36,NULL,NULL,NULL),(49,'Tablet Samsung 8 - Bình Chiểu - NTN DIỄM','K9GD4','2019-11-04 00:00:00',2,1,27,9,NULL,NULL,NULL),(51,'Tablet SS - Bình Chiểu - PT Trúc','7UB1J','2019-11-06 00:00:00',2,1,32,9,NULL,NULL,NULL),(53,'Tab - SS Bình Chiểu - ĐT Bình','7P1JO','2019-11-06 00:00:00',2,1,33,9,NULL,NULL,NULL),(55,'Tab ss Bình Chiểu - TTN Mai','2R80J','2019-11-06 00:00:00',2,1,42,9,NULL,NULL,NULL),(56,'Tab ss Bình chiểu - ĐM Đức','9FLC1','2019-11-06 00:00:00',2,1,31,9,NULL,NULL,NULL),(59,'Lenovo 7 inches - Test','8W9NU','2019-11-07 00:00:00',2,1,73,36,NULL,NULL,NULL),(61,'Kiosk Bình Chiểu FxScr','DK87Y','2019-11-07 00:00:00',2,1,NULL,9,NULL,NULL,NULL),(62,'Laptop - Thiện test','XEJ27','2019-11-07 00:00:00',2,1,NULL,9,NULL,NULL,NULL),(63,'Kiosk P2_BinhThanh FxScr','9Q7JA','2019-11-08 00:00:00',2,1,NULL,38,NULL,NULL,NULL),(74,'Kiosk P2 Bình Thạnh - No FxScr','RA922','2019-11-09 00:00:00',2,1,NULL,38,NULL,NULL,NULL),(79,'Thiết bị 2MCUW','2MCUW','2019-12-06 00:00:00',2,1,NULL,9,NULL,NULL,NULL),(80,'Thiết bị 521ZA','521ZA','2020-02-11 00:00:00',2,1,NULL,9,NULL,NULL,NULL),(81,'Thiết bị 3NH1V','3NH1V','2020-02-14 00:00:00',2,1,NULL,31,NULL,NULL,NULL),(82,'Thiết bị P9M1YUHTPB8O427U730NLA','P9M1YUHTPB8O427U730NLA','2020-02-29 00:00:00',2,0,NULL,0,NULL,NULL,NULL),(83,'Thiết bị ORNA8','ORNA8','2020-02-29 00:00:00',2,0,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_device` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_device` with 19 row(s)
--

--
-- Table structure for table `ks_menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_menu` (
  `ID_Menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `menu_note` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `menu_active` tinyint(1) NOT NULL,
  `menu_position` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL DEFAULT '0',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_level` int(11) NOT NULL DEFAULT '1',
  `menu_route` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_show` int(11) NOT NULL DEFAULT '0',
  `menu_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_9` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_10` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Menu`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_menu`
--

LOCK TABLES `ks_menu` WRITE;
/*!40000 ALTER TABLE `ks_menu` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_menu` VALUES (77,'Dữ Liệu Khảo Sát','Danh Sách Khảo Sát',1,1,0,80,1,'admin/survey/listsurvey',1,'1','1','1','1','1'),(78,'Kết Quả Khảo Sát','Kết Quả Khảo Sát',1,1,0,70,1,'admin/survey/surveyresult',1,'1','1','1','1','1'),(79,'Quản lý bộ phận','Quản lý bộ phận cho superviosr',1,1,0,60,1,'admin/organization;admin/organization/{organization}/edit;admin/organization/create;admin/organization/{organization};',1,'1','1','1','1','1'),(80,'Quản lý nhân viên','Quản lý Nhân viên dành cho Suppervisor',1,1,0,50,1,'admin/user;admin/user/{user}/edit;admin/user/create;admin/user/{user};',1,'1','1','1','1','1'),(81,'Quản Lý Chủ Đề','Quản Lý Chủ Đề',1,1,0,10,1,'admin/topic;admin/topic/create;admin/topic/{topic}/edit;admin/topic/{topic}/copy;admin/topic/{topic};',1,'1','1','1','1','1'),(82,'Quan lý câu hỏi','Quan lý câu hỏi',1,1,0,40,1,'admin/question/create/{topic};admin/question/{question}/copy;admin/question;admin/question/{question}/edit;admin/question/{question};',0,'1','1','1','1','1'),(83,'Quản lý Thiết Bị','Quản lý Thiết Bị',1,1,0,20,1,'admin/device;admin/device/{device}/edit;admin/device/create;admin/device/{device};',1,'1','1','1','1','1'),(84,'Quản lý Lập Lịch','Quản lý Lập Lịch',1,1,0,30,1,'admin/schedule;admin/schedule/{schedule}/edit;admin/schedule/create;admin/schedule/{schedule};',1,'1','1','1','1','1');
/*!40000 ALTER TABLE `ks_menu` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_menu` with 8 row(s)
--

--
-- Table structure for table `ks_menu_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_menu_role` (
  `ID_Menurole` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Menu` int(11) NOT NULL,
  `ID_Role` int(11) NOT NULL,
  `menurole_actived` tinyint(1) NOT NULL,
  `menurole_4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Menurole`),
  KEY `ID_Menu` (`ID_Menu`),
  KEY `ID_Role` (`ID_Role`),
  CONSTRAINT `Ks_Menu_Role_ibfk_1` FOREIGN KEY (`ID_Menu`) REFERENCES `ks_menu` (`ID_Menu`),
  CONSTRAINT `Ks_Menu_Role_ibfk_2` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_menu_role`
--

LOCK TABLES `ks_menu_role` WRITE;
/*!40000 ALTER TABLE `ks_menu_role` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_menu_role` VALUES (4,77,1,1,NULL,NULL,NULL,NULL,NULL),(5,78,1,1,NULL,NULL,NULL,NULL,NULL),(21,79,4,1,NULL,NULL,NULL,NULL,NULL),(22,81,4,1,NULL,NULL,NULL,NULL,NULL),(23,78,4,1,NULL,NULL,NULL,NULL,NULL),(24,80,4,1,NULL,NULL,NULL,NULL,NULL),(25,77,4,1,NULL,NULL,NULL,NULL,NULL),(26,82,4,1,NULL,NULL,NULL,NULL,NULL),(34,77,2,1,NULL,NULL,NULL,NULL,NULL),(35,79,2,1,NULL,NULL,NULL,NULL,NULL),(36,81,2,1,NULL,NULL,NULL,NULL,NULL),(37,83,2,1,NULL,NULL,NULL,NULL,NULL),(38,84,2,1,NULL,NULL,NULL,NULL,NULL),(39,78,2,1,NULL,NULL,NULL,NULL,NULL),(40,80,2,1,NULL,NULL,NULL,NULL,NULL),(41,82,2,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_menu_role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_menu_role` with 16 row(s)
--

--
-- Table structure for table `ks_organization`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_level` int(11) DEFAULT '0',
  `org_idCreated` int(11) DEFAULT '0',
  `org_idAssigned` int(11) DEFAULT '0',
  `org_idParent` int(11) DEFAULT '0',
  `org_topic_id` int(11) DEFAULT NULL,
  `org_address` text COLLATE utf8_unicode_ci,
  `org_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `org_isSelectEmp` int(11) DEFAULT NULL,
  `org_isActived` int(11) NOT NULL DEFAULT '0',
  `org_chudebatbuoc` int(11) DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `orglv1` int(11) DEFAULT NULL,
  `orglv2` int(11) DEFAULT NULL,
  `org_order` int(11) DEFAULT '0',
  `org_note1` text COLLATE utf8_unicode_ci,
  `org_note2` text COLLATE utf8_unicode_ci,
  `org_note3` text COLLATE utf8_unicode_ci,
  `org_nhanemail` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`org_id`),
  KEY `org_idCreated` (`org_idCreated`),
  KEY `org_idAssigned` (`org_idAssigned`),
  KEY `org_idParent` (`org_idParent`),
  KEY `org_topic_id` (`org_topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_organization`
--

LOCK TABLES `ks_organization` WRITE;
/*!40000 ALTER TABLE `ks_organization` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_organization` VALUES (9,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,9,0,0,NULL,NULL,NULL,'phong2018@gmail.com'),(10,'Tiếp nhận - Trả kết quả','/photos/1/QuochuyVN.png',2,1,NULL,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','102',0,1,1,NULL,NULL,NULL,NULL,9,10,2,NULL,NULL,NULL,NULL),(11,'Văn hóa - Xã hội','/photos/1/QuochuyVN.png',2,1,NULL,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','103',0,1,0,NULL,NULL,NULL,NULL,9,11,3,NULL,NULL,NULL,NULL),(16,'Lãnh đạo UBND phường1','/photos/1/QuochuyVN.png',2,2,2,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','100',1,1,NULL,NULL,NULL,NULL,NULL,9,16,1,NULL,NULL,NULL,NULL),(30,'Kính tế - Đô thị','/photos/1/QuochuyVN.png',2,2,NULL,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','104',1,1,NULL,NULL,NULL,2,'2019-11-18 15:05:53',9,30,4,NULL,NULL,NULL,NULL),(31,'ỦY BAN NHÂN DÂN XÃ QUI ĐỨC - BÌNH CHÁNH','/photos/1/QuochuyVN.png',1,1,NULL,0,16,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','02837790197',1,1,1,NULL,NULL,NULL,NULL,31,0,0,NULL,NULL,NULL,'phong2018@gmail.com'),(32,'Lãnh đạo UBND xã','/photos/1/QuochuyVN.png',2,1,NULL,31,NULL,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','101',1,0,0,NULL,NULL,NULL,NULL,31,32,1,NULL,NULL,NULL,NULL),(33,'Tiếp nhận - Trả kết quả','/photos/1/QuochuyVN.png',2,1,NULL,31,NULL,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','102',1,0,1,NULL,NULL,NULL,NULL,31,33,2,NULL,NULL,NULL,NULL),(34,'Văn hóa - Xã hội','/photos/1/QuochuyVN.png',2,1,NULL,31,NULL,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','103',1,1,0,NULL,NULL,NULL,NULL,31,34,3,NULL,NULL,NULL,NULL),(35,'Kính tế - Đô thị','/photos/1/QuochuyVN.png',2,1,NULL,0,NULL,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','104',1,1,0,NULL,NULL,NULL,NULL,31,35,4,NULL,NULL,NULL,NULL),(36,'UBND XÃ TRUNG LẬP THƯỢNG - HUYỆN CỦ CHI','/photos/1/QuochuyVN.png',1,1,NULL,0,16,'Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','02838926786',1,1,1,NULL,NULL,NULL,NULL,36,0,0,NULL,NULL,NULL,NULL),(37,'Tiếp nhận và trả kết quả','/photos/1/QuochuyVN.png',2,1,NULL,36,NULL,'Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','02838926786',1,1,1,NULL,NULL,NULL,NULL,36,37,1,NULL,NULL,NULL,NULL),(39,'BỆNH VIỆN ĐA KHOA HỒNG HÀ',NULL,1,1,NULL,0,26,'46 Phan Kính, Nam Hồng, Hồng Lĩnh, Hà Tĩnh','02393577678',NULL,1,1,NULL,NULL,NULL,NULL,39,0,1,NULL,NULL,NULL,NULL),(41,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'phong2018@gmail.com'),(42,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'phong2018@gmail.com'),(43,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'phong2018@gmail.com'),(44,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC-copy','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'phong2018@gmail.com'),(46,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC-copy','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'phong2018@gmail.com'),(47,'UBND PHƯỜNG BÌNH CHIỂU - QUẬN THỦ ĐỨC-copy','/photos/1/QuochuyVN.png',1,1,2,0,16,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','02838970030',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'phong2018@gmail.com'),(48,'UBND XÃ TRUNG LẬP THƯỢNG - HUYỆN CỦ CHI-copy','/photos/1/QuochuyVN.png',1,1,NULL,0,16,'Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','02838926786',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(49,'Lãnh đạo UBND phường1-copy','/photos/1/QuochuyVN.png',2,1,2,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','100',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(50,'Lãnh đạo UBND phường1-copy','/photos/1/QuochuyVN.png',2,1,2,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','100',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(51,'Lãnh đạo UBND phường1-copy-copy','/photos/1/QuochuyVN.png',2,1,2,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','100',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(52,'Lãnh đạo UBND phường1-copy-copy-copy','/photos/1/QuochuyVN.png',2,1,2,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','100',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(53,'ỦY BAN NHÂN DÂN XÃ QUI ĐỨC - BÌNH CHÁNH-copy','/photos/1/QuochuyVN.png',1,1,NULL,0,16,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','02837790197',1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL),(54,'Lãnh đạo UBND xã-copy','/photos/1/QuochuyVN.png',2,1,NULL,31,NULL,'B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','101',1,0,0,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(55,'Lãnh đạo UBND phường1-copy','/photos/1/QuochuyVN.png',2,1,2,9,NULL,'934 TL43, Bình Chiểu, Thủ Đức, Hồ Chí Minh','100',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_organization` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_organization` with 27 row(s)
--

--
-- Table structure for table `ks_question`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_description` text COLLATE utf8_unicode_ci,
  `question_isActived` int(11) DEFAULT NULL,
  `question_order` int(11) DEFAULT NULL,
  `question_idTopic` int(11) DEFAULT NULL,
  `question_options` int(11) DEFAULT NULL,
  `question_scores` int(11) DEFAULT NULL,
  `question_type` int(11) DEFAULT '0',
  `question_created_by` int(11) DEFAULT NULL,
  `question_created_at` datetime NOT NULL,
  `question_updated_at` datetime NOT NULL,
  `question_note1` text COLLATE utf8_unicode_ci,
  `question_note2` text COLLATE utf8_unicode_ci,
  `question_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`question_id`),
  KEY `question_idTopic` (`question_idTopic`),
  KEY `question_created_by` (`question_created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_question`
--

LOCK TABLES `ks_question` WRITE;
/*!40000 ALTER TABLE `ks_question` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_question` VALUES (53,'<p>Mức độ&nbsp;h&agrave;i l&ograve;ng của Qu&yacute; vị đối với th&aacute;i độ giao tiếp của c&aacute;n bộ c&ocirc;ng chức?</p>',1,1,16,3,3,1,1,'2019-10-28 00:00:00','2019-10-28 00:00:00',NULL,NULL,NULL),(60,'<p>Mức độ h&agrave;i l&ograve;ng của Qu&yacute; vị với c&aacute;c hướng dẫn của c&aacute;n bộ c&ocirc;ng chức?</p>',1,2,16,3,3,1,1,'2019-10-28 00:00:00','2019-10-28 00:00:00',NULL,NULL,NULL),(61,'<p>Mức độ h&agrave;i l&ograve;ng của Qu&yacute; vị với thời gian trả&nbsp;kết quả của c&aacute;n bộ c&ocirc;ng chức?</p>',1,3,16,3,3,1,1,'2019-10-28 00:00:00','2019-10-28 00:00:00',NULL,NULL,NULL),(62,'<p>Th&aacute;i độ phục vụ của PHường</p>',1,1,18,3,3,1,1,'2019-10-02 00:00:00','2019-10-02 00:00:00',NULL,NULL,NULL),(63,'<p>Hướng dẫn&nbsp;phục vụ của PHường</p>',1,1,18,3,3,1,1,'2019-10-02 00:00:00','2019-10-02 00:00:00',NULL,NULL,NULL),(64,'<p>Nhiệt t&igrave;nh phục vụ của PHường</p>',1,1,18,3,3,1,1,'2019-10-02 00:00:00','2019-10-02 00:00:00',NULL,NULL,NULL),(69,'<p>c&acirc;u hỏi 1</p>',1,1,20,2,2,1,15,'2019-10-22 00:00:00','2019-10-22 00:00:00',NULL,NULL,NULL),(70,'<p>cau hoi 2</p>',1,2,20,2,3,1,15,'2019-10-22 00:00:00','2019-10-22 00:00:00',NULL,NULL,NULL),(76,'<p>&aacute;dfsdfadf</p>',1,1,24,2,2,1,15,'2019-10-22 00:00:00','2019-10-22 00:00:00',NULL,NULL,NULL),(77,'Copy-',0,1,24,2,2,1,15,'2019-10-22 00:00:00','2019-10-22 00:00:00',NULL,NULL,NULL),(78,'Copy-<p>&aacute;dfsdfadf</p>',0,1,24,2,2,1,15,'2019-10-22 00:00:00','2019-10-22 00:00:00',NULL,NULL,NULL),(85,'<p>TH&Acirc;N THIỆN</p>',1,1,26,3,3,1,1,'2019-11-09 00:00:00','2019-11-09 00:00:00',NULL,NULL,NULL),(86,'<p>CHUY&Ecirc;N NGHIỆP</p>',1,1,26,3,3,1,1,'2019-11-09 00:00:00','2019-11-09 00:00:00',NULL,NULL,NULL),(87,'<p>CHU Đ&Aacute;O</p>',1,1,26,3,3,1,1,'2019-11-09 00:00:00','2019-11-09 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_question` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_question` with 14 row(s)
--

--
-- Table structure for table `ks_result`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `result_idSurvey` int(11) DEFAULT NULL,
  `result_idQuestion` int(11) DEFAULT NULL,
  `result_Answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `result_note1` text COLLATE utf8_unicode_ci,
  `result_note2` text COLLATE utf8_unicode_ci,
  `result_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`result_id`),
  KEY `result_idSurvey` (`result_idSurvey`),
  KEY `result_idQuestion` (`result_idQuestion`),
  KEY `result_idAnswer` (`result_Answer`)
) ENGINE=InnoDB AUTO_INCREMENT=1668 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_result`
--

LOCK TABLES `ks_result` WRITE;
/*!40000 ALTER TABLE `ks_result` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_result` VALUES (1563,2189,53,'683',NULL,NULL,NULL),(1564,2189,60,'692',NULL,NULL,NULL),(1565,2189,61,'695',NULL,NULL,NULL),(1566,2191,85,'700',NULL,NULL,NULL),(1567,2191,86,'706',NULL,NULL,NULL),(1568,2191,87,'712',NULL,NULL,NULL),(1569,2193,85,'701',NULL,NULL,NULL),(1570,2193,86,'707',NULL,NULL,NULL),(1571,2193,87,'713',NULL,NULL,NULL),(1572,2195,53,'683',NULL,NULL,NULL),(1573,2195,60,'692',NULL,NULL,NULL),(1574,2195,61,'695',NULL,NULL,NULL),(1575,2196,53,'683',NULL,NULL,NULL),(1576,2196,60,'692',NULL,NULL,NULL),(1577,2196,61,'695',NULL,NULL,NULL),(1578,2197,53,'683',NULL,NULL,NULL),(1579,2197,60,'692',NULL,NULL,NULL),(1580,2197,61,'695',NULL,NULL,NULL),(1581,2198,53,'683',NULL,NULL,NULL),(1582,2198,60,'692',NULL,NULL,NULL),(1583,2198,61,'695',NULL,NULL,NULL),(1584,2199,53,'684',NULL,NULL,NULL),(1585,2199,60,'693',NULL,NULL,NULL),(1586,2199,61,'696',NULL,NULL,NULL),(1587,2200,62,'556',NULL,NULL,NULL),(1588,2200,63,'560',NULL,NULL,NULL),(1589,2200,64,'563',NULL,NULL,NULL),(1596,2204,53,'684',NULL,NULL,NULL),(1597,2204,60,'692',NULL,NULL,NULL),(1598,2204,61,'696',NULL,NULL,NULL),(1599,2205,53,'683',NULL,NULL,NULL),(1600,2205,60,'692',NULL,NULL,NULL),(1601,2205,61,'695',NULL,NULL,NULL),(1602,2206,53,'683',NULL,NULL,NULL),(1603,2206,60,'692',NULL,NULL,NULL),(1604,2206,61,'695',NULL,NULL,NULL),(1605,2207,53,'683',NULL,NULL,NULL),(1606,2207,60,'692',NULL,NULL,NULL),(1607,2207,61,'695',NULL,NULL,NULL),(1608,2208,53,'683',NULL,NULL,NULL),(1609,2208,60,'692',NULL,NULL,NULL),(1610,2208,61,'695',NULL,NULL,NULL),(1611,2209,53,'683',NULL,NULL,NULL),(1612,2209,60,'693',NULL,NULL,NULL),(1613,2209,61,'697',NULL,NULL,NULL),(1614,2210,53,'683',NULL,NULL,NULL),(1615,2210,60,'693',NULL,NULL,NULL),(1616,2210,61,'697',NULL,NULL,NULL),(1617,2211,62,'556',NULL,NULL,NULL),(1618,2211,63,'559',NULL,NULL,NULL),(1619,2211,64,'562',NULL,NULL,NULL),(1620,2214,62,'556',NULL,NULL,NULL),(1621,2214,63,'559',NULL,NULL,NULL),(1622,2214,64,'562',NULL,NULL,NULL),(1623,2215,62,'557',NULL,NULL,NULL),(1624,2215,63,'560',NULL,NULL,NULL),(1625,2215,64,'563',NULL,NULL,NULL),(1626,2221,53,'683',NULL,NULL,NULL),(1627,2221,60,'692',NULL,NULL,NULL),(1628,2221,61,'695',NULL,NULL,NULL),(1629,2221,53,'683',NULL,NULL,NULL),(1630,2221,60,'692',NULL,NULL,NULL),(1631,2221,61,'695',NULL,NULL,NULL),(1632,2221,53,'683',NULL,NULL,NULL),(1633,2221,60,'692',NULL,NULL,NULL),(1634,2221,61,'695',NULL,NULL,NULL),(1635,2222,53,'683',NULL,NULL,NULL),(1636,2222,60,'692',NULL,NULL,NULL),(1637,2222,61,'695',NULL,NULL,NULL),(1638,2223,53,'683',NULL,NULL,NULL),(1639,2223,60,'692',NULL,NULL,NULL),(1640,2223,61,'695',NULL,NULL,NULL),(1641,2225,53,'683',NULL,NULL,NULL),(1642,2225,60,'692',NULL,NULL,NULL),(1643,2225,61,'695',NULL,NULL,NULL),(1644,2226,53,'683',NULL,NULL,NULL),(1645,2226,60,'692',NULL,NULL,NULL),(1646,2226,61,'695',NULL,NULL,NULL),(1647,2227,53,'683',NULL,NULL,NULL),(1648,2227,60,'692',NULL,NULL,NULL),(1649,2227,61,'696',NULL,NULL,NULL),(1650,2229,53,'683',NULL,NULL,NULL),(1651,2229,60,'692',NULL,NULL,NULL),(1652,2229,61,'695',NULL,NULL,NULL),(1653,2231,53,'683',NULL,NULL,NULL),(1654,2231,60,'692',NULL,NULL,NULL),(1655,2231,61,'695',NULL,NULL,NULL),(1656,2232,53,'683',NULL,NULL,NULL),(1657,2232,60,'692',NULL,NULL,NULL),(1658,2232,61,'695',NULL,NULL,NULL),(1659,2233,53,'683',NULL,NULL,NULL),(1660,2233,60,'692',NULL,NULL,NULL),(1661,2233,61,'695',NULL,NULL,NULL),(1662,2233,53,'683',NULL,NULL,NULL),(1663,2233,60,'692',NULL,NULL,NULL),(1664,2233,61,'695',NULL,NULL,NULL),(1665,2235,53,'683',NULL,NULL,NULL),(1666,2235,60,'692',NULL,NULL,NULL),(1667,2235,61,'695',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_result` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_result` with 99 row(s)
--

--
-- Table structure for table `ks_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule_idOrg` int(11) DEFAULT '0',
  `schedule_morningStart` time DEFAULT '00:00:00',
  `schedule_morningEnd` time DEFAULT '00:00:00',
  `schedule_afternoonStart` time DEFAULT '00:00:00',
  `schedule_afternoonEnd` time DEFAULT '00:00:00',
  `schedule_eveningStart` time DEFAULT '00:00:00',
  `schedule_eveningEnd` time DEFAULT '00:00:00',
  `schedule_isActived` int(11) DEFAULT NULL,
  `schedule_note1` text COLLATE utf8_unicode_ci,
  `schedule_note2` text COLLATE utf8_unicode_ci,
  `schedule_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`schedule_id`),
  KEY `schedule_idOrg` (`schedule_idOrg`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_schedule`
--

LOCK TABLES `ks_schedule` WRITE;
/*!40000 ALTER TABLE `ks_schedule` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_schedule` VALUES (6,'Lịch Tiếp nhận - Bình Chiểu',10,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(7,'Lịch Lãnh đạo - Bình Chiểu',16,'08:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(8,'Lịch VHXH - Bình Chiểu',11,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(9,'lịch làm việc phường 12',21,'07:00:00','11:00:00','13:00:00','17:00:00','19:00:00','23:00:00',1,NULL,NULL,NULL),(10,'ll việc p12',20,'07:00:00','11:00:00','13:00:00','17:00:00','19:00:00','23:00:00',1,NULL,NULL,NULL),(11,'lịch làm việc bp1',23,'07:00:00','12:00:00','13:00:00','17:00:00','19:00:00','23:00:00',1,NULL,NULL,NULL),(12,'bp2',24,'07:00:00','23:59:00','13:00:00','17:00:00','19:00:00','23:00:00',1,NULL,NULL,NULL),(13,'bp1',23,'07:00:00','23:59:00','13:00:00','17:00:00','19:00:00','23:00:00',1,NULL,NULL,NULL),(14,'Lịch KTĐT - Bình Chiểu',30,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(15,'Lịch Lãnh đạo - Qui Đức',32,'07:00:00','11:30:00','13:00:00','17:00:00','17:00:00','23:00:00',1,NULL,NULL,NULL),(16,'Lịch Tiếp nhận - Qui Đức',33,'07:00:00','11:30:00','13:00:00','17:00:00','17:00:00','23:00:00',1,NULL,NULL,NULL),(17,'Lịch VH-XH - Qui Đức',34,'07:00:00','11:30:00','13:00:00','17:00:00','17:00:00','23:00:00',1,NULL,NULL,NULL),(18,'Lịch KTĐT - Qui Đức',35,'07:00:00','11:30:00','13:00:00','17:00:00','17:00:00','23:00:00',1,NULL,NULL,NULL),(19,'Lịch Tiếp nhận - Trung Lập Thượng',37,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(20,'Lịch BV Hồng Hà - Hà Tĩnh',39,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(21,'Lịch Tiếp nhận - Bình Chiểu-copy',NULL,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',0,NULL,NULL,NULL),(22,'Lịch Tiếp nhận - Bình Chiểu-copy',NULL,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',0,NULL,NULL,NULL),(23,'Lịch Tiếp nhận - Bình Chiểu-copy',NULL,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',0,NULL,NULL,NULL),(24,'Lịch Tiếp nhận - Bình Chiểu-copy',NULL,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(25,'Lịch Tiếp nhận - Bình Chiểu-copy',NULL,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',1,NULL,NULL,NULL),(26,'Lịch VH-XH - Qui Đức-copy',30,'07:00:00','11:30:00','13:00:00','17:00:00','17:00:00','23:00:00',1,NULL,NULL,NULL),(27,'Lịch VHXH - Bình Chiểu-copy',NULL,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',0,NULL,NULL,NULL),(28,'Lịch Tiếp nhận - Bình Chiểu-copy',10,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',0,NULL,NULL,NULL),(29,'Lịch BV Hồng Hà - Hà Tĩnh-copy',39,'07:00:00','11:59:00','13:00:00','17:00:00','17:00:00','23:59:00',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_schedule` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_schedule` with 24 row(s)
--

--
-- Table structure for table `ks_survey`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_survey` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_idTopic` int(11) DEFAULT NULL,
  `survey_idObject` int(11) DEFAULT NULL,
  `survey_idorglv1` int(11) DEFAULT '0',
  `survey_customer` text COLLATE utf8_unicode_ci,
  `survey_session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `survey_customer_dossierId` int(11) DEFAULT NULL,
  `survey_created_at` datetime NOT NULL,
  `survey_isActived` int(11) DEFAULT NULL,
  `survey_note1` text COLLATE utf8_unicode_ci,
  `survey_note2` text COLLATE utf8_unicode_ci,
  `survey_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`survey_id`),
  KEY `survey_idTopic` (`survey_idTopic`),
  KEY `survey_idObject` (`survey_idObject`)
) ENGINE=InnoDB AUTO_INCREMENT=2236 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_survey`
--

LOCK TABLES `ks_survey` WRITE;
/*!40000 ALTER TABLE `ks_survey` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_survey` VALUES (1216,16,5,0,NULL,'aR0lVKd4LFgV3yoX7JvzFzSDM3WpGY35qua3KaJ9',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1217,16,5,0,NULL,'aR0lVKd4LFgV3yoX7JvzFzSDM3WpGY35qua3KaJ9',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1225,16,28,0,NULL,'9gRfwZ1LA0w9oy6Y1F8HCwk8BIARcxfuopPX96Dx',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1227,16,5,0,NULL,'OvMEzOLw3nFQ6mrGBefcs69KL3gxOMezKpEoFDqM',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1229,16,24,0,NULL,'bSoJjJ3Lnsx9ab2A7cUiVrqVAyUkU2RUaAMnp4qC',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1231,16,28,0,NULL,'wxnJwcJ8VvkLeTQ8RZ2jiYY1vhyUEdDLh5yPJyGh',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1238,16,28,0,NULL,'wxnJwcJ8VvkLeTQ8RZ2jiYY1vhyUEdDLh5yPJyGh',NULL,'2019-10-28 00:00:00',0,NULL,NULL,NULL),(1239,16,45,0,NULL,'pLGEVVZJl4wa5nV3JKycRTd2pFDTamdx6vapTX6N',NULL,'2019-10-29 00:00:00',0,NULL,NULL,NULL),(1278,16,32,0,NULL,'vFWnDVGfAeWWvkWIcCXaoQqroEOoiNN93McfIpYs',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1284,16,32,0,NULL,'vFWnDVGfAeWWvkWIcCXaoQqroEOoiNN93McfIpYs',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1285,16,32,0,NULL,'vFWnDVGfAeWWvkWIcCXaoQqroEOoiNN93McfIpYs',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1286,16,32,0,NULL,'vFWnDVGfAeWWvkWIcCXaoQqroEOoiNN93McfIpYs',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1287,16,6,0,NULL,'LoAGo4tPwLdKcmrQ88Z2XbVSP89Ya6GSowLNLLcI',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1372,16,6,0,NULL,'LoAGo4tPwLdKcmrQ88Z2XbVSP89Ya6GSowLNLLcI',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1373,16,6,0,NULL,'LoAGo4tPwLdKcmrQ88Z2XbVSP89Ya6GSowLNLLcI',NULL,'2019-10-30 00:00:00',0,NULL,NULL,NULL),(1374,16,55,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1375,16,56,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1376,16,56,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1377,16,56,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1384,16,53,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1385,16,53,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1394,16,56,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1395,16,55,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1396,16,54,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1397,16,57,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1398,16,58,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1399,16,56,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1400,16,54,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1401,16,56,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1404,16,57,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1405,16,57,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1406,16,57,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1407,16,58,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1408,16,58,0,NULL,'baxqutCc8Z9TT0Doc8uIyjx5gsWLdVP0grc5OY3o',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1411,16,52,0,NULL,'fYHSIt5DEiCI1BwL6MrMf38ydrdWchRZlrZWvB05',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1412,16,52,0,NULL,'fYHSIt5DEiCI1BwL6MrMf38ydrdWchRZlrZWvB05',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1413,16,54,0,NULL,'fYHSIt5DEiCI1BwL6MrMf38ydrdWchRZlrZWvB05',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1415,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1416,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1417,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1418,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1419,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1420,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1421,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1422,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1423,16,51,0,NULL,'02DCq4r5G8TulyBS86xLScMypRLU7unPu7pthf2G',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1427,16,57,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1428,16,56,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1436,16,57,0,NULL,'GMXPR6k9hcabPNxycqzF3OT0rgiz7vhqb8vOX6oL',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1440,16,57,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1441,16,57,0,NULL,'polzkpJ3b5lkvdeKmCf7fE9kVRJvpuKr4WV5rxIk',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1442,16,58,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1443,16,58,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1444,16,58,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1445,16,56,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1447,16,57,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1448,16,56,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1449,16,56,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1450,16,56,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1451,16,56,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1452,16,56,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1453,16,58,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1454,16,58,0,NULL,'gRxRRXhmsoetbNYI1oBHON52nKjiIBpxMYJ6rE42',NULL,'2019-10-31 00:00:00',0,NULL,NULL,NULL),(1455,16,57,0,NULL,'BWba0ef0vw0a2iKB9JVh1a3NAphNHizZqgjCARwT',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1456,16,57,0,NULL,'ZgrdsW9zypaTpUt66FVllnv7IEnFwsqL5enwlsFG',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1457,16,62,0,NULL,'ZgrdsW9zypaTpUt66FVllnv7IEnFwsqL5enwlsFG',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1458,16,52,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1460,16,52,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1461,16,69,0,NULL,'ZgrdsW9zypaTpUt66FVllnv7IEnFwsqL5enwlsFG',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1465,16,60,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1466,16,60,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1467,16,60,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1469,16,60,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1568,16,29,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1574,16,29,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1577,16,57,0,NULL,'ZgrdsW9zypaTpUt66FVllnv7IEnFwsqL5enwlsFG',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1578,16,52,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1580,16,28,0,NULL,'svvTDcTTxNxbYnmQbOI2p46iQ0YsLzN7di97fKPe',NULL,'2019-11-01 00:00:00',0,NULL,NULL,NULL),(1595,16,74,0,NULL,'NT1JJgE1L6jgWLKm9DrblASlrTvwOj9O5URFuFTd',NULL,'2019-11-02 00:00:00',0,NULL,NULL,NULL),(1598,16,74,0,NULL,'w0ZEZ3Q2ZK2VoGg5kkx2nGPNtsSI5N7GvbQopHnl',NULL,'2019-11-03 00:00:00',0,NULL,NULL,NULL),(1600,16,69,0,NULL,'gMvxMyWk6tg5nZFAQi31PTI4Q0h6cCeAAbuDRQU1',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1601,16,69,0,NULL,'gMvxMyWk6tg5nZFAQi31PTI4Q0h6cCeAAbuDRQU1',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1605,16,5,0,NULL,'ODd8qqYU08cEoWjUAooBct2bWnJ1pEObX00ZWGQc',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1610,16,27,0,NULL,'ODd8qqYU08cEoWjUAooBct2bWnJ1pEObX00ZWGQc',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1612,16,27,0,NULL,'ODd8qqYU08cEoWjUAooBct2bWnJ1pEObX00ZWGQc',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1616,16,27,0,NULL,'ODd8qqYU08cEoWjUAooBct2bWnJ1pEObX00ZWGQc',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1617,16,27,0,NULL,'ODd8qqYU08cEoWjUAooBct2bWnJ1pEObX00ZWGQc',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1619,16,27,0,NULL,'ODd8qqYU08cEoWjUAooBct2bWnJ1pEObX00ZWGQc',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1620,16,73,0,NULL,'RKnmSSEzreQvCwkrpT5THWX1xWS7yrFZVBMxYBep',NULL,'2019-11-04 00:00:00',0,NULL,NULL,NULL),(1666,16,27,0,NULL,'lbda4NGLr7AS5lKMlm1TdzC9yYMi6A3g2bosmfZD',NULL,'2019-11-05 00:00:00',0,NULL,NULL,NULL),(1668,16,52,0,NULL,'1YgoiF5xIStnDcRTFYxZaObPZ2FCLm23LpybM7js',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1669,16,55,0,NULL,'1YgoiF5xIStnDcRTFYxZaObPZ2FCLm23LpybM7js',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1670,16,55,0,NULL,'1YgoiF5xIStnDcRTFYxZaObPZ2FCLm23LpybM7js',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1671,16,56,0,NULL,'1YgoiF5xIStnDcRTFYxZaObPZ2FCLm23LpybM7js',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1672,16,56,0,NULL,'1YgoiF5xIStnDcRTFYxZaObPZ2FCLm23LpybM7js',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1674,16,27,0,NULL,'Nh34YUOweqfSck2NKdLKPBDDo4cSzC0MvYXiZHQD',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1675,16,57,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1676,16,57,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1677,16,60,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1678,16,60,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1679,16,60,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1680,16,60,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1681,16,60,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1688,16,57,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1689,16,54,0,NULL,'Y2DKYtLVjn1UmYoxKQGpwMPv2UuyrH5htmgbX7B1',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1697,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1698,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1699,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1702,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1703,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1704,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1705,16,27,0,NULL,'stANfipQGOTPCejRPmYPqPJcz1FabsSVRRDO8BRq',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1707,16,31,0,NULL,'qLqVzI8Z7AOp5USMcPivhlNzAc3eKAOpCwDzgsFw',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1713,16,42,0,NULL,'gYBAcBmoyEUoWC93xe385yuq27epi3EVDTtAJsAy',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1714,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1715,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1719,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1720,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1721,16,31,0,NULL,'2awrdI0WtUTasgmmHHPmEImMM70T4226HiA6SL1b',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1722,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1727,16,6,0,NULL,'Hhz7FSAMHWM4I1AnS24HMcjdqczxDO4YpuzRnM4J',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1733,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1738,16,33,0,NULL,'TbNfLOm7MQJPtKj8gzA4V1yi61qwpW118MpG5fQJ',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1739,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1740,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1741,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1744,16,32,0,NULL,'2awrdI0WtUTasgmmHHPmEImMM70T4226HiA6SL1b',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1747,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1749,16,32,0,NULL,'2awrdI0WtUTasgmmHHPmEImMM70T4226HiA6SL1b',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1750,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1751,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1752,16,31,0,NULL,'yZ4A9A5E12nvFqYT4cwnLGYgAX8eywlBL4yd6AAK',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1753,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1754,16,27,0,NULL,'g9fOKqFOIPsVAth4J5o5B8z0er5oUnEdh8kuaSVo',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1755,16,71,0,NULL,'6jQPvwsaSHaMq8G5NkVD67BmiZbQ5Ni4mP64FRUC',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1756,16,74,0,NULL,'6jQPvwsaSHaMq8G5NkVD67BmiZbQ5Ni4mP64FRUC',NULL,'2019-11-06 00:00:00',0,NULL,NULL,NULL),(1757,16,28,0,NULL,'KXml5dRjXCgtlR9fM1IMcw7TaHrUJSghD4ChOX0C',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1758,16,28,0,NULL,'KXml5dRjXCgtlR9fM1IMcw7TaHrUJSghD4ChOX0C',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1759,16,73,0,NULL,'KXml5dRjXCgtlR9fM1IMcw7TaHrUJSghD4ChOX0C',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1760,16,31,0,NULL,'RJw6rf13vSYx70aMuFFchK0JTUNFvqCUaswosKaP',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1762,16,33,0,NULL,'ajEhzxl1VQDR52n034YZvhUbJoMnvpqlBOpnCyuD',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1763,16,42,0,NULL,'htJOBhq7Ap42TMozVQrTO1zqTPp8DXjEr1DUjNon',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1764,16,27,0,NULL,'2kwLtPxswjbjvGFKZjqwQrj8XL6WnwBxIZEtG6tR',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1772,16,71,0,NULL,'eMT1U9o4qqkvBGzihNNBm1mftNqmYOc5Sjj3YoMh',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1773,16,32,0,NULL,'Fy2wcVjHeP58E9r27WRwsapHAt8LkAsYbzZNtyER',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1782,16,33,0,NULL,'NMknEzT9OwOMA6FIp0Q1KrIxJyzF5TaxWgZ1QZDm',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1786,16,69,0,NULL,'m20LEjoH3tcvgyM6H05LdSAXb81UKBLFmtgCGDTr',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1787,16,74,0,NULL,'m20LEjoH3tcvgyM6H05LdSAXb81UKBLFmtgCGDTr',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1798,16,31,0,NULL,'JaiY3zypCBNTs0zYgkiDEwaHnfD5EabT0YAv3Zmj',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1801,16,27,0,NULL,'bhe0TZjK5MCdnXc6o3cSMuSWYOjLS2GD2VJJgHPD',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1803,16,42,0,NULL,'TkzjqV6ZWPZQNlA6fOUe8yd17gUN6sddiEEHJAhR',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1806,16,33,0,NULL,'KN7s1J5GPVSCMA79LQPOFJpdRprrQZ65yYneg75I',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1808,16,32,0,NULL,'P7jcWcLS0964hJ7hmcYqOq5fTwyUf5dlnFZ6wLo3',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1811,16,31,0,NULL,'JaiY3zypCBNTs0zYgkiDEwaHnfD5EabT0YAv3Zmj',NULL,'2019-11-07 00:00:00',0,NULL,NULL,NULL),(1816,16,31,0,NULL,'lcQq08zWqUepkFZXb7Ixk88bUS7LCf8xSYlDitHm',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1817,16,31,0,NULL,'lcQq08zWqUepkFZXb7Ixk88bUS7LCf8xSYlDitHm',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1818,16,31,0,NULL,'lcQq08zWqUepkFZXb7Ixk88bUS7LCf8xSYlDitHm',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1825,16,42,0,NULL,'ODdcASBYjgiVFGGCNLyVst3cbTkDwjjadFyVZVlT',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1826,16,42,0,NULL,'ODdcASBYjgiVFGGCNLyVst3cbTkDwjjadFyVZVlT',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1828,16,27,0,NULL,'iBgOMs5C8pbVYqoNlPxl1jMRKBeNXgGVHMTEv78S',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1829,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1830,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1831,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1832,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1833,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1834,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1841,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1845,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1846,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1847,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1848,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1849,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1850,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1851,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1852,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1853,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1854,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1857,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1871,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1877,16,33,0,NULL,'ltFXOHVxP9NSS62onhDBbIGT5Ic3zQLW6LhxYcpP',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1879,16,32,0,NULL,'O35aMMxz5FnqUBYugZcuwCOTEhvN4B1qRP6IqAtl',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1882,16,78,0,NULL,'CSQUl57RJsBFkDeREtSVFtt7L324731g0Irgh272',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1883,16,77,0,NULL,'CSQUl57RJsBFkDeREtSVFtt7L324731g0Irgh272',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1884,16,76,0,NULL,'CSQUl57RJsBFkDeREtSVFtt7L324731g0Irgh272',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1885,16,31,0,NULL,'qQMwv2zK6D6HJtfpoj1WO7hevfiRQGq1p1WsicDW',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1886,16,42,0,NULL,'OcolCxnkHXTCDZTSbwB6hcSzYFGdAa6RIqGeVvo4',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1887,16,42,0,NULL,'OcolCxnkHXTCDZTSbwB6hcSzYFGdAa6RIqGeVvo4',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1888,16,42,0,NULL,'OcolCxnkHXTCDZTSbwB6hcSzYFGdAa6RIqGeVvo4',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1890,16,81,0,NULL,'grm9bGVnUekm6aT54ygfECUvqHbkqir7AKC5dM2X',NULL,'2019-11-08 00:00:00',0,NULL,NULL,NULL),(1891,18,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1892,18,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1893,18,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1894,26,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1897,26,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1898,26,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1900,26,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1902,26,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1903,26,39,0,NULL,'sGsH99dayYijucdyF7UJCBhenRvPftRntmnExtSv',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1904,26,39,0,NULL,'kHGXvcHTAYOKya8FGQwb2OzXy2q8bDAbyEc2AlUG',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1905,26,39,0,NULL,'toZgshROwlzj5PT709ZABRW1dCRQdRH2G1A4R5SY',NULL,'2019-11-09 00:00:00',0,NULL,NULL,NULL),(1907,16,76,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1908,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1909,16,79,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1910,16,79,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1911,16,80,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1912,16,80,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1913,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1914,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1915,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1916,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1917,16,77,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1918,16,76,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1919,16,80,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1920,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1921,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1923,16,78,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1926,16,77,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1927,16,79,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1928,16,76,0,NULL,'DVt0b9AHA9kwuo6FbMWVa1qaJA6nRQAve9w0OJXK',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1933,16,78,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1934,16,78,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1937,16,27,0,NULL,'xS3dlr4DaPeT3PCHrvRaXAyTklBcIiaVFddN7E6Z',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1938,16,76,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1939,16,76,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1940,16,76,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1941,16,80,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1942,16,81,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1943,16,78,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1944,16,78,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1945,16,78,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1946,16,78,0,NULL,'70t0ATYDJzyncHNZOzQPTiMwes1PyK2YRNbBydFO',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1974,16,44,0,NULL,'hlJB2g7IB0Qrxg6FwUEmM0ewow2v1WAvjW8Yzrih',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1978,16,44,0,NULL,'hlJB2g7IB0Qrxg6FwUEmM0ewow2v1WAvjW8Yzrih',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1983,16,45,0,NULL,'9sb8rb9zjrvk815GJAVXz4GquqLOSgGPy1wFQeBS',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1987,16,44,0,NULL,'hlJB2g7IB0Qrxg6FwUEmM0ewow2v1WAvjW8Yzrih',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1989,16,44,0,NULL,'hlJB2g7IB0Qrxg6FwUEmM0ewow2v1WAvjW8Yzrih',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1995,16,45,0,NULL,'9sb8rb9zjrvk815GJAVXz4GquqLOSgGPy1wFQeBS',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(1997,16,33,0,NULL,'eBAEiyfcCpFdj2ESFSCMBZKe2PlvIGC8JjFQ5E1d',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2007,16,32,0,NULL,'jkLWV7UgE2tz4P3ckvKuHsl0F2eLqPf1ML3BLZSu',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2008,16,31,0,NULL,'UcDK2i2V7wRRzNb3XhQ1annEhDGH1AljV3YCPgq8',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2011,16,31,0,NULL,'9sb8rb9zjrvk815GJAVXz4GquqLOSgGPy1wFQeBS',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2012,16,31,0,NULL,'9sb8rb9zjrvk815GJAVXz4GquqLOSgGPy1wFQeBS',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2013,16,31,0,NULL,'9sb8rb9zjrvk815GJAVXz4GquqLOSgGPy1wFQeBS',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2014,16,31,0,NULL,'9sb8rb9zjrvk815GJAVXz4GquqLOSgGPy1wFQeBS',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2017,16,31,0,NULL,'UcDK2i2V7wRRzNb3XhQ1annEhDGH1AljV3YCPgq8',NULL,'2019-11-11 00:00:00',0,NULL,NULL,NULL),(2018,16,31,0,NULL,'RAYF8PQym2U3IANoRyEB3DZIsCOlvdtm3L8gUJDj',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2019,16,31,0,NULL,'Jja36ic6snFR384RoMaUZcgjE91h1q8qjZ3mjfje',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2021,16,77,0,NULL,'AaK5xDEVULrqBre1RikeJWUFqMmlsYqqBVFIab2X',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2023,16,77,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2025,16,77,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2028,16,77,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2030,16,78,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2031,16,78,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2032,16,76,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2037,16,78,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2042,16,77,0,NULL,'1myvr8joS5AtcLMxL1GYch6lRiOdm7NcndQNT7PY',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2044,16,31,0,NULL,'qL3uxMD6vmblafkxKB8ujY6uWmTPg6H6keREtc6U',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2045,16,32,0,NULL,'kjIrKZCJXsLnNiPQc78upI0heyZceYG6NH1AaKbS',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2046,16,79,0,NULL,'P705573CEkyah25bwvH09WRh3n7dBWZFzIjMd0Ik',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2053,16,45,0,NULL,'KgYQNQthH1OrlZhvDcTX0Tr5O7EIplC3VOniEe3g',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2056,16,78,0,NULL,'P705573CEkyah25bwvH09WRh3n7dBWZFzIjMd0Ik',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2060,16,69,0,NULL,'dQtr3gdeaSOoBHerHmicXPGMTE2lfMJiHO6JJId2',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2062,16,32,0,NULL,'i5qPrDifXSVcfIysHs8lAQikqo69EvUftS2q3scy',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2065,16,27,0,NULL,'21sbe8hwseRcmfCsWaf7emEyLLZUw4fJJYjW3ayt',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2067,16,27,0,NULL,'21sbe8hwseRcmfCsWaf7emEyLLZUw4fJJYjW3ayt',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2070,16,33,0,NULL,'cx8kWdnVz1viwyRtKPdzK2D8oQ4jPUymAf7FRvxV',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2071,16,80,0,NULL,'P705573CEkyah25bwvH09WRh3n7dBWZFzIjMd0Ik',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2072,16,80,0,NULL,'P705573CEkyah25bwvH09WRh3n7dBWZFzIjMd0Ik',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2073,16,31,0,NULL,'jCyBxxuCIKgyxe2uHoVdgSuoMcqIPFdCP1gdqIPW',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2075,16,32,0,NULL,'i5qPrDifXSVcfIysHs8lAQikqo69EvUftS2q3scy',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2078,16,32,0,NULL,'QAN2fzadIsJfnwEPNrMiNIlLIpwgTRre4wHZisgb',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2079,16,32,0,NULL,'QAN2fzadIsJfnwEPNrMiNIlLIpwgTRre4wHZisgb',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2081,16,78,0,NULL,'P705573CEkyah25bwvH09WRh3n7dBWZFzIjMd0Ik',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2083,16,79,0,NULL,'P705573CEkyah25bwvH09WRh3n7dBWZFzIjMd0Ik',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2086,16,42,0,NULL,'i6CCsFq1EWB7AGsPPSMo7w81mLzpFRGBXpQtpgDs',NULL,'2019-11-12 00:00:00',0,NULL,NULL,NULL),(2087,16,33,0,NULL,'oKUpi4PgIEzTGi1YHe4LZX32XLFHOh9gPCzfJw9O',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2088,16,33,0,NULL,'h63J2ZcyuDSAO9m5vC558Vh5bwcGfveZKYamDiVL',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2089,16,31,0,NULL,'2z3NiwMR84VS7CvOpi58qQrMra9RwXdKXtb8E3B4',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2090,16,32,0,NULL,'XAO1OnNkL2trE8sMJ5o1Y3Qk9s3lOpv2BLO110Dc',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2091,16,33,0,NULL,'NnBsnY64wqIjDDofO6PL5AiS8Mp4DpMhUKI6F5VV',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2093,16,27,0,NULL,'G44WxUtNg8hZ3OKdNKNdiAyrpHPRxBx9Y8WL19Mg',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2094,16,42,0,NULL,'6BHiNBOQcF1eriksCYYsP1Nz6GkOh3wSHGag6Zx2',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2096,16,37,0,NULL,'8hnRd2D7ndfif9Mhi43DMreLefZjBEamhiWqdf6E',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2098,16,45,0,NULL,'8hnRd2D7ndfif9Mhi43DMreLefZjBEamhiWqdf6E',NULL,'2019-11-13 00:00:00',0,NULL,NULL,NULL),(2100,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2102,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2103,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2104,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2105,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2106,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2107,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2108,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2112,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2120,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2124,16,28,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2128,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2146,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2147,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2148,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2149,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2150,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2151,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2152,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2153,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2154,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2155,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2156,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2157,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2158,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2159,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2160,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2161,16,27,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2162,16,5,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2164,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2165,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2166,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2167,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2168,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2169,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2170,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2171,16,6,0,NULL,'wS9MxFRqvh1X7dP93VAIUFsCfvmgk10Ygui2DAtJ',NULL,'2019-11-23 00:00:00',0,NULL,NULL,NULL),(2180,16,6,0,NULL,'yZ9bhTurZcnSySZAhkq7ZPs960v8jNtmofOzuiQH',NULL,'2019-12-06 00:00:00',0,NULL,NULL,NULL),(2186,16,5,0,NULL,'yZ9bhTurZcnSySZAhkq7ZPs960v8jNtmofOzuiQH',NULL,'2019-12-06 00:00:00',0,NULL,NULL,NULL),(2189,16,5,9,NULL,'yZ9bhTurZcnSySZAhkq7ZPs960v8jNtmofOzuiQH',NULL,'2019-12-06 00:00:00',1,NULL,NULL,NULL),(2190,26,39,0,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',0,NULL,NULL,NULL),(2191,26,39,39,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2192,26,39,0,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',0,NULL,NULL,NULL),(2193,26,39,39,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2194,26,39,0,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',0,NULL,NULL,NULL),(2195,16,45,9,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2196,16,28,9,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2197,16,28,9,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2198,16,36,9,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2199,16,45,9,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2200,18,9,9,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',1,NULL,NULL,NULL),(2201,18,9,0,NULL,'YaILhvqU47xO5aBryQBMy2TxkS7FzBFbAwt9FYm0',NULL,'2020-02-11 00:00:00',0,NULL,NULL,NULL),(2204,16,5,9,NULL,'vRxLJVWsUXQWehNqSTgllT1yKX8X2U4jfnlCZ7q7',NULL,'2020-02-14 00:00:00',1,NULL,NULL,NULL),(2205,16,6,9,NULL,'rkDEnKhN90VKrm5RxlvsYPeCwLjQqbhJvzWb7FBc',NULL,'2020-02-14 00:00:00',1,NULL,NULL,NULL),(2206,16,5,9,NULL,'rkDEnKhN90VKrm5RxlvsYPeCwLjQqbhJvzWb7FBc',NULL,'2020-02-14 00:00:00',1,NULL,NULL,NULL),(2207,16,28,9,NULL,'m0hPasvtOW19ceQwRZSHkg0sOSJsPzQazmyQiOul',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2208,16,28,9,NULL,'m0hPasvtOW19ceQwRZSHkg0sOSJsPzQazmyQiOul',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2209,16,27,9,NULL,'m0hPasvtOW19ceQwRZSHkg0sOSJsPzQazmyQiOul',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2210,16,27,9,NULL,'m0hPasvtOW19ceQwRZSHkg0sOSJsPzQazmyQiOul',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2211,18,9,9,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2212,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2213,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2214,18,9,9,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2215,18,9,9,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',1,NULL,NULL,NULL),(2216,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2217,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2218,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2219,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2220,18,9,0,NULL,'ibN2Mwde5YPE6qN5bI39MynOy2YfuoFsbDByqZey',NULL,'2020-02-15 00:00:00',0,NULL,NULL,NULL),(2221,16,5,9,NULL,'CK7PXUFUwI52v0oyWaEOgQNldEXvQ7WAZMAxjXWa',NULL,'2020-02-17 00:00:00',1,NULL,NULL,NULL),(2222,16,5,9,NULL,'A7S6UomwNVnJ17EqwKXWQdbaLAxih7mez009IiO4',NULL,'2020-02-23 00:00:00',1,NULL,NULL,NULL),(2223,16,27,9,NULL,'A7S6UomwNVnJ17EqwKXWQdbaLAxih7mez009IiO4',NULL,'2020-02-23 00:00:00',1,NULL,NULL,NULL),(2224,16,51,0,NULL,'A7S6UomwNVnJ17EqwKXWQdbaLAxih7mez009IiO4',NULL,'2020-02-23 00:00:00',0,NULL,NULL,NULL),(2225,16,52,31,NULL,'A7S6UomwNVnJ17EqwKXWQdbaLAxih7mez009IiO4',NULL,'2020-02-23 00:00:00',1,NULL,NULL,NULL),(2226,16,52,31,NULL,'A7S6UomwNVnJ17EqwKXWQdbaLAxih7mez009IiO4',NULL,'2020-02-23 00:00:00',1,NULL,NULL,NULL),(2227,16,52,31,NULL,'2N5FNpfrZDk27p2Y6bMZUTmtJYhp26xsxl0lt8TM',NULL,'2020-02-24 00:00:00',1,NULL,NULL,NULL),(2229,16,52,31,NULL,'6GPgZnuyx1a3leyVhtvpijoQeSeuL78YAFzzCq7w',NULL,'2020-02-29 00:00:00',1,NULL,NULL,NULL),(2230,16,52,0,NULL,'6GPgZnuyx1a3leyVhtvpijoQeSeuL78YAFzzCq7w',NULL,'2020-02-29 00:00:00',0,NULL,NULL,NULL),(2231,16,52,31,NULL,'6GPgZnuyx1a3leyVhtvpijoQeSeuL78YAFzzCq7w',NULL,'2020-02-29 00:00:00',1,NULL,NULL,NULL),(2232,16,52,31,NULL,'6GPgZnuyx1a3leyVhtvpijoQeSeuL78YAFzzCq7w',NULL,'2020-02-29 00:00:00',1,NULL,NULL,NULL),(2233,16,54,31,NULL,'QTvB8IlGIPIflMF80OdwgDGovJz6UdRocg7Y0Gqq',NULL,'2020-02-29 00:00:00',1,NULL,NULL,NULL),(2235,16,55,31,NULL,'QTvB8IlGIPIflMF80OdwgDGovJz6UdRocg7Y0Gqq',NULL,'2020-02-29 00:00:00',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_survey` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_survey` with 366 row(s)
--

--
-- Table structure for table `ks_topic`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ks_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topic_description` text COLLATE utf8_unicode_ci,
  `topic_thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `topic_type` int(11) DEFAULT NULL,
  `topic_isActived` int(11) DEFAULT NULL,
  `topic_idCreated` int(11) DEFAULT NULL,
  `topic_idorg` int(11) DEFAULT '0',
  `topic_created_at` datetime NOT NULL,
  `topic_updated_at` datetime NOT NULL,
  `topic_note1` text COLLATE utf8_unicode_ci,
  `topic_note2` text COLLATE utf8_unicode_ci,
  `topic_note3` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ks_topic`
--

LOCK TABLES `ks_topic` WRITE;
/*!40000 ALTER TABLE `ks_topic` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `ks_topic` VALUES (16,'Đánh giá hài lòng của công dân đối với nhân viên','<p>Đ&aacute;nh gi&aacute; h&agrave;i l&ograve;ng của c&ocirc;ng d&acirc;n đối với nh&acirc;n vi&ecirc;n</p>','/thumb.png',2,1,1,0,'2019-10-28 00:00:00','2019-10-28 00:00:00',NULL,NULL,NULL),(18,'Đánh giá hài lòng của công dân đối với Phường','<p>Đ&aacute;nh gi&aacute; h&agrave;i l&ograve;ng của c&ocirc;ng d&acirc;n đối với Phường</p>','/thumb.png',1,1,1,0,'2019-10-02 00:00:00','2019-10-02 00:00:00',NULL,NULL,NULL),(26,'Khảo sát đơn vị - BV Hồng Hà','<p>D&agrave;nh cho bệnh nh&acirc;n</p>','/thumb.png',1,1,1,0,'2019-11-09 00:00:00','2019-11-09 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ks_topic` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `ks_topic` with 3 row(s)
--

--
-- Table structure for table `list_step`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_step` (
  `ID_Step` int(11) NOT NULL AUTO_INCREMENT,
  `step_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `step_note` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_actived` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `execution_time` int(11) DEFAULT '0',
  `out_ofdate` int(11) NOT NULL DEFAULT '0',
  `step_4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Step`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_step`
--

LOCK TABLES `list_step` WRITE;
/*!40000 ALTER TABLE `list_step` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `list_step` VALUES (1,'Nhận Hồ Sơ','Nhân viên nhận hồ sơ (Nhân viên nhận hồ sơ và chưa chuyển cho bộ phận xử lý)',0,0,2,1,'1','1','1','1','1'),(2,'Đang Xử Lý','Đang Xử Lý (Chuyển hồ sơ các bộ phận đang xử lý)',0,0,0,1,'1','1','1','1','1'),(3,'Lãnh Đạo Duyệt','Lãnh Đạo Duyệt (Chuyển hồ sơ Lãnh đạo Ký)',0,0,0,1,'1','1','1','1','1'),(4,'Chờ trả Kết Quả','Chờ Trả Kết quả (Chuyển hồ sơ lại cho nhân viên tiếp nhận, chờ người dân đến nhận hồ sơ)',0,0,0,0,'1','1','1','1','1'),(6,'Hoàn Thành','Hoàn thành (Người dân đã nhận hồ sơ)',0,0,0,0,'1','1','1','1','1'),(9,'Trả Hồ Sơ để Bổ Sung','Hồ sơ bị lỗi, đã chuyển lại cho nhân viên tiếp nhận, chờ người dân đến để trả Hồ Sơ để Bổ Sung',0,0,0,0,'1','1','1','1','1'),(10,'Hồ sơ Lỗi','Người dân đã nhận hồ sơ bị lỗi về để bổ sung',0,0,0,0,'1','1','1','1','1'),(11,'Sửa thông tin hồ sơ','Quy trình sửa thông tin hồ sơ dành cho Giám sát',0,0,1,0,'1','1','1','1','1'),(12,'Xóa hồ sơ không hợp lệ','Xóa hồ sơ khỏi hệ thống',0,0,1,0,'1','1','1','1','1');
/*!40000 ALTER TABLE `list_step` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `list_step` with 9 row(s)
--

--
-- Table structure for table `menu`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `ID_Menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `menu_note` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `menu_active` tinyint(1) NOT NULL,
  `menu_position` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL DEFAULT '0',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_level` int(11) NOT NULL DEFAULT '1',
  `menu_route` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_show` int(11) NOT NULL DEFAULT '0',
  `menu_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_9` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_10` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Menu`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `menu` VALUES (23,'Quyền Sửa Hồ Sơ','Menu link Quyền Sửa Hồ Sơ',1,1,0,250,1,'admin/dossier/{dossier}/edit; admin/dossier/{dossier};',0,'1','1','1','1','1'),(24,'Quyền Xóa Hồ Sơ','Menu Link Quyền Xóa Hồ Sơ',1,1,0,250,1,'admin/dossier/delete/{dossier};',0,'1','1','1','1','1'),(25,'Quyền thêm Hồ Sơ','Quyền Thêm Hồ Sơ',1,1,0,250,1,'admin/dossier/create;',0,'1','1','1','1','1'),(52,'Tất Cả Hồ Sơ','Menu Thư mục Tất cả hồ sơ',1,1,0,48,1,'admin/dossier;',1,'1','1','1','1','1'),(53,'Nhận Hồ Sơ','Menu Link Nhận Hồ Sơ',1,1,61,50,2,'admin/dossier/dossierstep/1;',1,'1','1','1','1','1'),(54,'Hồ Sơ Đang Xử Lý','Menu Link Hồ Sơ Đang Xử Lý',1,1,61,51,2,'admin/dossier/dossierstep/2;',1,'1','1','1','1','1'),(55,'Lãnh Đạo Duyệt','Menu Link Lãnh Đạo Duyệt',1,1,61,52,2,'admin/dossier/dossierstep/3;',1,'1','1','1','1','1'),(56,'Chờ trả Kết Quả','Menu Link Chờ trả Kết Quả',1,1,61,53,2,'admin/dossier/dossierstep/4;',1,'1','1','1','1','1'),(57,'Hoàn Thành','Menu Link Hoàn Thành',1,1,61,54,2,'admin/dossier/dossierstep/6;',1,'1','1','1','1','1'),(58,'Trả Hồ Sơ để Bổ Sung','Menu Link Trả Hồ Sơ để Bổ Sung',1,1,61,55,2,'admin/dossier/dossierstep/9;',1,'1','1','1','1','1'),(59,'Hồ sơ Lỗi','Menu Link Hồ sơ Lỗi',1,1,61,56,2,'admin/dossier/dossierstep/10;',1,'1','1','1','1','1'),(61,'Xử Lý Hồ Sơ','Thư Mục Hồ Sơ',1,1,0,49,1,'',1,'1','1','1','1','1'),(63,'Quyền Xem Hồ sơ theo Từng Quy trình cụ thể','Quyền Xem Hồ sơ theo Từng Quy trình cụ thể (vd: Nhận hồ sơ, đang xử lý, lãnh đạo duyệt...)',1,1,0,250,1,'admin/dossier/dossierstep/{step};',0,'1','1','1','1','1'),(64,'Quyền Thêm Quy Trình Cho Hồ sơ','Quyền thêm quy trình cho hồ sơ',1,1,0,250,1,'admin/dossier/createprocess/{dossier}; admin/dossier/storeprocess/{dossier};',0,'1','1','1','1','1'),(65,'Hồ Sơ Quá Hạn','Menu Link  Hồ Sơ Quá Hạn',1,1,61,49,2,'admin/dossier/c/quahan;',1,'1','1','1','1','1'),(66,'Thống Kê Hồ Sơ','Thống Kê Hồ Sơ - Dành cho Lãnh đạo phường - Vai trò Giám Sát',1,1,0,50,1,'admin/dossier/c/thongke;',1,'1','1','1','1','1'),(70,'Quản lý hồ sơ','Hồ Sơ Bị Xóa do Admin quản lý',1,1,0,49,1,'admin/dossier/c/hosobixoa;',1,'1','1','1','1','1'),(72,'Thông tin tài khoản','Thông tin tài khoản',1,1,0,51,1,'admin/user/c/manageinfo;',1,'1','1','1','1','1'),(73,'Nhật ký hoạt động','Nhật ký hoạt động',1,1,0,52,1,'admin/setting/nhatky; admin/setting/nhatky/download/{dossier};',1,'1','1','1','1','1');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `menu` with 19 row(s)
--

--
-- Table structure for table `menu_role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_role` (
  `ID_Menurole` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Menu` int(11) NOT NULL,
  `ID_Role` int(11) NOT NULL,
  `menurole_actived` tinyint(1) NOT NULL,
  `menurole_4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menurole_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Menurole`),
  KEY `ID_Menu` (`ID_Menu`),
  KEY `ID_Role` (`ID_Role`),
  CONSTRAINT `Menu_Role_ibfk_1` FOREIGN KEY (`ID_Menu`) REFERENCES `menu` (`ID_Menu`),
  CONSTRAINT `Menu_Role_ibfk_2` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`)
) ENGINE=InnoDB AUTO_INCREMENT=889 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_role`
--

LOCK TABLES `menu_role` WRITE;
/*!40000 ALTER TABLE `menu_role` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `menu_role` VALUES (800,70,1,1,NULL,NULL,NULL,NULL,NULL),(801,73,1,1,NULL,NULL,NULL,NULL,NULL),(821,52,2,1,NULL,NULL,NULL,NULL,NULL),(822,61,2,1,NULL,NULL,NULL,NULL,NULL),(823,66,2,1,NULL,NULL,NULL,NULL,NULL),(824,72,2,1,NULL,NULL,NULL,NULL,NULL),(825,73,2,1,NULL,NULL,NULL,NULL,NULL),(826,65,2,1,NULL,NULL,NULL,NULL,NULL),(827,53,2,1,NULL,NULL,NULL,NULL,NULL),(828,54,2,1,NULL,NULL,NULL,NULL,NULL),(829,55,2,1,NULL,NULL,NULL,NULL,NULL),(830,56,2,1,NULL,NULL,NULL,NULL,NULL),(831,57,2,1,NULL,NULL,NULL,NULL,NULL),(832,58,2,1,NULL,NULL,NULL,NULL,NULL),(833,59,2,1,NULL,NULL,NULL,NULL,NULL),(836,23,2,1,NULL,NULL,NULL,NULL,NULL),(837,24,2,1,NULL,NULL,NULL,NULL,NULL),(838,25,2,1,NULL,NULL,NULL,NULL,NULL),(839,63,2,1,NULL,NULL,NULL,NULL,NULL),(857,52,3,1,NULL,NULL,NULL,NULL,NULL),(858,61,3,1,NULL,NULL,NULL,NULL,NULL),(859,72,3,1,NULL,NULL,NULL,NULL,NULL),(860,65,3,1,NULL,NULL,NULL,NULL,NULL),(861,53,3,1,NULL,NULL,NULL,NULL,NULL),(862,54,3,1,NULL,NULL,NULL,NULL,NULL),(863,55,3,1,NULL,NULL,NULL,NULL,NULL),(864,56,3,1,NULL,NULL,NULL,NULL,NULL),(865,57,3,1,NULL,NULL,NULL,NULL,NULL),(866,58,3,1,NULL,NULL,NULL,NULL,NULL),(867,59,3,1,NULL,NULL,NULL,NULL,NULL),(870,25,3,1,NULL,NULL,NULL,NULL,NULL),(871,63,3,1,NULL,NULL,NULL,NULL,NULL),(872,64,3,1,NULL,NULL,NULL,NULL,NULL),(873,52,4,1,NULL,NULL,NULL,NULL,NULL),(874,61,4,1,NULL,NULL,NULL,NULL,NULL),(875,66,4,1,NULL,NULL,NULL,NULL,NULL),(876,72,4,1,NULL,NULL,NULL,NULL,NULL),(877,73,4,1,NULL,NULL,NULL,NULL,NULL),(878,65,4,1,NULL,NULL,NULL,NULL,NULL),(879,53,4,1,NULL,NULL,NULL,NULL,NULL),(880,54,4,1,NULL,NULL,NULL,NULL,NULL),(881,55,4,1,NULL,NULL,NULL,NULL,NULL),(882,56,4,1,NULL,NULL,NULL,NULL,NULL),(883,57,4,1,NULL,NULL,NULL,NULL,NULL),(884,58,4,1,NULL,NULL,NULL,NULL,NULL),(885,59,4,1,NULL,NULL,NULL,NULL,NULL),(886,25,4,1,NULL,NULL,NULL,NULL,NULL),(887,63,4,1,NULL,NULL,NULL,NULL,NULL),(888,64,4,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `menu_role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `menu_role` with 49 row(s)
--

--
-- Table structure for table `migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `migrations` VALUES (1,'2016_06_01_000001_create_oauth_auth_codes_table',1),(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(4,'2016_06_01_000004_create_oauth_clients_table',1),(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `migrations` with 5 row(s)
--

--
-- Table structure for table `oauth_access_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `oauth_access_tokens` VALUES ('5f3e846d7a2404a401b4d854ae1fa2a6f8b189c1f99e7b321831abee13af0580763d699d6431562b',5,1,'MyApp','[]',0,'2019-07-07 02:45:09','2019-07-07 02:45:09','2020-07-07 09:45:09'),('7904bcba72e0d51180bfb0171c36dc16e47a674001e56c955c1532c50af14abf5463e5ff2630c3a8',19,1,'MyApp','[]',0,'2019-07-07 02:45:45','2019-07-07 02:45:45','2020-07-07 09:45:45'),('dd44fbf7ab5bef0592c8fc3e53ee896dcb43ba0691d24b03df7d5184a5daac0474f3e10cecf2c58b',19,1,'MyApp','[]',0,'2019-07-07 02:45:31','2019-07-07 02:45:31','2020-07-07 09:45:31');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oauth_access_tokens` with 3 row(s)
--

--
-- Table structure for table `oauth_auth_codes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oauth_auth_codes` with 0 row(s)
--

--
-- Table structure for table `oauth_clients`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','8jAPeowBUx3bslzJu9v05dio0F8rqsQgLoCkwIEP','http://localhost',1,0,0,'2019-07-07 02:38:12','2019-07-07 02:38:12'),(2,NULL,'Laravel Password Grant Client','8CwbW78EfV0pX5TdDoJyBlObxQsNYXXC03cMogVJ','http://localhost',0,1,0,'2019-07-07 02:38:12','2019-07-07 02:38:12');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oauth_clients` with 2 row(s)
--

--
-- Table structure for table `oauth_personal_access_clients`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-07-07 02:38:12','2019-07-07 02:38:12');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oauth_personal_access_clients` with 1 row(s)
--

--
-- Table structure for table `oauth_refresh_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `oauth_refresh_tokens` with 0 row(s)
--

--
-- Table structure for table `password_resets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `token` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `password_resets` VALUES ('phong2018@gmail.com','$2y$10$MMb9I9ksUqx4azWHqQLdC.cUSC0n3EUIHpzQluE4UBV4vy7ajFuzq','2019-07-20 10:32:27');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `password_resets` with 1 row(s)
--

--
-- Table structure for table `position`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `ID_Pos` int(11) NOT NULL AUTO_INCREMENT,
  `pos_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `pos_note` int(11) NOT NULL,
  `pos_short` varchar(110) COLLATE utf8_unicode_ci NOT NULL,
  `is_actived` int(11) NOT NULL DEFAULT '0',
  `pos_4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pos_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Pos`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `position` VALUES (1,'Admin / Supervisor',1,'Adm-Sup',0,'null','null','null','null','null'),(2,'Chủ tịch UBND Phường',1,'CTP',0,'null','null','null','null','null'),(6,'Phó chủ tịch UBND Phường',1,'PCTP',0,'null','null','null','null','null'),(7,'Cán bộ công chức',1,'CBCC',0,'null','null','null','null','null'),(24,'Chủ tịch UBND xã',1,'CTX',0,'null','null','null','null','null'),(25,'Phó chủ tịch UBND xã',1,'PCTX',0,'null','null','null','null','null');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `position` with 6 row(s)
--

--
-- Table structure for table `procedure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure` (
  `ID_Procedure` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `ID_Sector` int(11) NOT NULL,
  `procedure_active` int(11) NOT NULL,
  `execution_time` int(11) DEFAULT '0',
  `procedure_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `procedure_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `procedure_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `procedure_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `procedure_9` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Procedure`),
  KEY `ID_Sector` (`ID_Sector`),
  CONSTRAINT `Procedure_ibfk_1` FOREIGN KEY (`ID_Sector`) REFERENCES `sector` (`ID_Sector`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `procedure` VALUES (1,'Đăng ký khai sinh thông thường',1,1,5,'1','1','1','1','1'),(2,'Đăng ký khai sinh cho trẻ em bị bỏ rơi',1,1,0,'1','1','1','1','1'),(5,'Đăng ký khai sinh quá hạn',1,1,2,'1','1','1','1','1'),(14,'Đăng Ký Khai Tử',1,1,0,'1','1','1','1','1'),(15,'Đăng ký khai sinh cho con ngoài giá thú có người nhận là cha',1,1,0,'1','1','1','1','1'),(17,'Đăng ký khai sinh, khai tử cho trẻ chết sơ sinh',1,1,0,'1','1','1','1','1'),(19,'Đăng ký khai tử quá hạn',1,1,0,'1','1','1','1','1'),(20,'Đăng ký việc nhận con',1,1,0,'1','1','1','1','1'),(21,'Giải quyết khiếu nại lần đầu',6,1,0,'1','1','1','1','1'),(22,'Giải quyết tố cáo',6,1,5,'1','1','1','1','1'),(23,'Thành lập nhóm trẻ, lớp mẫu giáo độc lập tư thục',7,1,0,'1','1','1','1','1'),(24,'Sát nhập, chia tách nhóm trẻ, lớp mẫu giáo độc lập tư thục',7,1,0,'1','1','1','1','1'),(25,'Giải thể hoạt động nhóm trẻ, lớp mẫu giáo độc lập tư thục',7,1,0,'1','1','1','1','1'),(26,'Xác nhận đơn vay vốn ngân hàng chính sách xã hội cho thân nhân liệt sỹ',12,1,0,'1','1','1','1','1'),(27,'Xác nhận đơn đề nghị giải quyết chế độ người có công nuôi dưỡng liệt sỹ',1,1,0,'1','1','1','1','1'),(28,'Xác nhận đơn đề nghị giải quyết chế độ tuất cho thân nhân người có công với cách mạng',12,1,0,'1','1','1','1','1'),(29,'Xác nhận đơn đề nghị chứng nhận người có công với cách mạng',12,1,0,'1','1','1','1','1'),(30,'Hòa giải tranh chấp đất đai',14,1,0,'1','1','1','1','1'),(31,'fffff',1,1,NULL,'1','1','1','1','1'),(32,'Cấp sửa đổi, bổ sung Giấy xác nhận đăng ký sản xuất rượu thủ công đẻ bán cho doanh nghiệp có giấy phép sản xuất rượu để chế biến lại',19,1,10,'1','1','1','1','1'),(33,'Cấp số nhà cho Hộ gia đình',20,1,3,'1','1','1','1','1'),(34,'Đăng ký kết hôn lần đầu',1,1,2,'1','1','1','1','1');
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `procedure` with 22 row(s)
--

--
-- Table structure for table `role`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ID_Role` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_active` int(11) NOT NULL,
  `role_4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Role`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `role` VALUES (1,'Quản Trị',1,NULL,NULL,NULL,NULL,NULL),(2,'Giám Sát',1,NULL,NULL,NULL,NULL,NULL),(3,'Nhân Viên',1,NULL,NULL,NULL,NULL,NULL),(4,'Lãnh đạo',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `role` with 4 row(s)
--

--
-- Table structure for table `sector`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sector` (
  `ID_Sector` int(11) NOT NULL AUTO_INCREMENT,
  `sector_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sector_active` int(11) NOT NULL,
  `sector_forGs` int(11) DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `orglv1` int(11) DEFAULT NULL,
  `orglv2` int(11) DEFAULT NULL,
  `sector_4` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_5` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_6` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sector_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Sector`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `sector` VALUES (1,'TƯ PHÁP',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(6,'THANH TRA',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(7,'GIÁO DỤC - ĐÀO TẠO',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(12,'LAO ĐỘNG THƯƠNG BINH & XÃ HỘI',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(14,'ĐỊA CHÍNH - TÀI NGUYÊN MÔI TRƯỜNG',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(15,'TÀI CHÍNH',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(16,'VĂN HÓA - THÔNG TIN',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(17,'NỘI VỤ',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(19,'CÔNG THƯƠNG',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1'),(20,'XÂY DỰNG',1,0,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','1','1','1');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `sector` with 10 row(s)
--

--
-- Table structure for table `setting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=9904 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `setting` VALUES (4489,'config','config_meta_title','HỆ THỐNG QUẢN LÝ HỒ SƠ - ỦY BAN NHÂN PHƯỜNG LINH TRUNG',0),(4490,'config','config_logoadmin_qlp','/photos/1/logo.png',0),(4491,'config','config_logo_qlp','/photos/1/QuochuyVN.png',0),(4496,'config','config_meta_description','Hồ sơ 1 cửa phục vụ quản lý công việc tại Phường',0),(4497,'config','config_dossier_limit','10',0),(6511,'config','config_amthanhcamon','1569064487thank.wav',0),(6512,'config','config_amthanhxinchao','1569064487welcome.wav',0),(9827,'config','config_ks_meta_title','Hệ thống khảo sát hài lòng',0),(9828,'config','config_logoadmin_htks','/photos/1/QuochuyVN.png',0),(9829,'config','config_banner_htks','/photos/1/hoa-sen.png',0),(9830,'config','config_logo_htks','/photos/1/Chrysanthemum.jpg',0),(9835,'config','config_ks_meta_description','Hệ thống khảo sát hài lòng',0),(9836,'config','config_ks_intro_home_htks','<div style=\"background:#c73091;color:white;width:100%;padding:15px\">\r\n<h4><span style=\"font-size:28px;\">Ch&agrave;o mừng Qu&yacute; kh&aacute;ch đến với</span></h4>\r\n\r\n<h2><span style=\"font-size:48px;\">Hệ thống Đ&aacute;nh gi&aacute; Nh&acirc;n vi&ecirc;n</span></h2>\r\n\r\n<p><span style=\"font-size:24px;\">Đ&aacute;nh gi&aacute; n&agrave;y ho&agrave;n to&agrave;n bảo mật, d&ugrave;ng để chấm điểm thi đua&nbsp;v&agrave; v&ocirc; c&ugrave;ng&nbsp;c&oacute; &yacute; nghĩa trong cải thiện Chất lượng Dịch vụ của ch&uacute;ng t&ocirc;i.</span></p>\r\n</div>',0),(9837,'config','config_ks_thankyou_htks','<div style=\"background:#c73091;color:white;width:100%;padding:15px\">\r\n<h4><span style=\"font-size:48px;\">Ho&agrave;n tất Đ&aacute;nh gi&aacute;. </span></h4>\r\n\r\n<h4><span style=\"font-size:36px;\">Ch&uacute;ng t&ocirc;i ch&acirc;n th&agrave;nh cảm ơn qu&yacute; kh&aacute;ch!</span></h4>\r\n</div>',0),(9840,'config','config_time_auto_direct','2',0),(9864,'config','config_gs_meta_title','PHẢN ÁNH TRỰC TUYẾN',0),(9865,'config','config_gs_logoadmin','/photos/shares/QuochuyVN.png',0),(9866,'config','config_gs_banner','/photos/shares/bannerhome.png',0),(9867,'config','config_gs_logo',NULL,0),(9868,'config','config_tencoquan','UBND Quận Thủ Đức',0),(9869,'config','config_diachi','43 Nguyễn Văn Bá, Bình Thọ, Thủ Đức, Hồ Chí Minh',0),(9870,'config','config_sodienthoai','028 3896 6801',0),(9871,'config','config_emailcoquan','vp.thuduc@tphcm.gov.vn',0),(9872,'config','config_gs_meta_description','Hệ thống Giám sát',0),(9873,'config','config_gs_intro_home_htks','<p>Giới thiệu hệ thống</p>',0),(9874,'config','config_gs_thankyou_htks','<p>Trang Cảm ơn</p>',0),(9875,'config','config_dangkythietbidekhaosat','1',0),(9876,'config','config_showeverypage','10',0),(9877,'config','config_gs_imgtype_allow','jpg;jpeg;png;gif;',0),(9878,'config','config_gs_imgsize_allow','10',0),(9879,'config','config_gs_videotype_allow','avi;mp4;3gp;wav;mov;',0),(9880,'config','config_gs_videosize_allow','20',0),(9881,'config','config_orgtosurvey',NULL,0),(9882,'config','config_bacode_symbology','qr',0),(9883,'config','config_barcode-width','100',0),(9884,'config','config_barcode-height','100',0),(9885,'config','config_barcode-padding','1',0),(9886,'config','config_temp_guiemail','10',0),(9887,'config','config_temp_guisms','11',0),(9888,'config','config_temp_biennhanhoso','12',0),(9889,'config','config_temp_chuyenhoso','13',0),(9890,'config','config_mail_protocol','smtp',0),(9891,'config','config_mail_parameter',NULL,0),(9892,'config','config_mail_smtp_hostname','smtp.gmail.com',0),(9893,'config','config_mail_smtp_username','nhakhoahoc.net@gmail.com',0),(9894,'config','config_mail_smtp_password','kzfimgzsaklzkwdb',0),(9895,'config','config_mail_smtp_port','587',0),(9896,'config','config_mail_encryption','tls',0),(9897,'config','config_mail_smtp_timeout','5',0),(9898,'config','config_sms_provider','esms.vn',0),(9899,'config','config_esmsvn_api_key','4E3E517F46E713FEC2F8AD8BE2D9D2',0),(9900,'config','config_esmsvn_secret_key','6C93319C7985AE7B2250B9042C10D6',0),(9901,'config','config_maintenance','0',0),(9902,'config','config_radiotimebackup','hourlyAt',0),(9903,'config','config_backup_time','hourlyAt,17,',0);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `setting` with 55 row(s)
--

--
-- Table structure for table `task_appointed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_appointed` (
  `ID_Task` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Dossier` int(11) NOT NULL,
  `ID_Staff` int(11) NOT NULL,
  `ID_Manager` int(11) DEFAULT NULL,
  `id_nguoithem` int(11) NOT NULL DEFAULT '0',
  `isAutoAppointed` tinyint(1) DEFAULT NULL,
  `viewed_notice` int(11) NOT NULL DEFAULT '0',
  `appointed_time` datetime NOT NULL,
  `task_7` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_8` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_9` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_10` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task_11` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Task`),
  KEY `ID_Staff` (`ID_Staff`),
  KEY `ID_Dossier` (`ID_Dossier`),
  CONSTRAINT `Task_Appointed_ibfk_2` FOREIGN KEY (`ID_Dossier`) REFERENCES `dossier` (`ID_Dossier`),
  CONSTRAINT `task_appointed_ibfk_1` FOREIGN KEY (`ID_Staff`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_appointed`
--

LOCK TABLES `task_appointed` WRITE;
/*!40000 ALTER TABLE `task_appointed` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `task_appointed` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `task_appointed` with 0 row(s)
--

--
-- Table structure for table `template`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `temp_name` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp_note` text COLLATE utf8_unicode_ci,
  `temp_path` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp_bladeview` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp_order` int(11) DEFAULT '0',
  `temp_parameter` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `template` VALUES (10,'Mẫu gửi Email khi nhận hồ sơ','Mẫu gửi Email nhận HS','/views/admin/temp/temp10.blade.php','admin.temp.temp10',1,'{{$BarCode}} {{$MaHoSo}} {{$TenHoSo}} {{$ChuHoSo}} {{$DiaChiChuHoSo}} {{$EmailChuHoSo}} {{$DienThoaiChuHoSo}} {{$ZaloChuHoSo}} {{$NgayNhanHoSo}} {{$NgayTraHoSo}} {{$TenCoQuan}} {{$DiaChiCoQuan}} {{$DienThoaiCoQuan}} {{$EmailCoQuan}} {{$MoTaCoQuan}}','2019-06-01 10:31:50','2019-08-12 14:23:18'),(11,'Mẫu gửi tin nhắn khi nhận hồ sơ','Mẫu gửi tin nhắn nhận HS','/views/admin/temp/temp11.blade.php','admin.temp.temp11',NULL,'{{$BarCode}} {{$MaHoSo}} {{$TenHoSo}} {{$ChuHoSo}} {{$DiaChiChuHoSo}} {{$EmailChuHoSo}} {{$DienThoaiChuHoSo}} {{$ZaloChuHoSo}} {{$NgayNhanHoSo}} {{$NgayTraHoSo}} {{$TenCoQuan}} {{$DiaChiCoQuan}} {{$DienThoaiCoQuan}} {{$EmailCoQuan}} {{$MoTaCoQuan}}','2019-06-01 10:32:47','2019-06-11 07:11:01'),(12,'Mẫu biên nhận hồ sơ','Mẫu biên nhận hồ sơ','/views/admin/temp/temp12.blade.php','admin.temp.temp12',NULL,'{{$BarCode}} {{$MaHoSo}} {{$TenHoSo}} {{$ChuHoSo}} {{$DiaChiChuHoSo}} {{$EmailChuHoSo}} {{$DienThoaiChuHoSo}} {{$ZaloChuHoSo}} {{$NgayNhanHoSo}} {{$NgayTraHoSo}} {{$TenCoQuan}} {{$DiaChiCoQuan}} {{$DienThoaiCoQuan}} {{$EmailCoQuan}} {{$MoTaCoQuan}}','2019-06-01 10:33:10','2019-06-09 17:13:50'),(13,'Mẫu chuyển Hồ Sơ','Mẫu chuyển Hồ Sơ','/views/admin/temp/temp13.blade.php','admin.temp.temp13',NULL,'{{$BarCode}} {{$MaHoSo}} {{$TenHoSo}} {{$ChuHoSo}} {{$DiaChiChuHoSo}} {{$EmailChuHoSo}} {{$DienThoaiChuHoSo}} {{$ZaloChuHoSo}} {{$NgayNhanHoSo}} {{$NgayTraHoSo}} {{$TenCoQuan}} {{$DiaChiCoQuan}} {{$DienThoaiCoQuan}} {{$EmailCoQuan}} {{$MoTaCoQuan}}','2019-06-01 10:33:48','2019-06-02 10:56:11');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `template` with 4 row(s)
--

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Staff` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DoB` datetime NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zalo_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_Position` int(11) NOT NULL,
  `ID_Role` int(11) NOT NULL,
  `user_IdOrg` int(11) DEFAULT NULL,
  `isActived` int(11) NOT NULL DEFAULT '1',
  `user_level` int(11) NOT NULL DEFAULT '3',
  `chucdanh` text COLLATE utf8_unicode_ci,
  `chonkhaosat` int(11) DEFAULT '0',
  `createdby` int(11) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  `orglv1` int(11) DEFAULT NULL,
  `orglv2` int(11) DEFAULT NULL,
  `user_15` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_16` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_17` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_18` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_19` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `ID_Role` (`ID_Role`),
  KEY `ID_Position` (`ID_Position`),
  KEY `user_IdOrg` (`user_IdOrg`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ID_Role`) REFERENCES `role` (`ID_Role`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`ID_Position`) REFERENCES `position` (`ID_Pos`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `users` VALUES (1,'BHC-000','admin@gmail.com','$2y$10$PErLIJitR5m8Gw.IVp8t6OSHrqxfMf5zcWi/hoJpGeswr8lvs1bem','Admin','1970-02-13 00:00:00',1,'0904585845','0904585845','156 Nhật Tảo, phường 8, quận 10, TPHCM','/photos/shares/QuochuyVN.png',1,1,9,1,1,'admin',0,NULL,NULL,1,'2020-03-22 13:56:50',9,0,'','','','','','uu0bT9CVa55Hmrr0mJUALiblAj6HtdvfOWmGQevLilDkJdFCvnJ2GCJ5pezr'),(2,'BHC-001','phong2018@gmail.com','$2y$10$5PO7ZQUi1TcYCESV87dQD.W8Ntkq58ByyjTa0IMzulornU/zUKKNu','Supervisor_BinhChieu','2000-01-01 00:00:00',1,'0904585845','0904585845','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1admin.png',1,2,16,1,2,'Giám sát phường Bình Chiểu',0,1,'2019-11-18 09:12:15',NULL,NULL,9,16,'','','','','',NULL),(5,'PBC-001','yen@gmail.com','$2y$10$/Ta4fpqh77YuK0blYnnY8eXVS0.OWIdV4OJXOLuNC8zDKFbB4Ludm','Trương Hồng Yến','1985-06-29 00:00:00',0,'028.38970030','0904585845','Đường Tỉnh Lộ 43, Phường Bình Chiểu, Quận Thủ Đức, TP Hồ Chí Minh','/avatars/1Yen_th.jpg',2,4,16,1,2,'Chủ tịch UBND phường',1,NULL,NULL,NULL,NULL,9,16,'','','','','','iXpRgb6gMA16cDFh6FtO3q7JFdxC8sQMBHgem4JqLME0Pl9es8pRS60L5PHF'),(6,'PBC-002','nha@gmail.com','$2y$10$MF3uEWTJliY3w3Uw.DYXIucVnyMBM79Jkm9dr.Dci6zH72vlsFPWC','Châu Thanh Nhã','1999-04-03 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/photos/1/avatar/1Nha_ct.jpg',6,4,16,1,2,'Phó chủ tịch UBND phường',1,NULL,NULL,NULL,NULL,9,16,'','','','','','Orx0qRZRacKjgZSwgIUevnClZaqfHyrRaSZanEUjYDibAz1mxDWpn7SC32kQ'),(24,'PBC-003','xuan@gmail.com','$2y$10$TUkZdkdktqjNwu0N6.Y8.uk1S34/ETWg6mXsvY2UwxBDJAPUJjMUW','Võ Phùng Xuân','2000-02-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Xuan_vp.jpg',6,4,16,1,3,'Phó chủ tịch UBND phường',1,NULL,NULL,NULL,NULL,9,16,'','','','','',NULL),(25,'PBC-004','ngan@gmail.com','$2y$10$czQoUvgrPSloX1yU/XyCpueupzfXMHSnp6mn7znVYo9hdWKZ.caDi','Nguyễn Thị Bích Ngân','2000-02-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Ngan_ntb.jpg',6,4,16,1,1,'Phó chủ tịch UBND phường',1,NULL,NULL,NULL,NULL,9,16,'','','','','',NULL),(26,'PBC-005','thuy@gmail.com','$2y$10$ZBeutO4c6N.B8Jpix0H/c.T296as09XCBxuYGlXwuCT/Tmf6tXYey','Võ Thị Thanh Thủy','2000-02-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Thuy_vtt.jpg',6,4,16,1,3,'Phó chủ tịch UBND phường',1,NULL,NULL,NULL,NULL,9,16,'','','','','',NULL),(27,'PBC-006','diem@gmail.com','$2y$10$Mw8uZmYycKDGGifzgk9g3.GIpE661aNmn/viUjTW9GVz/fK3zYLKW','Nguyễn Thị Nhã Diễm','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/photos/1/Binh_chieu/Diem_ntn.jpg',7,3,10,1,2,'Nhân viên Hộ tịch',1,NULL,NULL,1,'2019-12-15 14:32:49',9,10,'','','','','',NULL),(28,'PBC-007','le@gmail.com','$2y$10$SUkjVmdhaWxd/eHDz0QnLOmncRf7U9EoPWPsHSVhrvYynhd/zP6SG','Phạm Thị Hồng Lê','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Le_pth.jpg',7,3,10,1,2,'Nhân viên Tư pháp',1,NULL,NULL,2,'2020-03-22 15:14:11',9,10,'','','','','',NULL),(30,'PBC-009','thao@gmail.com','$2y$10$8VVLtoJp5DhZ/VXGTDBI7uVMnYjWuZ6kAHpuoiJxill6FWPXvEhAi','Nguyễn Thị Thu Thảo','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Thao_ntt.jpg',7,3,10,1,3,'Sao y chứng thực',1,NULL,NULL,NULL,NULL,9,10,'','','','','',NULL),(31,'PBC-010','duc@gmail.com','$2y$10$.tebvdy2zBcts78YzWTdWeRXYWyuuMJwuL9.FMIcFZIJ2IPzBbz5K','Đào Minh Đức','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Duc_dm.jpg',7,3,10,1,2,'Sao y chứng thực',1,NULL,NULL,NULL,NULL,9,10,'','','','','',NULL),(32,'PBC-011','truc@gmail.com','$2y$10$3wik9P.DE8eeHBMjv4baLuH52IUPjmtLourLP7XDEfYpii1HlcW8K','Phạm Phương Trúc','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Truc_pp.jpg',7,3,10,1,3,'Sao y chứng thực',1,NULL,NULL,NULL,NULL,9,10,'','','','','',NULL),(33,'PBC-012','binh@gmail.com','$2y$10$dqBN3laGbvCGcDU/y7XV5eG1bqq2Lt.6O3FNzv0aY92.FaV6cRmfW','Đinh Trọng Bình','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/photos/shares/Binh_chieu/Binh_dt.jpg',7,3,10,1,2,'Sao y chứng thực',1,NULL,NULL,NULL,NULL,9,10,'','','','','',NULL),(34,'PBC-013','tien@gmail.com','$2y$10$0bK6XgUs/AloN7cpvRJg.ul9sDrcBLmpPEBwa6tWhd7iXqgjwhOEO','Phan Thị Mỹ Tiên','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Tien_ptm.jpg',7,3,10,1,3,'Sao y chứng thực',1,NULL,NULL,NULL,NULL,9,10,'','','','','',NULL),(35,'PBC-014','diemct@gmail.com','$2y$10$ALX13K0LoeUOeJKwFFn2OOXUpHhWqzElOaFNxmlSiF11jTZe8u0rq','Cao Thị Tuyết Diễm','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Diem_ctt.jpg',7,3,30,1,3,'Ủy nhiệm thu thuế',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(36,'PBC-015','xuankm@gmail.com','$2y$10$XC2kqa6ZJ51LU1nYyNYit.pzWl.bkNjKc1FTGgdAO5J1QCaOzHTvK','Kiều Minh Xuân','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Xuan_km.jpg',7,3,30,1,3,'Sản xuất kinh doanh - Môi trường',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(37,'PBC-016','nguyen@gmail.com','$2y$10$TQUqG5f4JSQcbsWp9P7inuHWShiynXu4FdhVfl2oOx8uUoCI6DSTi','Phạm Văn Nguyễn','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Nguyen_pv.jpg',7,3,30,1,3,'Sản xuất kinh doanh - Môi trường',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(38,'PBC-017','tam@gmail.com','$2y$10$7QLnCfF4O6XZbJOPLGYBueXLzeK4hMrw5C9eRUxxNdb01KDgnX/WW','Nguyễn Ngọc Tâm','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Tam_nn.jpg',7,3,30,1,3,'Sản xuất kinh doanh - Môi trường',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(39,'PBC-018','son@gmail.com','$2y$10$LO/xKbSgkO9n4nlIlz1kre/bILZtJB/Bfdgc3bU4JODUSXkQn2mvC','Huỳnh Thanh Sơn','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Son_ht.jpg',7,3,30,1,3,'Địa chính - xây dựng',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(40,'PBC-019','nam@gmail.com','$2y$10$yYavdh.uChqujulI7SePmegBpDK1kMFCHWmc0d78Vei4d0iBB9iQK','Nguyễn Trung Nam','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Nam_nt.jpg',7,3,30,1,3,'Địa chính - xây dựng',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(41,'PBC-020','sang@gmail.com','$2y$10$lZtfBmGxiU9PEREX0OCfYu4i81sQ9Ikl1ODK44nOgO176tp6kMF02','Lương Tuấn Sang','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Sang_lt.jpg',7,3,30,1,3,'Địa chính - xây dựng',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(42,'PBC-021','mai@gmail.com','$2y$10$8j5b1l0f61dG/WczzUwFEOJDmf.iQRezLd0i53PGn/SY4JmKrMBim','Trần Thị Ngọc Mai','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Mai_ttn.jpg',7,3,30,1,3,'Địa chính - xây dựng',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(43,'PBC-021','tuan@gmail.com','$2y$10$OFxROwW0KNj7p8ufRpWeC.aS.6K6Jh2APVS1lsnRA9ebgD0KHvHV.','Trần Anh Tuấn','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Tuan_ta.jpg',7,3,30,1,3,'Địa chính - xây dựng',1,NULL,NULL,NULL,NULL,9,30,'','','','','',NULL),(44,'PBC-023','anh@gmail.com','$2y$10$xfRDo/kyBQr7a/9S9c8Xsubopob1Ewb0FcIsJcxOTNwE6Q4k9WehO','Khổng Thị Kim Anh','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Anh_ktk.jpg',7,3,11,1,3,'Bình đẳng giới - Trẻ em',1,NULL,NULL,NULL,NULL,9,11,'','','','','',NULL),(45,'PBC-024','linh@gmail.com','$2y$10$jwoC17SnF4c/wHUkM7CRoOdwafvTXugledzuzL/l.D1pBig3imPku','Đỗ Thị Thùy Linh','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Linh_dtt.jpg',7,3,11,1,3,'Lao động thương binh và Xã hội',1,NULL,NULL,NULL,NULL,9,11,'','','','','',NULL),(46,'PBC-025','trang@gmail.com','$2y$10$v9g6Ww/BjTIaHrVFYiEu1ORsgRpMXxJUQM24LbO86mFEpPzQKfPjm','Nguyễn Thị Thùy Trang','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Trang_ntt.jpg',7,3,11,1,3,'Giảm nghèo bền vững',1,NULL,NULL,NULL,NULL,9,11,'','','','','',NULL),(47,'PBC-026','duong@gmail.com','$2y$10$RPc3Qft.gfO7GmOm7eoodOFaWPWfpz5m.figFumkH7IuNoKF0Sv9K','Lê Đình Dương','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Blank_Employee.jpg',7,3,11,1,3,'Phòng, chống Tệ nạn xã hội',1,NULL,NULL,NULL,NULL,9,11,'','','','','',NULL),(48,'PBC-027','huong@gmail.com','$2y$10$0VBB7Jlq2ycHFM0dWKFqYui6kJmi85Q0sMSVnhrjvD7OE24YbCd6W','Nguyễn Thị Quý Hương','2000-01-01 00:00:00',0,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Huong_ntq.jpg',7,3,11,1,3,'Văn hóa thông tin',1,NULL,NULL,NULL,NULL,9,11,'','','','','',NULL),(49,'PBC-028','kiet@gmail.com','$2y$10$8uDaADxjh3WqLoqcnjQivuSZbuZcHUrSTXQJNblajkMMdclAZjlUu','Trần Võ Tuấn Kiệt','2000-01-01 00:00:00',1,'02838970030','02838970030','934 Tỉnh lộ 43, Quận Thủ Đức, Tp. HCM','/avatars/1Kiet_tvt.jpg',7,3,11,1,3,'Văn hóa thông tin - Thể thao',1,NULL,NULL,NULL,NULL,9,11,'','','','','',NULL),(50,'XQD_000','supervisor_quiduc@gmail.com','$2y$10$CMOo.HKPhoVdfuXuwy.jc.LYIiB6Sz9rD44D7h2ddFi/n3FBSE/Ni','Supervisor_QuiDuc','2000-01-01 00:00:00',1,'02837790197','02837790197','B3/24 ấp 2 Qui Đức, Huyện Bình Chánh, Tp. HCM','/photos/1/Qui_duc/admin.png',1,2,31,1,3,'Giám sát Qui Đức',0,NULL,NULL,NULL,NULL,31,0,'','','','','',NULL),(51,'XQD_0001','phuong_quiduc@gmail.com','$2y$10$YbE6yrUgW19PQo7IzAh7G.Q.6fzAQbC9QH4dHgvxXYfGtK265njIO','Khưu Thị Diễm Phượng','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',24,4,32,1,2,'Chủ tịch UBND xã',1,NULL,NULL,NULL,NULL,31,32,'','','','','',NULL),(52,'XQD_0002','yen_quiduc@gmail.com','$2y$10$6Ct9IubS3IJiGtlh2KvEfeaPKuYBKuvpl5x1cfhplKjcL0axsfiPa','Nguyễn Thị Hồng Yến','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',25,4,32,1,2,'Phó Chủ tịch UBND xã',1,NULL,NULL,NULL,NULL,31,32,'','','','','',NULL),(53,'XQD_0003','ha_quiduc@gmail.com','$2y$10$5j89vaVd1VKVpVB3uPnqqu7kr78oY1tGbqa1I.X9h3T3vhpJowOyO','Nguyễn Thị Hồng Hà','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',25,4,32,1,2,'Phó Chủ tịch UBND xã',1,NULL,NULL,NULL,NULL,31,32,'','','','','',NULL),(54,'XQD_0004','linh_quiduc@gmail.com','$2y$10$8emFfR/jF4e6hY6Uq4Eyru/Ue38eNLdtFMoKhWZzD1Olp1gkZkalG','Dương Công Duy Linh','2000-01-01 00:00:00',1,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Linh_dcd.jpg',7,3,34,1,2,'Công chức Tư pháp – Hộ tịch',1,NULL,NULL,50,'2020-03-22 15:17:37',31,34,'','','','','',NULL),(55,'XQD_0005','son_quiduc@gmail.com','$2y$10$yGnW8J/GICfhPXO7BvQd3OfM8dqHqm7.R1li9vzx4D3/oetB0IgKa','Võ Thái Sơn','2000-01-01 00:00:00',1,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Son_vt.jpg',7,3,33,1,2,'Công chức Tư pháp – Hộ tịch',1,NULL,NULL,NULL,NULL,31,33,'','','','','',NULL),(56,'XQD_0006','han_quiduc@gmail.com','$2y$10$ZTov9nsI53PXpdG34oAqKuBnkVY23JQkS2cddA/wzdnOJEkFYiWpy','Nguyễn Thị Hồng Hận','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Han_nth.jpg',7,3,33,1,2,'Công chức Văn phòng-Thống kê',1,NULL,NULL,NULL,NULL,31,33,'','','','','',NULL),(57,'XQD_0007','thi_quiduc@gmail.com','$2y$10$u/ba8SHFWgua/B7uqvOOxOqXBnEdMwkBgmNzZOb0sMIMlHddsrYvO','Nguyễn Thị Kim Thi','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Thi_ntk.jpg',7,3,33,1,2,'Cán bộ Văn thư – Lưu trữ',1,NULL,NULL,NULL,NULL,31,33,'','','','','',NULL),(58,'XQD_0013','lien_quiduc@gmail.com','$2y$10$lwrqOgpSMtDZFsbcRQcLCO6VeAVdRh/DwwEMZ.RbhQnbkK/zCAimm','Ngô Thị Hồng Liên','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/shares/Qui_duc/Lien_nth.jpg',7,3,35,1,2,'Cán bộ Địa chính – Xây dựng',1,NULL,NULL,NULL,NULL,31,35,'','','','','',NULL),(59,'XQD_0008','tuan_quiduc@gmail.com','$2y$10$a2CJ7O2h9tmUpjg1.7cq9uEa9AdI6fUgm3Ndmmq6HuDBrTzSlsgKq','Mai Văn Tuấn','2000-01-01 00:00:00',1,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',7,3,34,1,2,'Công chức Văn hóa - Xã hội',1,NULL,NULL,NULL,NULL,31,34,'','','','','',NULL),(60,'XQD_0009','cuong_quiduc@gmail.com','$2y$10$PIulqIwNLlEpnHT1CykLVe0mLWWXO93z4fnuHtohuRyVl6DxvXabe','Nguyễn Thị Kim Cương','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',7,3,34,1,2,'Công chức Văn hóa - Xã hội',1,NULL,NULL,NULL,NULL,31,34,'','','','','',NULL),(61,'XQD_0010','thu_quiduc@gmail.com','$2y$10$f5sFYiIq2/gd7lp2mBdd8OB7rqn5iX1Cntehcqa7X4Mr8inh8p3cC','Trương Thị Ngọc Thu','2000-10-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',7,3,34,1,2,'Cán bộ Lao động Thương binh & Xã hội',1,NULL,NULL,NULL,NULL,31,34,'','','','','',NULL),(62,'XQD_0011','trinh_quiduc@gmail.com','$2y$10$0uvF6uFa.7R9Mf/V4YZiEOO8ErPXcUwoR0g0wH8DWBFBRPtQhYSOK','Nguyễn Thị Huyền Trinh','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Trinh_nth.jpg',7,3,34,1,2,'Cán bộ Dân số Gia đình & Trẻ em',1,NULL,NULL,NULL,NULL,31,34,'','','','','',NULL),(63,'XQD_0012','thanh_quiduc@gmail.com','$2y$10$Ifs.9JKk9BKzK5iGXuMCouBij3r.ASHvcYUwVGFQRBWuuneKVjvhi','Phạm Võ Minh Thành','2000-01-01 00:00:00',1,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',7,3,35,1,2,'Cán bộ phụ trách kinh tế',1,NULL,NULL,NULL,NULL,31,35,'','','','','',NULL),(66,'XQD_0014','diep_quiduc@gmail.com','$2y$10$3y9v1m6Pt32R0nBa47hoEe273BgDe2cl0xm.B/cRU71iijtQEG1n6','Trần Ngọc Điệp','2000-01-01 00:00:00',0,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',7,3,35,1,3,'Công chức Địa chính-Xây dựng -Nông nghiệp & Môi trường',1,NULL,NULL,NULL,NULL,31,35,'','','','','',NULL),(67,'XQD_0015','an_quiduc@gmail.com','$2y$10$bXynteXNG0vf3ukH.uTAbel3UvN.Gf39Sna1/WYXI8XPLLlLii.Hi','Võ Tuấn An','2000-01-01 00:00:00',1,'02837790197','02837790197','B3/24 ấp 2, xã Qui Đức, huyện Bình Chánh','/photos/1/Qui_duc/Blank_Employee.jpg',7,3,35,1,3,'Công chức Địa chính-Xây dựng -Nông nghiệp & Môi trường',1,NULL,NULL,NULL,NULL,31,35,'','','','','',NULL),(68,'XTLT_0000','supervisor_trunglapthuong@gmail.com','$2y$10$2u4h5DW3cB0kAiYBlTw/luxDPsT7T7vRxJh5SVRQUE.MGM/beXXRO','Suppervisor_TrungLapThuong','2000-01-01 00:00:00',1,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/1/admin.png',1,2,36,1,3,'Giám sát Trung Lập Thượng',0,NULL,NULL,NULL,NULL,36,0,'','','','','',NULL),(69,'XTLT_0001','minh_trlapthuong@gmail.com','$2y$10$lBy7L0XvwNer1.SpV1WQiO839mj4qp7iWzLvD25v.meNepcnJwTwK','Lý Văn Minh','2000-01-01 00:00:00',1,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/shares/TLap_thuong/Minh_lv.jpg',7,3,37,1,2,'Công chức Tư Pháp - Hộ tịch',1,NULL,NULL,NULL,NULL,36,37,'','','','','',NULL),(70,'XTLT_002','tong_trlapthuong@gmail.com','$2y$10$W/zo5CH/u81u5hfMoJem8eKXTNVHHa5rUEBJW6w5lH.bxFvcawT9S','Lương Bá Tòng','2000-01-01 00:00:00',1,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/shares/TLap_thuong/Tong_lb.jpg',7,3,37,1,2,'Công chức Tư Pháp - Hộ tịch',1,NULL,NULL,NULL,NULL,36,37,'','','','','',NULL),(71,'XTLT_003','phong_trlapthuong@gmail.com','$2y$10$d.USL8hE0s.y1Sql8spVYeDE9JHSsBUYelCXr6O4dSjozS/umu3Ai','Ngô Văn Phong','2000-01-01 00:00:00',1,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/shares/TLap_thuong/Phong_nv.jpg',7,3,37,1,2,'Công chức Địa chính - NN - XD  và môi trường',1,NULL,NULL,NULL,NULL,36,37,'','','','','',NULL),(72,'XTLT_004','hon_trlapthuong@gmail.com','$2y$10$uyt1tJZtyIRIrJbaSRv8l.JaSVg9/zdrXMKbCg0iuv8Jrjym5L8kO','Huỳnh Văn Họn','2000-01-01 00:00:00',1,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/shares/TLap_thuong/Hon_hv.jpg',7,3,37,1,2,'Công chức Văn hóa - Xã hội',1,NULL,NULL,NULL,NULL,36,37,'','','','','',NULL),(73,'XTLT_005','huan_trlapthuong@gmail.com','$2y$10$7hMPsmQaXRTAllc6WT4cEuDyIPqxUHRF5dUzFreyUoywTc8cAzVQy','Nguyễn Hoàng Huân','2000-01-01 00:00:00',1,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/shares/TLap_thuong/Huan_nh.jpg',7,3,37,1,2,'Công chức Văn phòng - Thống kê',1,NULL,NULL,NULL,NULL,36,37,'','','','','',NULL),(74,'XTLT_006','gam_trlapthuong@gmail.com','$2y$10$YYEA.LYn8yBf6jBW1w/SpulAx3WrA2RM0iQBCjDXxUoo09R6uL2L2','Nguyễn Thị Hồng Gấm','2000-01-01 00:00:00',0,'02838926786','02838926786','Trung Lập, Trung Lập Thượng, Củ Chi, Hồ Chí Minh','/photos/shares/TLap_thuong/Gam_nth.jpg',7,3,37,1,2,'Cán bộ Lao động Thương binh - Xã hội',1,NULL,NULL,NULL,NULL,36,37,'','','','','',NULL),(75,'P2BT_000','supervisor_p2bt@gmail.com','$2y$10$uSBd8RpYqOYS4MOm38lMh.lOqPX5MS06GzsctBQsGGSytQIXsisTi','Supervisor_P2BT','2000-01-01 00:00:00',1,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/admin.png',1,2,40,1,2,'Giám sát P2BT',0,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(76,'P2BT_001','quyen_p2bt@gmail.com','$2y$10$hpTsJzcgEoBxkJsf30Exm.UkTkzcpvvuw8OananUN6PmvsZ/CmPCe','Phan Mai Quyên','2000-01-01 00:00:00',0,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/Phuong2_BT/Quyen_pm.jpg',7,3,40,1,2,'Công chức Địa chính - Xây dựng - Đô thị - Môi trường',1,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(77,'P2BT_002','phung_p2bt@gmail.com','$2y$10$DO/ZZmh2bMZ29a0Wo7tZHOaxWQbIKcNzFgYO.SLdu0RHfKBwcYkfm','Trương Thị Ngọc Phụng','2000-01-01 00:00:00',0,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/Phuong2_BT/Phung_ttn.jpg',7,3,40,1,2,'Công chức Tư pháp - Hộ tịch',1,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(78,'P2BT_003','xuan_p2bt@gmail.com','$2y$10$bmZm2T03nw4CjfIz3FrumezbU72eP9NE9DKaehlJipw7BeAKBt1/W','Lâm Tuyết Xuân','2000-01-01 00:00:00',0,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/Phuong2_BT/Xuan_lt.jpg',7,3,40,1,2,'Công chức Tư pháp - Hộ tịch',1,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(79,'P2BT_004','van_p2bt@gmail.com','$2y$10$4uDM0O5BUQnLB3btUQ4mauAzRCXOXh/TsCFejI.voMrz2tFOEnNWC','Huỳnh Thị Thanh Vân','2000-01-01 00:00:00',0,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/Phuong2_BT/Van_htt.jpg',7,3,40,1,2,'Chuyên trách Lao động - Thương binh - Xã hội',1,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(80,'P2BT_005','hanh_p2bt@gmail.com','$2y$10$UDHvy1jApoAK7B0zme/3U.qeIoZpc6fWc6Z1h9e/9QFML8GRhL74q','Phan Thị Hồng Hạnh','2000-01-01 00:00:00',0,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/Phuong2_BT/Hanh_pth.jpg',7,3,40,1,2,'Công chức Văn phòng - Thống kê',1,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(81,'P2BT_006','quang_p2bt@gmail.com','$2y$10$qc1cTMfrkD4G7sXYp.QX4eOoNllLVlP5jDNdG3l8dsfXoRfPu0kx6','Đàm Nhật Quang','2000-01-01 00:00:00',1,'0288412171','0288412171','14 Phan Bội Châu, Phường 14, Bình Thạnh','/photos/shares/Phuong2_BT/Quang_dm.jpg',7,3,40,1,2,'Công chức Địa chính - Xây dựng - Đô thị - Môi trường',1,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL),(82,'1234','phong1@gmail.com','$2y$10$9nnBc0aUQk7mzxzFVglFN.gSju.g/XK6HF059rfYrUZXoc9FoTit6','pong','2019-11-23 00:00:00',1,'111','11','sdfasdf',NULL,7,3,35,1,2,'chuc',0,1,'2019-11-18 09:24:53',NULL,NULL,31,35,'','','','','',NULL),(86,'anh11111','anh1@gmail.com','$2y$10$gMATaTGXqCCrLhFyEbu6COxkZTbR.FRfyqwCvFIGcyww7zd4S1ZFm','anh1111','2019-11-13 00:00:00',0,'111','11','admi','/photos/shares/Qui_duc/Han_nth.jpg',7,3,16,1,2,'đaf',0,2,'2019-11-18 09:39:18',2,'2019-11-18 09:40:13',9,16,'','','','','',NULL),(87,'aaa','g1@gmail.com','$2y$10$m0rCMebEgSgAUcx8qQ.D9.kVffLMBSxpgmi4XPC0TWa6xBYCSC6zm','aa','2019-12-11 00:00:00',1,'111','111','aa',NULL,7,3,16,1,2,'111',0,1,'2019-12-15 11:01:42',1,'2019-12-15 11:13:19',9,16,'','','','','',NULL),(88,'copy-aaa','1576383383-g1@gmail.com','$2y$10$m0rCMebEgSgAUcx8qQ.D9.kVffLMBSxpgmi4XPC0TWa6xBYCSC6zm','copy-aa','2019-12-11 00:00:00',1,'111','111','aa','',7,3,16,0,2,'111',0,1,'2019-12-15 11:16:23',NULL,NULL,9,16,NULL,NULL,NULL,NULL,NULL,NULL),(89,'copy-aaa','1576383566-g1@gmail.com','$2y$10$m0rCMebEgSgAUcx8qQ.D9.kVffLMBSxpgmi4XPC0TWa6xBYCSC6zm','copy-aa','2019-12-11 00:00:00',1,'111','111','aa','',7,3,16,0,2,'111',0,1,'2019-12-15 11:19:26',NULL,NULL,9,16,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `users` with 64 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Sun, 22 Mar 2020 15:23:56 +0700
