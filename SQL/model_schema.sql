-- MySQL dump 10.13  Distrib 5.6.43-84.3, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: app
-- ------------------------------------------------------
-- Server version	5.6.43

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `adr_addr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adr_address1` varchar(120) NOT NULL DEFAULT '',
  `adr_address2` varchar(120) DEFAULT NULL,
  `adr_address3` varchar(120) DEFAULT NULL,
  `adr_city` varchar(100) NOT NULL DEFAULT '',
  `adr_state` varchar(100) NOT NULL DEFAULT '',
  `adr_country` varchar(100) NOT NULL DEFAULT '',
  `adr_zip_code` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`adr_addr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20027 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`adr_addr_id`, `adr_address1`, `adr_address2`, `adr_address3`, `adr_city`, `adr_state`, `adr_country`, `adr_zip_code`) VALUES (20009,'9844 N MacArthur Blvd','Apt 2307',NULL,'Irving','Texas','US','75063'),(20014,'9844 N MacArthur Blvd','Apt 2307',NULL,'Irving','Texas','US','75063'),(20015,'3499 Sandy Street',NULL,NULL,'Plano','Texas','US','75023'),(20016,'Waterview Parkway',NULL,NULL,'Dallas','Texas','United States of America (USA)','75252'),(20018,'1 BBQ Blvd',NULL,NULL,'Cow Town','Texas','United States of America (USA)','75252'),(20019,'17217 Waterview Parkway Suite 1.202Y',NULL,NULL,'Dallas','Texas','United States of America (USA)','75252'),(20020,'aaaaaa','vvvvvvvvv',NULL,'dallas','NY','US','222222'),(20021,'ggg','fdgdf',NULL,'davcx','vcx','US','222222'),(20022,'dsa','dsa',NULL,'s','s','s','s'),(20023,'hnn','hnh',NULL,'fds','dsfs','fds','dsfs'),(20024,'dsa','dsa',NULL,'ewq','ew','ewq','wqeqw'),(20025,'22','dsa',NULL,'12dsa','das','w','w'),(20026,'ooooo','76767876h',NULL,'dsassssss','dsa','dsa','ccccc');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_plans`
--

DROP TABLE IF EXISTS `alert_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_plans` (
  `al_plan_id` int(24) unsigned NOT NULL AUTO_INCREMENT,
  `al_active_flag` tinyint(4) NOT NULL DEFAULT '1',
  `al_group_id` mediumint(10) unsigned NOT NULL,
  `al_plan_name` varchar(30) NOT NULL DEFAULT 'Default Plan',
  `al_contact_a` varchar(15) NOT NULL DEFAULT '',
  `al_contact_b` varchar(15) DEFAULT '',
  `al_contact_c` varchar(15) DEFAULT '',
  `al_created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `al_created_by` varchar(30) NOT NULL DEFAULT '',
  `al_updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `al_updated_by` varchar(30) NOT NULL DEFAULT '',
  `al_default_plan` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`al_plan_id`),
  KEY `al_group_id` (`al_group_id`),
  CONSTRAINT `alert_plans_ibfk_1` FOREIGN KEY (`al_group_id`) REFERENCES `groups` (`gr_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_plans`
--

LOCK TABLES `alert_plans` WRITE;
/*!40000 ALTER TABLE `alert_plans` DISABLE KEYS */;
INSERT INTO `alert_plans` (`al_plan_id`, `al_active_flag`, `al_group_id`, `al_plan_name`, `al_contact_a`, `al_contact_b`, `al_contact_c`, `al_created_on`, `al_created_by`, `al_updated_on`, `al_updated_by`, `al_default_plan`) VALUES (10,1,10018,'Default Plan','9722089054','','','2018-07-09 17:40:18','Robin undefined','2018-07-09 17:40:18','Robin undefined',1),(11,0,10018,'Robin\'s Plan','9722089054','','','2018-07-19 19:13:21','Robin Gallo','2018-07-19 19:13:28','Robin Gallo',0),(12,1,10018,'Three Amigos','2142823347','2142823883','2147932113','2018-07-19 19:14:14','Robin Gallo','2018-07-20 04:46:07','Robin Gallo',0),(16,1,10021,'System Generated','4697336460','','','2018-08-10 18:46:48','Bill Goff','2018-09-05 13:20:52','Bill Goff',1),(18,0,10023,'System Generated','2147932113','','','2018-08-28 17:48:00','An Bui','2018-10-08 18:14:09','An Bui',1),(19,0,10024,'System Generated','2147932113','','','2018-08-28 17:48:11','An Bui','2018-10-08 18:14:13','An Bui',1),(20,1,10025,'System Generated','2147932113','','','2018-08-28 17:48:19','An Bui','2018-08-28 17:48:19','An Bui',1),(21,0,10026,'System Generated','2147932113','','','2018-08-28 17:48:27','An Bui','2018-10-08 18:14:21','An Bui',1),(22,1,10018,'Vivek Test Plan','6824083273','','','2018-09-26 21:12:24','Robin Gallo','2018-09-26 21:12:24','Robin Gallo',0),(23,1,10027,'System Generated','2147932113','','','2018-10-12 16:40:35','An Bui','2018-10-12 16:40:35','An Bui',1),(24,1,10028,'System Generated','2147932113','','','2018-10-18 15:26:55','An Bui','2018-10-18 15:26:55','An Bui',1),(25,1,10029,'System Generated','2147932113','','','2018-10-23 15:19:01','An Bui','2018-10-23 15:19:01','An Bui',1),(26,0,10030,'System Generated','6824083273','','','2019-02-05 19:38:10','John Tauch','2019-02-05 19:43:22','John Tauch',1),(27,0,10031,'System Generated','2147932113','','','2019-02-05 19:43:46','An Bui','2019-02-05 19:44:38','An Bui',1),(28,1,10032,'System Generated','2147932113','','','2019-02-05 19:45:04','An Bui','2019-02-05 19:45:04','An Bui',1),(29,1,10033,'System Generated','1111111111','','','2019-05-15 08:52:08','Bill Goff','2019-05-15 08:52:08','Bill Goff',1),(30,1,10034,'System Generated','1111111111','','','2019-05-15 09:01:10','Bill Goff','2019-05-15 09:01:10','Bill Goff',1),(31,1,10035,'System Generated','1111111111','','','2019-05-15 09:02:48','Bill Goff','2019-05-15 09:02:48','Bill Goff',1),(32,1,10036,'System Generated','1111111111','','','2019-05-15 09:04:17','Bill Goff','2019-05-15 09:04:17','Bill Goff',1),(33,1,10037,'System Generated','1111111111','','','2019-05-15 09:16:59','Bill Goff','2019-05-15 09:16:59','Bill Goff',1),(34,1,10038,'System Generated','1111111111','','','2019-05-15 09:20:58','Bill Goff','2019-05-15 09:20:58','Bill Goff',1),(35,1,10039,'System Generated','1111111111','','','2019-05-15 09:22:14','Bill Goff','2019-05-15 09:22:14','Bill Goff',1);
/*!40000 ALTER TABLE `alert_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `cl_client_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cl_client_name` varchar(45) NOT NULL DEFAULT '',
  `cl_home_addr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_billing_addr_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_primary_phone` varchar(15) NOT NULL DEFAULT '',
  `cl_primary_contact` varchar(45) NOT NULL DEFAULT '',
  `cl_created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cl_created_by` varchar(30) NOT NULL DEFAULT '',
  `cl_updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cl_updated_by` varchar(30) NOT NULL DEFAULT '',
  `billing_plan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cl_client_id`),
  KEY `clients_ibfk_1` (`cl_home_addr_id`),
  KEY `clients_ibfk_2` (`cl_billing_addr_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`cl_home_addr_id`) REFERENCES `address` (`adr_addr_id`) ON UPDATE CASCADE,
  CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`cl_billing_addr_id`) REFERENCES `address` (`adr_addr_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20019 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`cl_client_id`, `cl_client_name`, `cl_home_addr_id`, `cl_billing_addr_id`, `cl_primary_phone`, `cl_primary_contact`, `cl_created_on`, `cl_created_by`, `cl_updated_on`, `cl_updated_by`, `billing_plan`) VALUES (20013,'Walmart',20014,20014,'6824074945','Ujjwal','2018-06-28 17:12:55','Ujjawal','2018-06-28 17:12:55','Ujjawal',NULL),(20014,'Robin\'s Site',20015,20015,'9722089054','Robin Gallo','2018-07-05 23:05:42','Robin','2018-07-05 23:05:42','Robin',NULL),(20015,'R9 Tech',20016,20016,'6824083273','John Tauch','2018-07-20 16:02:11','John','2018-07-20 16:02:11','John',NULL),(20017,'Leroy\'s BBQ',20018,20018,'1111111111','Bill','2018-08-10 18:21:13','Bill','2018-08-10 18:21:13','Bill',NULL),(20018,'Crest Foods',20019,20019,'2147932113','An Bui','2018-08-28 17:46:39','An','2018-08-28 17:46:39','An',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_gateway_details`
--

DROP TABLE IF EXISTS `group_gateway_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_gateway_details` (
  `ggd_group_id` mediumint(8) unsigned NOT NULL,
  `ggd_gateway_mongo_id` varchar(24) NOT NULL DEFAULT '',
  `ggd_gateway_imei` varchar(20) NOT NULL DEFAULT '',
  `ggd_assigned` int(1) unsigned NOT NULL DEFAULT '0',
  `ggd_created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ggd_created_by` varchar(30) NOT NULL DEFAULT '',
  `ggd_updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ggd_updated_by` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`ggd_group_id`,`ggd_gateway_mongo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_gateway_details`
--

LOCK TABLES `group_gateway_details` WRITE;
/*!40000 ALTER TABLE `group_gateway_details` DISABLE KEYS */;
INSERT INTO `group_gateway_details` (`ggd_group_id`, `ggd_gateway_mongo_id`, `ggd_gateway_imei`, `ggd_assigned`, `ggd_created_on`, `ggd_created_by`, `ggd_updated_on`, `ggd_updated_by`) VALUES (10025,'5bbb71f3414c690011c17f20','358832070016997',1,'2018-10-08 15:04:19','An','2018-10-08 15:04:19','An'),(10027,'5bc0cea77ffa25001159a2f0','358832070016054',1,'2018-10-12 16:41:11','An','2018-10-12 16:41:11','An'),(10028,'5bc8aba9db0fa100112148c6','358832070016310',1,'2018-10-18 15:50:01','An','2018-10-18 15:50:01','An'),(10029,'5bcf3caee9814b001179fb9c','355188080002409',1,'2018-10-23 15:22:22','An','2018-10-23 15:22:22','An'),(10032,'5c59e7e52a130a0011ed0643','358832070297472',1,'2019-02-05 19:45:41','An','2019-02-05 19:45:41','An');
/*!40000 ALTER TABLE `group_gateway_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_user_details`
--

DROP TABLE IF EXISTS `group_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_user_details` (
  `gud_group_id` mediumint(8) unsigned NOT NULL,
  `gud_user_id` mediumint(8) unsigned NOT NULL,
  `gud_role` varchar(20) NOT NULL DEFAULT '',
  `gud_row_active_flag` int(1) unsigned NOT NULL DEFAULT '0',
  `gud_created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gud_created_by` varchar(30) NOT NULL DEFAULT '',
  `gud_updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gud_updated_by` varchar(30) NOT NULL DEFAULT '',
  `gud_client_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`gud_group_id`,`gud_user_id`),
  KEY `group_user_details_ibfk_4` (`gud_client_id`),
  KEY `group_user_details_ibfk_2` (`gud_user_id`),
  KEY `group_user_details_ibfk_1` (`gud_group_id`),
  CONSTRAINT `group_user_details_ibfk_1` FOREIGN KEY (`gud_group_id`) REFERENCES `groups` (`gr_group_id`) ON UPDATE CASCADE,
  CONSTRAINT `group_user_details_ibfk_2` FOREIGN KEY (`gud_user_id`) REFERENCES `users` (`usr_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_user_details_ibfk_4` FOREIGN KEY (`gud_client_id`) REFERENCES `clients` (`cl_client_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_user_details`
--

LOCK TABLES `group_user_details` WRITE;
/*!40000 ALTER TABLE `group_user_details` DISABLE KEYS */;
INSERT INTO `group_user_details` (`gud_group_id`, `gud_user_id`, `gud_role`, `gud_row_active_flag`, `gud_created_on`, `gud_created_by`, `gud_updated_on`, `gud_updated_by`, `gud_client_id`) VALUES (10018,13,'SITE_ADMIN',1,'2019-05-09 16:03:35','John','2019-05-09 16:03:35','John',20014),(10018,16,'SITE_ADMIN',1,'2018-08-08 22:37:20','Robin','2018-08-08 22:37:20','Robin',20014),(10018,18,'SITE_ADMIN',1,'2018-08-14 20:32:05','Robin','2018-08-14 20:32:05','Robin',20014),(10018,40,'SITE_USER',1,'2019-05-08 15:01:13','John','2019-05-08 15:01:13','John',20015),(10018,48,'SITE_ADMIN',1,'2019-05-07 18:02:14','John','2019-05-07 18:02:14','John',20015),(10018,49,'SITE_ADMIN',1,'2019-05-07 18:04:44','John','2019-05-07 18:04:44','John',20015),(10018,51,'SITE_ADMIN',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10018,52,'SITE_ADMIN',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10018,57,'SITE_USER',1,'2019-05-08 19:47:45','John','2019-05-08 19:47:45','John',20017),(10018,59,'SITE_ADMIN',1,'2019-05-09 06:17:33','John','2019-05-09 06:17:33','John',20013),(10021,17,'SITE_ADMIN',1,'2018-08-10 18:46:48','Bill','2018-08-10 18:46:48','Bill',20017),(10021,40,'SITE_ADMIN',1,'2019-05-08 15:01:13','John','2019-05-08 15:01:13','John',20015),(10021,48,'SITE_ADMIN',1,'2019-05-07 18:02:14','John','2019-05-07 18:02:14','John',20015),(10021,49,'SITE_ADMIN',1,'2019-05-07 18:04:44','John','2019-05-07 18:04:44','John',20015),(10021,51,'SITE_ADMIN',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10021,52,'SITE_ADMIN',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10021,53,'SITE_USER',1,'2019-05-08 14:53:22','John','2019-05-08 14:53:22','John',20015),(10021,55,'SITE_ADMIN',1,'2019-05-08 15:02:16','John','2019-05-08 15:02:16','John',20015),(10021,59,'SITE_USER',1,'2019-05-09 06:17:33','John','2019-05-09 06:17:33','John',20013),(10023,57,'SITE_ADMIN',1,'2019-05-08 19:47:45','John','2019-05-08 19:47:45','John',20017),(10023,71,'SITE_ADMIN',1,'2019-05-14 11:07:54','An','2019-05-14 11:07:54','An',20018),(10023,72,'SITE_ADMIN',1,'2019-05-14 12:04:15','An','2019-05-14 12:04:15','An',20018),(10024,13,'SITE_USER',1,'2019-05-09 16:03:35','John','2019-05-09 16:03:35','John',20014),(10024,48,'SITE_USER',1,'2019-05-07 18:02:14','John','2019-05-07 18:02:14','John',20015),(10024,49,'SITE_USER',1,'2019-05-07 18:04:44','John','2019-05-07 18:04:44','John',20015),(10024,51,'SITE_USER',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10024,52,'SITE_USER',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10024,58,'SITE_USER',1,'2019-05-08 19:48:54','John','2019-05-08 19:48:54','John',20014),(10025,20,'SITE_ADMIN',1,'2018-08-28 17:51:46','An','2018-08-28 17:51:46','An',20018),(10025,22,'SITE_ADMIN',1,'2018-10-15 17:06:03','An','0000-00-00 00:00:00','An',20018),(10025,51,'SITE_USER',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10025,52,'SITE_USER',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10025,54,'SITE_ADMIN',1,'2019-05-08 14:57:08','John','2019-05-08 14:57:08','John',20015),(10026,20,'SITE_ADMIN',0,'2018-08-28 17:51:25','An','2018-08-28 17:51:25','An',20018),(10026,53,'SITE_ADMIN',1,'2019-05-08 14:53:22','John','2019-05-08 14:53:22','John',20015),(10026,55,'SITE_USER',1,'2019-05-08 15:02:16','John','2019-05-08 15:02:16','John',20015),(10027,58,'SITE_ADMIN',1,'2019-05-08 19:48:54','John','2019-05-08 19:48:54','John',20014),(10028,48,'SITE_USER',1,'2019-05-07 18:02:14','John','2019-05-07 18:02:14','John',20015),(10028,49,'SITE_USER',1,'2019-05-07 18:04:44','John','2019-05-07 18:04:44','John',20015),(10028,51,'SITE_USER',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10028,52,'SITE_USER',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10029,48,'SITE_USER',1,'2019-05-07 18:02:14','John','2019-05-07 18:02:14','John',20015),(10029,49,'SITE_USER',1,'2019-05-07 18:04:44','John','2019-05-07 18:04:44','John',20015),(10029,51,'SITE_USER',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10029,52,'SITE_USER',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10029,54,'SITE_ADMIN',1,'2019-05-08 14:57:08','John','2019-05-08 14:57:08','John',20015),(10030,12,'SITE_ADMIN',0,'2019-02-05 19:38:10','John','2019-02-05 19:38:10','John',20015),(10030,48,'SITE_USER',1,'2019-05-07 18:02:14','John','2019-05-07 18:02:14','John',20015),(10030,49,'SITE_USER',1,'2019-05-07 18:04:44','John','2019-05-07 18:04:44','John',20015),(10030,51,'SITE_USER',1,'2019-05-07 18:07:08','John','2019-05-07 18:07:08','John',20015),(10030,52,'SITE_USER',1,'2019-05-08 06:26:57','John','2019-05-08 06:26:57','John',20015),(10030,53,'SITE_USER',1,'2019-05-08 14:53:22','John','2019-05-08 14:53:22','John',20015),(10030,54,'SITE_USER',1,'2019-05-08 14:57:08','John','2019-05-08 14:57:08','John',20015),(10031,58,'SITE_USER',1,'2019-05-08 19:48:54','John','2019-05-08 19:48:54','John',20014),(10033,17,'CLIENT_OWNER',1,'2019-05-15 08:52:08','Bill','2019-05-15 08:52:08','Bill',20017),(10034,17,'CLIENT_OWNER',1,'2019-05-15 09:01:10','Bill','2019-05-15 09:01:10','Bill',20017),(10035,17,'CLIENT_OWNER',1,'2019-05-15 09:02:48','Bill','2019-05-15 09:02:48','Bill',20017),(10036,17,'CLIENT_OWNER',1,'2019-05-15 09:04:17','Bill','2019-05-15 09:04:17','Bill',20017),(10037,17,'CLIENT_OWNER',1,'2019-05-15 09:16:59','Bill','2019-05-15 09:16:59','Bill',20017),(10038,17,'CLIENT_OWNER',1,'2019-05-15 09:20:58','Bill','2019-05-15 09:20:58','Bill',20017),(10039,17,'CLIENT_OWNER',1,'2019-05-15 09:22:14','Bill','2019-05-15 09:22:14','Bill',20017);
/*!40000 ALTER TABLE `group_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `gr_group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gr_group_name` varchar(100) NOT NULL DEFAULT '',
  `gr_group_phone` varchar(16) NOT NULL DEFAULT '',
  `gr_client_id` mediumint(8) unsigned NOT NULL,
  `gr_row_active_flag` int(1) NOT NULL DEFAULT '0',
  `gr_address_id` int(10) unsigned NOT NULL,
  `subscription_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`gr_group_id`),
  KEY `groups_ibfk_1` (`gr_client_id`),
  KEY `groups_ibfk_2` (`gr_address_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`gr_client_id`) REFERENCES `clients` (`cl_client_id`) ON UPDATE CASCADE,
  CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`gr_address_id`) REFERENCES `address` (`adr_addr_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10040 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`gr_group_id`, `gr_group_name`, `gr_group_phone`, `gr_client_id`, `gr_row_active_flag`, `gr_address_id`, `subscription_id`) VALUES (10018,'R9TECH SITE','9722089054',20014,1,0,NULL),(10021,'Allen','4697336460',20017,1,0,NULL),(10023,'Fire Wheel','2147932113',20018,0,0,NULL),(10024,'Stone Briar 2','2147932113',20018,0,0,NULL),(10025,'Star','2147932113',20018,1,0,NULL),(10026,'Sundance','2147932113',20018,0,0,NULL),(10027,'Galleria','2146998110',20018,1,0,NULL),(10028,'Stone Briar','2146998110',20018,1,0,NULL),(10029,'Firewheel','2146998110',20018,1,0,NULL),(10030,'Smoothie Factory 2','6824083273',20015,0,0,NULL),(10031,'Smoothie Factory','2147932113',20018,0,0,NULL),(10032,'Coit Smoothie','2147932113',20018,1,0,NULL),(10033,'glam.com','1111111111',20017,1,20020,NULL),(10034,'pubportal.inc','1111111111',20017,1,20021,NULL),(10035,'dad','1111111111',20017,1,20022,NULL),(10036,'vxc','1111111111',20017,1,20023,NULL),(10037,'vvvvvvvvv','1111111111',20017,1,20024,NULL),(10038,'yyyyyyyyyyyy','1111111111',20017,1,20025,NULL),(10039,'ioiuoiu','1111111111',20017,1,20026,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`r9_sql_master`@`%`*/ /*!50003 TRIGGER update_group_childs_on_delete AFTER UPDATE ON groups
    FOR EACH ROW
BEGIN
    IF NEW.gr_row_active_flag = 0 THEN
        UPDATE group_user_details SET gud_row_active_flag = 0 WHERE gud_group_id = NEW.gr_group_id;
        UPDATE alert_plans SET al_active_flag = 0 WHERE al_group_id = NEW.gr_group_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `invoice_groups`
--

DROP TABLE IF EXISTS `invoice_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_groups` (
  `invoice_id` int(10) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`invoice_id`,`group_id`),
  KEY `fk_invoice_group_1_idx` (`group_id`),
  CONSTRAINT `fk_invoice_group_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`gr_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_group_2` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_groups`
--

LOCK TABLES `invoice_groups` WRITE;
/*!40000 ALTER TABLE `invoice_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` int(10) unsigned DEFAULT NULL,
  `billing_plan_details` text,
  `client_id` mediumint(8) unsigned DEFAULT NULL,
  `bill_to_name` varchar(50) NOT NULL,
  `bill_to_company` varchar(50) DEFAULT NULL,
  `bill_to_email` varchar(50) NOT NULL,
  `bill_to_address` varchar(120) NOT NULL,
  `bill_to_address2` varchar(120) DEFAULT NULL,
  `bill_to_city` varchar(45) DEFAULT NULL,
  `bill_to_state` varchar(45) DEFAULT NULL,
  `bill_to_zipcode` varchar(10) DEFAULT NULL,
  `bill_to_country` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `items` text,
  `total` decimal(10,2) DEFAULT NULL,
  `notification_sent` tinyint(3) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_billing_invoices_1_idx` (`subscription_id`),
  CONSTRAINT `fk_billing_invoices_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_report`
--

DROP TABLE IF EXISTS `site_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `reading_type` varchar(255) NOT NULL,
  `reading_parameters` text NOT NULL,
  `users_ids` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `site_report_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `groups` (`gr_group_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_report`
--

LOCK TABLES `site_report` WRITE;
/*!40000 ALTER TABLE `site_report` DISABLE KEYS */;
INSERT INTO `site_report` (`id`, `site_id`, `name`, `type`, `reading_type`, `reading_parameters`, `users_ids`, `created_at`, `updated_at`) VALUES (49,10018,'reprot all nodes','monthly','interval','{\"noOfIntervals\":4,\"startTime\":\"00:14\"}','[9]','2019-05-13 19:13:03','0000-00-00 00:00:00'),(50,10018,'disabled gateways','weekly','time','{\"timeRead1\":\"11:14\",\"timeRead2\":\"21:12\"}','[18]','2019-05-13 19:13:25','0000-00-00 00:00:00'),(52,10018,'vxvcx','monthly','time','{\"timeRead1\":\"00:17\",\"timeRead2\":\"20:13\"}','[16]','2019-05-14 07:15:57','0000-00-00 00:00:00'),(53,10021,'tasdsd','monthly','interval','{\"noOfIntervals\":6,\"startTime\":\"00:32\"}','[59]','2019-05-14 07:31:05','0000-00-00 00:00:00'),(54,10025,'all star site report','monthly','time','{\"timeRead1\":\"02:29\"}','[20,54]','2019-05-14 09:27:11','0000-00-00 00:00:00'),(55,10018,'dsadsa','monthly','interval','{\"noOfIntervals\":3,\"startTime\":\"20:41\"}','[40]','2019-05-14 15:39:42','0000-00-00 00:00:00'),(56,10039,'saffff','monthly','interval','{\"noOfIntervals\":3,\"startTime\":\"16:32\"}','[17]','2019-05-15 11:31:34','0000-00-00 00:00:00'),(60,10018,'cxzczxcx','monthly','interval','{\"noOfIntervals\":2,\"startTime\":\"13:15\"}','[16]','2019-05-16 08:14:02','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `site_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT NULL,
  `billing_plan` varchar(45) NOT NULL,
  `billing_plan_details` text,
  `name` varchar(50) NOT NULL,
  `bill_to_name` varchar(50) NOT NULL,
  `bill_to_company` varchar(50) DEFAULT NULL,
  `bill_to_email` varchar(50) NOT NULL,
  `bill_to_address` varchar(120) NOT NULL,
  `bill_to_address2` varchar(120) DEFAULT NULL,
  `bill_to_city` varchar(45) DEFAULT NULL,
  `bill_to_state` varchar(45) DEFAULT NULL,
  `bill_to_zipcode` varchar(10) DEFAULT NULL,
  `bill_to_country` varchar(45) DEFAULT NULL,
  `client_id` mediumint(8) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_subscriptions_1_idx` (`client_id`),
  KEY `fk_subscriptions_1_idx1` (`user_id`),
  CONSTRAINT `fk_subscriptions_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`usr_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` (`id`, `user_id`, `billing_plan`, `billing_plan_details`, `name`, `bill_to_name`, `bill_to_company`, `bill_to_email`, `bill_to_address`, `bill_to_address2`, `bill_to_city`, `bill_to_state`, `bill_to_zipcode`, `bill_to_country`, `client_id`, `created_at`) VALUES (1,12,'monthly-Commercial','{\"Recurrence\":\"monthly\",\"Recurrence_Days\":30,\"Gateways\":1,\"Nodes\":2,\"Additional\":{\"Gateway\":289,\"Node\":70},\"Service\":49,\"Service_Additional\":{\"Gateway\":25,\"Node\":2},\"One_Time\":{\"label\":\"One time Setup Fee\",\"fee\":59},\"payments_info\":{\"First Payment (Immediate) - Hardware Cost Only\":429,\"Each Month\":\"$49 + $25 (* Additional Gate) + $2 (* Additional Node)\"}}','sda','das','dsa','cata@wdsa.eo','dsa','das','dsa','das','dsa','dsa',20013,'2019-05-16 08:48:42');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `usr_user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `usr_fname` varchar(60) NOT NULL DEFAULT '',
  `usr_lname` varchar(60) NOT NULL DEFAULT '',
  `usr_email` varchar(100) NOT NULL DEFAULT '',
  `usr_username` varchar(60) NOT NULL DEFAULT '',
  `usr_pass_hash` varchar(60) NOT NULL DEFAULT '',
  `usr_created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usr_created_by` varchar(30) NOT NULL DEFAULT '',
  `usr_updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usr_pass_reset_token` varchar(60) DEFAULT NULL,
  `usr_pass_reset_expiry` datetime DEFAULT NULL,
  `usr_updated_by` varchar(30) NOT NULL DEFAULT '',
  `usr_client_id` mediumint(8) unsigned NOT NULL,
  `usr_user_phone` varchar(15) NOT NULL DEFAULT '',
  `usr_pass_expiry` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usr_pass_attempts` decimal(10,0) DEFAULT NULL,
  `usr_row_active_flag` int(1) unsigned NOT NULL DEFAULT '0',
  `usr_register_token` varchar(60) DEFAULT NULL,
  `usr_role_type` varchar(50) NOT NULL,
  `usr_default_group_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`usr_user_id`),
  UNIQUE KEY `usr_email` (`usr_email`),
  UNIQUE KEY `usr_username` (`usr_username`),
  KEY `usr_default_group_id` (`usr_default_group_id`),
  KEY `user_cklient_ubfk1` (`usr_client_id`),
  CONSTRAINT `user_cklient_ubfk1` FOREIGN KEY (`usr_client_id`) REFERENCES `clients` (`cl_client_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`usr_user_id`, `usr_fname`, `usr_lname`, `usr_email`, `usr_username`, `usr_pass_hash`, `usr_created_on`, `usr_created_by`, `usr_updated_on`, `usr_pass_reset_token`, `usr_pass_reset_expiry`, `usr_updated_by`, `usr_client_id`, `usr_user_phone`, `usr_pass_expiry`, `usr_pass_attempts`, `usr_row_active_flag`, `usr_register_token`, `usr_role_type`, `usr_default_group_id`) VALUES (9,'Ujjawalaaaaaaaaaaaaa','Mishraaaaaaa','ugomishra@gmail.com','umishra','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-06-28 17:12:55','Ujjawal','2018-06-28 17:12:55',NULL,NULL,'Ujjawal',20013,'6824074945','2018-07-28 17:12:55',0,1,NULL,'SYSTEM_ADMIN',NULL),(10,'Robin','Gallo','rgallo@r9tech.com','rgallo','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-07-05 23:05:42','Robin','2018-07-05 23:05:42',NULL,NULL,'Robin',20013,'9722089054','2018-08-05 23:05:42',0,1,NULL,'CLIENT_OWNER','10027'),(11,'Ujjawal','Mishra','ujjwal@yahoo.com','ujjwal@yahoo.com','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-07-12 18:36:51','Ujjawal','2018-07-12 18:36:51',NULL,NULL,'Ujjawal',20014,'6824074945','2018-08-12 18:36:51',0,1,NULL,'STORE_ADMIN','10028'),(12,'John','Tauch','admin@r9tech.com','r9tech','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-07-20 16:02:11','John','2018-07-20 16:02:11',NULL,NULL,'John',20015,'6824083273','2018-08-20 16:02:11',0,1,NULL,'SYSTEM_ADMIN',NULL),(13,'John','Tauch','jtauch@r9tech.com','jtauch@r9tech.com','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-08-07 21:00:52','John','2018-08-07 21:00:52',NULL,NULL,'John',20014,'2142823347','2018-09-07 21:00:52',0,1,NULL,'SITE_ACCESS',NULL),(16,'Vivek','Shah','vshah@r9tech.com','vshah@r9tech.com','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-08-08 22:37:05','Vivek','2018-08-08 22:37:05',NULL,NULL,'Vivek',20014,'6824083273','2018-09-08 22:37:05',0,1,NULL,'CLIENT_ADMIN','10030'),(17,'Bill','Goff','bgoff@r9tech.com','bgoff','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-08-10 18:21:13','Bill','2018-08-10 18:21:13',NULL,NULL,'Bill',20017,'1111111111','2018-09-10 18:21:13',0,1,NULL,'CLIENT_OWNER','10031'),(18,'Eric','Tauch','etauch@r9tech.com','etauch@r9tech.com','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-08-14 20:31:15','Eric','2018-08-14 20:31:15',NULL,NULL,'Eric',20014,'2142823883','2018-09-14 20:31:15',0,1,NULL,'CLIENT_ADMIN','10032'),(19,'An','Buiiiiiiiuuuuu','abui@r9tech.com','abui','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-08-28 17:46:39','An','2018-08-28 17:46:39',NULL,NULL,'An',20018,'2147932113','2018-09-28 17:46:39',0,1,NULL,'CLIENT_ADMIN','10027'),(20,'An','Bui','anduybui@gmail.com','anduybui@gmail.com','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-08-28 17:51:07','An','2018-08-28 17:51:07',NULL,NULL,'An',20018,'2147932113','2018-09-28 17:51:07',0,1,NULL,'STORE_ADMIN','10028'),(22,'Robin','Gallo','rmariet1@gmail.com','rmariet1@gmail.com','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-10-15 17:05:22','Robin','2018-10-15 17:05:22',NULL,NULL,'Robin',20018,'9722089054','2018-11-15 17:05:22',0,1,NULL,'STORE_ADMIN','10029'),(23,'John','Tauch','reports@r9tech.com','r9reports','$2b$10$ekZSqNav.4JNufeI10EnSuejfRkLI8XhjnooUVSBiENtwpNLs0VeK','2018-10-18 16:02:11','John','2018-07-20 16:02:11',NULL,NULL,'John',20015,'6824083273','2018-08-20 16:02:11',0,1,NULL,'SITE_ACCESS',NULL),(40,'tttttttttttt','sss','abui@r9tesdddeeedsch.com','abui@r9tesdddeeedsch.com','$2b$10$eAcZ7CeQTFww//Y49ExFx.OZOzAGemgx7BzGMH1QdImaFLyisxUqW','2019-05-07 15:56:45','s','2019-05-07 15:56:45',NULL,NULL,'s',20015,'+1 15417543010','2019-06-07 15:56:45',0,1,NULL,'SITE_ACCESS',NULL),(48,'s','sss','abui@r9ssssssstee.com','abui@r9ssssssstee.com','$2b$10$HlF/F6gaBGRRAWHaz26GluDtG18FKgg1yxo0DXVQ51XsbKyQjbxRG','2019-05-07 18:02:13','s','2019-05-07 18:02:13',NULL,NULL,'s',20015,'+1 15417543010','2019-06-07 18:02:13',0,1,NULL,'SITE_ACCESS',NULL),(49,'s','sss','abui@r9ssssdsadsasssstee.com','abui@r9ssssdsadsasssstee.com','$2b$10$jfSGvUT8r.aia0a17MsnserHPb0jcu9psDLdh3CIxeIXQxtM9vYrO','2019-05-07 18:04:44','s','2019-05-07 18:04:44',NULL,NULL,'s',20015,'+1 15417543010','2019-06-07 18:04:44',0,1,NULL,'SITE_ACCESS',NULL),(51,'s','sss','abui@usssssuuu.com','abui@usssssuuu.com','$2b$10$8F1efynPBF3POYIQo0v2..I0OfWvV7wwtShiOhSU9aKlk5Jy/Fcfy','2019-05-07 18:07:07','s','2019-05-07 18:07:07',NULL,NULL,'s',20015,'+1 15417543010','2019-06-07 18:07:07',0,1,NULL,'SITE_ACCESS',NULL),(52,'s','sss','abui@dsadsadas.com','abui@dsadsadas.com','$2b$10$hcYjMh7T0gpC1WnpGNSpo.3jIxMtrZ27HyIPcPUndCBNTkqRHZboW','2019-05-08 06:26:57','s','2019-05-08 06:26:57',NULL,NULL,'s',20015,'+1 15417543010','2019-06-08 06:26:57',0,1,NULL,'SITE_ACCESS',NULL),(53,'xxxxxxxxxxxxxxx','pretest','abui@test.com','abui@test.com','$2b$10$ro..Q0uB2giX0hLF3oLTGun4N3FALpa5DLkJeTflQ6DfTjAHW1l9K','2019-05-08 13:46:05','test','2019-05-08 13:46:05',NULL,NULL,'test',20015,'+1 682 407 4945','2019-06-08 13:46:05',0,1,NULL,'SITE_ACCESS',NULL),(54,'vbc','bv','abui@ssss.com','abui@ssss.com','$2b$10$Y744AkUqdoddWOQhBtheWeUqLtcLvyxvQ83uHqJWdPD/R40aJ4M8m','2019-05-08 14:28:48','vbc','2019-05-08 14:28:48',NULL,NULL,'vbc',20015,'+1 682 407 4945','2019-06-08 14:28:48',0,1,NULL,'SITE_ACCESS',NULL),(55,'Cata test','TEst','abui@sssssss.com','abui@sssssss.com','$2b$10$VUQhJBmN8GP0lOmL0icF3e3xPhvvwSULW.CHpnHknpZuH5hOp2Zby','2019-05-08 15:02:16','Cata test','2019-05-08 15:02:16',NULL,NULL,'Cata test',20015,'+1 15417543010','2019-06-08 15:02:16',0,1,NULL,'SITE_ACCESS',NULL),(56,'dsa','sss','abui@r9ssstech.com','abui@r9ssstech.com','$2b$10$bDnQj9kY2m0DB9FJUY5KVeVzjAulWbIT.UwpQRaUYk/4BAzxQLHqS','2019-05-08 19:45:34','dsa','2019-05-08 19:45:34',NULL,NULL,'dsa',20018,'+1 682 407 4945','2019-06-08 19:45:34',0,1,NULL,'CLIENT_ADMIN','10030'),(57,'test','test nanmr','abui@sssss.com','abui@sssss.com','$2b$10$Oi3A2z1PYCezSHkPDUsskO6hSvCIc3SBslM3QcINR9tdxNAdLbYGi','2019-05-08 19:47:45','test','2019-05-08 19:47:45',NULL,NULL,'test',20017,'+1 682 407 4945','2019-06-08 19:47:45',0,1,NULL,'SITE_ACCESS',NULL),(58,'ro','nbib','abui@robin.com','abui@robin.com','$2b$10$emVaISfBYuRLAsa1JdMbauNkPoMBPg25W1yEMZVQHpoQ3y78SAPW.','2019-05-08 19:48:54','ro','2019-05-08 19:48:54',NULL,NULL,'ro',20014,'+1 15417543010','2019-06-08 19:48:54',0,1,NULL,'SITE_ACCESS',NULL),(59,'Catalin','Test','abui@r9teech.com','abui@r9teech.com','$2b$10$Cb0kVY8iPBgtUcgTKm6r..KOtvSAOn.iCSVI8XOYKwSa0WsW/lUPK','2019-05-09 06:11:41','Catalin','2019-05-09 06:11:41',NULL,NULL,'Catalin',20017,'+1 682 407 4945','2019-06-09 06:11:41',0,1,NULL,'SITE_ACCESS',NULL),(60,'Catalin','Mar','abui@mar.com','abui@mar.com','$2b$10$65YkIa3ZVREA6m5WpLLAPOTzqTkcjD5RvxcE0SzKxtEC61TYRTfRy','2019-05-10 10:07:10','Catalin','2019-05-10 10:07:10',NULL,NULL,'Catalin',20017,'+1 682 407 4945','2019-06-10 10:07:10',0,1,NULL,'CLIENT_ADMIN','10031'),(62,'uuuuuuuuuuuuuuu','bbbbbbbb','abssssui@r9tech.com','abssssui@r9tech.com','$2b$10$hXrK.ClbqlCk9zXpc57pyOfQXEt2myIu7Ei7Z6LfC66cS61zvGJLO','2019-05-13 13:33:03','aaaaaaaaaaaaa','2019-05-13 13:33:03',NULL,NULL,'aaaaaaaaaaaaa',20014,'+1 682 407 4945','2019-06-13 13:33:03',0,1,NULL,'CLIENT_ADMIN',NULL),(63,'test',' pretest','pretest@wisesys.ro','pretest@wisesys.ro','$2b$10$NhR38UDyHsTgmXYMozqy9elign/hCqqEeNUdiixfLtLMsD20Y6Ibm','2019-05-14 10:01:06','test','2019-05-14 10:01:06',NULL,NULL,'test',20014,'+1 682 407 4945','2019-06-14 10:01:06',0,1,NULL,'CLIENT_OWNER',NULL),(64,'MAr','wisesys','mar@wisesys.com','mar@wisesys.com','$2b$10$qEfG.vD6KwBKa.iYMBrOdeBhZqpT9fl5tfdfMDV7y/v6TdYIzlNyK','2019-05-14 10:07:30','MAr','2019-05-14 10:07:30',NULL,NULL,'MAr',20018,'+1 15417543010','2019-06-14 10:07:30',0,1,NULL,'CLIENT_ADMIN',NULL),(65,'dsadsa','dsaddsa','aaa@vvvv.com','aaa@vvvv.com','$2b$10$EZFwhMqB9sZVhlSCUtJwueMqG7piWj66qgoCd7N6XMPuf2zwaOfbe','2019-05-14 10:10:17','dsadsa','2019-05-14 10:10:17',NULL,NULL,'dsadsa',20014,'+1 682 407 4945','2019-06-14 10:10:17',0,1,NULL,'CLIENT_ADMIN',NULL),(66,'tttt','hhhh','xxx@ddddd.com','xxx@ddddd.com','$2b$10$JwsIuhi4FMN/kP2f3s.40O4HLaDpA9a4M4gYDstQ2tx74V3WmuvWC','2019-05-14 10:11:35','tttt','2019-05-14 10:11:35',NULL,NULL,'tttt',20013,'+1 682 407 4945','2019-06-14 10:11:35',0,1,NULL,'CLIENT_ADMIN',NULL),(67,'hgf','hgf','ab5ui@r9tech.com','ab5ui@r9tech.com','$2b$10$70jAlofsPA3O7QHekQU90.S1OtigcYzFVFCeFevU2YdTvSHcHuqiS','2019-05-14 10:13:11','hgf','2019-05-14 10:13:11',NULL,NULL,'hgf',20017,'+1 682 407 4945','2019-06-14 10:13:11',0,1,NULL,'CLIENT_ADMIN',NULL),(68,'ouoiuoiuo','uouiouiou','kkkkkk@r9tech.com','kkkkkk@r9tech.com','$2b$10$6lu8gU7LsfcIC5HU6TB6dOmifVwgpgRYp.B2b/URzU59Z5Fcz8y0G','2019-05-14 10:17:33','ouoiuoiuo','2019-05-14 10:17:33',NULL,NULL,'ouoiuoiuo',20014,'+1 682 407 4945','2019-06-14 10:17:33',0,1,NULL,'CLIENT_OWNER',NULL),(69,'Robin','Hood','rob@r9tech.com','hhhhhhhh@r9tech.com','$2b$10$0aHXmT8KgSbr6KDXvHVEhuGfqmAmG5wtEO0PilpUQWQ/PYrzdf7C.','2019-05-14 10:18:16','hgfhgfh','2019-05-14 10:18:16',NULL,NULL,'hgfhgfh',20014,'+1 682 407 4945','2019-06-14 10:18:16',0,1,NULL,'CLIENT_OWNER',NULL),(70,'Dow','Timmy','tim@jjjj.com','jjjjjabui@jjjj.com','$2b$10$aluMc62A9rgi1AE4MtuyLuX3dxGSfIZIc8wt8MSq7maUrdQ4GpDgW','2019-05-14 10:19:19','jhgjh','2019-05-14 10:19:19',NULL,NULL,'jhgjh',20017,'+1 972 208 9054','2019-06-14 10:19:19',0,1,NULL,'CLIENT_ADMIN',NULL),(71,'aaa','aaaaa','xxxxx@xxx.com','xxxxx@xxx.com','$2b$10$A2XysNuap4Z0PdWTMI88uOcqxD6NLGKJq90qNF8Yxn4ZMOSl386BW','2019-05-14 11:07:54','aaa','2019-05-14 11:07:54',NULL,NULL,'aaa',20018,'+1 682 407 4945','2019-06-14 11:07:54',0,1,NULL,'SITE_ACCESS',NULL),(72,'vcxvcxv','vcxvxcvxc','avvvvvbui@vvvv.com','avvvvvbui@vvvv.com','$2b$10$Cqsbth2Wf1qhMT/6XBriJu8Y.rAEdr.vkTyUzgYI5VbJ7Vu2Xu2m6','2019-05-14 12:04:15','vcxvcxv','2019-05-14 12:04:15',NULL,NULL,'vcxvcxv',20018,'+1 682 407 4945','2019-06-14 12:04:15',0,1,NULL,'SITE_ACCESS',NULL),(73,'sda','jhfkdjhfklsdah l','aaaaaa@r9tech.com','aaaaaa@r9tech.com','$2b$10$0cD2DvQsuXw/FvMyH7cSOOC.pw8lCSwTzJ0IeYShn/8nYkuXz1Ecu','2019-05-14 16:20:43','sda','2019-05-14 16:20:43',NULL,NULL,'sda',20013,'+1 15417543010','2019-06-14 16:20:43',0,1,NULL,'CLIENT_ADMIN',NULL),(74,'dsadsa','dasdsadas','ccccccccccccc@r9tech.com','ccccccccccccc@r9tech.com','$2b$10$g/HXtiK.lIoylDXmT9HacupgPKXCuJYL2UKe2twSETYF6MCozZ9Xm','2019-05-16 08:21:55','dsadsa','2019-05-16 08:21:55',NULL,NULL,'dsadsa',20017,'+1 682 407 4945','2019-06-16 08:21:55',0,1,NULL,'CLIENT_ADMIN',NULL);
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

-- Dump completed on 2019-05-16 11:51:26