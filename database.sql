-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: jobbox
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'jj6hVAOg8MWNsmng7AAI6mDYpQhKGAL0',1,'2024-05-13 21:55:17','2024-05-13 21:55:17','2024-05-13 21:55:17');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,'Dolorem aperiam inventore et. Quis dolor sunt quod quam sequi sunt provident. Earum voluptatem corrupti consectetur explicabo cum. Dolore commodi est mollitia sapiente voluptas qui.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-05-13 21:55:20','2024-05-13 21:55:20'),(2,'Lifestyle',0,'Quasi adipisci ut est. Et non porro dolores aliquam ea necessitatibus. Laboriosam molestiae placeat beatae quo aspernatur dolorem eum. Autem non odio fuga delectus.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-05-13 21:55:20','2024-05-13 21:55:20'),(3,'Travel Tips',2,'Ipsa maiores minus qui deleniti commodi itaque. Et laborum repellendus ut necessitatibus est aliquid. Autem ad accusantium occaecati expedita sed aut nulla. Assumenda aperiam amet aliquid qui.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-05-13 21:55:20','2024-05-13 21:55:20'),(4,'Healthy',0,'Assumenda ex explicabo dolores quis fugit in. Tempore qui praesentium et dignissimos id delectus. Autem eligendi quod fugiat ipsam.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-05-13 21:55:20','2024-05-13 21:55:20'),(5,'Travel Tips',4,'Ut mollitia dolore laudantium nihil praesentium. Qui nemo minus pariatur et omnis. Qui ullam voluptate et sapiente. Exercitationem voluptate dolor et quia aliquam rerum quas in.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-05-13 21:55:20','2024-05-13 21:55:20'),(6,'Hotel',0,'Aperiam quis occaecati quasi aliquam. Aut ea molestiae fuga debitis accusamus quibusdam in. Dolores nostrum aut atque qui. Sed fugit velit enim veritatis voluptatibus est.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-05-13 21:55:20','2024-05-13 21:55:20'),(7,'Nature',6,'Repudiandae tempora doloribus ad. Rerum modi cumque adipisci impedit delectus eum adipisci. Molestiae cupiditate sit sunt ab nobis odio est odit.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-05-13 21:55:20','2024-05-13 21:55:20');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/location1.png',0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(2,'London','london',2,2,NULL,0,'locations/location2.png',0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(3,'New York','new-york',3,3,NULL,0,'locations/location3.png',0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(4,'New York','new-york-1',4,4,NULL,0,'locations/location4.png',0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/location5.png',0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(6,'Berlin','berlin',6,6,NULL,0,'locations/location6.png',0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Prof. Aurore Feest Jr.','xsmith@example.org','+12535506783','73573 Mitchell Underpass Apt. 413\nPort Jamil, IA 57147','A qui mollitia occaecati natus non error.','Perspiciatis sed blanditiis reiciendis itaque rerum. Eos et aut accusamus doloremque harum. Odio quos et eos asperiores consequatur nostrum. Provident perferendis quo autem non. Eum officiis ut ea a quas dolorum aut. Ullam facere molestiae quo qui. Ea voluptas hic exercitationem dolorem cumque vitae. Ducimus ut similique voluptatem laudantium nam ut facilis repellat. Id rerum iusto ipsum beatae perferendis.',NULL,'unread','2024-05-13 21:55:21','2024-05-13 21:55:21'),(2,'Gilda Wiegand','stamm.dave@example.net','+19413009079','4752 Bechtelar Run Suite 346\nWest Norvalville, SD 08901-3601','Vitae quia doloribus cum esse commodi.','Nihil est sit est. Dolores esse facere est incidunt qui sapiente asperiores eos. Id quidem et culpa nihil. Consequatur rerum iure laudantium eveniet debitis temporibus ab. Sint error et dicta sunt nihil. Aut quas cum doloribus sequi pariatur velit maiores. Eaque eveniet similique inventore perspiciatis. Exercitationem ea quibusdam in hic exercitationem placeat dolores. Debitis placeat quidem qui qui dolorem sapiente.',NULL,'read','2024-05-13 21:55:21','2024-05-13 21:55:21'),(3,'German Dickinson','lsimonis@example.com','+14232324040','340 Schiller Course Apt. 161\nNorth Kristopherstad, MA 86725-5975','Ducimus ut tempore aut et a sunt omnis.','Laborum impedit eum voluptatem quos quod. Velit et qui cupiditate quam facere est. Asperiores animi iusto nihil in molestiae. Inventore qui nihil et fugiat labore ipsa error reiciendis. Officiis aut pariatur iusto error saepe reiciendis laboriosam. Non ut fugiat ad consequuntur voluptatibus voluptas necessitatibus. Qui corrupti occaecati dolor repellendus quaerat autem veniam. Ea placeat nemo quo dolores numquam. Quos sint temporibus odit nihil dolores molestiae.',NULL,'unread','2024-05-13 21:55:21','2024-05-13 21:55:21'),(4,'Ms. Bethany Hills DVM','walter.giovanny@example.org','+14587707752','314 Cassandra Pass Suite 870\nLittelburgh, IL 49147','Illo alias qui eius quasi officia sit facere.','Non natus nobis vel explicabo non. Voluptatem consequuntur nostrum omnis consequatur molestiae est eaque. Modi minus numquam dolorum. Quaerat ratione et excepturi. Eveniet dolores consequatur optio quaerat. Sequi vel consequuntur illo ut distinctio dolor. Est temporibus eius non laudantium dolor.',NULL,'read','2024-05-13 21:55:21','2024-05-13 21:55:21'),(5,'Rickie Barton','rhagenes@example.org','+14422088488','6247 Richmond Gardens\nWest Elnora, VA 77464-5841','Ullam voluptate voluptas sit nostrum et.','Nostrum ut voluptatem qui delectus. Debitis autem repellat iste quo aliquid. Sint distinctio cum ut cum quia est voluptatem. Ad est saepe eum voluptas. Et odio voluptatem omnis aperiam perferendis quis. Pariatur similique vel vel et rem fuga. Provident aut at sed aut quia quo. Laboriosam adipisci eos repellat id. Aperiam cum expedita esse rerum nam sint libero. Rem aut velit qui mollitia aut. Quis dolorum vel in cum sunt distinctio qui.',NULL,'read','2024-05-13 21:55:21','2024-05-13 21:55:21'),(6,'Chaz Treutel DDS','maybell78@example.org','+13172238954','17342 Krajcik Flat Apt. 285\nWest Buddyland, AZ 32791-5864','Praesentium a rerum fugiat sequi.','Eum et architecto sed. Quasi corrupti voluptatem libero odit possimus aut quod. Sed et labore similique qui reprehenderit neque. Totam qui est sit delectus. Mollitia in voluptatum ipsa illum illum. Fugiat sapiente dolor aliquam voluptatibus ipsa mollitia voluptate omnis. Hic esse culpa quis quaerat. Corporis maxime vero voluptas qui id maxime.',NULL,'unread','2024-05-13 21:55:21','2024-05-13 21:55:21'),(7,'Immanuel Douglas','yreinger@example.com','+18502555850','3375 Elyse Mountains\nSouth Lucinda, NC 33869-1926','Placeat occaecati eligendi at tenetur et neque.','Commodi maiores aut ipsum. Magnam rerum repellendus velit rerum eligendi officiis. Consequuntur ullam sed amet mollitia. Minus voluptatem magnam veritatis nihil ducimus. Corporis eum deserunt veniam laboriosam vel. Fuga voluptate qui reprehenderit et sit. Nam omnis harum sunt rerum distinctio. Quibusdam deserunt eos sunt illo omnis vel libero aperiam. Eveniet autem voluptatem praesentium consequatur ratione. Odit unde ad sunt numquam.',NULL,'unread','2024-05-13 21:55:21','2024-05-13 21:55:21'),(8,'Prof. Camryn Donnelly','hpadberg@example.net','+14794616610','34665 Crona Course\nVedabury, WV 05780','Sit rerum eum dolores sint.','Ex iure et quia quia tenetur minus. Voluptatem sit quis est facilis fugit in. Ullam dolores nam ut earum nobis et. Quam ut adipisci ullam sed quia voluptas voluptas sed. Ex incidunt adipisci blanditiis accusantium porro. Numquam facere id sunt voluptatem aperiam autem quasi. Corporis repellendus fugit illum blanditiis libero. Ullam quia aut ducimus non placeat quia esse ut. Quia optio eos eum reiciendis doloremque pariatur. Vel eaque dolorem qui porro.',NULL,'read','2024-05-13 21:55:21','2024-05-13 21:55:21'),(9,'Dejuan Wuckert','brain.rolfson@example.com','+15346882946','5805 Harvey Burgs Suite 903\nWest Callieton, FL 41510','Rem quibusdam est ab et rerum ut debitis.','Molestias omnis itaque quo ut omnis. Id ea enim eum ut rerum. Non occaecati et ducimus consequuntur eaque. Blanditiis sunt rerum a voluptas odit. Iure delectus porro error aut. At nesciunt sunt qui voluptas minima eum aut. Quos recusandae deserunt iste quidem accusantium. In iusto vel et dolor. Consequuntur rem ducimus deserunt qui debitis. Praesentium porro provident veritatis fugiat unde fugiat.',NULL,'unread','2024-05-13 21:55:21','2024-05-13 21:55:21'),(10,'Shania Breitenberg','nchristiansen@example.net','+15206375520','403 Ziemann Parkway\nJeanettemouth, TX 11533-3340','Tenetur veniam aut soluta voluptatem voluptate.','Autem veritatis numquam quia ea. Enim similique incidunt qui nulla. Quia quasi ut quam laboriosam. Blanditiis nulla blanditiis et et sit id. Tempore aut nesciunt unde. In iure quasi voluptate fuga. Sit laboriosam voluptas odio odio accusantium ipsam ea. Laudantium laboriosam repellendus excepturi repellat beatae. Ipsa qui non dignissimos eum mollitia amet.',NULL,'read','2024-05-13 21:55:21','2024-05-13 21:55:21');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published','2024-05-13 21:55:23',NULL,'FRA'),(2,'England','English',0,0,'published','2024-05-13 21:55:23',NULL,'UK'),(3,'USA','Americans',0,0,'published','2024-05-13 21:55:23',NULL,'US'),(4,'Holland','Dutch',0,0,'published','2024-05-13 21:55:23',NULL,'HL'),(5,'Denmark','Danish',0,0,'published','2024-05-13 21:55:23',NULL,'DN'),(6,'Germany','Danish',0,0,'published','2024-05-13 21:55:23',NULL,'DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'General',0,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL),(2,'Buying',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL),(3,'Payment',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL),(4,'Support',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(2,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(3,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(4,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(5,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(6,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(7,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(8,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(9,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(10,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(11,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(12,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(13,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(14,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(15,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(16,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(17,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(18,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(19,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',4,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(20,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(21,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',4,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(22,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',4,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(23,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',4,'published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(24,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Explicabo ad facilis soluta sit et qui voluptate. Qui in laborum ut amet illo voluptatem. Enim ut in dolorem harum officiis.',1,0,'galleries/1.jpg',1,'published','2024-05-13 21:55:21','2024-05-13 21:55:21'),(2,'New Day','Odio dolorem velit cum quod nesciunt. Quia rerum aut voluptatum ut.',1,0,'galleries/2.jpg',1,'published','2024-05-13 21:55:21','2024-05-13 21:55:21'),(3,'Happy Day','Aut molestiae sequi error ea in. Est ipsam ut quis nostrum omnis et quia. Itaque ad delectus excepturi vel.',1,0,'galleries/3.jpg',1,'published','2024-05-13 21:55:21','2024-05-13 21:55:21'),(4,'Nature','Consequuntur inventore culpa dicta nostrum autem est. Tempora in fugiat reiciendis. Omnis aliquid qui consequuntur reprehenderit maxime ex.',1,0,'galleries/4.jpg',1,'published','2024-05-13 21:55:21','2024-05-13 21:55:21'),(5,'Morning','Omnis omnis commodi debitis neque aliquam. Enim sapiente quae minima molestiae. Ullam quia dolores dolorem maxime.',1,0,'galleries/5.jpg',1,'published','2024-05-13 21:55:21','2024-05-13 21:55:21'),(6,'Photography','Eius aut libero natus ut quia saepe eos. Ad laudantium sed dolore deserunt. Modi ut omnis consectetur incidunt harum numquam quas.',1,0,'galleries/6.jpg',1,'published','2024-05-13 21:55:21','2024-05-13 21:55:21');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Inventore mollitia veritatis atque cumque nihil blanditiis corporis. Vel nihil eum consequatur. Ea delectus ut dolorem nisi quo laudantium pariatur.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium vitae ea ut quod ut voluptate voluptates. Porro consectetur fuga qui laboriosam sequi repellendus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Pariatur quia est et. Expedita esse ad sint similique et suscipit ea. Ut ipsum voluptatem vero temporibus et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Incidunt dolores natus dolores est tempore. Rerum facilis aut iure quod. Repudiandae autem eveniet quo rem mollitia distinctio.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"At et consequatur architecto exercitationem nemo illo sint et. Officia eligendi tempore sunt sunt dolor veniam est. Dolores in autem quae alias quo.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Sequi nam qui ut est rem ad. Nemo mollitia ut pariatur dolor. Provident dicta laudantium nostrum velit. Aut delectus consequuntur laudantium.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Rerum consequatur suscipit dolorem eum et et pariatur et. Autem doloribus ut officiis. Soluta sint soluta est provident.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Facere corporis aut ipsa voluptatibus accusamus libero enim. Earum iste ipsam quo dolores. Vero incidunt provident sed in et quisquam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Dolore adipisci quidem nihil et ea. Est fugit officia velit aliquid fugiat quia placeat dolor. Ratione et molestias omnis.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2024-05-13 21:55:21','2024-05-13 21:55:21'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Inventore mollitia veritatis atque cumque nihil blanditiis corporis. Vel nihil eum consequatur. Ea delectus ut dolorem nisi quo laudantium pariatur.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium vitae ea ut quod ut voluptate voluptates. Porro consectetur fuga qui laboriosam sequi repellendus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Pariatur quia est et. Expedita esse ad sint similique et suscipit ea. Ut ipsum voluptatem vero temporibus et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Incidunt dolores natus dolores est tempore. Rerum facilis aut iure quod. Repudiandae autem eveniet quo rem mollitia distinctio.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"At et consequatur architecto exercitationem nemo illo sint et. Officia eligendi tempore sunt sunt dolor veniam est. Dolores in autem quae alias quo.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Sequi nam qui ut est rem ad. Nemo mollitia ut pariatur dolor. Provident dicta laudantium nostrum velit. Aut delectus consequuntur laudantium.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Rerum consequatur suscipit dolorem eum et et pariatur et. Autem doloribus ut officiis. Soluta sint soluta est provident.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Facere corporis aut ipsa voluptatibus accusamus libero enim. Earum iste ipsam quo dolores. Vero incidunt provident sed in et quisquam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Dolore adipisci quidem nihil et ea. Est fugit officia velit aliquid fugiat quia placeat dolor. Ratione et molestias omnis.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2024-05-13 21:55:21','2024-05-13 21:55:21'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Inventore mollitia veritatis atque cumque nihil blanditiis corporis. Vel nihil eum consequatur. Ea delectus ut dolorem nisi quo laudantium pariatur.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium vitae ea ut quod ut voluptate voluptates. Porro consectetur fuga qui laboriosam sequi repellendus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Pariatur quia est et. Expedita esse ad sint similique et suscipit ea. Ut ipsum voluptatem vero temporibus et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Incidunt dolores natus dolores est tempore. Rerum facilis aut iure quod. Repudiandae autem eveniet quo rem mollitia distinctio.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"At et consequatur architecto exercitationem nemo illo sint et. Officia eligendi tempore sunt sunt dolor veniam est. Dolores in autem quae alias quo.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Sequi nam qui ut est rem ad. Nemo mollitia ut pariatur dolor. Provident dicta laudantium nostrum velit. Aut delectus consequuntur laudantium.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Rerum consequatur suscipit dolorem eum et et pariatur et. Autem doloribus ut officiis. Soluta sint soluta est provident.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Facere corporis aut ipsa voluptatibus accusamus libero enim. Earum iste ipsam quo dolores. Vero incidunt provident sed in et quisquam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Dolore adipisci quidem nihil et ea. Est fugit officia velit aliquid fugiat quia placeat dolor. Ratione et molestias omnis.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2024-05-13 21:55:21','2024-05-13 21:55:21'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Inventore mollitia veritatis atque cumque nihil blanditiis corporis. Vel nihil eum consequatur. Ea delectus ut dolorem nisi quo laudantium pariatur.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium vitae ea ut quod ut voluptate voluptates. Porro consectetur fuga qui laboriosam sequi repellendus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Pariatur quia est et. Expedita esse ad sint similique et suscipit ea. Ut ipsum voluptatem vero temporibus et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Incidunt dolores natus dolores est tempore. Rerum facilis aut iure quod. Repudiandae autem eveniet quo rem mollitia distinctio.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"At et consequatur architecto exercitationem nemo illo sint et. Officia eligendi tempore sunt sunt dolor veniam est. Dolores in autem quae alias quo.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Sequi nam qui ut est rem ad. Nemo mollitia ut pariatur dolor. Provident dicta laudantium nostrum velit. Aut delectus consequuntur laudantium.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Rerum consequatur suscipit dolorem eum et et pariatur et. Autem doloribus ut officiis. Soluta sint soluta est provident.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Facere corporis aut ipsa voluptatibus accusamus libero enim. Earum iste ipsam quo dolores. Vero incidunt provident sed in et quisquam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Dolore adipisci quidem nihil et ea. Est fugit officia velit aliquid fugiat quia placeat dolor. Ratione et molestias omnis.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2024-05-13 21:55:21','2024-05-13 21:55:21'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Inventore mollitia veritatis atque cumque nihil blanditiis corporis. Vel nihil eum consequatur. Ea delectus ut dolorem nisi quo laudantium pariatur.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium vitae ea ut quod ut voluptate voluptates. Porro consectetur fuga qui laboriosam sequi repellendus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Pariatur quia est et. Expedita esse ad sint similique et suscipit ea. Ut ipsum voluptatem vero temporibus et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Incidunt dolores natus dolores est tempore. Rerum facilis aut iure quod. Repudiandae autem eveniet quo rem mollitia distinctio.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"At et consequatur architecto exercitationem nemo illo sint et. Officia eligendi tempore sunt sunt dolor veniam est. Dolores in autem quae alias quo.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Sequi nam qui ut est rem ad. Nemo mollitia ut pariatur dolor. Provident dicta laudantium nostrum velit. Aut delectus consequuntur laudantium.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Rerum consequatur suscipit dolorem eum et et pariatur et. Autem doloribus ut officiis. Soluta sint soluta est provident.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Facere corporis aut ipsa voluptatibus accusamus libero enim. Earum iste ipsam quo dolores. Vero incidunt provident sed in et quisquam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Dolore adipisci quidem nihil et ea. Est fugit officia velit aliquid fugiat quia placeat dolor. Ratione et molestias omnis.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2024-05-13 21:55:21','2024-05-13 21:55:21'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Inventore mollitia veritatis atque cumque nihil blanditiis corporis. Vel nihil eum consequatur. Ea delectus ut dolorem nisi quo laudantium pariatur.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium vitae ea ut quod ut voluptate voluptates. Porro consectetur fuga qui laboriosam sequi repellendus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Pariatur quia est et. Expedita esse ad sint similique et suscipit ea. Ut ipsum voluptatem vero temporibus et.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Incidunt dolores natus dolores est tempore. Rerum facilis aut iure quod. Repudiandae autem eveniet quo rem mollitia distinctio.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"At et consequatur architecto exercitationem nemo illo sint et. Officia eligendi tempore sunt sunt dolor veniam est. Dolores in autem quae alias quo.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Sequi nam qui ut est rem ad. Nemo mollitia ut pariatur dolor. Provident dicta laudantium nostrum velit. Aut delectus consequuntur laudantium.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Rerum consequatur suscipit dolorem eum et et pariatur et. Autem doloribus ut officiis. Soluta sint soluta est provident.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Facere corporis aut ipsa voluptatibus accusamus libero enim. Earum iste ipsam quo dolores. Vero incidunt provident sed in et quisquam.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Dolore adipisci quidem nihil et ea. Est fugit officia velit aliquid fugiat quia placeat dolor. Ratione et molestias omnis.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2024-05-13 21:55:21','2024-05-13 21:55:21');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_activity_logs`
--

DROP TABLE IF EXISTS `jb_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_activity_logs`
--

LOCK TABLES `jb_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `jb_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_educations`
--

DROP TABLE IF EXISTS `jb_account_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `specialized` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_educations`
--

LOCK TABLES `jb_account_educations` WRITE;
/*!40000 ALTER TABLE `jb_account_educations` DISABLE KEYS */;
INSERT INTO `jb_account_educations` VALUES (1,'American Institute of Health Technology',2,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:28','2024-05-13 21:55:28'),(2,'American Institute of Health Technology',8,'Economics','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:30','2024-05-13 21:55:30'),(3,'American Institute of Health Technology',9,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:30','2024-05-13 21:55:30'),(4,'Associated Mennonite Biblical Seminary',11,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:30','2024-05-13 21:55:30'),(5,'Gateway Technical College',12,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:31','2024-05-13 21:55:31'),(6,'The University of the State of Alabama',13,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:31','2024-05-13 21:55:31'),(7,'The University of the State of Alabama',16,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:32','2024-05-13 21:55:32'),(8,'Associated Mennonite Biblical Seminary',17,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:32','2024-05-13 21:55:32'),(9,'Associated Mennonite Biblical Seminary',21,'Economics','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:33','2024-05-13 21:55:33'),(10,'American Institute of Health Technology',25,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:34','2024-05-13 21:55:34'),(11,'Antioch University McGregor',27,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:34','2024-05-13 21:55:34'),(12,'Antioch University McGregor',29,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:35','2024-05-13 21:55:35'),(13,'Adams State College',30,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:35','2024-05-13 21:55:35'),(14,'Associated Mennonite Biblical Seminary',34,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:36','2024-05-13 21:55:36'),(15,'American Institute of Health Technology',36,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:37','2024-05-13 21:55:37'),(16,'Associated Mennonite Biblical Seminary',37,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:37','2024-05-13 21:55:37'),(17,'Gateway Technical College',39,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:37','2024-05-13 21:55:37'),(18,'Antioch University McGregor',41,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:38','2024-05-13 21:55:38'),(19,'Gateway Technical College',42,'Economics','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:38','2024-05-13 21:55:38'),(20,'Adams State College',45,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:39','2024-05-13 21:55:39'),(21,'Gateway Technical College',46,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:39','2024-05-13 21:55:39'),(22,'The University of the State of Alabama',51,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:40','2024-05-13 21:55:40'),(23,'Gateway Technical College',52,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:41','2024-05-13 21:55:41'),(24,'Gateway Technical College',53,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:41','2024-05-13 21:55:41'),(25,'Gateway Technical College',55,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:41','2024-05-13 21:55:41'),(26,'Gateway Technical College',56,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(27,'The University of the State of Alabama',57,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(28,'Associated Mennonite Biblical Seminary',58,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(29,'American Institute of Health Technology',59,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(30,'The University of the State of Alabama',61,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:43','2024-05-13 21:55:43'),(31,'Antioch University McGregor',63,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:43','2024-05-13 21:55:43'),(32,'Adams State College',66,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:44','2024-05-13 21:55:44'),(33,'Gateway Technical College',68,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:45','2024-05-13 21:55:45'),(34,'American Institute of Health Technology',72,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:46','2024-05-13 21:55:46'),(35,'Associated Mennonite Biblical Seminary',76,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:47','2024-05-13 21:55:47'),(36,'Antioch University McGregor',77,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:47','2024-05-13 21:55:47'),(37,'Associated Mennonite Biblical Seminary',79,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:47','2024-05-13 21:55:47'),(38,'American Institute of Health Technology',82,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:48','2024-05-13 21:55:48'),(39,'American Institute of Health Technology',83,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:48','2024-05-13 21:55:48'),(40,'Gateway Technical College',84,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:49','2024-05-13 21:55:49'),(41,'The University of the State of Alabama',85,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:49','2024-05-13 21:55:49'),(42,'Adams State College',87,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:50','2024-05-13 21:55:50'),(43,'Gateway Technical College',90,'Classical Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:50','2024-05-13 21:55:50'),(44,'Antioch University McGregor',91,'Economics','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:51','2024-05-13 21:55:51'),(45,'Antioch University McGregor',94,'Anthropology','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:51','2024-05-13 21:55:51'),(46,'Gateway Technical College',96,'Art History','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:52','2024-05-13 21:55:52'),(47,'Adams State College',99,'Culture and Technology Studies','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:52','2024-05-13 21:55:52');
/*!40000 ALTER TABLE `jb_account_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_experiences`
--

DROP TABLE IF EXISTS `jb_account_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_experiences`
--

LOCK TABLES `jb_account_experiences` WRITE;
/*!40000 ALTER TABLE `jb_account_experiences` DISABLE KEYS */;
INSERT INTO `jb_account_experiences` VALUES (1,'Spa Paragon',2,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:28','2024-05-13 21:55:28'),(2,'Exploration Kids',8,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:30','2024-05-13 21:55:30'),(3,'Darwin Travel',9,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:30','2024-05-13 21:55:30'),(4,'Spa Paragon',11,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:30','2024-05-13 21:55:30'),(5,'Darwin Travel',12,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:31','2024-05-13 21:55:31'),(6,'Party Plex',13,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:31','2024-05-13 21:55:31'),(7,'Party Plex',16,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:32','2024-05-13 21:55:32'),(8,'GameDay Catering',17,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:32','2024-05-13 21:55:32'),(9,'Party Plex',21,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:33','2024-05-13 21:55:33'),(10,'Darwin Travel',25,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:34','2024-05-13 21:55:34'),(11,'Darwin Travel',27,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:34','2024-05-13 21:55:34'),(12,'Darwin Travel',29,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:35','2024-05-13 21:55:35'),(13,'GameDay Catering',30,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:35','2024-05-13 21:55:35'),(14,'Darwin Travel',34,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:36','2024-05-13 21:55:36'),(15,'Exploration Kids',36,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:37','2024-05-13 21:55:37'),(16,'Darwin Travel',37,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:37','2024-05-13 21:55:37'),(17,'Spa Paragon',39,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:37','2024-05-13 21:55:37'),(18,'Party Plex',41,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:38','2024-05-13 21:55:38'),(19,'GameDay Catering',42,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:38','2024-05-13 21:55:38'),(20,'Party Plex',45,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:39','2024-05-13 21:55:39'),(21,'Darwin Travel',46,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:39','2024-05-13 21:55:39'),(22,'Spa Paragon',51,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:40','2024-05-13 21:55:40'),(23,'Party Plex',52,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:41','2024-05-13 21:55:41'),(24,'Darwin Travel',53,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:41','2024-05-13 21:55:41'),(25,'Spa Paragon',55,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:41','2024-05-13 21:55:41'),(26,'Darwin Travel',56,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(27,'Spa Paragon',57,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(28,'Darwin Travel',58,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(29,'Exploration Kids',59,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:42','2024-05-13 21:55:42'),(30,'Spa Paragon',61,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:43','2024-05-13 21:55:43'),(31,'Party Plex',63,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:43','2024-05-13 21:55:43'),(32,'Darwin Travel',66,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:44','2024-05-13 21:55:44'),(33,'Party Plex',68,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:45','2024-05-13 21:55:45'),(34,'Darwin Travel',72,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:46','2024-05-13 21:55:46'),(35,'Darwin Travel',76,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:47','2024-05-13 21:55:47'),(36,'Exploration Kids',77,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:47','2024-05-13 21:55:47'),(37,'Exploration Kids',79,'Dog Trainer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:47','2024-05-13 21:55:47'),(38,'Party Plex',82,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:48','2024-05-13 21:55:48'),(39,'Spa Paragon',83,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:48','2024-05-13 21:55:48'),(40,'Darwin Travel',84,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:49','2024-05-13 21:55:49'),(41,'Party Plex',85,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:49','2024-05-13 21:55:49'),(42,'Exploration Kids',87,'Project Manager','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:50','2024-05-13 21:55:50'),(43,'Party Plex',90,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:50','2024-05-13 21:55:50'),(44,'Darwin Travel',91,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:51','2024-05-13 21:55:51'),(45,'Exploration Kids',94,'President of Sales','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:51','2024-05-13 21:55:51'),(46,'Spa Paragon',96,'Marketing Coordinator','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:52','2024-05-13 21:55:52'),(47,'Exploration Kids',99,'Web Designer','2024-05-14','2024-05-14','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `jb_account_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_skills`
--

DROP TABLE IF EXISTS `jb_account_favorite_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_skills` (
  `skill_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`skill_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_skills`
--

LOCK TABLES `jb_account_favorite_skills` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_tags`
--

DROP TABLE IF EXISTS `jb_account_favorite_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_tags`
--

LOCK TABLES `jb_account_favorite_tags` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_packages`
--

DROP TABLE IF EXISTS `jb_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_packages`
--

LOCK TABLES `jb_account_packages` WRITE;
/*!40000 ALTER TABLE `jb_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_password_resets`
--

DROP TABLE IF EXISTS `jb_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `jb_account_password_resets_email_index` (`email`),
  KEY `jb_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_password_resets`
--

LOCK TABLES `jb_account_password_resets` WRITE;
/*!40000 ALTER TABLE `jb_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_accounts`
--

DROP TABLE IF EXISTS `jb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job-seeker',
  `credits` int unsigned DEFAULT NULL,
  `resume` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_public_profile` tinyint unsigned NOT NULL DEFAULT '0',
  `hide_cv` tinyint(1) NOT NULL DEFAULT '0',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_for_hiring` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `cover_letter` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_accounts_email_unique` (`email`),
  UNIQUE KEY `jb_accounts_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_accounts`
--

LOCK TABLES `jb_accounts` WRITE;
/*!40000 ALTER TABLE `jb_accounts` DISABLE KEYS */;
INSERT INTO `jb_accounts` VALUES (1,NULL,'Mazie','Powlowski','Software Developer',NULL,'employer@archielite.com','$2y$12$56kHelG2HNgampct8H9ZhuUIBM/srSpvZY2.1I5uRS7PeH/RxTuTi',184,'1977-04-04','+15595595925','2024-05-14 04:55:28',NULL,'employer',NULL,NULL,'6832 Enos Valleys Suite 839\nHeathcoteland, UT 52850-9418','Oh, how I wish you would seem to come before that!\' \'Call the first question, you know.\' \'Not at all,\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you balanced an.',1,0,3177,0,NULL,'2024-05-13 21:55:28','2024-05-13 21:55:28',1,1,NULL,NULL,NULL),(2,NULL,'Jade','Schumm','Creative Designer',NULL,'job_seeker@archielite.com','$2y$12$3WDZrYrSxBueAj8jfApsT.yJL2abwJczqnMapMdKEX.C6IOtJp/yG',186,'2020-10-06','+12395714359','2024-05-14 04:55:28',NULL,'job-seeker',NULL,'resume/01.pdf','58694 Rempel Valley Suite 846\nLake Jayden, AK 29112-4568','France-- Then turn not pale, beloved snail, but come and join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, as we were. My notion was that.',1,0,228,0,NULL,'2024-05-13 21:55:28','2024-05-13 21:55:28',0,1,NULL,NULL,NULL),(3,NULL,'Sarah','Harding','Creative Designer',NULL,'sarah_harding@archielite.com','$2y$12$cgjY/t/6PmI6TRg31JfDbO22g54s5vGFY7mEpIMPdu56Mdf5GQsTW',184,'2008-02-26','+14842325494','2024-05-14 04:55:28',NULL,'employer',NULL,NULL,'25109 Keeley Fall Apt. 608\nPort Lesterton, IN 89977','He unfolded the paper as he came, \'Oh! the Duchess, who seemed to Alice with one of its right ear and left foot, so as to prevent its undoing itself,) she carried it out to sea as you can--\' \'Swim.',1,0,1135,0,NULL,'2024-05-13 21:55:28','2024-05-13 21:55:28',0,1,NULL,NULL,NULL),(4,NULL,'Steven','Jobs','Creative Designer',NULL,'steven_jobs@archielite.com','$2y$12$b8PUZ3VbFuUsVqrF23uY7.Pc5/H6oOpdyBPZTsPFVBbjvLzwZJXb6',185,'1980-09-16','+14809041555','2024-05-14 04:55:29',NULL,'employer',NULL,NULL,'316 Marquardt Isle\nMarcburgh, IA 40972-2142','So she went on. Her listeners were perfectly quiet till she had never seen such a thing. After a while she was trying to box her own children. \'How should I know?\' said Alice, rather alarmed at the.',1,0,3607,0,NULL,'2024-05-13 21:55:29','2024-05-13 21:55:29',0,1,NULL,NULL,NULL),(5,NULL,'William','Kent','Creative Designer',NULL,'william_kent@archielite.com','$2y$12$l.fjyL3gXbGXv8rxeui/DeZIrndq2gRK4jr2SJXnK89UFJu7POhh6',186,'2024-01-17','+13058727519','2024-05-14 04:55:29',NULL,'employer',NULL,NULL,'486 Maci Wells Suite 768\nLake Anastaciomouth, ND 59100-0865','Alice and all of them attempted to explain it is I hate cats and dogs.\' It was all very well without--Maybe it\'s always pepper that makes you forget to talk. I can\'t take LESS,\' said the Mouse.',1,0,322,1,NULL,'2024-05-13 21:55:29','2024-05-13 21:55:29',0,1,NULL,NULL,NULL),(6,NULL,'Malcolm','Schroeder','I!\' said the Cat.',NULL,'romaguera.willie@gmail.com','$2y$12$UzKRoShR9zL/6ZbPuJ1J.OXXD2zJxPxAyGi76onOJu1AJGZ1DIeUe',186,'2010-06-26','+12539268725','2024-05-14 04:55:29',NULL,'employer',NULL,NULL,'21951 Walker Summit Apt. 528\nKayburgh, ID 59590','Alice. \'Nothing,\' said Alice. \'I wonder how many hours a day is very confusing.\' \'It isn\'t,\' said the Hatter. \'You MUST remember,\' remarked the King, and the Mock Turtle said: \'advance twice, set to.',1,0,2904,1,NULL,'2024-05-13 21:55:29','2024-05-13 21:55:29',1,1,NULL,NULL,NULL),(7,NULL,'Shad','Leannon','King was the fan.',NULL,'dbahringer@auer.info','$2y$12$xnvfCfHDOIE6YyvqlP.TcerTYWEznhkAN7Qe3EQYzQ7olnFDH3JIO',186,'1998-09-08','+18785078801','2024-05-14 04:55:29',NULL,'employer',NULL,NULL,'88447 Della Gateway Apt. 704\nWest Collinfort, NV 57967-4136','Number One,\' said Alice. \'Well, then,\' the Gryphon replied very solemnly. Alice was not quite sure whether it would not join the dance. So they couldn\'t get them out of its mouth and began by.',1,0,3487,1,NULL,'2024-05-13 21:55:29','2024-05-13 21:55:29',1,1,NULL,NULL,NULL),(8,NULL,'Hassan','Kunze','He was an immense.',NULL,'white.madalyn@gmail.com','$2y$12$CyYVCR48eZ9AdA38OUvnVen/j.VnxXBvo0UupQig7hlTTqSb/oXsm',184,'2001-01-24','+17204553434','2024-05-14 04:55:30',NULL,'job-seeker',NULL,'resume/01.pdf','299 Kemmer Gateway Suite 916\nJacintheland, CO 19268','Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice to herself, as she could remember them, all these strange Adventures of hers that you think you can find it.\' And she.',1,0,1790,0,NULL,'2024-05-13 21:55:30','2024-05-13 21:55:30',1,1,NULL,NULL,NULL),(9,NULL,'Torrance','Gottlieb','March Hare. \'Then.',NULL,'watsica.viviane@hotmail.com','$2y$12$x/DcIlqPAz5d7d31KpgZb.ykWrzVW8ltSctQHNKAxMQoPxJY5feKG',185,'1990-02-25','+12692061665','2024-05-14 04:55:30',NULL,'job-seeker',NULL,'resume/01.pdf','17855 Hand Stream\nLake Theodora, IN 16444','Long Tale They were just beginning to see you any more!\' And here poor Alice began telling them her adventures from the trees behind him. \'--or next day, maybe,\' the Footman continued in the middle.',1,0,2208,0,NULL,'2024-05-13 21:55:30','2024-05-13 21:55:30',0,1,NULL,NULL,NULL),(10,NULL,'Gay','Jerde','Dormouse: \'not in.',NULL,'michel42@langworth.com','$2y$12$mwKCSt4cXq2LG0Yd1p2rE.tHQNWOV2DEwg2MgeI.NlG1UOFZwPKaG',184,'1988-08-17','+17165459023','2024-05-14 04:55:30',NULL,'employer',NULL,NULL,'4523 Renner Inlet Apt. 231\nRobelview, MS 60128-6223','As soon as look at the Mouse\'s tail; \'but why do you know what they\'re about!\' \'Read them,\' said the King, the Queen, but she stopped hastily, for the first witness,\' said the Cat. \'I don\'t know.',1,0,2867,1,NULL,'2024-05-13 21:55:30','2024-05-13 21:55:30',1,1,NULL,NULL,NULL),(11,NULL,'Anibal','Bartoletti','Alice noticed with.',NULL,'lraynor@hotmail.com','$2y$12$c/FL8ZNEA5jmFC6MGlQ0Xek4yNxdk1V9FJSngifScfjwmTusUlbGC',186,'1981-09-30','+17319928765','2024-05-14 04:55:30',NULL,'job-seeker',NULL,'resume/01.pdf','84310 Mitchell Orchard Suite 795\nPagacmouth, VA 79119-5054','Duchess. \'I make you dry enough!\' They all returned from him to be seen--everything seemed to be done, I wonder?\' Alice guessed in a hurry. \'No, I\'ll look first,\' she said, \'than waste it in time,\'.',1,0,2561,0,NULL,'2024-05-13 21:55:30','2024-05-13 21:55:30',0,1,NULL,NULL,NULL),(12,NULL,'Alta','Ortiz','THIS!\' (Sounds of.',NULL,'stehr.fernando@mante.org','$2y$12$sWpbs3hAmdWSGSXFqXVLJOB.pYZ7JN3YzZPdb1y86w0qkIbNMFsR2',186,'1972-03-18','+13195478338','2024-05-14 04:55:31',NULL,'job-seeker',NULL,'resume/01.pdf','656 Zackery Hill Suite 186\nKossfurt, MS 24124','Dodo had paused as if she were looking up into the sky. Twinkle, twinkle--\"\' Here the Queen to-day?\' \'I should like to be sure! However, everything is to-day! And yesterday things went on growing.',1,0,4523,0,NULL,'2024-05-13 21:55:31','2024-05-13 21:55:31',0,1,NULL,NULL,NULL),(13,NULL,'Everette','Windler','At this moment the.',NULL,'chester41@gulgowski.com','$2y$12$lT0vPdDETZ/ubLZ.hNZXourNN4t0yB6k/PBejv.zdyDacNS3UCWOq',185,'1983-07-24','+15204653313','2024-05-14 04:55:31',NULL,'job-seeker',NULL,'resume/01.pdf','478 Mabel Avenue Suite 974\nCummingshaven, CA 96583-2297','I\'ve tried banks, and I\'ve tried to curtsey as she couldn\'t answer either question, it didn\'t sound at all like the look of the busy farm-yard--while the lowing of the hall; but, alas! either the.',1,0,3461,1,NULL,'2024-05-13 21:55:31','2024-05-13 21:55:31',0,1,NULL,NULL,NULL),(14,NULL,'Stephan','Hand','Alice to herself.',NULL,'alejandrin.wisozk@yahoo.com','$2y$12$eQkG0q9OluSHwgzwpFN9qeVLgnIQf/FnpW/9o68zE7DYNxVZ2048q',185,'1997-02-18','+14246348819','2024-05-14 04:55:31',NULL,'employer',NULL,NULL,'268 Phyllis Cliff\nFramiberg, DE 19119','The Hatter was the first to speak. \'What size do you know the meaning of it altogether; but after a few minutes to see what was going to do it?\' \'In my youth,\' said the White Rabbit; \'in fact.',1,0,2344,1,NULL,'2024-05-13 21:55:31','2024-05-13 21:55:31',1,1,NULL,NULL,NULL),(15,NULL,'Soledad','McClure','Alice thought the.',NULL,'hamill.alba@yahoo.com','$2y$12$CpBSNkEHjQ3zfbb.S1xWBOL4pvth6WgDIfH3VYduB2K4JZrK4CD8W',185,'1987-08-20','+17016956250','2024-05-14 04:55:31',NULL,'employer',NULL,NULL,'891 Kilback Parks Apt. 435\nSanfordstad, CA 40325','Alice; but she did not feel encouraged to ask them what the name of nearly everything there. \'That\'s the first witness,\' said the Dormouse, who seemed ready to sink into the sky. Alice went on.',1,0,4532,1,NULL,'2024-05-13 21:55:31','2024-05-13 21:55:31',1,1,NULL,NULL,NULL),(16,NULL,'Beulah','Hodkiewicz','And mentioned me.',NULL,'brendon37@champlin.com','$2y$12$j1pj/Ps7vaLh4ej3j92QieIEAqykXYPKb5/Mj7.7pTI0C2kvBoWmC',186,'2012-06-29','+13613196651','2024-05-14 04:55:32',NULL,'job-seeker',NULL,'resume/01.pdf','3893 Joany Forks Suite 650\nIsaiasmouth, TN 60453','Alice could not help bursting out laughing: and when she looked up, but it is.\' \'Then you may nurse it a very curious to see the Hatter said, turning to the jury. They were just beginning to get.',1,0,1999,1,NULL,'2024-05-13 21:55:32','2024-05-13 21:55:32',0,1,NULL,NULL,NULL),(17,NULL,'Adriel','Hamill','SAID was, \'Why is.',NULL,'vjenkins@gusikowski.com','$2y$12$LV1EBfN2SplZKSg49hsZU.fAtu9WuHmntLDPCNPhTAc5A7TbORs2e',186,'2022-10-13','+18319617643','2024-05-14 04:55:32',NULL,'job-seeker',NULL,'resume/01.pdf','73215 Rosalind Centers\nNew Orinmouth, UT 40601-6868','Alice think it would be like, but it is.\' \'I quite agree with you,\' said the King. Here one of them can explain it,\' said Five, \'and I\'ll tell you what year it is?\' \'Of course it is,\' said the.',1,0,2212,0,NULL,'2024-05-13 21:55:32','2024-05-13 21:55:32',0,1,NULL,NULL,NULL),(18,NULL,'Laurence','Shields','March Hare moved.',NULL,'lillie.lind@boehm.org','$2y$12$1lyi0uDSePKTxEhIs/RAdOIQm7TAu98bfOnBReDH4X9IPnnZMb.C2',184,'2015-05-11','+15316520687','2024-05-14 04:55:32',NULL,'employer',NULL,NULL,'1777 Olson Villages\nDooleymouth, NJ 93098','Alice said to one of them say, \'Look out now, Five! Don\'t go splashing paint over me like that!\' \'I couldn\'t help it,\' said Alice. \'I\'ve tried every way, and nothing seems to like her, down here.',1,0,4239,0,NULL,'2024-05-13 21:55:32','2024-05-13 21:55:32',1,1,NULL,NULL,NULL),(19,NULL,'Sid','Lockman','Alice doubtfully.',NULL,'tressie.streich@hotmail.com','$2y$12$8q38qh7szUmt./uM97DGLeJ7mlHX3cGh7ci7qH/iOiUQeGMPcdeXq',186,'1976-10-17','+13235602138','2024-05-14 04:55:32',NULL,'employer',NULL,NULL,'588 Dickens Spring Apt. 162\nEdwinchester, HI 78020','Hardly knowing what she did, she picked up a little before she had asked it aloud; and in another moment down went Alice after it, never once considering how in the way wherever she wanted much to.',1,0,2856,1,NULL,'2024-05-13 21:55:32','2024-05-13 21:55:32',0,1,NULL,NULL,NULL),(20,NULL,'Winifred','Shields','You grant that?\'.',NULL,'graham.glenda@hotmail.com','$2y$12$yYPd8bwWH./QmO.BxqK5IO/I.u.1n5DbTuKY253h8Y0iJ8oXGoLli',184,'1997-02-28','+17757144741','2024-05-14 04:55:33',NULL,'employer',NULL,NULL,'321 Beaulah Locks\nNew Emmittstad, MD 93574-2600','Puss,\' she began, rather timidly, saying to her great delight it fitted! Alice opened the door between us. For instance, suppose it doesn\'t mind.\' The table was a large canvas bag, which tied up at.',1,0,2284,1,NULL,'2024-05-13 21:55:33','2024-05-13 21:55:33',0,1,NULL,NULL,NULL),(21,NULL,'Sister','Kirlin','And concluded the.',NULL,'ncummerata@skiles.com','$2y$12$aF7WVugmTfd9XlFAj5Sal.XGuubgnGI37rozIvCUneZsdkpcZegUa',186,'1970-09-10','+17478752447','2024-05-14 04:55:33',NULL,'job-seeker',NULL,'resume/01.pdf','3575 Donnelly Village\nWest Wilford, AR 52786','Alice began, in a sorrowful tone, \'I\'m afraid I can\'t tell you what year it is?\' \'Of course you don\'t!\' the Hatter replied. \'Of course not,\' Alice cautiously replied: \'but I know is, something comes.',1,0,2725,1,NULL,'2024-05-13 21:55:33','2024-05-13 21:55:33',0,1,NULL,NULL,NULL),(22,NULL,'Colin','Hagenes','Alice herself, and.',NULL,'zkuhlman@yahoo.com','$2y$12$l.zSdu4Y8jF8qOQe9ddy7uZuyVhsvcfbyii4m0ijq9nFdlcwB.w0q',186,'1994-05-01','+16806876519','2024-05-14 04:55:33',NULL,'employer',NULL,NULL,'7244 Lueilwitz Underpass Suite 434\nPfefferfurt, CT 14467-5103','The rabbit-hole went straight on like a candle. I wonder what Latitude or Longitude I\'ve got to the little magic bottle had now had its full effect, and she thought it would be very likely it can.',1,0,239,0,NULL,'2024-05-13 21:55:33','2024-05-13 21:55:33',0,1,NULL,NULL,NULL),(23,NULL,'Chance','Goodwin','Rabbit just under.',NULL,'malika.pouros@metz.com','$2y$12$2X7b4KjDluDapKldAwc6T.ArhSmX2ugjRyEClEFQnGEafScsRvTfi',185,'1979-03-11','+19518895933','2024-05-14 04:55:33',NULL,'employer',NULL,NULL,'844 Savanna Square Apt. 741\nSouth Marlee, FL 41223','Oh, my dear Dinah! I wonder if I must, I must,\' the King exclaimed, turning to Alice to herself. \'Of the mushroom,\' said the Duchess. \'I make you grow shorter.\' \'One side will make you dry enough!\'.',1,0,3796,0,NULL,'2024-05-13 21:55:33','2024-05-13 21:55:33',0,1,NULL,NULL,NULL),(24,NULL,'Meda','Toy','Mock Turtle yet?\'.',NULL,'eleazar13@senger.com','$2y$12$TP3LhU3A89/HxtrgNtfF7.5yxCoKf2OxfHjSaOjPZiJk.PuXt5TNe',186,'2013-05-01','+18285599527','2024-05-14 04:55:34',NULL,'employer',NULL,NULL,'388 Grant Viaduct\nStewartton, WY 18618-4620','Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at Two. Two began in a very interesting dance to watch,\' said Alice, in a sorrowful tone; \'at least there\'s no room.',1,0,2224,0,NULL,'2024-05-13 21:55:34','2024-05-13 21:55:34',0,1,NULL,NULL,NULL),(25,NULL,'Ada','Mraz','Alice. \'I\'m glad.',NULL,'bernier.belle@stamm.com','$2y$12$MBnGXg.r/IjcwAEj4cm43OMh6n6Y9CSbNCicjeCiGJDajqcGb8Ply',185,'1974-08-02','+16036932777','2024-05-14 04:55:34',NULL,'job-seeker',NULL,'resume/01.pdf','73791 Shaina Square Suite 057\nSchmittburgh, FL 30404','Improve his shining tail, And pour the waters of the other side, the puppy jumped into the air. \'--as far out to be managed? I suppose you\'ll be telling me next that you think you can find them.\' As.',1,0,3381,0,NULL,'2024-05-13 21:55:34','2024-05-13 21:55:34',0,1,NULL,NULL,NULL),(26,NULL,'Alberto','Howe','An obstacle that.',NULL,'michaela.boyle@yahoo.com','$2y$12$Skn1vbxXBdd8jCxj511Hh.XhFimO/udwVjXMZqWC.fbKph9nYEs2q',186,'1999-07-06','+17817252445','2024-05-14 04:55:34',NULL,'employer',NULL,NULL,'37166 Swaniawski Route Suite 011\nWest Rosarioside, WA 19227-4233','Duchess to play croquet.\' Then they both sat silent for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' said the Duchess: \'what a clear way you have of putting things!\' \'It\'s a mineral, I THINK,\'.',1,0,4192,1,NULL,'2024-05-13 21:55:34','2024-05-13 21:55:34',1,1,NULL,NULL,NULL),(27,NULL,'Maiya','Hodkiewicz','I\'m talking!\' Just.',NULL,'laney51@feest.com','$2y$12$E4wzXTRZTtDp16bvuPGvP.YyaC9Ex7NWlZKS8Gts6UAiQ9VZwlu7C',186,'1977-02-03','+16095365038','2024-05-14 04:55:34',NULL,'job-seeker',NULL,'resume/01.pdf','15638 Nickolas Plains Suite 649\nPort Lessieberg, MT 89571-6175','The Cat seemed to be Involved in this way! Stop this moment, and fetch me a pair of the well, and noticed that one of the well, and noticed that one of the players to be a person of authority among.',1,0,776,0,NULL,'2024-05-13 21:55:34','2024-05-13 21:55:34',0,1,NULL,NULL,NULL),(28,NULL,'Roel','Terry','VERY wide, but she.',NULL,'akeem53@pfeffer.com','$2y$12$vwreCsVznDcU.ZspB1oMDOPjvENX6XyxIJQtihT9D.e1Kpgr24p3W',186,'1976-03-12','+14806730858','2024-05-14 04:55:35',NULL,'employer',NULL,NULL,'659 Bette Bridge\nKlingland, TX 12850-5746','First, she dreamed of little animals and birds waiting outside. The poor little thing was waving its tail about in the face. \'I\'ll put a stop to this,\' she said to the end of half an hour or so.',1,0,1116,1,NULL,'2024-05-13 21:55:35','2024-05-13 21:55:35',1,1,NULL,NULL,NULL),(29,NULL,'Lola','Abbott','Queen, stamping on.',NULL,'eldora.rohan@harvey.com','$2y$12$7CYqcZk5WMUpdh5aaQ/PLOtrQAvl1j0X67rNEUKwaSgA8ein.xdGC',184,'2000-08-25','+17329869136','2024-05-14 04:55:35',NULL,'job-seeker',NULL,'resume/01.pdf','82617 Marjorie Dale\nBlockburgh, RI 95399','I\'ve kept her waiting!\' Alice felt that this could not help thinking there MUST be more to be patted on the OUTSIDE.\' He unfolded the paper as he fumbled over the verses the White Rabbit.',1,0,663,0,NULL,'2024-05-13 21:55:35','2024-05-13 21:55:35',1,1,NULL,NULL,NULL),(30,NULL,'Meghan','DuBuque','I\'ve been changed.',NULL,'damien.farrell@boyle.info','$2y$12$mcMLTubsycWh8LKSBjuUdepzmRKlFB8QVj32eNZqpc4N5n4xMA4G6',184,'1976-08-21','+16516919642','2024-05-14 04:55:35',NULL,'job-seeker',NULL,'resume/01.pdf','5115 Evangeline Ports Apt. 047\nJacobsport, TN 07411-5099','Hatter. He came in sight of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice to herself.',1,0,1609,0,NULL,'2024-05-13 21:55:35','2024-05-13 21:55:35',0,1,NULL,NULL,NULL),(31,NULL,'Emma','Olson','Pigeon in a deep.',NULL,'sonia54@gmail.com','$2y$12$uf.YIuROf9kWFjYrtzePmudJ0.w6IKd0oT4VqjqM2dGOXlihKorm.',186,'1970-11-18','+18476763834','2024-05-14 04:55:35',NULL,'employer',NULL,NULL,'449 Juliet Orchard Apt. 280\nWest Tyrel, AR 32712','I BEG your pardon!\' cried Alice hastily, afraid that it seemed quite dull and stupid for life to go on. \'And so these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, rather alarmed.',1,0,3363,1,NULL,'2024-05-13 21:55:35','2024-05-13 21:55:35',0,1,NULL,NULL,NULL),(32,NULL,'Mariela','Kilback','So they sat down.',NULL,'considine.shawna@gmail.com','$2y$12$01Ldn4evo25LezCm0DisP.YJZP/7t4wTwdLDsmdtlJQwtdzk6GQt2',185,'1970-06-27','+13025954941','2024-05-14 04:55:36',NULL,'employer',NULL,NULL,'367 Antonette Canyon\nEast Mozellfort, ND 86434','There was a little girl she\'ll think me at all.\' \'In that case,\' said the Duchess. \'I make you grow shorter.\' \'One side of the officers of the sort. Next came an angry tone, \'Why, Mary Ann, what ARE.',1,0,1321,0,NULL,'2024-05-13 21:55:36','2024-05-13 21:55:36',1,1,NULL,NULL,NULL),(33,NULL,'Jonathan','Reichel','Alice, \'we learned.',NULL,'vstehr@hotmail.com','$2y$12$oio54utE/YQjWGCLqKwXkOgtKqLVXGTMXipwpFbjR81jRPZrL32G.',184,'1985-05-30','+14809106404','2024-05-14 04:55:36',NULL,'employer',NULL,NULL,'13499 Alvera Brook Suite 034\nNew Queenie, NV 11098-7168','The Cat\'s head with great curiosity, and this Alice thought to herself, rather sharply; \'I advise you to set them free, Exactly as we were. My notion was that it made Alice quite jumped; but she had.',1,0,669,1,NULL,'2024-05-13 21:55:36','2024-05-13 21:55:36',1,1,NULL,NULL,NULL),(34,NULL,'Maxine','Shanahan','Alice\'s shoulder.',NULL,'erich.nitzsche@hotmail.com','$2y$12$oHMvwKEFCgefELBlZCp3o.P2PAdZ/ijO4H6kvkmU4TWEyr/./M/RO',184,'2020-09-06','+14134615938','2024-05-14 04:55:36',NULL,'job-seeker',NULL,'resume/01.pdf','346 Bogan Divide\nEast Gerhardhaven, ND 17231','Duchess. An invitation for the baby, the shriek of the deepest contempt. \'I\'ve seen a good deal worse off than before, as the March Hare and the whole place around her became alive with the Lory, as.',1,0,3088,1,NULL,'2024-05-13 21:55:36','2024-05-13 21:55:36',0,1,NULL,NULL,NULL),(35,NULL,'Liza','Jones','By the time they.',NULL,'wbogan@yahoo.com','$2y$12$h/ZjTu8JVOn0AdlH7xa9hO/mg0GPAsgFs96bA13nMZDJNv3ko3ZaC',184,'2011-07-09','+19718188014','2024-05-14 04:55:36',NULL,'employer',NULL,NULL,'5972 McKenzie Falls Apt. 922\nBeattyfort, OH 29629','HE was.\' \'I never could abide figures!\' And with that she was nine feet high. \'I wish I could let you out, you know.\' \'Who is this?\' She said the Caterpillar. \'Is that all?\' said Alice, and sighing.',1,0,845,1,NULL,'2024-05-13 21:55:36','2024-05-13 21:55:36',0,1,NULL,NULL,NULL),(36,NULL,'Vinnie','Mitchell','King added in an.',NULL,'gdickinson@hotmail.com','$2y$12$qJtWYhgAMKxoSuEGFXIw9O/f/4pFheyKtIAbedqHA22oMtEsbpCnu',185,'1979-02-12','+12406654568','2024-05-14 04:55:37',NULL,'job-seeker',NULL,'resume/01.pdf','468 Cornelius Lane Suite 650\nNorth Delaneyberg, NJ 80157-3294','Alice. \'I don\'t believe there\'s an atom of meaning in it,\' said the last concert!\' on which the wretched Hatter trembled so, that Alice had begun to repeat it, when a sharp hiss made her feel very.',1,0,2853,1,NULL,'2024-05-13 21:55:37','2024-05-13 21:55:37',0,1,NULL,NULL,NULL),(37,NULL,'Afton','Douglas','Alice. \'Stand up.',NULL,'cicero.klocko@hotmail.com','$2y$12$WtaKsVsZ7ZzcTKy1./rMPu84RZAnhnvSXmoTVMSySF5v/3syHTna2',186,'2002-07-26','+19796794051','2024-05-14 04:55:37',NULL,'job-seeker',NULL,'resume/01.pdf','9799 Magdalena Villages\nSouth Bonita, TX 83643','Rabbit coming to look about her pet: \'Dinah\'s our cat. And she\'s such a thing. After a minute or two, they began moving about again, and looking anxiously about as curious as it spoke (it was.',1,0,2698,1,NULL,'2024-05-13 21:55:37','2024-05-13 21:55:37',0,1,NULL,NULL,NULL),(38,NULL,'Beau','Wisozk','I almost wish I\'d.',NULL,'milan.larkin@beer.com','$2y$12$jeQ.v1096WJwegTRbnL.reXiTHanv7U/64XFcKP.NwUDmGmyaKAC6',184,'2005-10-16','+12394778773','2024-05-14 04:55:37',NULL,'employer',NULL,NULL,'57691 Farrell Light Apt. 857\nLake Saul, KS 47260','If she should push the matter with it. There was not going to begin with; and being ordered about by mice and rabbits. I almost think I may as well as she could, for the accident of the month is.',1,0,2162,1,NULL,'2024-05-13 21:55:37','2024-05-13 21:55:37',0,1,NULL,NULL,NULL),(39,NULL,'Jackson','Brown','Tortoise--\' \'Why.',NULL,'rohan.shania@bergnaum.info','$2y$12$x4u.Wf6Bf18mST2.dQ87y.TFwTID3ZGQRmRX7gIk1/IZu0AFcHWG.',184,'1996-04-12','+14146864922','2024-05-14 04:55:37',NULL,'job-seeker',NULL,'resume/01.pdf','570 Blake Roads\nGloverborough, WA 33499-3065','Dormouse again, so violently, that she had tired herself out with trying, the poor little juror (it was exactly the right thing to eat or drink something or other; but the wise little Alice herself.',1,0,4250,0,NULL,'2024-05-13 21:55:37','2024-05-13 21:55:37',1,1,NULL,NULL,NULL),(40,NULL,'Spencer','Hahn','Good-bye, feet!\'.',NULL,'wjast@legros.net','$2y$12$2qGYHC8T/1GoI9ob/dUsueLL3sI5xLKC5wBKoYFuaYyW4knWVAaOy',184,'1976-06-07','+13047487377','2024-05-14 04:55:38',NULL,'employer',NULL,NULL,'84405 Rylee Plains Suite 652\nWest Ebonyside, NE 44568','Mock Turtle, who looked at the door-- Pray, what is the same as the rest of the fact. \'I keep them to sell,\' the Hatter hurriedly left the court, she said to herself, \'to be going messages for a.',1,0,2212,0,NULL,'2024-05-13 21:55:38','2024-05-13 21:55:38',0,1,NULL,NULL,NULL),(41,NULL,'Joanie','Mayer','Lizard, who seemed.',NULL,'ebeier@hotmail.com','$2y$12$07IPqD5Gwn2sviuPngZLQOSN4xhIeAqaZHx3REaMUEt1vfsbumS2W',185,'2013-01-12','+14243576821','2024-05-14 04:55:38',NULL,'job-seeker',NULL,'resume/01.pdf','692 Ruecker Field Apt. 668\nPort Elody, GA 47128','THAT direction,\' the Cat again, sitting on the floor, and a large canvas bag, which tied up at the picture.) \'Up, lazy thing!\' said Alice, who was beginning to get rather sleepy, and went to school.',1,0,490,0,NULL,'2024-05-13 21:55:38','2024-05-13 21:55:38',1,1,NULL,NULL,NULL),(42,NULL,'Kiera','Medhurst','Alice turned and.',NULL,'schamberger.ismael@tremblay.biz','$2y$12$UnCLnfx3DnR.QRyHgYRQ7OI/llSOkxFrzCUbje23e6IP5P3.PSif2',185,'1992-04-20','+14257251563','2024-05-14 04:55:38',NULL,'job-seeker',NULL,'resume/01.pdf','28560 Gwen Manor Suite 818\nNew Ivaview, NM 36090-7062','Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they COULD! I\'m sure I can\'t show it you myself,\' the Mock Turtle.',1,0,4364,0,NULL,'2024-05-13 21:55:38','2024-05-13 21:55:38',1,1,NULL,NULL,NULL),(43,NULL,'Helen','Mills','Gryphon as if he.',NULL,'heaney.mellie@yahoo.com','$2y$12$9g9kFzkdxYkicQZGAIoBeuCzmSdJgB2KjJRll6UOgF/nVNpJ76qWW',186,'1995-12-23','+14588358403','2024-05-14 04:55:38',NULL,'employer',NULL,NULL,'373 Brennan Center\nEast Asiamouth, NH 29068','Nobody moved. \'Who cares for you?\' said Alice, in a low voice, \'Your Majesty must cross-examine the next witness!\' said the young lady tells us a story.\' \'I\'m afraid I don\'t keep the same year for.',1,0,823,1,NULL,'2024-05-13 21:55:38','2024-05-13 21:55:38',0,1,NULL,NULL,NULL),(44,NULL,'Lillian','Miller','And she thought it.',NULL,'euna07@koelpin.com','$2y$12$2rgSs.tLgcvB9VkT2TZCBurUt2BJTY/B.eLSVdu4lxtvf0mRVEiOS',184,'1998-01-04','+14634387052','2024-05-14 04:55:39',NULL,'employer',NULL,NULL,'28792 Gorczany Highway\nPort Stefan, KY 65451','Alice thought she had not gone (We know it to speak good English); \'now I\'m opening out like the Mock Turtle in a solemn tone, only changing the order of the house, and have next to her. The Cat.',1,0,886,1,NULL,'2024-05-13 21:55:39','2024-05-13 21:55:39',1,1,NULL,NULL,NULL),(45,NULL,'Daryl','Becker','M--\' \'Why with an.',NULL,'jernser@gottlieb.com','$2y$12$D7srUnk5CfL35YNr3ZucKusaBwILu0kHzgdei5HZcjbBAcwHAEe7.',185,'1992-06-27','+15086560541','2024-05-14 04:55:39',NULL,'job-seeker',NULL,'resume/01.pdf','6686 Cleta Gardens Suite 927\nEast Dustin, ND 69891-0470','I\'ll set Dinah at you!\' There was nothing on it but tea. \'I don\'t see,\' said the King. Here one of the Lobster Quadrille, that she looked at each other for some time without interrupting it. \'They.',1,0,3911,1,NULL,'2024-05-13 21:55:39','2024-05-13 21:55:39',1,1,NULL,NULL,NULL),(46,NULL,'Wilford','Nicolas','Caterpillar; and.',NULL,'jerad.dare@boehm.com','$2y$12$y2BMYWzRA/795gMk6.UJnOYf2lPlVhz9v9QLGSCrY55Z309un4QOu',184,'2004-10-22','+15085970142','2024-05-14 04:55:39',NULL,'job-seeker',NULL,'resume/01.pdf','67600 Susana Ford Apt. 849\nSouth Ednaton, TN 79667-2795','They had not gone far before they saw her, they hurried back to the garden door. Poor Alice! It was so long since she had hoped) a fan and the bright eager eyes were nearly out of sight: \'but it.',1,0,2213,0,NULL,'2024-05-13 21:55:39','2024-05-13 21:55:39',1,1,NULL,NULL,NULL),(47,NULL,'Elvis','Schimmel','Bill\'s got to come.',NULL,'marguerite.kertzmann@abernathy.net','$2y$12$Fi40ec1eOtELvD2ibhbWL.W1m0YlziOHQAlAzQNyFoMnGT2dZnjMC',184,'1978-08-04','+15203914435','2024-05-14 04:55:39',NULL,'employer',NULL,NULL,'8276 Bergstrom Port Apt. 183\nSouth Carolyn, NH 49631','I ask! It\'s always six o\'clock now.\' A bright idea came into her eyes--and still as she spoke. \'I must be a lesson to you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice very.',1,0,1366,0,NULL,'2024-05-13 21:55:39','2024-05-13 21:55:39',1,1,NULL,NULL,NULL),(48,NULL,'Kiel','Ullrich','YOU manage?\' Alice.',NULL,'pagac.dangelo@roberts.com','$2y$12$VgrZblKp9YqFs8Im0PvVk.y.SA7YOE1SDyODeIFsI7nd7Nz40zQxm',185,'2004-05-24','+12238666441','2024-05-14 04:55:40',NULL,'employer',NULL,NULL,'4691 Quitzon Course\nLake Haroldview, IL 63420','She felt that she wanted to send the hedgehog a blow with its eyelids, so he with his knuckles. It was the BEST butter,\' the March Hare will be When they take us up and rubbed its eyes: then it.',1,0,4248,1,NULL,'2024-05-13 21:55:40','2024-05-13 21:55:40',1,1,NULL,NULL,NULL),(49,NULL,'Gabriella','Stokes','England the nearer.',NULL,'wunsch.evert@hotmail.com','$2y$12$3evORQ2eKQsh4kyAfWkQ.uYGC4FraoKhO9rrO0xgPOVQhRbfT9xEm',184,'1997-01-14','+17437417488','2024-05-14 04:55:40',NULL,'employer',NULL,NULL,'882 Gwen Place Apt. 226\nEast Dana, MT 50860-7881','The Rabbit started violently, dropped the white kid gloves and a Long Tale They were just beginning to see what was the first question, you know.\' He was looking about for some while in silence.',1,0,916,1,NULL,'2024-05-13 21:55:40','2024-05-13 21:55:40',1,1,NULL,NULL,NULL),(50,NULL,'Kelsi','Shields','Alice; \'all I know.',NULL,'heather70@yahoo.com','$2y$12$ka8mxNTDL8Z0B6SOjht5aOQU25V0YiGEPEYMaxgOkaJ8mvuwwqZcW',186,'2014-05-30','+14805353069','2024-05-14 04:55:40',NULL,'employer',NULL,NULL,'884 Toy Dale Suite 561\nSpinkabury, DC 14598','Go on!\' \'I\'m a poor man,\' the Hatter grumbled: \'you shouldn\'t have put it into his plate. Alice did not much larger than a pig, and she set off at once took up the conversation dropped, and the.',1,0,565,0,NULL,'2024-05-13 21:55:40','2024-05-13 21:55:40',0,1,NULL,NULL,NULL),(51,NULL,'Tamia','Gutkowski','I shan\'t! YOU do.',NULL,'britney.bosco@hotmail.com','$2y$12$njqxtxm6Vzo2XFnNBzGfGOcHOh/z4sqLbQCruJq4aed9kcuKt/B3y',184,'2010-10-01','+15187763729','2024-05-14 04:55:40',NULL,'job-seeker',NULL,'resume/01.pdf','306 Schaden Walk\nNadertown, NY 92155-6220','The cook threw a frying-pan after her as hard as it didn\'t much matter which way I ought to be otherwise.\"\' \'I think you could manage it?) \'And what an ignorant little girl or a worm. The question.',1,0,913,1,NULL,'2024-05-13 21:55:40','2024-05-13 21:55:40',1,1,NULL,NULL,NULL),(52,NULL,'Crawford','Predovic','And she went down.',NULL,'noemi.renner@batz.com','$2y$12$KppP5uVxAk1VC462oqxpk.oAQuz6Fl2FQ1yNl0M1JiwAYA35xT8fm',186,'1986-04-30','+15864154497','2024-05-14 04:55:41',NULL,'job-seeker',NULL,'resume/01.pdf','2893 Norris Springs\nGibsonhaven, NJ 73517-0237','I\'m sure I have dropped them, I wonder?\' Alice guessed in a wondering tone. \'Why, what are YOUR shoes done with?\' said the Mock Turtle sighed deeply, and drew the back of one flapper across his.',1,0,270,1,NULL,'2024-05-13 21:55:41','2024-05-13 21:55:41',1,1,NULL,NULL,NULL),(53,NULL,'Zella','Labadie','Gryphon, and the.',NULL,'xwalsh@gmail.com','$2y$12$fuvxpsy8LPcjkjGsXWYGL.IUtYIUWQpBNEJLxoTs0/0DNGl9dTaVi',185,'2010-06-02','+15648622885','2024-05-14 04:55:41',NULL,'job-seeker',NULL,'resume/01.pdf','7066 Anastasia Springs\nEast Dannie, WY 94627-6048','There was a very poor speaker,\' said the Caterpillar. \'Is that the reason and all her coaxing. Hardly knowing what she was nine feet high, and she told her sister, who was passing at the end of the.',1,0,1613,0,NULL,'2024-05-13 21:55:41','2024-05-13 21:55:41',1,1,NULL,NULL,NULL),(54,NULL,'Katheryn','Ebert','Do cats eat bats.',NULL,'shirley.bogan@gmail.com','$2y$12$FmV3uhI4sDHHcVBm/xBRIO22nu/GMICACTaQjBAlqCAFQLiSY8MQ2',186,'1974-11-08','+14422659778','2024-05-14 04:55:41',NULL,'employer',NULL,NULL,'651 Jon Plains Suite 809\nNorth Derrick, IN 82561','Alice was only too glad to find that she began thinking over other children she knew that it felt quite relieved to see what this bottle does. I do hope it\'ll make me smaller, I can listen all day.',1,0,2305,1,NULL,'2024-05-13 21:55:41','2024-05-13 21:55:41',0,1,NULL,NULL,NULL),(55,NULL,'Marvin','Reichert','And she\'s such a.',NULL,'schuster.mose@hotmail.com','$2y$12$9jH2xFd5ya2X6O/1qRPLbemjRYPfSSzbbkB.Go8aA.UgboG6IlA5W',184,'2024-02-27','+12699182440','2024-05-14 04:55:41',NULL,'job-seeker',NULL,'resume/01.pdf','1166 Rolfson Harbors Suite 630\nDorisshire, CA 80513-2458','And argued each case with my wife; And the Gryphon answered, very nearly getting up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t know how to set them free, Exactly as we.',1,0,2570,1,NULL,'2024-05-13 21:55:41','2024-05-13 21:55:41',1,1,NULL,NULL,NULL),(56,NULL,'Bobbie','Raynor','Gryphon. \'We can.',NULL,'stamm.ron@dickens.com','$2y$12$QpyWizcSBP/wSsOcgNaE/eldzNTpTiR6iKCFU3g7FuDEjpFmOLqK6',184,'2019-10-18','+13517076829','2024-05-14 04:55:42',NULL,'job-seeker',NULL,'resume/01.pdf','8725 Yvette Springs Suite 676\nEast Gene, TX 44323-9949','Lizard as she could not taste theirs, and the other side. The further off from England the nearer is to do so. \'Shall we try another figure of the mushroom, and raised herself to about two feet.',1,0,716,1,NULL,'2024-05-13 21:55:42','2024-05-13 21:55:42',1,1,NULL,NULL,NULL),(57,NULL,'Karson','Dickens','I wonder what CAN.',NULL,'kreiger.corbin@erdman.org','$2y$12$ipmr5U4BdGk15Eui2CLDz.sM5iKpO5tIsNK08jHikwC6XdLWtahbW',184,'1970-06-18','+19404274356','2024-05-14 04:55:42',NULL,'job-seeker',NULL,'resume/01.pdf','37528 Kacey Course\nWest Arnaldoburgh, VT 39791-3694','White Rabbit; \'in fact, there\'s nothing written on the bank, and of having the sentence first!\' \'Hold your tongue, Ma!\' said the Duchess, \'as pigs have to turn into a cucumber-frame, or something of.',1,0,862,1,NULL,'2024-05-13 21:55:42','2024-05-13 21:55:42',0,1,NULL,NULL,NULL),(58,NULL,'Annamae','Lindgren','Duchess: \'what a.',NULL,'dschumm@hotmail.com','$2y$12$Mkkk5tkg77c7gkjfVKaQ0uv8dNeK5RDnWqX2xVD4GgBpIY/e9.Zfy',186,'2009-05-06','+18185765119','2024-05-14 04:55:42',NULL,'job-seeker',NULL,'resume/01.pdf','60817 Velva Fall\nLowemouth, NV 91119','Queen was silent. The Dormouse slowly opened his eyes. \'I wasn\'t asleep,\' he said to herself; \'the March Hare had just succeeded in bringing herself down to look over their shoulders, that all the.',1,0,4798,0,NULL,'2024-05-13 21:55:42','2024-05-13 21:55:42',1,1,NULL,NULL,NULL),(59,NULL,'Toney','Boehm','Duchess; \'and most.',NULL,'hubert.upton@konopelski.com','$2y$12$xFDW6VZy7IiBa7RK8AtED.K37nceZx68O7gRPOujR319rgt/TVJLC',184,'1972-09-19','+19493384853','2024-05-14 04:55:42',NULL,'job-seeker',NULL,'resume/01.pdf','5749 Roslyn Ville\nEast Natalia, ND 43024-7888','YOU?\' said the Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Gryphon went on just as if it had lost something; and she heard a little house in it a.',1,0,632,1,NULL,'2024-05-13 21:55:42','2024-05-13 21:55:42',0,1,NULL,NULL,NULL),(60,NULL,'Darrion','Hagenes','Gryphon answered.',NULL,'vance85@berge.net','$2y$12$IBUrH2TpRgEANZ9ut0O7I.vc0CVRkffLOhy5SCF5JBRyZoHOv9sjW',184,'1987-05-05','+12819855129','2024-05-14 04:55:43',NULL,'employer',NULL,NULL,'7203 Streich Stravenue\nPort Ginaburgh, OH 48152-2101','Normans--\" How are you thinking of?\' \'I beg your pardon!\' she exclaimed in a whisper, half afraid that it was sneezing on the look-out for serpents night and day! Why, I do hope it\'ll make me.',1,0,1382,1,NULL,'2024-05-13 21:55:43','2024-05-13 21:55:43',1,1,NULL,NULL,NULL),(61,NULL,'Chesley','O\'Reilly','VERY wide, but she.',NULL,'gloria73@gmail.com','$2y$12$UCl6oVjEfneRix20.U8eKeTVqyANObK8zOgljeszoCUoIFGATfOty',186,'1981-05-28','+18568970182','2024-05-14 04:55:43',NULL,'job-seeker',NULL,'resume/01.pdf','973 Huel Expressway Suite 978\nAllisonport, DC 24920','Dormouse!\' And they pinched it on both sides of it; so, after hunting all about for some time busily writing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen of Hearts were.',1,0,3016,1,NULL,'2024-05-13 21:55:43','2024-05-13 21:55:43',1,1,NULL,NULL,NULL),(62,NULL,'Virginia','Rohan','Who in the middle.',NULL,'pkuvalis@cummerata.com','$2y$12$lkrBp7OwJNreDS2Odge2MemtcEYnkfE4d27dqcJeS8A7PpyRE1gaS',184,'1990-12-01','+15865301631','2024-05-14 04:55:43',NULL,'employer',NULL,NULL,'375 Garett Glens Suite 501\nFarrellberg, TN 88140','I know is, it would feel with all speed back to the croquet-ground. The other guests had taken his watch out of sight: then it chuckled. \'What fun!\' said the King. The next witness would be quite.',1,0,727,0,NULL,'2024-05-13 21:55:43','2024-05-13 21:55:43',0,1,NULL,NULL,NULL),(63,NULL,'Prudence','Gislason','Gryphon answered.',NULL,'xrippin@corwin.info','$2y$12$I0z3H3/Qb/a1UgpzhBAr1OEcmFCvp0YCQ4WjLFQFCnL.nZQAZgCXy',186,'2015-08-25','+16097504972','2024-05-14 04:55:43',NULL,'job-seeker',NULL,'resume/01.pdf','479 Alexa Lights\nNew Chanelfurt, LA 52467','Elsie, Lacie, and Tillie; and they lived at the house, quite forgetting her promise. \'Treacle,\' said the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at Two. Two began in a.',1,0,3422,0,NULL,'2024-05-13 21:55:43','2024-05-13 21:55:43',1,1,NULL,NULL,NULL),(64,NULL,'Moses','Spinka','While she was up.',NULL,'isabel79@reilly.com','$2y$12$193w5VP4qSDA0tLipgMH1evHQ2OnA6UZ7UDluFmRXQpmrhqWGHvaq',185,'1972-04-19','+15734958644','2024-05-14 04:55:44',NULL,'employer',NULL,NULL,'690 Nathaniel Mission\nEast Tyresemouth, DE 32980-6610','The long grass rustled at her hands, and she put it. She stretched herself up and ran till she was now only ten inches high, and her eyes immediately met those of a muchness\"--did you ever see such.',1,0,1308,0,NULL,'2024-05-13 21:55:44','2024-05-13 21:55:44',1,1,NULL,NULL,NULL),(65,NULL,'Lou','Terry','Caterpillar, and.',NULL,'tamara02@yahoo.com','$2y$12$R2JZuFcuQFaDp7Li0R6BDem8JkKREAV5Z9w1h7QrOOLW.UnWOzQYa',184,'1977-02-21','+19133656114','2024-05-14 04:55:44',NULL,'employer',NULL,NULL,'440 Vandervort Garden Suite 889\nKossmouth, UT 34065-5991','LITTLE larger, sir, if you cut your finger VERY deeply with a growl, And concluded the banquet--] \'What IS a long sleep you\'ve had!\' \'Oh, I\'ve had such a fall as this, I shall have somebody to talk.',1,0,4389,1,NULL,'2024-05-13 21:55:44','2024-05-13 21:55:44',1,1,NULL,NULL,NULL),(66,NULL,'Jaqueline','Schinner','And he got up this.',NULL,'klein.queen@altenwerth.com','$2y$12$vjyDmla.HFVRemuzfmquZeBmfcpW.ttAMbfWeN0JMUtAHvosXct.2',185,'2024-03-01','+15077834873','2024-05-14 04:55:44',NULL,'job-seeker',NULL,'resume/01.pdf','426 Becker Station Suite 806\nEldredton, OK 39950-5073','I suppose it doesn\'t matter which way she put it. She felt very lonely and low-spirited. In a minute or two, they began moving about again, and went in. The door led right into it. \'That\'s very.',1,0,4502,0,NULL,'2024-05-13 21:55:44','2024-05-13 21:55:44',1,1,NULL,NULL,NULL),(67,NULL,'Mac','Medhurst','Caterpillar; and.',NULL,'brekke.joannie@hotmail.com','$2y$12$saaan8.bocsqFoBiDkLYi.L5anq3O5X8ZLPtWZtVqIOu2N8Hs769S',186,'1976-09-06','+16625300901','2024-05-14 04:55:44',NULL,'employer',NULL,NULL,'618 Doyle Fields\nMarielleside, AL 13381-1377','Alice looked all round the table, half hoping that the reason of that?\' \'In my youth,\' Father William replied to his ear. Alice considered a little before she had caught the flamingo and brought it.',1,0,3587,1,NULL,'2024-05-13 21:55:44','2024-05-13 21:55:44',0,1,NULL,NULL,NULL),(68,NULL,'Irwin','Swaniawski','White Rabbit cried.',NULL,'weissnat.susan@yahoo.com','$2y$12$j3ELvrXZZtXXVXHv2kUiq.03vF8Ht2DzOfEdehwoSa01J2VdW7Mb6',184,'1977-11-19','+13853989861','2024-05-14 04:55:45',NULL,'job-seeker',NULL,'resume/01.pdf','1349 Opal Pass Suite 958\nNorth Antone, KS 41955-6499','When she got used to queer things happening. While she was considering in her pocket, and pulled out a new idea to Alice, and tried to beat them off, and had just begun \'Well, of all her fancy.',1,0,2824,1,NULL,'2024-05-13 21:55:45','2024-05-13 21:55:45',0,1,NULL,NULL,NULL),(69,NULL,'Baby','Runolfsson','No, I\'ve made up.',NULL,'susanna84@yahoo.com','$2y$12$HDUpA1WGi7SHLht0ukrqM.VOAdNiLC8TI39aopl/TrWhkk8Jfdt5a',184,'2011-08-24','+12796057980','2024-05-14 04:55:45',NULL,'employer',NULL,NULL,'2134 Eichmann Fields\nWest Mabelborough, AL 34202-1435','I\'m not used to queer things happening. While she was going to give the hedgehog a blow with its arms folded, frowning like a wild beast, screamed \'Off with his tea spoon at the proposal. \'Then the.',1,0,1277,1,NULL,'2024-05-13 21:55:45','2024-05-13 21:55:45',1,1,NULL,NULL,NULL),(70,NULL,'Noemy','Crist','Alice didn\'t think.',NULL,'rthompson@gmail.com','$2y$12$d/SS4pf8RVqYfEpTaJAnaO9LuiW.UlZKSYFkL5uD/LLsNCgRphEyG',184,'2004-10-13','+14846897305','2024-05-14 04:55:45',NULL,'employer',NULL,NULL,'698 Vivienne Rapids Apt. 109\nNew Rico, MN 94196','Never heard of such a long sleep you\'ve had!\' \'Oh, I\'ve had such a curious feeling!\' said Alice; \'you needn\'t be so stingy about it, and talking over its head. \'Very uncomfortable for the pool.',1,0,4989,1,NULL,'2024-05-13 21:55:45','2024-05-13 21:55:45',1,1,NULL,NULL,NULL),(71,NULL,'Janick','Herzog','I ever saw in my.',NULL,'tnienow@yahoo.com','$2y$12$.n5jpn/X4h3XcBoZcaCkIOpRtCp9sFvkwgsOW3nnHywewWyYvO/l2',184,'2007-08-07','+17024307325','2024-05-14 04:55:45',NULL,'employer',NULL,NULL,'250 Ila Freeway Apt. 886\nLake Francisco, AZ 81678-4991','CHAPTER III. A Caucus-Race and a great deal of thought, and rightly too, that very few little girls eat eggs quite as much as she could see, as they came nearer, Alice could see, as well as the.',1,0,3548,0,NULL,'2024-05-13 21:55:45','2024-05-13 21:55:45',1,1,NULL,NULL,NULL),(72,NULL,'Isabelle','Ullrich','Caterpillar. Alice.',NULL,'delores.rogahn@langosh.com','$2y$12$tLVP6AefUbHwBaOyhHDYuuG27Adz9JFVGOGxNK3X9eqZbkOuK2aDa',184,'1981-09-29','+12246821476','2024-05-14 04:55:46',NULL,'job-seeker',NULL,'resume/01.pdf','7396 Colin Forest Apt. 039\nRonshire, AK 58038','She felt very glad that it would like the look of the garden: the roses growing on it except a tiny little thing!\' said Alice, quite forgetting that she remained the same thing a bit!\' said the.',1,0,440,1,NULL,'2024-05-13 21:55:46','2024-05-13 21:55:46',1,1,NULL,NULL,NULL),(73,NULL,'Nathanael','Harber','PRECIOUS nose\'; as.',NULL,'deion77@borer.com','$2y$12$74bwPJaJxec81ajXQLdkouZz5YOna37OZI3NId5cOoBNEo4aVG5Iq',184,'2012-09-12','+18624618312','2024-05-14 04:55:46',NULL,'employer',NULL,NULL,'1268 Gonzalo Corners Apt. 303\nSouth Aubreestad, OH 73150-4890','There was a most extraordinary noise going on shrinking rapidly: she soon found an opportunity of saying to herself, \'Now, what am I to get us dry would be of very little use, as it didn\'t much.',1,0,673,0,NULL,'2024-05-13 21:55:46','2024-05-13 21:55:46',1,1,NULL,NULL,NULL),(74,NULL,'Burley','Prohaska','Canterbury, found.',NULL,'lynch.cyrus@yahoo.com','$2y$12$uPzqTm03OhLkFyIAjJkLvOJcqTdpmedHpaC1om4EFTCqfmhe4leze',184,'2010-05-02','+19896306412','2024-05-14 04:55:46',NULL,'employer',NULL,NULL,'77429 Neal Neck\nSouth Austinburgh, KS 39054','Mabel, for I know THAT well enough; and what does it to be no chance of getting her hands on her hand, and a fan! Quick, now!\' And Alice was not quite sure whether it was the first really clever.',1,0,407,0,NULL,'2024-05-13 21:55:46','2024-05-13 21:55:46',0,1,NULL,NULL,NULL),(75,NULL,'Evie','Lehner','Caterpillar, just.',NULL,'tjacobi@hotmail.com','$2y$12$412VV/wcwojn4NKL4dddYehuozpNKtSAnKsEXADIoj99NnXrtU2de',184,'1975-10-28','+18205198624','2024-05-14 04:55:46',NULL,'employer',NULL,NULL,'9865 Hamill Mews Suite 880\nLayneport, VT 33457-6911','Alice had not got into it), and sometimes she scolded herself so severely as to go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was in confusion, getting.',1,0,1270,0,NULL,'2024-05-13 21:55:46','2024-05-13 21:55:46',1,1,NULL,NULL,NULL),(76,NULL,'Emmie','Goyette','The first question.',NULL,'lysanne28@hotmail.com','$2y$12$tEkOqyl4NZyzLtfS1vv2YO1aNerWklVznGUyLuo/flcTFHZrCf/eK',186,'1979-03-07','+18484082949','2024-05-14 04:55:47',NULL,'job-seeker',NULL,'resume/01.pdf','84600 Bauch Via Apt. 135\nOlsonstad, OH 82989-9032','Alice felt a little girl,\' said Alice, rather alarmed at the door-- Pray, what is the same when I got up in spite of all the unjust things--\' when his eye chanced to fall upon Alice, as the whole.',1,0,4342,0,NULL,'2024-05-13 21:55:47','2024-05-13 21:55:47',1,1,NULL,NULL,NULL),(77,NULL,'Corine','Sporer','Queen, \'Really, my.',NULL,'loy.hickle@hotmail.com','$2y$12$MjJiUU.ppvKN4Smhq.unrOrF7ecc/Z95MpxuEtdrhrT3fm3qWLmWG',185,'1974-10-05','+14235536824','2024-05-14 04:55:47',NULL,'job-seeker',NULL,'resume/01.pdf','99794 Grant Land\nAdonisstad, HI 39114-8394','Hatter. \'I deny it!\' said the Gryphon went on just as well. The twelve jurors were writing down \'stupid things!\' on their slates, and she crossed her hands on her spectacles, and began singing in.',1,0,4480,0,NULL,'2024-05-13 21:55:47','2024-05-13 21:55:47',1,1,NULL,NULL,NULL),(78,NULL,'Hershel','Roberts','It\'s high time to.',NULL,'jamir.lueilwitz@becker.net','$2y$12$mv5E69YCeDZGzdmDTqVRXeno8wQ9v/k8afCJdJMQCq7SFRwJwS3bG',185,'2020-04-20','+17792972554','2024-05-14 04:55:47',NULL,'employer',NULL,NULL,'27716 Gleichner Trace\nBlickmouth, IA 53840-2703','Dinah my dear! Let this be a grin, and she went on planning to herself how she would have made a dreadfully ugly child: but it was good practice to say which), and they went up to the jury, in a low.',1,0,2912,0,NULL,'2024-05-13 21:55:47','2024-05-13 21:55:47',0,1,NULL,NULL,NULL),(79,NULL,'Judd','Haley','King: \'however, it.',NULL,'destinee.bartell@murray.com','$2y$12$..4RSJcvwQj87DDNai1cj.4f2G79Bkp5yRSZkBjzIqwtNJPWVLx3W',184,'1983-07-07','+13476525267','2024-05-14 04:55:47',NULL,'job-seeker',NULL,'resume/01.pdf','8129 Florida Parkways Suite 076\nO\'Reillybury, PA 19174-2483','Alice, and she walked down the little dears came jumping merrily along hand in her life, and had to stoop to save her neck kept getting entangled among the branches, and every now and then; such as.',1,0,4897,0,NULL,'2024-05-13 21:55:47','2024-05-13 21:55:47',0,1,NULL,NULL,NULL),(80,NULL,'Emil','Towne','I can\'t be civil.',NULL,'jovany.cremin@skiles.com','$2y$12$O7/YquZS/hvn4yI0ZWKm1eZW2EtFMFNOw8Z46stRDdjToVZ89VEey',186,'1985-01-22','+19086942155','2024-05-14 04:55:48',NULL,'employer',NULL,NULL,'51374 Hildegard Islands\nNorth Brant, MS 16439-6806','Queen. \'Their heads are gone, if it thought that SOMEBODY ought to have it explained,\' said the Duchess; \'and that\'s why. Pig!\' She said it to annoy, Because he knows it teases.\' CHORUS. (In which.',1,0,3349,1,NULL,'2024-05-13 21:55:48','2024-05-13 21:55:48',1,1,NULL,NULL,NULL),(81,NULL,'Katelin','Zemlak','SHE, of course,\'.',NULL,'cheyanne.schoen@lubowitz.com','$2y$12$AwuqUvTcxRtTh8RUpxRrkOComG.bzx.yrNPFJM6TYSejEbsgmpOcq',184,'2002-01-12','+17148240276','2024-05-14 04:55:48',NULL,'employer',NULL,NULL,'114 Edgardo Path Suite 636\nMaggioville, WA 24318','Caterpillar. \'Well, perhaps you were or might have been a RED rose-tree, and we put a stop to this,\' she said to the jury. \'Not yet, not yet!\' the Rabbit noticed Alice, as the door of which was the.',1,0,2788,0,NULL,'2024-05-13 21:55:48','2024-05-13 21:55:48',1,1,NULL,NULL,NULL),(82,NULL,'Wallace','Stoltenberg','March Hare said in.',NULL,'kiana.mueller@reichert.com','$2y$12$bVc1VpLOiUtXu0jAa9AK0O6yJe80f7MUosknGCgEj.iMC0hCoxOx.',185,'1995-04-12','+19864505017','2024-05-14 04:55:48',NULL,'job-seeker',NULL,'resume/01.pdf','6453 Bode Mills Suite 436\nPagacside, CT 79491-6373','Then it got down off the cake. * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice (she was so long since she had expected: before she got used to know.',1,0,2108,0,NULL,'2024-05-13 21:55:48','2024-05-13 21:55:48',0,1,NULL,NULL,NULL),(83,NULL,'Sidney','Yundt','YOU, and no more.',NULL,'oceane.hettinger@grimes.com','$2y$12$.4o9I01T5VhUDqn/82NA0.xEMZ/jbMdAA7TNFf78NtD1tkBFP9Ew.',185,'2023-01-04','+13613789683','2024-05-14 04:55:48',NULL,'job-seeker',NULL,'resume/01.pdf','746 Bechtelar Keys\nAnissaton, OH 35774','THAT well enough; and what does it to half-past one as long as you can--\' \'Swim after them!\' screamed the Gryphon. \'Well, I should say \"With what porpoise?\"\' \'Don\'t you mean that you think you might.',1,0,2908,1,NULL,'2024-05-13 21:55:48','2024-05-13 21:55:48',0,1,NULL,NULL,NULL),(84,NULL,'Serena','Osinski','Queen in front of.',NULL,'hayes.jewel@wiza.com','$2y$12$eLo52yE3dsWY8Rakjc5pMetBjX890/43p1RwZ1STa3fYt6aVLXc0i',184,'2021-03-28','+16232863271','2024-05-14 04:55:49',NULL,'job-seeker',NULL,'resume/01.pdf','32198 Schmitt Course Suite 493\nRolfsontown, CA 22930','King sharply. \'Do you know that Cheshire cats always grinned; in fact, I didn\'t know that Cheshire cats always grinned; in fact, a sort of use in knocking,\' said the youth, \'and your jaws are too.',1,0,4219,0,NULL,'2024-05-13 21:55:49','2024-05-13 21:55:49',1,1,NULL,NULL,NULL),(85,NULL,'Tristian','Quigley','The Rabbit Sends.',NULL,'vhauck@robel.com','$2y$12$QsVyohDv/liFDavy.xphA.KS0ZqBnnlAM1POHlBNjkA.Nx0qIn6DC',184,'1994-01-30','+14248674464','2024-05-14 04:55:49',NULL,'job-seeker',NULL,'resume/01.pdf','54153 Hayes Fork Suite 680\nLake Mozell, CA 64464-8904','Fish-Footman began by producing from under his arm a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they lived at the White Rabbit; \'in fact, there\'s nothing written on the top of.',1,0,1983,0,NULL,'2024-05-13 21:55:49','2024-05-13 21:55:49',1,1,NULL,NULL,NULL),(86,NULL,'Evert','Kuhic','Hatter. \'Stolen!\'.',NULL,'aschamberger@purdy.com','$2y$12$2.xz.JLFypb/5S6oPgFtAOhptTkqWZe.v3N/Z0WmWaXvy3rUEGKHu',186,'1996-10-12','+15078988783','2024-05-14 04:55:49',NULL,'employer',NULL,NULL,'51523 Amber Stravenue\nRasheedside, ND 01119-5229','I can go back and finish your story!\' Alice called after it; and the White Rabbit blew three blasts on the back. At last the Gryphon added \'Come, let\'s hear some of the others looked round also, and.',1,0,2215,1,NULL,'2024-05-13 21:55:49','2024-05-13 21:55:49',0,1,NULL,NULL,NULL),(87,NULL,'Heber','Howe','And beat him when.',NULL,'guy34@hotmail.com','$2y$12$GHjExkRADp9/juJUQDdhYe3l5k7kwxEyRz2IwbZg4rJ48H7ljV8ru',186,'1997-04-08','+14696894810','2024-05-14 04:55:50',NULL,'job-seeker',NULL,'resume/01.pdf','19110 Rose Creek\nAltenwerthton, NJ 75682-1438','WHAT?\' thought Alice \'without pictures or conversations?\' So she tucked it away under her arm, with its arms and legs in all directions, \'just like a star-fish,\' thought Alice. \'I wonder what they.',1,0,2703,1,NULL,'2024-05-13 21:55:50','2024-05-13 21:55:50',0,1,NULL,NULL,NULL),(88,NULL,'Lois','Herzog','While the Owl had.',NULL,'dortha.nikolaus@hotmail.com','$2y$12$00r0uS05TiHJhaZUo2m11.Z.R0Xq///1/2jYkzZWStEVTusngvGYS',186,'2019-04-02','+19869176111','2024-05-14 04:55:50',NULL,'employer',NULL,NULL,'942 Bruce Shoals Apt. 225\nSouth D\'angelo, RI 31803-5144','Alice! Come here directly, and get ready to make out exactly what they WILL do next! As for pulling me out of his tail. \'As if it makes rather a complaining tone, \'and they all looked puzzled.) \'He.',1,0,4190,1,NULL,'2024-05-13 21:55:50','2024-05-13 21:55:50',1,1,NULL,NULL,NULL),(89,NULL,'Pamela','Maggio','Come on!\' So they.',NULL,'green.marjory@yahoo.com','$2y$12$5b/1FfxMyMnkz2Ouv1taIOEJG.w5p2nH/U6CUsvfrP34xzXXXzgSa',184,'1994-02-20','+16573564147','2024-05-14 04:55:50',NULL,'employer',NULL,NULL,'14265 Gust Loop Suite 030\nSpinkaland, MN 25227','The Fish-Footman began by producing from under his arm a great many teeth, so she went on: \'--that begins with an M--\' \'Why with an M, such as mouse-traps, and the King said, with a large fan in the.',1,0,2274,1,NULL,'2024-05-13 21:55:50','2024-05-13 21:55:50',0,1,NULL,NULL,NULL),(90,NULL,'Avery','Kshlerin','THAT in a hoarse.',NULL,'isaac21@yahoo.com','$2y$12$zNQ3DTbP10dF7tWrPeG8h.3gERm7I6QQ7rLSik3SIOjTNtqbduqkW',184,'1999-04-12','+14636155054','2024-05-14 04:55:50',NULL,'job-seeker',NULL,'resume/01.pdf','31684 Berge Stream\nCasperton, CT 32612','Hatter continued, \'in this way:-- \"Up above the world you fly, Like a tea-tray in the act of crawling away: besides all this, there was enough of me left to make out who I am! But I\'d better take.',1,0,302,0,NULL,'2024-05-13 21:55:50','2024-05-13 21:55:50',0,1,NULL,NULL,NULL),(91,NULL,'Nick','Pollich','I wonder?\' As she.',NULL,'monahan.loren@spinka.com','$2y$12$b2T0XDQ3/rS.weUqnx7RxenKoBQ4vYCckcUxQyQpmMaqpScWh8Ax2',186,'1995-03-29','+14433315805','2024-05-14 04:55:50',NULL,'job-seeker',NULL,'resume/01.pdf','63110 Kub Ports Suite 801\nLelahchester, MI 66923-1571','Alice. \'What sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then at the sudden change, but she could have been was not quite like the look of the earth. At last the Mock Turtle.',1,0,3017,1,NULL,'2024-05-13 21:55:51','2024-05-13 21:55:51',1,1,NULL,NULL,NULL),(92,NULL,'Gunner','Schmidt','White Rabbit as he.',NULL,'tate53@yahoo.com','$2y$12$wM1Hhw5URVlNUKI/LN1z2OxobljwsrsI2Oi39csHPArwGdstj/orC',184,'1973-05-29','+12084943532','2024-05-14 04:55:51',NULL,'employer',NULL,NULL,'2227 Kirsten Via\nJakubowskiview, DE 36035-1304','King: \'however, it may kiss my hand if it makes me grow large again, for this curious child was very provoking to find that she tipped over the jury-box with the other: the only difficulty was, that.',1,0,3874,1,NULL,'2024-05-13 21:55:51','2024-05-13 21:55:51',1,1,NULL,NULL,NULL),(93,NULL,'Josie','Prosacco','Alice: \'--where\'s.',NULL,'terry.uriel@leannon.com','$2y$12$mtV/Vx6KFGoREBSCxB0.zefebiZDjDJOYPXVnd.PGpwOechfM8d8S',186,'2010-04-26','+19095548491','2024-05-14 04:55:51',NULL,'employer',NULL,NULL,'984 Orion Green\nNew Summerton, NH 95551-4974','Between yourself and me.\' \'That\'s the first to break the silence. \'What day of the thing Mock Turtle repeated thoughtfully. \'I should like to see if she could remember about ravens and.',1,0,4972,0,NULL,'2024-05-13 21:55:51','2024-05-13 21:55:51',0,1,NULL,NULL,NULL),(94,NULL,'Kamryn','Kutch','The Mouse did not.',NULL,'reed.harris@hotmail.com','$2y$12$cY/B1Y.Zm0/WCSzpxXJV4e4UIDSmQNExcAMAGRm90MlDqhkECjRFa',185,'1972-06-18','+12796465312','2024-05-14 04:55:51',NULL,'job-seeker',NULL,'resume/01.pdf','45250 Williamson Canyon Apt. 190\nNorth Angelina, LA 45811-6049','Alice. \'And be quick about it,\' added the Hatter, and he poured a little three-legged table, all made of solid glass; there was mouth enough for it now, I suppose, by being drowned in my life!\' Just.',1,0,537,0,NULL,'2024-05-13 21:55:51','2024-05-13 21:55:51',1,1,NULL,NULL,NULL),(95,NULL,'Roman','Rau','I\'LL soon make you.',NULL,'tillman.elyssa@yahoo.com','$2y$12$aKo8umq1EFe.osvOncA0k.iV1fJiZH8kv0wfuKHXbSjotingnp/Wu',186,'1982-05-24','+19477247743','2024-05-14 04:55:52',NULL,'employer',NULL,NULL,'385 Stokes Burgs\nNorth Tadport, AK 93190-7690','Dormouse denied nothing, being fast asleep. \'After that,\' continued the Pigeon, raising its voice to its feet, \'I move that the meeting adjourn, for the moment he was in confusion, getting the.',1,0,3003,1,NULL,'2024-05-13 21:55:52','2024-05-13 21:55:52',0,1,NULL,NULL,NULL),(96,NULL,'Tiana','Beahan','White Rabbit, who.',NULL,'wschamberger@farrell.biz','$2y$12$vi7VUacopHbCceEnQXWXK.vmbeaK/YUSJZ5fVt4WQoXfEZD8BIWdC',185,'2022-04-13','+15805367441','2024-05-14 04:55:52',NULL,'job-seeker',NULL,'resume/01.pdf','820 Tad Villages\nLennieshire, MD 93756','WAS a curious plan!\' exclaimed Alice. \'That\'s the reason of that?\' \'In my youth,\' said the Duchess. \'Everything\'s got a moral, if only you can find it.\' And she kept on good terms with him, he\'d do.',1,0,2154,1,NULL,'2024-05-13 21:55:52','2024-05-13 21:55:52',0,1,NULL,NULL,NULL),(97,NULL,'Jakayla','Willms','M--\' \'Why with an.',NULL,'mathew27@yahoo.com','$2y$12$FfYJ/8zDPOXJprYpyatOhOhV4purqZR58bbwpvRwkjeJ/ZBklfCVi',185,'1976-01-12','+19066497992','2024-05-14 04:55:52',NULL,'employer',NULL,NULL,'63453 Hansen Greens Suite 754\nStefaniebury, UT 64043-3774','Alice could speak again. In a little scream, half of fright and half believed herself in a hurry: a large arm-chair at one corner of it: \'No room! No room!\' they cried out when they had to be two.',1,0,2059,0,NULL,'2024-05-13 21:55:52','2024-05-13 21:55:52',1,1,NULL,NULL,NULL),(98,NULL,'Beau','Hagenes','Caterpillar, and.',NULL,'mable36@gmail.com','$2y$12$QgAJFmAjIfPm4FWYSlzaBei3kNltsCub9Y2TldGPaEkFfRZOX0Sq2',186,'1997-03-08','+15393909425','2024-05-14 04:55:52',NULL,'employer',NULL,NULL,'8300 Gutkowski Manors Apt. 447\nWest Floyd, KY 53206','I could let you out, you know.\' He was looking for the next question is, Who in the window?\' \'Sure, it\'s an arm, yer honour!\' \'Digging for apples, indeed!\' said the Pigeon in a soothing tone: \'don\'t.',1,0,1579,1,NULL,'2024-05-13 21:55:52','2024-05-13 21:55:52',1,1,NULL,NULL,NULL),(99,NULL,'Roel','Boehm','Mock Turtle. \'Very.',NULL,'estell.keeling@boyle.biz','$2y$12$3TnnYcJB4BQnK2H5WexjFu0f.FNmMief.FPaWB7ckvb7YfYghfnvq',185,'1972-12-22','+12702525659','2024-05-14 04:55:52',NULL,'job-seeker',NULL,'resume/01.pdf','749 Denesik Mall\nWillmsmouth, MT 18716','Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Duchess sang the second time round, she came.',1,0,4219,1,NULL,'2024-05-13 21:55:52','2024-05-13 21:55:52',0,1,NULL,NULL,NULL),(100,NULL,'Obie','Gorczany','She generally gave.',NULL,'ruth04@gmail.com','$2y$12$yp.DKpT/WWfGZtkhXn/yhuvWnId1YB8530aZV2iJydVZb/ORHsYYK',186,'2008-11-09','+14809025898','2024-05-14 04:55:53',NULL,'employer',NULL,NULL,'34768 Bashirian Island\nWest Demetrius, MS 87681-2636','As she said to herself, \'in my going out altogether, like a tunnel for some time after the rest of the tea--\' \'The twinkling of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole.',1,0,3389,1,NULL,'2024-05-13 21:55:53','2024-05-13 21:55:53',1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_analytics`
--

DROP TABLE IF EXISTS `jb_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_analytics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_full` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_analytics`
--

LOCK TABLES `jb_analytics` WRITE;
/*!40000 ALTER TABLE `jb_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_applications`
--

DROP TABLE IF EXISTS `jb_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `job_id` bigint unsigned NOT NULL,
  `resume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `is_external_apply` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_applications`
--

LOCK TABLES `jb_applications` WRITE;
/*!40000 ALTER TABLE `jb_applications` DISABLE KEYS */;
INSERT INTO `jb_applications` VALUES (1,'Judd','Haley','+13476525267','destinee.bartell@murray.com','Cat. \'Do you know I\'m mad?\' said Alice. \'I\'ve read that in some book, but I shall be late!\' (when she thought at first was moderate. But the insolence of his pocket, and pulled out a new pair of.',17,'resume/01.pdf','resume/01.pdf',79,1,'checked','2024-05-13 21:55:53','2024-05-13 21:55:53'),(2,'Sister','Kirlin','+17478752447','ncummerata@skiles.com','March Hare. The Hatter was the King; and as the whole pack of cards: the Knave of Hearts, who only bowed and smiled in reply. \'That\'s right!\' shouted the Queen. \'Their heads are gone, if it please.',47,'resume/01.pdf','resume/01.pdf',21,1,'checked','2024-05-13 21:55:53','2024-05-13 21:55:53'),(3,'Joanie','Mayer','+14243576821','ebeier@hotmail.com','Alice. \'And be quick about it,\' added the Dormouse. \'Don\'t talk nonsense,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, but in a furious passion, and went.',28,'resume/01.pdf','resume/01.pdf',41,1,'checked','2024-05-13 21:55:53','2024-05-13 21:55:53'),(4,'Vinnie','Mitchell','+12406654568','gdickinson@hotmail.com','The first question of course had to kneel down on their slates, when the Rabbit noticed Alice, as she swam lazily about in the trial done,\' she thought, and it said in a great crowd assembled about.',19,'resume/01.pdf','resume/01.pdf',36,1,'checked','2024-05-13 21:55:53','2024-05-13 21:55:53'),(5,'Serena','Osinski','+16232863271','hayes.jewel@wiza.com','Don\'t let him know she liked them best, For this must ever be A secret, kept from all the creatures order one about, and crept a little shaking among the distant green leaves. As there seemed to be.',2,'resume/01.pdf','resume/01.pdf',84,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(6,'Sidney','Yundt','+13613789683','oceane.hettinger@grimes.com','Why, it fills the whole party at once without waiting for the hot day made her so savage when they hit her; and the words \'DRINK ME\' beautifully printed on it were white, but there were TWO little.',16,'resume/01.pdf','resume/01.pdf',83,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(7,'Everette','Windler','+15204653313','chester41@gulgowski.com','Once more she found herself lying on the table. \'Have some wine,\' the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t know much,\' said Alice, whose thoughts were still running on.',22,'resume/01.pdf','resume/01.pdf',13,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(8,'Wilford','Nicolas','+15085970142','jerad.dare@boehm.com','There was a table in the air: it puzzled her a good deal to come down the bottle, saying to herself, and shouted out, \'You\'d better not do that again!\' which produced another dead silence. \'It\'s a.',30,'resume/01.pdf','resume/01.pdf',46,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(9,'Tristian','Quigley','+14248674464','vhauck@robel.com','Mock Turtle in the air. Even the Duchess said to herself; \'I should like to show you! A little bright-eyed terrier, you know, upon the other side of the birds hurried off to other parts of the door.',39,'resume/01.pdf','resume/01.pdf',85,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(10,'Maxine','Shanahan','+14134615938','erich.nitzsche@hotmail.com','All the time when she found she could do to come down the little door: but, alas! the little glass table. \'Now, I\'ll manage better this time,\' she said to the voice of the jurymen. \'It isn\'t a.',46,'resume/01.pdf','resume/01.pdf',34,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(11,'Wallace','Stoltenberg','+19864505017','kiana.mueller@reichert.com','Alice, a good thing!\' she said to herself; \'the March Hare and the small ones choked and had come to the puppy; whereupon the puppy jumped into the jury-box, and saw that, in her French lesson-book.',34,'resume/01.pdf','resume/01.pdf',82,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(12,'Ada','Mraz','+16036932777','bernier.belle@stamm.com','YET,\' she said to live. \'I\'ve seen a good many little girls eat eggs quite as safe to stay in here any longer!\' She waited for a little now and then, \'we went to the door, and knocked. \'There\'s no.',50,'resume/01.pdf','resume/01.pdf',25,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(13,'Corine','Sporer','+14235536824','loy.hickle@hotmail.com','The first thing she heard a little worried. \'Just about as it turned round and get ready to play croquet.\' Then they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides of the.',24,'resume/01.pdf','resume/01.pdf',77,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(14,'Torrance','Gottlieb','+12692061665','watsica.viviane@hotmail.com','I wonder what CAN have happened to me! I\'LL soon make you dry enough!\' They all sat down and make out who was beginning to write out a box of comfits, (luckily the salt water had not attended to.',26,'resume/01.pdf','resume/01.pdf',9,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(15,'Maiya','Hodkiewicz','+16095365038','laney51@feest.com','O Mouse!\' (Alice thought this must ever be A secret, kept from all the same, the next verse,\' the Gryphon replied rather impatiently: \'any shrimp could have been a holiday?\' \'Of course you don\'t!\'.',7,'resume/01.pdf','resume/01.pdf',27,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(16,'Alta','Ortiz','+13195478338','stehr.fernando@mante.org','King, going up to her very much pleased at having found out a box of comfits, (luckily the salt water had not noticed before, and behind it was done. They had a pencil that squeaked. This of course.',37,'resume/01.pdf','resume/01.pdf',12,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(17,'Annamae','Lindgren','+18185765119','dschumm@hotmail.com','Alice had not as yet had any dispute with the words a little, and then keep tight hold of anything, but she could see it trot away quietly into the darkness as hard as he spoke, and added \'It isn\'t.',21,'resume/01.pdf','resume/01.pdf',58,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(18,'Roel','Boehm','+12702525659','estell.keeling@boyle.biz','The Fish-Footman began by producing from under his arm a great hurry, muttering to itself \'Then I\'ll go round and swam slowly back to them, and all dripping wet, cross, and uncomfortable. The first.',12,'resume/01.pdf','resume/01.pdf',99,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(19,'Kiera','Medhurst','+14257251563','schamberger.ismael@tremblay.biz','I\'ll stay down here! It\'ll be no use speaking to it,\' she said to one of the house till she fancied she heard a little queer, won\'t you?\' \'Not a bit,\' said the King. \'Then it wasn\'t very civil of.',14,'resume/01.pdf','resume/01.pdf',42,1,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54'),(20,'Chesley','O\'Reilly','+18568970182','gloria73@gmail.com','Queen. \'Never!\' said the Hatter: \'let\'s all move one place on.\' He moved on as he fumbled over the wig, (look at the mushroom (she had grown in the air. This time there could be beheaded, and that.',36,'resume/01.pdf','resume/01.pdf',61,0,'checked','2024-05-13 21:55:54','2024-05-13 21:55:54');
/*!40000 ALTER TABLE `jb_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels`
--

DROP TABLE IF EXISTS `jb_career_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels`
--

LOCK TABLES `jb_career_levels` WRITE;
/*!40000 ALTER TABLE `jb_career_levels` DISABLE KEYS */;
INSERT INTO `jb_career_levels` VALUES (1,'Department Head',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(2,'Entry Level',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(3,'Experienced Professional',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(4,'GM / CEO / Country Head / President',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(5,'Intern/Student',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23');
/*!40000 ALTER TABLE `jb_career_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels_translations`
--

DROP TABLE IF EXISTS `jb_career_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_career_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_career_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels_translations`
--

LOCK TABLES `jb_career_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_career_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_career_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories`
--

DROP TABLE IF EXISTS `jb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories`
--

LOCK TABLES `jb_categories` WRITE;
/*!40000 ALTER TABLE `jb_categories` DISABLE KEYS */;
INSERT INTO `jb_categories` VALUES (1,'Content Writer',NULL,0,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(2,'Market Research',NULL,1,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(3,'Marketing &amp; Sale',NULL,2,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(4,'Customer Help',NULL,3,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(5,'Finance',NULL,4,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(6,'Software',NULL,5,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(7,'Human Resource',NULL,6,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(8,'Management',NULL,7,0,1,'published','2024-05-13 21:55:24','2024-05-13 21:55:24',0),(9,'Retail &amp; Products',NULL,8,0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25',0),(10,'Security Analyst',NULL,9,0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25',0);
/*!40000 ALTER TABLE `jb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories_translations`
--

DROP TABLE IF EXISTS `jb_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories_translations`
--

LOCK TABLES `jb_categories_translations` WRITE;
/*!40000 ALTER TABLE `jb_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies`
--

DROP TABLE IF EXISTS `jb_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `postal_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_founded` int unsigned DEFAULT NULL,
  `ceo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_offices` int unsigned DEFAULT NULL,
  `number_of_employees` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_revenue` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_companies_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies`
--

LOCK TABLES `jb_companies` WRITE;
/*!40000 ALTER TABLE `jb_companies` DISABLE KEYS */;
INSERT INTO `jb_companies` VALUES (1,NULL,'LinkedIn',NULL,'Dolorem qui et est molestiae dolorum. Aut hic iste assumenda quidem molestiae et. Aut qui autem culpa et voluptatem dolorem. Assumenda ea quis aut blanditiis.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/1.png','43.084478','-76.722115','3180 Dooley Prairie\nToyshire, DC 91925-9980',4,4,4,NULL,'+15394893419',2006,'John Doe',10,'7','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(2,NULL,'Adobe Illustrator',NULL,'Quia qui earum eum perspiciatis ut. Aliquid dicta molestiae aut adipisci. Consequuntur est dicta consequatur enim porro.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.adobe.com/','companies/2.png','43.506214','-76.091854','26874 Earl Extension Apt. 480\nErickview, DC 69921-5805',1,1,1,NULL,'+18436536426',1983,'Jeff Werner',3,'8','1M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(3,NULL,'Bing Search',NULL,'Quis quos aut enim id et rerum. In ratione eveniet repellat ipsa et. Eos laboriosam quia sit sed numquam.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.bing.com/','companies/3.png','43.412338','-75.732512','98294 Bauch Park\nNew Rosendochester, IL 63363-1005',1,1,1,NULL,'+19849623778',1991,'Nakamura',2,'3','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(4,NULL,'Dailymotion',NULL,'Doloremque fugit sapiente molestiae consequatur hic rem ut et. Quidem et quis sit voluptatem eligendi fugiat et. Unde quo reprehenderit minus fuga. Occaecati aspernatur rerum delectus sunt.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.dailymotion.com/','companies/4.png','43.136644','-75.198538','6301 Patsy Station Suite 473\nHacketthaven, ME 05256-4213',3,3,3,NULL,'+13472108000',1999,'John Doe',6,'9','7M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(5,NULL,'Linkedin',NULL,'Vero qui praesentium architecto voluptas repudiandae. Temporibus placeat fugiat quas dicta dolorem eveniet dignissimos. Non minus ea sed delectus quia velit.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/5.png','43.966952','-76.278701','50288 Angelita Field\nWest Filomenaville, DE 76721',1,1,1,NULL,'+19109548034',1996,'John Doe',5,'6','8M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(6,NULL,'Quora JSC',NULL,'Qui adipisci blanditiis et et molestiae. Ad explicabo eius ratione voluptas nam. Corporis praesentium nihil cum eveniet voluptates.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.quora.com/','companies/6.png','42.970083','-76.339625','408 Ottis Knolls\nBergstromborough, GA 08995',5,5,5,NULL,'+16513811334',2009,'John Doe',10,'3','9M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(7,NULL,'Nintendo',NULL,'Mollitia recusandae dolores eius est explicabo. Voluptatem vel qui incidunt perferendis beatae aut. Repellat et mollitia beatae quidem.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.nintendo.com/','companies/7.png','42.879625','-74.839638','343 Tessie Fork Suite 862\nPort Corenechester, TN 47551',3,3,3,NULL,'+17015838058',1974,'Steve Jobs',2,'8','1M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(8,NULL,'Periscope',NULL,'Quia iusto ea ut illo amet. Eligendi recusandae eligendi dolor quia nam et facilis. Corrupti iusto autem quaerat ipsa rerum et inventore qui. Voluptatem modi numquam repellendus dolor.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/8.png','43.066793','-75.697049','1091 Schuster Stravenue Apt. 393\nHarbermouth, IA 58714-0293',2,2,2,NULL,'+18785829939',2010,'John Doe',8,'8','3M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(9,NULL,'NewSum',NULL,'Molestiae nihil dolores dolores modi. Animi debitis a voluptatem. Consequatur aut sint eos consequatur eum beatae.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://newsum.us/','companies/4.png','43.818852','-76.487833','643 Toy Stravenue Suite 607\nStromanview, AR 82813',2,2,2,NULL,'+15616149771',1983,'John Doe',7,'1','10M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(10,NULL,'PowerHome',NULL,'Quasi qui quo illo eum voluptatem. Aut aut dolores modi totam officia. Et dolores consequatur fugiat accusantium enim quod. Doloremque accusantium laudantium voluptate deleniti voluptatum.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/5.png','42.566823','-74.908239','312 Treutel Track\nWardchester, TN 22652',5,5,5,NULL,'+18288585882',1978,'John Doe',6,'8','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(11,NULL,'Whop.com',NULL,'Ea blanditiis fuga voluptas accusamus iure accusantium. Tenetur commodi in deleniti officiis quisquam enim recusandae. Explicabo occaecati autem velit rerum voluptas quasi.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://whop.com/','companies/6.png','43.440043','-76.384904','2311 Jennyfer Islands\nEast Letitiaburgh, WV 25514-7560',6,6,6,NULL,'+14305589186',1996,'John Doe',8,'7','2M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(12,NULL,'Greenwood',NULL,'Alias sunt quasi voluptatem neque autem rerum enim. Nobis et qui ut magnam facere. Tenetur architecto repellendus sit minus repellat.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.greenwoodjs.io/','companies/7.png','42.520835','-75.602506','84159 Pascale Road\nEast Ernest, AK 44535',3,3,3,NULL,'+17813610653',1993,'John Doe',7,'8','7M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(13,NULL,'Kentucky',NULL,'Occaecati labore dolor nam non. Sit est nihil voluptatem commodi. Eos eaque libero et voluptatem in veritatis sequi. Eius et libero rerum explicabo nihil aut ut.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.kentucky.gov/','companies/8.png','43.396896','-75.876392','564 Doyle Groves\nRaymundotown, UT 56700',5,5,5,NULL,'+16076029719',2007,'John Doe',10,'4','1M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(14,NULL,'Equity',NULL,'Sed voluptas maxime magnam. Quis dicta non doloribus ipsam nihil eos inventore consequatur.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.equity.org.uk/','companies/6.png','42.663791','-76.613358','3735 Glover Well\nLake Toby, ME 12369-6710',3,3,3,NULL,'+12096136618',2010,'John Doe',2,'9','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(15,NULL,'Honda',NULL,'Rem quia consectetur ut animi nulla natus omnis ullam. Beatae corporis et pariatur sed sit soluta recusandae. Nulla sit vitae est et veritatis enim.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.honda.com/','companies/9.png','43.731666','-76.409493','982 Eden Terrace\nNorth Bertram, NH 80899',2,2,2,NULL,'+12068661703',1975,'John Doe',5,'4','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(16,NULL,'Toyota',NULL,'Nemo perspiciatis quasi quo in. Perspiciatis sint perferendis magnam quis rerum et tempora. Repellat quam ipsa est ea molestias voluptatem. Et omnis facilis autem quidem et incidunt.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.toyota.com/','companies/5.png','43.060908','-75.484776','40537 McKenzie Ridge Apt. 378\nSouth Hugh, NY 61873',4,4,4,NULL,'+16787260593',2002,'John Doe',2,'1','3M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(17,NULL,'Lexus',NULL,'Sit nesciunt omnis laborum maxime autem ex necessitatibus consequuntur. Et inventore ad consequatur quo hic.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/3.png','42.599137','-76.725411','513 Madonna Hill\nDejahaven, NJ 10258-5702',5,5,5,NULL,'+15644080114',1982,'John Doe',2,'5','2M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(18,NULL,'Ondo',NULL,'Aut nisi consequatur aut fuga sed occaecati. Quas distinctio cum fuga aut omnis ad autem. Perspiciatis amet est omnis. Voluptatibus cumque tenetur reprehenderit repellat.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://ondo.mn/','companies/6.png','43.663832','-76.384147','1718 Elisha Ranch Apt. 069\nNew Jaylenhaven, OR 20454-8999',1,1,1,NULL,'+16052890885',2016,'John Doe',10,'5','6M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(19,NULL,'Square',NULL,'Qui similique quibusdam voluptatibus officiis ipsam dolorem minus. Ipsum dicta iste ut enim. Assumenda fugiat aut id tempore.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://squareup.com/','companies/2.png','42.994572','-76.435971','725 Denesik Branch Apt. 369\nGlenniemouth, AL 79284-7248',4,4,4,NULL,'+14455709854',1995,'John Doe',9,'3','2M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(20,NULL,'Visa',NULL,'Culpa est voluptates minus non repellat. Illo ab at eos error eveniet accusantium magnam.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://visa.com/','companies/8.png','43.284187','-76.374621','193 Roberts Key Suite 174\nElnamouth, MI 05289',2,2,2,NULL,'+16508006553',2007,'John Doe',3,'5','3M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL);
/*!40000 ALTER TABLE `jb_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies_accounts`
--

DROP TABLE IF EXISTS `jb_companies_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies_accounts` (
  `company_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies_accounts`
--

LOCK TABLES `jb_companies_accounts` WRITE;
/*!40000 ALTER TABLE `jb_companies_accounts` DISABLE KEYS */;
INSERT INTO `jb_companies_accounts` VALUES (1,1),(1,4),(2,1),(2,4),(3,1),(3,4),(4,1),(4,4),(5,1),(5,4),(6,1),(6,4),(7,1),(7,4),(8,1),(8,4),(9,1),(9,4),(10,1),(10,4),(11,1),(11,4),(12,1),(12,4),(13,1),(13,4),(14,1),(14,4),(15,1),(15,4),(16,1),(16,4),(17,1),(17,4),(18,1),(18,4),(19,1),(19,4),(20,1),(20,4);
/*!40000 ALTER TABLE `jb_companies_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_coupons`
--

DROP TABLE IF EXISTS `jb_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_coupons`
--

LOCK TABLES `jb_coupons` WRITE;
/*!40000 ALTER TABLE `jb_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_currencies`
--

DROP TABLE IF EXISTS `jb_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_currencies`
--

LOCK TABLES `jb_currencies` WRITE;
/*!40000 ALTER TABLE `jb_currencies` DISABLE KEYS */;
INSERT INTO `jb_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-05-13 21:55:27','2024-05-13 21:55:27'),(2,'EUR','€',0,2,1,0,0.91,'2024-05-13 21:55:27','2024-05-13 21:55:27'),(3,'VND','₫',0,0,2,0,23717.5,'2024-05-13 21:55:27','2024-05-13 21:55:27');
/*!40000 ALTER TABLE `jb_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options`
--

DROP TABLE IF EXISTS `jb_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options`
--

LOCK TABLES `jb_custom_field_options` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options_translations`
--

LOCK TABLES `jb_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values`
--

DROP TABLE IF EXISTS `jb_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values`
--

LOCK TABLES `jb_custom_field_values` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values_translations`
--

LOCK TABLES `jb_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields`
--

DROP TABLE IF EXISTS `jb_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields`
--

LOCK TABLES `jb_custom_fields` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields_translations`
--

DROP TABLE IF EXISTS `jb_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields_translations`
--

LOCK TABLES `jb_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels`
--

DROP TABLE IF EXISTS `jb_degree_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels`
--

LOCK TABLES `jb_degree_levels` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels` DISABLE KEYS */;
INSERT INTO `jb_degree_levels` VALUES (1,'Non-Matriculation',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(2,'Matriculation/O-Level',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(3,'Intermediate/A-Level',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(4,'Bachelors',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(5,'Masters',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(6,'MPhil/MS',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(7,'PHD/Doctorate',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(8,'Certification',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(9,'Diploma',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(10,'Short Course',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23');
/*!40000 ALTER TABLE `jb_degree_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels_translations`
--

DROP TABLE IF EXISTS `jb_degree_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels_translations`
--

LOCK TABLES `jb_degree_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types`
--

DROP TABLE IF EXISTS `jb_degree_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree_level_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types`
--

LOCK TABLES `jb_degree_types` WRITE;
/*!40000 ALTER TABLE `jb_degree_types` DISABLE KEYS */;
INSERT INTO `jb_degree_types` VALUES (1,'Matric in Arts',2,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(2,'Matric in Science',2,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(3,'O-Levels',2,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(4,'A-Levels',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(5,'Faculty of Arts',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(6,'Faculty of Science (Pre-medical)',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(7,'Faculty of Science (Pre-Engineering)',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(8,'Intermediate in Computer Science',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(9,'Intermediate in Commerce',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(10,'Intermediate in General Science',3,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(11,'Bachelors in Arts',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(12,'Bachelors in Architecture',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(13,'Bachelors in Business Administration',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(14,'Bachelors in Commerce',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(15,'Bachelors of Dental Surgery',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(16,'Bachelors of Education',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(17,'Bachelors in Engineering',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(18,'Bachelors in Pharmacy',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(19,'Bachelors in Science',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(20,'Bachelors of Science in Nursing (Registered Nursing)',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(21,'Bachelors in Law',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(22,'Bachelors in Technology',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(23,'BCS/BS',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(24,'Doctor of Veterinary Medicine',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(25,'MBBS',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(26,'Post Registered Nursing B.S.',4,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(27,'Masters in Arts',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(28,'Masters in Business Administration',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(29,'Masters in Commerce',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(30,'Masters of Education',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(31,'Masters in Law',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(32,'Masters in Science',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(33,'Executive Masters in Business Administration',5,0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23');
/*!40000 ALTER TABLE `jb_degree_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types_translations`
--

DROP TABLE IF EXISTS `jb_degree_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types_translations`
--

LOCK TABLES `jb_degree_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas`
--

DROP TABLE IF EXISTS `jb_functional_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas`
--

LOCK TABLES `jb_functional_areas` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas` DISABLE KEYS */;
INSERT INTO `jb_functional_areas` VALUES (1,'Accountant',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(2,'Accounts, Finance &amp; Financial Services',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(3,'Admin',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(4,'Admin Operation',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(5,'Administration',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(6,'Administration Clerical',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(7,'Advertising',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(8,'Advertising',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(9,'Advertisement',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(10,'Architects &amp; Construction',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(11,'Architecture',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(12,'Bank Operation',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(13,'Business Development',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(14,'Business Management',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(15,'Business Systems Analyst',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(16,'Clerical',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(17,'Client Services &amp; Customer Support',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(18,'Computer Hardware',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(19,'Computer Networking',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(20,'Consultant',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(21,'Content Writer',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(22,'Corporate Affairs',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(23,'Creative Design',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(24,'Creative Writer',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(25,'Customer Support',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(26,'Data Entry',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(27,'Data Entry Operator',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(28,'Database Administration (DBA)',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(29,'Development',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(30,'Distribution &amp; Logistics',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(31,'Education &amp; Training',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(32,'Electronics Technician',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(33,'Engineering',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(34,'Engineering Construction',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(35,'Executive Management',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(36,'Executive Secretary',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(37,'Field Operations',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(38,'Front Desk Clerk',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(39,'Front Desk Officer',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(40,'Graphic Design',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(41,'Hardware',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(42,'Health &amp; Medicine',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(43,'Health &amp; Safety',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(44,'Health Care',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(45,'Health Related',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(46,'Hotel Management',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(47,'Hotel/Restaurant Management',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(48,'HR',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(49,'Human Resources',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(50,'Import &amp; Export',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(51,'Industrial Production',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(52,'Installation &amp; Repair',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(53,'Interior Designers &amp; Architects',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(54,'Intern',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(55,'Internship',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(56,'Investment Operations',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(57,'IT Security',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(58,'IT Systems Analyst',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(59,'Legal &amp; Corporate Affairs',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(60,'Legal Affairs',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(61,'Legal Research',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(62,'Logistics &amp; Warehousing',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(63,'Maintenance/Repair',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(64,'Management Consulting',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(65,'Management Information System (MIS)',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(66,'Managerial',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(67,'Manufacturing',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(68,'Manufacturing &amp; Operations',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(69,'Marketing',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(70,'Marketing',0,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(71,'Media - Print &amp; Electronic',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(72,'Media &amp; Advertising',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(73,'Medical',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(74,'Medicine',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(75,'Merchandising',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(76,'Merchandising &amp; Product Management',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(77,'Monitoring &amp; Evaluation (M&amp;E)',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(78,'Network Administration',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(79,'Network Operation',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(80,'Online Advertising',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(81,'Online Marketing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(82,'Operations',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(83,'Planning',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(84,'Planning &amp; Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(85,'PR',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(86,'Print Media',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(87,'Printing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(88,'Procurement',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(89,'Product Developer',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(90,'Product Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(91,'Product Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(92,'Product Management',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(93,'Production',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(94,'Production &amp; Quality Control',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(95,'Project Management',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(96,'Project Management Consultant',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(97,'Public Relations',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(98,'QA',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(99,'QC',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(100,'Qualitative Research',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(101,'Quality Assurance (QA)',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(102,'Quality Control',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(103,'Quality Inspection',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(104,'Recruiting',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(105,'Recruitment',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(106,'Repair &amp; Overhaul',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(107,'Research &amp; Development (R&amp;D)',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(108,'Research &amp; Evaluation',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(109,'Research &amp; Fellowships',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(110,'Researcher',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(111,'Restaurant Management',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(112,'Retail',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(113,'Retail &amp; Wholesale',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(114,'Retail Buyer',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(115,'Retail Buying',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(116,'Retail Merchandising',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(117,'Safety &amp; Environment',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(118,'Sales',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(119,'Sales &amp; Business Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(120,'Sales Support',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(121,'Search Engine Optimization (SEO)',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(122,'Secretarial, Clerical &amp; Front Office',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(123,'Security',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(124,'Security &amp; Environment',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(125,'Security Guard',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(126,'SEM',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(127,'SMO',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(128,'Software &amp; Web Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(129,'Software Engineer',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(130,'Software Testing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(131,'Stores &amp; Warehousing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(132,'Supply Chain',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(133,'Supply Chain Management',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(134,'Systems Analyst',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(135,'Teachers/Education, Training &amp; Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(136,'Technical Writer',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(137,'Tele Sale Representative',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(138,'Telemarketing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(139,'Training &amp; Development',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(140,'Transportation &amp; Warehousing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(141,'TSR',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(142,'Typing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(143,'Warehousing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(144,'Web Developer',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(145,'Web Marketing',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(146,'Writer',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(147,'PR',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(148,'QA',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(149,'QC',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(150,'SEM',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(151,'SMO',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(152,'TSR',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(153,'HR',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(154,'QA',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(155,'QC',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24'),(156,'SEM',0,0,'published','2024-05-13 21:55:24','2024-05-13 21:55:24');
/*!40000 ALTER TABLE `jb_functional_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas_translations`
--

DROP TABLE IF EXISTS `jb_functional_areas_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_functional_areas_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_functional_areas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas_translations`
--

LOCK TABLES `jb_functional_areas_translations` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_functional_areas_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoice_items`
--

DROP TABLE IF EXISTS `jb_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoice_items`
--

LOCK TABLES `jb_invoice_items` WRITE;
/*!40000 ALTER TABLE `jb_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoices`
--

DROP TABLE IF EXISTS `jb_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_invoices_code_unique` (`code`),
  KEY `jb_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `jb_invoices_payment_id_index` (`payment_id`),
  KEY `jb_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoices`
--

LOCK TABLES `jb_invoices` WRITE;
/*!40000 ALTER TABLE `jb_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences`
--

DROP TABLE IF EXISTS `jb_job_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences`
--

LOCK TABLES `jb_job_experiences` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences` DISABLE KEYS */;
INSERT INTO `jb_job_experiences` VALUES (1,'Fresh',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(2,'Less Than 1 Year',1,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(3,'1 Year',2,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(4,'2 Year',3,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(5,'3 Year',4,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(6,'4 Year',5,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(7,'5 Year',6,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(8,'6 Year',7,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(9,'7 Year',8,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(10,'8 Year',9,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(11,'9 Year',10,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(12,'10 Year',11,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25');
/*!40000 ALTER TABLE `jb_job_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences_translations`
--

DROP TABLE IF EXISTS `jb_job_experiences_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_experiences_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_experiences_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences_translations`
--

LOCK TABLES `jb_job_experiences_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_experiences_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts`
--

DROP TABLE IF EXISTS `jb_job_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts`
--

LOCK TABLES `jb_job_shifts` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts` DISABLE KEYS */;
INSERT INTO `jb_job_shifts` VALUES (1,'First Shift (Day)',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(2,'Second Shift (Afternoon)',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(3,'Third Shift (Night)',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(4,'Rotating',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25');
/*!40000 ALTER TABLE `jb_job_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts_translations`
--

DROP TABLE IF EXISTS `jb_job_shifts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_shifts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_shifts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts_translations`
--

LOCK TABLES `jb_job_shifts_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_shifts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills`
--

DROP TABLE IF EXISTS `jb_job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills`
--

LOCK TABLES `jb_job_skills` WRITE;
/*!40000 ALTER TABLE `jb_job_skills` DISABLE KEYS */;
INSERT INTO `jb_job_skills` VALUES (1,'JavaScript',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(2,'PHP',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(3,'Python',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(4,'Laravel',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(5,'CakePHP',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(6,'WordPress',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(7,'Flutter',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(8,'FilamentPHP',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(9,'React.js',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25');
/*!40000 ALTER TABLE `jb_job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills_translations`
--

DROP TABLE IF EXISTS `jb_job_skills_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_skills_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills_translations`
--

LOCK TABLES `jb_job_skills_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_skills_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_skills_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types`
--

DROP TABLE IF EXISTS `jb_job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types`
--

LOCK TABLES `jb_job_types` WRITE;
/*!40000 ALTER TABLE `jb_job_types` DISABLE KEYS */;
INSERT INTO `jb_job_types` VALUES (1,'Contract',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(2,'Freelance',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(3,'Full Time',0,1,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(4,'Internship',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(5,'Part Time',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25');
/*!40000 ALTER TABLE `jb_job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types_translations`
--

DROP TABLE IF EXISTS `jb_job_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types_translations`
--

LOCK TABLES `jb_job_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs`
--

DROP TABLE IF EXISTS `jb_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `apply_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `is_freelance` tinyint unsigned NOT NULL DEFAULT '0',
  `career_level_id` bigint unsigned DEFAULT NULL,
  `salary_from` decimal(15,2) unsigned DEFAULT NULL,
  `salary_to` decimal(15,2) unsigned DEFAULT NULL,
  `salary_range` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hour',
  `currency_id` bigint unsigned DEFAULT NULL,
  `degree_level_id` bigint unsigned DEFAULT NULL,
  `job_shift_id` bigint unsigned DEFAULT NULL,
  `job_experience_id` bigint unsigned DEFAULT NULL,
  `functional_area_id` bigint unsigned DEFAULT NULL,
  `hide_salary` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_positions` int unsigned NOT NULL DEFAULT '1',
  `expire_date` date DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `views` int unsigned NOT NULL DEFAULT '0',
  `number_of_applied` int unsigned NOT NULL DEFAULT '0',
  `hide_company` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `external_apply_clicks` int unsigned NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employer_colleagues` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `application_closing_date` date DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs`
--

LOCK TABLES `jb_jobs` WRITE;
/*!40000 ALTER TABLE `jb_jobs` DISABLE KEYS */;
INSERT INTO `jb_jobs` VALUES (1,'UI / UX Designer full-time','Voluptate eligendi et non quae possimus voluptatum deserunt. Sit dolor nulla in ipsa id quisquam. Ex voluptas aut dolore id. Quis praesentium explicabo veritatis rem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,5,5,5,0,2,1100.00,10900.00,'daily',1,3,4,3,91,0,2,'2024-06-07',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.566823','-74.908239',0,0,1,0,'published','approved','2024-04-05 16:04:57','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(2,'Full Stack Engineer','Aut quam distinctio nostrum ad ipsum amet. Et explicabo qui aperiam rem rem molestiae sint fugiat. Vero rerum ex aliquid deleniti doloremque officiis asperiores. Iste quae mollitia tenetur dolor.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','https://google.com',15,NULL,2,2,2,0,1,2600.00,5100.00,'daily',0,10,2,2,128,0,2,'2024-07-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.731666','-76.409493',0,0,1,0,'published','approved','2024-03-14 22:03:31','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(3,'Java Software Engineer','Fuga et mollitia fuga modi aut. Adipisci enim autem harum est ex. Consectetur tempora labore nobis ea iusto quia. Sed sunt inventore qui. Officia sequi dolorum temporibus doloribus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,5,9500.00,17000.00,'hourly',1,7,2,5,22,0,9,'2024-07-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.066793','-75.697049',0,0,0,0,'published','approved','2024-04-12 13:10:17','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(4,'Digital Marketing Manager','Sit ipsam voluptates ut veritatis. Nobis perferendis qui autem et et eos ab itaque. Nisi consequatur voluptas quaerat debitis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,5,5,5,0,3,5800.00,14800.00,'hourly',1,1,2,2,148,0,2,'2024-06-24',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.566823','-74.908239',0,0,0,1,'published','approved','2024-04-03 11:40:31','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(5,'Frontend Developer','Quia quae aliquam dolores fugit suscipit ut autem. Aut enim sit laborum et similique repellendus. Velit quia quibusdam natus. Dolor aut quia praesentium cum eos et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,4,8600.00,10800.00,'hourly',0,6,4,5,90,0,6,'2024-05-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.520835','-75.602506',0,0,0,0,'published','approved','2024-03-18 06:06:21','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(6,'React Native Web Developer','Dolor voluptatum molestiae reprehenderit qui eum eos. Dolor nemo libero non quasi quia voluptates suscipit. Consectetur aut assumenda in.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,1,1,1,0,1,5300.00,15100.00,'yearly',1,1,1,3,2,0,5,'2024-06-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.412338','-75.732512',0,0,1,0,'published','approved','2024-03-31 06:15:54','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(7,'Senior System Engineer','Ut quas necessitatibus et saepe. Veritatis tempore blanditiis a sed excepturi voluptatem. Ab et fugit quam ab vel. Fuga saepe laborum sit ut voluptatem consequatur eveniet.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',4,NULL,3,3,3,0,1,3300.00,9700.00,'monthly',1,1,2,1,80,0,2,'2024-06-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.136644','-75.198538',0,0,0,0,'published','approved','2024-04-21 03:35:28','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(8,'Products Manager','Et qui et quo voluptatem. Deleniti beatae dolor aperiam ratione quo. Magnam quae autem vitae aliquid iste. Dolor debitis architecto quasi expedita.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,1,2900.00,4600.00,'daily',1,2,3,2,57,0,5,'2024-07-10',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,1,1,'published','approved','2024-03-31 11:47:22','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(9,'Lead Quality Control QA','Culpa labore omnis adipisci consequuntur itaque et quia dolorem. Incidunt ea dicta magnam quibusdam dicta aut. Aut consequatur reiciendis quas earum nostrum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,3,4300.00,12600.00,'daily',1,2,1,2,70,0,6,'2024-05-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,0,0,'published','approved','2024-04-15 00:04:39','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(10,'Principal Designer, Design Systems','Voluptatem repellendus ut illum repellendus repellendus repellat sapiente vel. Dignissimos placeat consectetur rerum sint ratione tempore.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,4,4,4,0,2,5700.00,11700.00,'hourly',0,7,4,1,156,0,3,'2024-06-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.084478','-76.722115',0,0,0,1,'published','approved','2024-04-26 21:45:44','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(11,'DevOps Architect','Quis quidem qui qui qui quia veritatis. Iste vitae pariatur dolore quae rerum ipsa. Eum et rerum beatae veritatis corporis. Ex sapiente placeat perspiciatis quia quis similique.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,1,1,1,0,5,4700.00,9500.00,'weekly',1,10,2,4,128,0,4,'2024-05-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.966952','-76.278701',0,0,0,1,'published','approved','2024-04-26 01:25:11','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(12,'Senior Software Engineer, npm CLI','Facere et nihil distinctio maxime quidem aut. Quia magnam cum deleniti nisi consequatur deserunt minus. Occaecati veniam nam eum tenetur officiis nam.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,2,2,2,0,4,9400.00,17600.00,'hourly',0,10,4,2,24,0,10,'2024-06-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.284187','-76.374621',0,0,0,0,'published','approved','2024-04-09 15:57:19','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(13,'Senior Systems Engineer','Rem odio nobis et voluptas quia ex aspernatur. Aliquam magnam et molestias totam. Alias dolor tempora optio placeat. Vel nobis non totam delectus est.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,2,8000.00,10200.00,'daily',0,8,2,5,46,0,5,'2024-06-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.520835','-75.602506',0,0,1,0,'published','approved','2024-04-23 08:17:19','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(14,'Software Engineer Actions Platform','Voluptatem deserunt ea quod dicta aut eius. Repudiandae molestias porro et quia ipsum inventore fugiat. Nam aliquid esse voluptas aliquid.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,1,1,1,0,5,9300.00,13200.00,'hourly',0,8,3,1,135,0,3,'2024-06-17',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.506214','-76.091854',0,0,1,1,'published','approved','2024-05-04 15:05:26','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(15,'Staff Engineering Manager, Actions','Officiis ullam quia et est voluptatem. Nisi eos et quia ipsum. Omnis quaerat at explicabo provident.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,1,500.00,3000.00,'yearly',1,10,3,2,109,0,5,'2024-07-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.520835','-75.602506',0,0,0,0,'published','approved','2024-04-09 12:15:47','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(16,'Staff Engineering Manager: Actions Runtime','Placeat atque autem tempora quidem debitis omnis ut. Vitae dolores facere magnam aspernatur ullam voluptatem sit. Vel saepe velit blanditiis sequi. Corrupti architecto ullam vel natus vitae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,2,2,2,0,1,6500.00,7500.00,'yearly',0,9,2,1,155,0,5,'2024-06-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.818852','-76.487833',0,0,1,0,'published','approved','2024-04-22 10:57:44','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(17,'Staff Engineering Manager, Packages','Excepturi consequatur et non occaecati dolor. Impedit animi harum et quo nemo et sit. Velit accusamus eos incidunt eveniet. Tempore inventore possimus impedit ab molestias quasi dignissimos.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,4,4,4,0,4,900.00,2000.00,'monthly',0,2,3,2,156,0,3,'2024-06-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.060908','-75.484776',0,0,1,0,'published','approved','2024-03-23 14:10:37','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(18,'Staff Software Engineer','Sint quod omnis sint aut. Illo alias laudantium accusamus possimus ut optio nisi repellat. Modi consequatur molestiae qui incidunt dolores quam doloremque est.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,3,6500.00,14400.00,'yearly',0,7,2,5,78,0,10,'2024-06-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,1,0,'published','approved','2024-04-08 17:41:29','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(19,'Systems Software Engineer','Vel ab aperiam molestiae consequuntur fugit quibusdam. Fuga dolor qui aut explicabo assumenda. Illum sit totam sit non. Est rerum quaerat provident.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,1,1,1,0,1,6000.00,8300.00,'hourly',0,5,4,2,114,0,4,'2024-05-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.412338','-75.732512',0,0,1,1,'published','approved','2024-03-19 13:05:38','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(20,'Senior Compensation Analyst','Minima et dignissimos nesciunt eveniet. Dolor ipsum quisquam labore nostrum nesciunt sed tenetur. In dolor non sequi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,1,1,1,0,3,5000.00,11500.00,'monthly',1,3,4,3,95,0,9,'2024-06-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.663832','-76.384147',0,0,1,0,'published','approved','2024-03-22 01:18:13','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(21,'Senior Accessibility Program Manager','Et aut cumque saepe impedit explicabo excepturi aut. Omnis et animi aperiam quidem vitae et. Quos sit ad eius ipsa porro. Ut et ut assumenda fugiat qui excepturi molestiae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,1,1,1,0,5,1800.00,10900.00,'daily',0,5,2,5,23,0,4,'2024-06-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.966952','-76.278701',0,0,0,1,'published','approved','2024-03-29 12:43:24','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(22,'Analyst Relations Manager, Application Security','Aut quidem maxime cumque nam. Minus repellendus incidunt consequatur ut qui. Architecto sint voluptas fuga labore culpa non perspiciatis corrupti. Adipisci explicabo sint ad magnam voluptatem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,4,4,4,0,2,9200.00,15500.00,'daily',1,2,4,3,7,0,9,'2024-06-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.060908','-75.484776',0,0,1,0,'published','approved','2024-03-17 09:38:21','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(23,'Senior Enterprise Advocate, EMEA','Illum deserunt sit praesentium ullam nesciunt. Quis et sunt ad quis eum quos. Ullam qui et perspiciatis. Aspernatur a optio ea non sapiente incidunt.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,2,2,2,0,3,5700.00,15100.00,'daily',0,9,2,1,108,0,5,'2024-05-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.284187','-76.374621',0,0,0,1,'published','approved','2024-04-13 12:18:16','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(24,'Deal Desk Manager','Rerum repellendus et omnis quo omnis temporibus blanditiis. Reprehenderit quia autem quisquam ea. Eos vitae voluptatem quisquam et occaecati. Quos neque iusto voluptatem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',4,NULL,3,3,3,0,3,1400.00,6200.00,'weekly',0,3,1,1,17,0,4,'2024-06-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.136644','-75.198538',0,0,1,0,'published','approved','2024-03-21 00:45:58','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(25,'Director, Revenue Compensation','Omnis sit alias sunt. Atque nisi deserunt necessitatibus numquam sed ipsum sed. Quia ducimus sit iure beatae quae tenetur ullam. Iusto iste aliquid autem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,1,1,1,0,2,7300.00,8200.00,'daily',0,2,3,4,7,0,2,'2024-06-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.663832','-76.384147',0,0,0,1,'published','approved','2024-05-01 15:02:07','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(26,'Program Manager','Repellat voluptas esse dolores asperiores assumenda quia atque. Enim facilis quidem vero animi hic ea non.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,2,2,2,0,2,2300.00,5900.00,'daily',0,1,3,4,145,0,9,'2024-07-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.284187','-76.374621',0,0,1,0,'published','approved','2024-04-25 05:14:56','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(27,'Sr. Manager, Deal Desk - INTL','Nemo omnis qui totam dolores accusantium. Ea quod eveniet eligendi quia. Et qui enim ea excepturi aperiam animi. Id ducimus aliquam animi soluta qui veniam sit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,1,1,1,0,2,8200.00,10200.00,'daily',0,1,4,2,64,0,6,'2024-07-04',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.663832','-76.384147',0,0,0,0,'published','approved','2024-04-15 13:59:14','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(28,'Senior Director, Product Management, Actions Runners and Compute Services','Dolorum reiciendis magni eaque labore molestiae quis. Hic nesciunt qui doloremque ea est. Ex mollitia sit et ut minima explicabo. Et deserunt reiciendis ratione non veniam.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,4,6800.00,11700.00,'yearly',0,1,4,2,155,0,2,'2024-06-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.520835','-75.602506',0,0,0,1,'published','approved','2024-03-28 13:55:16','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(29,'Alliances Director','Cumque perferendis quod quas rerum error ratione. Minus et voluptas a deserunt molestias iusto nostrum ad. Nobis adipisci officia quam alias enim.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,2,2,2,0,4,4400.00,6500.00,'monthly',0,4,2,5,56,0,8,'2024-07-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.818852','-76.487833',0,0,0,1,'published','approved','2024-04-01 09:28:57','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(30,'Corporate Sales Representative','Eveniet earum omnis sit beatae enim amet. Enim et nisi occaecati et nobis. Dolorum modi iste velit sit. Voluptatem repellat exercitationem quia. Esse ex dolores vel voluptatem maxime et eveniet.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,2,2,2,0,3,1400.00,6200.00,'yearly',1,3,3,1,6,0,10,'2024-06-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.818852','-76.487833',0,0,0,0,'published','approved','2024-05-02 04:35:55','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(31,'Country Leader','Id quos ut et aut. Quasi commodi eos facere omnis cumque vel. Assumenda nisi dolorum sequi totam nesciunt quidem dolorum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',17,NULL,5,5,5,0,2,1100.00,6000.00,'monthly',1,2,4,4,49,0,2,'2024-06-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.599137','-76.725411',0,0,0,0,'published','approved','2024-03-24 17:32:37','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(32,'Customer Success Architect','Veniam harum debitis expedita praesentium molestiae. Culpa qui veniam sed corrupti est nam eveniet. Sapiente quo repudiandae aliquam ipsam. Qui voluptas dolores dolorum ullam et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,3,3,3,0,1,5500.00,13700.00,'weekly',1,8,1,3,127,0,10,'2024-06-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.879625','-74.839638',0,0,0,0,'published','approved','2024-04-17 23:43:57','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(33,'DevOps Account Executive - US Public Sector','Excepturi voluptatibus non et id nobis. Laudantium soluta dignissimos sunt dolores recusandae laboriosam. Aut repellat omnis in quia ex aut unde. Architecto fugiat quia tempore quisquam ut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,4,8500.00,13400.00,'daily',1,4,4,3,80,0,5,'2024-06-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,0,1,'published','approved','2024-03-31 17:31:36','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(34,'Enterprise Account Executive','Porro officia consequatur ullam eos porro quo temporibus. Quos nisi deleniti dolor enim id. Aut temporibus omnis reprehenderit at. Mollitia a sunt quaerat eligendi et rem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,1,1,1,0,1,6100.00,6700.00,'monthly',0,10,1,4,77,0,6,'2024-07-11',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.663832','-76.384147',0,0,0,0,'published','approved','2024-04-27 13:18:06','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(35,'Senior Engineering Manager, Product Security Engineering - Paved Paths','Et pariatur quo quae ut non explicabo saepe veniam. Voluptas incidunt molestias minima atque et laudantium. Qui sequi blanditiis unde non doloremque at. Repellat eaque quia dolorum in.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,2,2,2,0,3,7400.00,14900.00,'daily',1,8,4,3,39,0,5,'2024-06-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.818852','-76.487833',0,0,0,0,'published','approved','2024-04-27 13:25:48','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(36,'Customer Reliability Engineer III','Reiciendis cumque aliquam sit cum. Blanditiis qui fuga esse. Corporis iusto hic commodi eum odit voluptatum quia.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,4,6000.00,10200.00,'hourly',1,5,3,5,1,0,9,'2024-06-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,0,0,'published','approved','2024-03-20 13:34:12','2024-05-13 21:55:26',NULL,NULL,NULL,NULL),(37,'Support Engineer (Enterprise Support Japanese)','Omnis rem quod sit eum occaecati explicabo dolores. Atque laborum rerum sed et rerum eveniet. Fuga minus deserunt quas in qui quis dolor. Qui laboriosam consectetur qui consequatur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,4,4,4,0,2,9600.00,11900.00,'monthly',0,10,4,1,85,0,8,'2024-05-30',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.084478','-76.722115',0,0,0,1,'published','approved','2024-04-24 16:50:11','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(38,'Technical Partner Manager','Ut earum autem beatae quae debitis. Et enim et accusamus qui similique. Omnis esse quas voluptatem optio.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,1,4600.00,10900.00,'weekly',0,4,4,5,83,0,8,'2024-07-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.066793','-75.697049',0,0,0,1,'published','approved','2024-04-09 01:47:49','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(39,'Sr Manager, Inside Account Management','Voluptas fugit ad quod nesciunt. Quae omnis aut error corporis quas. Non et sed eos non veniam asperiores. Maiores veritatis eum est fuga. Dolor corporis corporis eos aut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,1,1,1,0,4,2600.00,4000.00,'monthly',1,8,3,1,27,0,9,'2024-06-28',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.663832','-76.384147',0,0,0,0,'published','approved','2024-05-04 21:03:12','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(40,'Services Sales Representative','Fuga dolorem occaecati provident excepturi ut veritatis. Quis ipsa officia id qui voluptatem ipsam architecto. Et impedit et quidem rerum rerum sed ea quia.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,2,1200.00,7700.00,'yearly',0,2,2,1,36,0,6,'2024-06-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,1,1,'published','approved','2024-04-13 04:19:40','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(41,'Services Delivery Manager','Occaecati praesentium et sunt sed in. Et velit dolorem voluptatibus autem fugit quas. Voluptatem mollitia nam et blanditiis eius perferendis. Placeat sit suscipit velit dicta.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,2,2,2,0,2,4800.00,14300.00,'daily',1,4,2,4,46,0,4,'2024-06-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.284187','-76.374621',0,0,0,0,'published','approved','2024-03-30 07:59:10','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(42,'Senior Solutions Engineer','Qui labore eos et dignissimos explicabo sunt. Architecto aut harum fugit. Distinctio non ad voluptatum et. Aut voluptatem vitae error quis culpa.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,3,3,3,0,2,3800.00,11000.00,'hourly',1,3,1,2,91,0,7,'2024-07-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.879625','-74.839638',0,0,1,1,'published','approved','2024-03-20 06:35:40','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(43,'Senior Service Delivery Engineer','Deserunt aut voluptate placeat officiis sit mollitia pariatur ut. Ratione officia cupiditate mollitia sit sit. Est est accusantium et ut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',4,NULL,3,3,3,0,4,6600.00,15600.00,'weekly',1,9,1,2,9,0,8,'2024-05-30',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.136644','-75.198538',0,0,1,1,'published','approved','2024-03-17 00:44:52','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(44,'Senior Director, Global Sales Development','Quia dicta assumenda dolores exercitationem eum voluptas. Voluptatem voluptas quia modi non numquam laudantium quo doloremque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,1,1,1,0,5,4600.00,6500.00,'monthly',0,6,2,5,139,0,9,'2024-06-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.663832','-76.384147',0,0,0,1,'published','approved','2024-04-13 02:32:52','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(45,'Partner Program Manager','Sit magnam hic natus occaecati nulla est. Quasi sint et praesentium ut. Excepturi ratione deserunt porro.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,2,4900.00,14400.00,'daily',1,4,3,2,111,0,7,'2024-07-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.520835','-75.602506',0,0,0,0,'published','approved','2024-04-22 09:11:31','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(46,'Principal Cloud Solutions Engineer','Et libero tempore nulla commodi nostrum nobis iste. Quasi labore molestiae omnis itaque nisi sit. Optio cum veritatis sapiente modi aut. Illo est possimus dolore aut eum illo sapiente.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,1,1,1,0,5,5300.00,11900.00,'weekly',1,8,2,1,148,0,4,'2024-06-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.412338','-75.732512',0,0,0,0,'published','approved','2024-04-05 06:37:42','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(47,'Senior Cloud Solutions Engineer','Et sunt eius est non fuga. Aspernatur sint eaque totam vel modi. Beatae provident natus sint ipsum eum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,4,4,4,0,5,6400.00,15500.00,'weekly',1,1,1,4,94,0,5,'2024-07-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.060908','-75.484776',0,0,0,1,'published','approved','2024-04-18 01:47:33','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(48,'Senior Customer Success Manager','Rerum quae ratione non omnis non. Minima magni natus et illo dolor officia repudiandae. Aut tenetur eum molestiae. Omnis maxime fugiat odit odio.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,1,3900.00,6300.00,'yearly',1,5,2,2,16,0,4,'2024-06-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.520835','-75.602506',0,0,1,1,'published','approved','2024-04-10 18:21:55','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(49,'Inside Account Manager','Libero consectetur aut occaecati nulla qui. Qui accusantium qui accusamus quaerat.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',17,NULL,5,5,5,0,2,7700.00,16800.00,'monthly',1,10,4,3,70,0,9,'2024-07-10',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.599137','-76.725411',0,0,1,0,'published','approved','2024-04-18 04:17:53','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(50,'UX Jobs Board','Minima a dignissimos quia laboriosam harum. Et placeat ut magni voluptas deleniti porro officiis ea.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,6,6,6,0,1,4000.00,5800.00,'hourly',1,4,4,5,50,0,2,'2024-06-12',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.440043','-76.384904',0,0,1,0,'published','approved','2024-05-07 13:10:45','2024-05-13 21:55:27',NULL,NULL,NULL,NULL),(51,'Senior Laravel Developer (TALL Stack)','Sed rerum illum nobis. Non vitae est voluptatem et rerum. Necessitatibus libero consectetur ipsa. Ducimus et voluptatem omnis aut iusto consequatur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,5,5,5,0,2,4500.00,11800.00,'hourly',1,4,1,5,51,0,3,'2024-07-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.970083','-76.339625',0,0,0,0,'published','approved','2024-03-26 05:10:52','2024-05-13 21:55:27',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_categories`
--

DROP TABLE IF EXISTS `jb_jobs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_categories` (
  `job_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_categories`
--

LOCK TABLES `jb_jobs_categories` WRITE;
/*!40000 ALTER TABLE `jb_jobs_categories` DISABLE KEYS */;
INSERT INTO `jb_jobs_categories` VALUES (1,1),(1,5),(1,8),(2,1),(2,4),(2,9),(3,1),(3,2),(3,9),(4,1),(4,2),(4,9),(5,1),(5,4),(5,7),(6,1),(6,4),(6,6),(7,1),(7,4),(7,8),(8,1),(8,4),(8,8),(9,1),(9,3),(9,10),(10,1),(10,3),(10,10),(11,1),(11,5),(11,10),(12,1),(12,3),(12,6),(13,1),(13,5),(13,9),(14,1),(14,3),(14,8),(15,1),(15,5),(15,10),(16,1),(16,2),(16,10),(17,1),(17,4),(17,7),(18,1),(18,4),(18,10),(19,1),(19,5),(19,7),(20,1),(20,5),(20,6),(21,1),(21,3),(21,9),(22,1),(22,5),(22,10),(23,1),(23,3),(23,7),(24,1),(24,5),(24,8),(25,1),(25,4),(25,8),(26,1),(26,2),(26,7),(27,1),(27,4),(27,6),(28,1),(28,4),(28,7),(29,1),(29,3),(29,7),(30,1),(30,5),(30,10),(31,1),(31,3),(31,8),(32,1),(32,4),(32,6),(33,1),(33,5),(33,10),(34,1),(34,2),(34,6),(35,1),(35,3),(35,8),(36,1),(36,5),(36,8),(37,1),(37,2),(37,9),(38,1),(38,2),(38,7),(39,1),(39,5),(39,8),(40,1),(40,2),(40,6),(41,1),(41,5),(41,8),(42,1),(42,2),(42,7),(43,1),(43,4),(43,8),(44,1),(44,4),(44,7),(45,1),(45,5),(45,7),(46,1),(46,3),(46,9),(47,1),(47,4),(47,7),(48,1),(48,5),(48,6),(49,1),(49,2),(49,10),(50,1),(50,2),(50,6),(51,1),(51,3),(51,10);
/*!40000 ALTER TABLE `jb_jobs_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_skills`
--

DROP TABLE IF EXISTS `jb_jobs_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_skills` (
  `job_id` bigint unsigned NOT NULL,
  `job_skill_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_skills`
--

LOCK TABLES `jb_jobs_skills` WRITE;
/*!40000 ALTER TABLE `jb_jobs_skills` DISABLE KEYS */;
INSERT INTO `jb_jobs_skills` VALUES (1,4),(2,6),(3,7),(4,9),(5,8),(6,6),(7,2),(8,1),(9,2),(10,8),(11,8),(12,5),(13,3),(14,7),(15,2),(16,8),(17,7),(18,6),(19,4),(20,6),(21,4),(22,4),(23,4),(24,5),(25,9),(26,5),(27,5),(28,4),(29,8),(30,5),(31,9),(32,6),(33,9),(34,5),(35,1),(36,5),(37,2),(38,6),(39,6),(40,3),(41,9),(42,5),(43,6),(44,5),(45,9),(46,5),(47,1),(48,2),(49,5),(50,8),(51,6);
/*!40000 ALTER TABLE `jb_jobs_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_tags`
--

DROP TABLE IF EXISTS `jb_jobs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_tags` (
  `job_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`job_id`,`tag_id`),
  KEY `jb_jobs_tags_job_id_index` (`job_id`),
  KEY `jb_jobs_tags_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_tags`
--

LOCK TABLES `jb_jobs_tags` WRITE;
/*!40000 ALTER TABLE `jb_jobs_tags` DISABLE KEYS */;
INSERT INTO `jb_jobs_tags` VALUES (1,4),(1,6),(2,2),(2,7),(3,4),(3,7),(4,3),(4,7),(5,1),(5,6),(6,2),(6,5),(7,4),(7,8),(8,4),(8,8),(9,1),(9,8),(10,4),(10,8),(11,2),(11,6),(12,2),(12,7),(13,1),(13,7),(14,3),(14,6),(15,2),(15,8),(16,3),(16,6),(17,2),(17,6),(18,1),(18,8),(19,2),(19,7),(20,1),(20,7),(21,2),(21,5),(22,1),(22,8),(23,2),(23,8),(24,4),(24,7),(25,1),(25,7),(26,4),(26,7),(27,1),(27,6),(28,2),(28,6),(29,4),(29,8),(30,3),(30,8),(31,2),(31,5),(32,2),(32,7),(33,3),(33,7),(34,1),(34,6),(35,3),(35,8),(36,2),(36,6),(37,4),(37,8),(38,2),(38,5),(39,1),(39,7),(40,3),(40,5),(41,4),(41,8),(42,4),(42,8),(43,4),(43,7),(44,2),(44,6),(45,1),(45,8),(46,3),(46,5),(47,1),(47,6),(48,1),(48,8),(49,2),(49,6),(50,4),(50,8),(51,4),(51,8);
/*!40000 ALTER TABLE `jb_jobs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_translations`
--

DROP TABLE IF EXISTS `jb_jobs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_jobs_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`jb_jobs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_translations`
--

LOCK TABLES `jb_jobs_translations` WRITE;
/*!40000 ALTER TABLE `jb_jobs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_jobs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_types`
--

DROP TABLE IF EXISTS `jb_jobs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_types` (
  `job_id` bigint unsigned NOT NULL,
  `job_type_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_types`
--

LOCK TABLES `jb_jobs_types` WRITE;
/*!40000 ALTER TABLE `jb_jobs_types` DISABLE KEYS */;
INSERT INTO `jb_jobs_types` VALUES (1,4),(2,1),(3,4),(4,4),(5,2),(6,5),(7,4),(8,5),(9,1),(10,1),(11,4),(12,3),(13,1),(14,3),(15,4),(16,5),(17,2),(18,2),(19,5),(20,2),(21,2),(22,1),(23,2),(24,4),(25,5),(26,3),(27,2),(28,2),(29,5),(30,1),(31,1),(32,2),(33,1),(34,1),(35,5),(36,1),(37,2),(38,5),(39,2),(40,4),(41,2),(42,3),(43,3),(44,3),(45,4),(46,5),(47,5),(48,2),(49,5),(50,2),(51,1);
/*!40000 ALTER TABLE `jb_jobs_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels`
--

DROP TABLE IF EXISTS `jb_language_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels`
--

LOCK TABLES `jb_language_levels` WRITE;
/*!40000 ALTER TABLE `jb_language_levels` DISABLE KEYS */;
INSERT INTO `jb_language_levels` VALUES (1,'Expert',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(2,'Intermediate',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25'),(3,'Beginner',0,0,'published','2024-05-13 21:55:25','2024-05-13 21:55:25');
/*!40000 ALTER TABLE `jb_language_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels_translations`
--

DROP TABLE IF EXISTS `jb_language_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_language_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_language_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels_translations`
--

LOCK TABLES `jb_language_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_language_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_language_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_major_subjects`
--

DROP TABLE IF EXISTS `jb_major_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_major_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_major_subjects`
--

LOCK TABLES `jb_major_subjects` WRITE;
/*!40000 ALTER TABLE `jb_major_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_major_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages`
--

DROP TABLE IF EXISTS `jb_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `account_limit` int unsigned DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages`
--

LOCK TABLES `jb_packages` WRITE;
/*!40000 ALTER TABLE `jb_packages` DISABLE KEYS */;
INSERT INTO `jb_packages` VALUES (1,'Free First Post',0.00,1,0,1,0,1,0,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL),(2,'Single Post',250.00,1,0,1,0,NULL,1,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL),(3,'5 Posts',1000.00,1,20,5,0,NULL,0,'published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL);
/*!40000 ALTER TABLE `jb_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages_translations`
--

DROP TABLE IF EXISTS `jb_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_packages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages_translations`
--

LOCK TABLES `jb_packages_translations` WRITE;
/*!40000 ALTER TABLE `jb_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_reviews`
--

DROP TABLE IF EXISTS `jb_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `created_by_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_id` bigint unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`reviewable_id`,`reviewable_type`,`created_by_id`,`created_by_type`),
  KEY `jb_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `jb_reviews_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  KEY `jb_reviews_reviewable_id_reviewable_type_status_index` (`reviewable_id`,`reviewable_type`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_reviews`
--

LOCK TABLES `jb_reviews` WRITE;
/*!40000 ALTER TABLE `jb_reviews` DISABLE KEYS */;
INSERT INTO `jb_reviews` VALUES (1,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',4,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(2,'Botble\\JobBoard\\Models\\Account',40,'Botble\\JobBoard\\Models\\Company',4,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(3,'Botble\\JobBoard\\Models\\Account',77,'Botble\\JobBoard\\Models\\Company',17,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(4,'Botble\\JobBoard\\Models\\Account',15,'Botble\\JobBoard\\Models\\Company',16,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(5,'Botble\\JobBoard\\Models\\Account',42,'Botble\\JobBoard\\Models\\Company',6,4.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(6,'Botble\\JobBoard\\Models\\Account',81,'Botble\\JobBoard\\Models\\Company',20,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(7,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',90,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(8,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',85,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(9,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',82,4.00,'Best ecommerce CMS online store!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(10,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',60,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(11,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',63,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(12,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',20,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(13,'Botble\\JobBoard\\Models\\Account',18,'Botble\\JobBoard\\Models\\Company',11,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(14,'Botble\\JobBoard\\Models\\Account',29,'Botble\\JobBoard\\Models\\Company',13,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(15,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',69,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(16,'Botble\\JobBoard\\Models\\Account',46,'Botble\\JobBoard\\Models\\Company',5,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(17,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',39,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(18,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',19,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(19,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',22,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(20,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',41,2.00,'Clean & perfect source code','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(21,'Botble\\JobBoard\\Models\\Account',18,'Botble\\JobBoard\\Models\\Company',17,1.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(22,'Botble\\JobBoard\\Models\\Company',13,'Botble\\JobBoard\\Models\\Account',75,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(23,'Botble\\JobBoard\\Models\\Account',56,'Botble\\JobBoard\\Models\\Company',10,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(24,'Botble\\JobBoard\\Models\\Account',45,'Botble\\JobBoard\\Models\\Company',20,5.00,'Good app, good backup service and support. Good documentation.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(25,'Botble\\JobBoard\\Models\\Account',49,'Botble\\JobBoard\\Models\\Company',4,1.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(26,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',85,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(27,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',24,3.00,'Best ecommerce CMS online store!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(28,'Botble\\JobBoard\\Models\\Account',12,'Botble\\JobBoard\\Models\\Company',17,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(29,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',29,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(30,'Botble\\JobBoard\\Models\\Account',82,'Botble\\JobBoard\\Models\\Company',10,1.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(31,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',13,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(32,'Botble\\JobBoard\\Models\\Company',13,'Botble\\JobBoard\\Models\\Account',24,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(33,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',77,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(34,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',3,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(35,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',84,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(36,'Botble\\JobBoard\\Models\\Account',55,'Botble\\JobBoard\\Models\\Company',5,4.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(37,'Botble\\JobBoard\\Models\\Account',66,'Botble\\JobBoard\\Models\\Company',8,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(38,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',30,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(39,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',99,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(40,'Botble\\JobBoard\\Models\\Account',84,'Botble\\JobBoard\\Models\\Company',10,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(41,'Botble\\JobBoard\\Models\\Account',67,'Botble\\JobBoard\\Models\\Company',18,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(42,'Botble\\JobBoard\\Models\\Account',23,'Botble\\JobBoard\\Models\\Company',16,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(43,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',87,2.00,'Clean & perfect source code','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(44,'Botble\\JobBoard\\Models\\Account',78,'Botble\\JobBoard\\Models\\Company',6,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(45,'Botble\\JobBoard\\Models\\Account',44,'Botble\\JobBoard\\Models\\Company',17,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(46,'Botble\\JobBoard\\Models\\Account',52,'Botble\\JobBoard\\Models\\Company',11,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(47,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',98,1.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(48,'Botble\\JobBoard\\Models\\Account',99,'Botble\\JobBoard\\Models\\Company',4,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(49,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',80,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(50,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',72,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(51,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',6,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(52,'Botble\\JobBoard\\Models\\Account',28,'Botble\\JobBoard\\Models\\Company',20,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(53,'Botble\\JobBoard\\Models\\Account',68,'Botble\\JobBoard\\Models\\Company',4,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(54,'Botble\\JobBoard\\Models\\Account',11,'Botble\\JobBoard\\Models\\Company',9,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(55,'Botble\\JobBoard\\Models\\Account',92,'Botble\\JobBoard\\Models\\Company',18,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(56,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',3,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(57,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',99,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(58,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',65,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(59,'Botble\\JobBoard\\Models\\Account',15,'Botble\\JobBoard\\Models\\Company',19,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(60,'Botble\\JobBoard\\Models\\Account',81,'Botble\\JobBoard\\Models\\Company',7,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(61,'Botble\\JobBoard\\Models\\Account',74,'Botble\\JobBoard\\Models\\Company',13,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(62,'Botble\\JobBoard\\Models\\Account',15,'Botble\\JobBoard\\Models\\Company',11,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(63,'Botble\\JobBoard\\Models\\Account',40,'Botble\\JobBoard\\Models\\Company',1,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(64,'Botble\\JobBoard\\Models\\Account',4,'Botble\\JobBoard\\Models\\Company',13,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(65,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',70,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(66,'Botble\\JobBoard\\Models\\Account',34,'Botble\\JobBoard\\Models\\Company',2,4.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(67,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',89,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(68,'Botble\\JobBoard\\Models\\Account',5,'Botble\\JobBoard\\Models\\Company',11,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(69,'Botble\\JobBoard\\Models\\Company',13,'Botble\\JobBoard\\Models\\Account',45,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(70,'Botble\\JobBoard\\Models\\Account',91,'Botble\\JobBoard\\Models\\Company',7,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(71,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',20,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(72,'Botble\\JobBoard\\Models\\Account',34,'Botble\\JobBoard\\Models\\Company',17,2.00,'Good app, good backup service and support. Good documentation.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(73,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',73,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(74,'Botble\\JobBoard\\Models\\Account',28,'Botble\\JobBoard\\Models\\Company',2,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(75,'Botble\\JobBoard\\Models\\Account',75,'Botble\\JobBoard\\Models\\Company',16,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(76,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',50,1.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(77,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',61,1.00,'Clean & perfect source code','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(78,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',43,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(79,'Botble\\JobBoard\\Models\\Account',66,'Botble\\JobBoard\\Models\\Company',10,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(80,'Botble\\JobBoard\\Models\\Account',1,'Botble\\JobBoard\\Models\\Company',1,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(81,'Botble\\JobBoard\\Models\\Account',88,'Botble\\JobBoard\\Models\\Company',10,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(82,'Botble\\JobBoard\\Models\\Account',72,'Botble\\JobBoard\\Models\\Company',20,4.00,'Best ecommerce CMS online store!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(83,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',11,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(85,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',74,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(86,'Botble\\JobBoard\\Models\\Account',19,'Botble\\JobBoard\\Models\\Company',17,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(87,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',22,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(88,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',81,2.00,'Good app, good backup service and support. Good documentation.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(89,'Botble\\JobBoard\\Models\\Account',31,'Botble\\JobBoard\\Models\\Company',10,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(90,'Botble\\JobBoard\\Models\\Account',83,'Botble\\JobBoard\\Models\\Company',3,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(91,'Botble\\JobBoard\\Models\\Company',17,'Botble\\JobBoard\\Models\\Account',30,2.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(92,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',61,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(93,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',25,1.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(94,'Botble\\JobBoard\\Models\\Account',43,'Botble\\JobBoard\\Models\\Company',16,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(95,'Botble\\JobBoard\\Models\\Company',17,'Botble\\JobBoard\\Models\\Account',13,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(96,'Botble\\JobBoard\\Models\\Account',30,'Botble\\JobBoard\\Models\\Company',5,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(97,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',8,2.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(98,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',57,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(99,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',59,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(100,'Botble\\JobBoard\\Models\\Account',18,'Botble\\JobBoard\\Models\\Company',8,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `jb_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_saved_jobs`
--

DROP TABLE IF EXISTS `jb_saved_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_saved_jobs` (
  `account_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_saved_jobs`
--

LOCK TABLES `jb_saved_jobs` WRITE;
/*!40000 ALTER TABLE `jb_saved_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_saved_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags`
--

DROP TABLE IF EXISTS `jb_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags`
--

LOCK TABLES `jb_tags` WRITE;
/*!40000 ALTER TABLE `jb_tags` DISABLE KEYS */;
INSERT INTO `jb_tags` VALUES (1,'Illustrator','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(2,'Adobe XD','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(3,'Figma','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(4,'Sketch','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(5,'Lunacy','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(6,'PHP','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(7,'Python','','published','2024-05-13 21:55:26','2024-05-13 21:55:26'),(8,'JavaScript','','published','2024-05-13 21:55:26','2024-05-13 21:55:26');
/*!40000 ALTER TABLE `jb_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags_translations`
--

DROP TABLE IF EXISTS `jb_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags_translations`
--

LOCK TABLES `jb_tags_translations` WRITE;
/*!40000 ALTER TABLE `jb_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_transactions`
--

DROP TABLE IF EXISTS `jb_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_transactions`
--

LOCK TABLES `jb_transactions` WRITE;
/*!40000 ALTER TABLE `jb_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','6e3ceb30d7f0cd36f954174eb7980e4f',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','6b1e0688c216b3161c20488b57eced5a',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','ae75ee6679f85038b3c41f360c13b702',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','88d57cd7e3ebdac624d62e1d04614da9',3,'Botble\\Menu\\Models\\Menu'),(5,'en_US','4fb757a79a729f87e9131c721852ea25',4,'Botble\\Menu\\Models\\Menu'),(6,'en_US','d7ab7e14c719999569fb52ddaae0c47a',5,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (41,0,'acer','acer',3,'image/png',285,'our-partners/acer.png','[]','2024-05-13 21:55:19','2024-05-13 21:55:19',NULL,'public'),(42,0,'asus','asus',3,'image/png',314,'our-partners/asus.png','[]','2024-05-13 21:55:19','2024-05-13 21:55:19',NULL,'public'),(43,0,'dell','dell',3,'image/png',296,'our-partners/dell.png','[]','2024-05-13 21:55:19','2024-05-13 21:55:19',NULL,'public'),(44,0,'microsoft','microsoft',3,'image/png',287,'our-partners/microsoft.png','[]','2024-05-13 21:55:19','2024-05-13 21:55:19',NULL,'public'),(45,0,'nokia','nokia',3,'image/png',308,'our-partners/nokia.png','[]','2024-05-13 21:55:19','2024-05-13 21:55:19',NULL,'public'),(46,0,'1','1',4,'image/jpeg',9803,'news/1.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(47,0,'10','10',4,'image/jpeg',9803,'news/10.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(48,0,'11','11',4,'image/jpeg',9803,'news/11.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(49,0,'12','12',4,'image/jpeg',9803,'news/12.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(50,0,'13','13',4,'image/jpeg',9803,'news/13.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(51,0,'14','14',4,'image/jpeg',9803,'news/14.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(52,0,'15','15',4,'image/jpeg',9803,'news/15.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(53,0,'16','16',4,'image/jpeg',9803,'news/16.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(54,0,'2','2',4,'image/jpeg',9803,'news/2.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(55,0,'3','3',4,'image/jpeg',9803,'news/3.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(56,0,'4','4',4,'image/jpeg',9803,'news/4.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(57,0,'5','5',4,'image/jpeg',9803,'news/5.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(58,0,'6','6',4,'image/jpeg',9803,'news/6.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(59,0,'7','7',4,'image/jpeg',9803,'news/7.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(60,0,'8','8',4,'image/jpeg',9803,'news/8.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(61,0,'9','9',4,'image/jpeg',9803,'news/9.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(62,0,'cover-image1','cover-image1',4,'image/png',9803,'news/cover-image1.png','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(63,0,'cover-image2','cover-image2',4,'image/png',9803,'news/cover-image2.png','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(64,0,'cover-image3','cover-image3',4,'image/png',9803,'news/cover-image3.png','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(65,0,'img-news1','img-news1',4,'image/png',9803,'news/img-news1.png','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(66,0,'img-news2','img-news2',4,'image/png',9803,'news/img-news2.png','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(67,0,'img-news3','img-news3',4,'image/png',9803,'news/img-news3.png','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(68,0,'1','1',5,'image/jpeg',6977,'galleries/1.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(69,0,'10','10',5,'image/jpeg',9803,'galleries/10.jpg','[]','2024-05-13 21:55:20','2024-05-13 21:55:20',NULL,'public'),(70,0,'2','2',5,'image/jpeg',6977,'galleries/2.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(71,0,'3','3',5,'image/jpeg',6977,'galleries/3.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(72,0,'4','4',5,'image/jpeg',6977,'galleries/4.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(73,0,'5','5',5,'image/jpeg',6977,'galleries/5.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(74,0,'6','6',5,'image/jpeg',6977,'galleries/6.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(75,0,'7','7',5,'image/jpeg',6977,'galleries/7.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(76,0,'8','8',5,'image/jpeg',9803,'galleries/8.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(77,0,'9','9',5,'image/jpeg',9803,'galleries/9.jpg','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(78,0,'widget-banner','widget-banner',6,'image/png',11079,'widgets/widget-banner.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(79,0,'404','404',7,'image/png',10947,'general/404.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(80,0,'android','android',7,'image/png',477,'general/android.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(81,0,'app-store','app-store',7,'image/png',477,'general/app-store.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(82,0,'content','content',7,'image/png',1692,'general/content.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(83,0,'cover-image','cover-image',7,'image/png',8992,'general/cover-image.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(84,0,'customer','customer',7,'image/png',2810,'general/customer.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(85,0,'favicon','favicon',7,'image/png',706,'general/favicon.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(86,0,'finance','finance',7,'image/png',2460,'general/finance.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(87,0,'human','human',7,'image/png',2359,'general/human.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(88,0,'img-about2','img-about2',7,'image/png',36911,'general/img-about2.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(89,0,'lightning','lightning',7,'image/png',2768,'general/lightning.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(90,0,'logo-company','logo-company',7,'image/png',3166,'general/logo-company.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(91,0,'logo-light','logo-light',7,'image/png',2352,'general/logo-light.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(92,0,'logo','logo',7,'image/png',2459,'general/logo.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(93,0,'management','management',7,'image/png',1915,'general/management.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(94,0,'marketing','marketing',7,'image/png',2134,'general/marketing.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(95,0,'newsletter-background-image','newsletter-background-image',7,'image/png',9830,'general/newsletter-background-image.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(96,0,'newsletter-image-left','newsletter-image-left',7,'image/png',4177,'general/newsletter-image-left.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(97,0,'newsletter-image-right','newsletter-image-right',7,'image/png',2886,'general/newsletter-image-right.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(98,0,'research','research',7,'image/png',3206,'general/research.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(99,0,'retail','retail',7,'image/png',2874,'general/retail.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(100,0,'security','security',7,'image/png',2986,'general/security.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(101,0,'img-1','img-1',8,'image/png',2377,'authentication/img-1.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(102,0,'img-2','img-2',8,'image/png',5009,'authentication/img-2.png','[]','2024-05-13 21:55:21','2024-05-13 21:55:21',NULL,'public'),(103,0,'background-cover-candidate','background-cover-candidate',9,'image/png',436821,'pages/background-cover-candidate.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(104,0,'background_breadcrumb','background_breadcrumb',9,'image/png',6111,'pages/background-breadcrumb.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(105,0,'banner-section-search-box','banner-section-search-box',9,'image/png',20501,'pages/banner-section-search-box.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(106,0,'banner1','banner1',9,'image/png',7381,'pages/banner1.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(107,0,'banner2','banner2',9,'image/png',4920,'pages/banner2.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(108,0,'banner3','banner3',9,'image/png',2472,'pages/banner3.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(109,0,'banner4','banner4',9,'image/png',1952,'pages/banner4.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(110,0,'banner5','banner5',9,'image/png',1545,'pages/banner5.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(111,0,'banner6','banner6',9,'image/png',1609,'pages/banner6.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(112,0,'bg-breadcrumb','bg-breadcrumb',9,'image/png',14250,'pages/bg-breadcrumb.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(113,0,'bg-cat','bg-cat',9,'image/png',60543,'pages/bg-cat.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(114,0,'bg-left-hiring','bg-left-hiring',9,'image/png',1631,'pages/bg-left-hiring.png','[]','2024-05-13 21:55:22','2024-05-13 21:55:22',NULL,'public'),(115,0,'bg-newsletter','bg-newsletter',9,'image/png',4587,'pages/bg-newsletter.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(116,0,'bg-right-hiring','bg-right-hiring',9,'image/png',3074,'pages/bg-right-hiring.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(117,0,'controlcard','controlcard',9,'image/png',7404,'pages/controlcard.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(118,0,'home-page-4-banner','home-page-4-banner',9,'image/png',7596,'pages/home-page-4-banner.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(119,0,'icon-bottom-banner','icon-bottom-banner',9,'image/png',274,'pages/icon-bottom-banner.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(120,0,'icon-top-banner','icon-top-banner',9,'image/png',362,'pages/icon-top-banner.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(121,0,'img-banner','img-banner',9,'image/png',10542,'pages/img-banner.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(122,0,'img-chart','img-chart',9,'image/png',7549,'pages/img-chart.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(123,0,'img-job-search','img-job-search',9,'image/png',35569,'pages/img-job-search.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(124,0,'img-profile','img-profile',9,'image/png',9177,'pages/img-profile.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(125,0,'img-single','img-single',9,'image/png',13060,'pages/img-single.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(126,0,'img1','img1',9,'image/png',10246,'pages/img1.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(127,0,'job-tools','job-tools',9,'image/png',2216,'pages/job-tools.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(128,0,'left-job-head','left-job-head',9,'image/png',14956,'pages/left-job-head.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(129,0,'newsletter-left','newsletter-left',9,'image/png',4177,'pages/newsletter-left.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(130,0,'newsletter-right','newsletter-right',9,'image/png',2886,'pages/newsletter-right.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(131,0,'planning-job','planning-job',9,'image/png',1623,'pages/planning-job.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(132,0,'right-job-head','right-job-head',9,'image/png',10955,'pages/right-job-head.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(133,0,'facebook','facebook',10,'image/png',795,'socials/facebook.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(134,0,'linkedin','linkedin',10,'image/png',804,'socials/linkedin.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(135,0,'twitter','twitter',10,'image/png',1029,'socials/twitter.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(136,0,'location1','location1',11,'image/png',5149,'locations/location1.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(137,0,'location2','location2',11,'image/png',5921,'locations/location2.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(138,0,'location3','location3',11,'image/png',5276,'locations/location3.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(139,0,'location4','location4',11,'image/png',5259,'locations/location4.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(140,0,'location5','location5',11,'image/png',5140,'locations/location5.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(141,0,'location6','location6',11,'image/png',4891,'locations/location6.png','[]','2024-05-13 21:55:23','2024-05-13 21:55:23',NULL,'public'),(142,0,'1','1',12,'image/png',407,'job-categories/1.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(143,0,'10','10',12,'image/png',407,'job-categories/10.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(144,0,'11','11',12,'image/png',407,'job-categories/11.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(145,0,'12','12',12,'image/png',407,'job-categories/12.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(146,0,'13','13',12,'image/png',407,'job-categories/13.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(147,0,'14','14',12,'image/png',407,'job-categories/14.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(148,0,'15','15',12,'image/png',407,'job-categories/15.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(149,0,'16','16',12,'image/png',407,'job-categories/16.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(150,0,'17','17',12,'image/png',407,'job-categories/17.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(151,0,'18','18',12,'image/png',407,'job-categories/18.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(152,0,'19','19',12,'image/png',407,'job-categories/19.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(153,0,'2','2',12,'image/png',407,'job-categories/2.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(154,0,'3','3',12,'image/png',407,'job-categories/3.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(155,0,'4','4',12,'image/png',407,'job-categories/4.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(156,0,'5','5',12,'image/png',407,'job-categories/5.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(157,0,'6','6',12,'image/png',407,'job-categories/6.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(158,0,'7','7',12,'image/png',407,'job-categories/7.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(159,0,'8','8',12,'image/png',407,'job-categories/8.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(160,0,'9','9',12,'image/png',407,'job-categories/9.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(161,0,'img-cover-1','img-cover-1',12,'image/png',33918,'job-categories/img-cover-1.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(162,0,'img-cover-2','img-cover-2',12,'image/png',33918,'job-categories/img-cover-2.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(163,0,'img-cover-3','img-cover-3',12,'image/png',33918,'job-categories/img-cover-3.png','[]','2024-05-13 21:55:24','2024-05-13 21:55:24',NULL,'public'),(164,0,'1','1',13,'image/png',598,'companies/1.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(165,0,'2','2',13,'image/png',598,'companies/2.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(166,0,'3','3',13,'image/png',598,'companies/3.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(167,0,'4','4',13,'image/png',598,'companies/4.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(168,0,'5','5',13,'image/png',598,'companies/5.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(169,0,'6','6',13,'image/png',598,'companies/6.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(170,0,'7','7',13,'image/png',598,'companies/7.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(171,0,'8','8',13,'image/png',598,'companies/8.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(172,0,'9','9',13,'image/png',598,'companies/9.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(173,0,'company-cover-image','company-cover-image',13,'image/png',8992,'companies/company-cover-image.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(174,0,'img1','img1',14,'image/png',5706,'jobs/img1.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(175,0,'img2','img2',14,'image/png',5706,'jobs/img2.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(176,0,'img3','img3',14,'image/png',5706,'jobs/img3.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(177,0,'img4','img4',14,'image/png',5706,'jobs/img4.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(178,0,'img5','img5',14,'image/png',5706,'jobs/img5.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(179,0,'img6','img6',14,'image/png',5706,'jobs/img6.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(180,0,'img7','img7',14,'image/png',5706,'jobs/img7.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(181,0,'img8','img8',14,'image/png',5706,'jobs/img8.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(182,0,'img9','img9',14,'image/png',5706,'jobs/img9.png','[]','2024-05-13 21:55:25','2024-05-13 21:55:25',NULL,'public'),(183,0,'01','01',15,'application/pdf',43496,'resume/01.pdf','[]','2024-05-13 21:55:27','2024-05-13 21:55:27',NULL,'public'),(184,0,'1','1',16,'image/png',3090,'avatars/1.png','[]','2024-05-13 21:55:27','2024-05-13 21:55:27',NULL,'public'),(185,0,'2','2',16,'image/png',2773,'avatars/2.png','[]','2024-05-13 21:55:27','2024-05-13 21:55:27',NULL,'public'),(186,0,'3','3',16,'image/png',2749,'avatars/3.png','[]','2024-05-13 21:55:27','2024-05-13 21:55:27',NULL,'public'),(187,0,'1','1',17,'image/png',395380,'covers/1.png','[]','2024-05-13 21:55:27','2024-05-13 21:55:27',NULL,'public'),(188,0,'2','2',17,'image/png',1308067,'covers/2.png','[]','2024-05-13 21:55:27','2024-05-13 21:55:27',NULL,'public'),(189,0,'3','3',17,'image/png',301502,'covers/3.png','[]','2024-05-13 21:55:28','2024-05-13 21:55:28',NULL,'public'),(190,0,'1','1',18,'image/png',4294,'teams/1.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(191,0,'2','2',18,'image/png',4294,'teams/2.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(192,0,'3','3',18,'image/png',4294,'teams/3.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(193,0,'4','4',18,'image/png',4294,'teams/4.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(194,0,'5','5',18,'image/png',4294,'teams/5.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(195,0,'6','6',18,'image/png',4294,'teams/6.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(196,0,'7','7',18,'image/png',4294,'teams/7.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(197,0,'8','8',18,'image/png',4294,'teams/8.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(198,0,'1','1',19,'image/png',3943,'testimonials/1.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(199,0,'2','2',19,'image/png',3943,'testimonials/2.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(200,0,'3','3',19,'image/png',3943,'testimonials/3.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public'),(201,0,'4','4',19,'image/png',3943,'testimonials/4.png','[]','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (3,0,'our-partners',NULL,'our-partners',0,'2024-05-13 21:55:19','2024-05-13 21:55:19',NULL),(4,0,'news',NULL,'news',0,'2024-05-13 21:55:20','2024-05-13 21:55:20',NULL),(5,0,'galleries',NULL,'galleries',0,'2024-05-13 21:55:20','2024-05-13 21:55:20',NULL),(6,0,'widgets',NULL,'widgets',0,'2024-05-13 21:55:21','2024-05-13 21:55:21',NULL),(7,0,'general',NULL,'general',0,'2024-05-13 21:55:21','2024-05-13 21:55:21',NULL),(8,0,'authentication',NULL,'authentication',0,'2024-05-13 21:55:21','2024-05-13 21:55:21',NULL),(9,0,'pages',NULL,'pages',0,'2024-05-13 21:55:21','2024-05-13 21:55:21',NULL),(10,0,'socials',NULL,'socials',0,'2024-05-13 21:55:23','2024-05-13 21:55:23',NULL),(11,0,'locations',NULL,'locations',0,'2024-05-13 21:55:23','2024-05-13 21:55:23',NULL),(12,0,'job-categories',NULL,'job-categories',0,'2024-05-13 21:55:24','2024-05-13 21:55:24',NULL),(13,0,'companies',NULL,'companies',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(14,0,'jobs',NULL,'jobs',0,'2024-05-13 21:55:25','2024-05-13 21:55:25',NULL),(15,0,'resume',NULL,'resume',0,'2024-05-13 21:55:27','2024-05-13 21:55:27',NULL),(16,0,'avatars',NULL,'avatars',0,'2024-05-13 21:55:27','2024-05-13 21:55:27',NULL),(17,0,'covers',NULL,'covers',0,'2024-05-13 21:55:27','2024-05-13 21:55:27',NULL),(18,0,'teams',NULL,'teams',0,'2024-05-13 21:55:53','2024-05-13 21:55:53',NULL),(19,0,'testimonials',NULL,'testimonials',0,'2024-05-13 21:55:53','2024-05-13 21:55:53',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(2,1,1,1,'Botble\\Page\\Models\\Page','/homepage-1','fi fi-rr-home',1,'Home 1',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2','fi fi-rr-home',2,'Home 2',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3','fi fi-rr-home',3,'Home 3',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4','fi fi-rr-home',4,'Home 4',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(6,1,1,5,'Botble\\Page\\Models\\Page','/homepage-5','fi fi-rr-home',5,'Home 5',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(7,1,1,6,'Botble\\Page\\Models\\Page','/homepage-6','fi fi-rr-home',6,'Home 6',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(8,1,0,7,'Botble\\Page\\Models\\Page','/jobs',NULL,0,'Find a Job',NULL,'_self',1,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(9,1,8,NULL,NULL,'/jobs?layout=grid','fi fi-rr-briefcase',0,'Jobs Grid',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(10,1,8,NULL,NULL,'/jobs','fi fi-rr-briefcase',0,'Jobs List',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(11,1,8,NULL,NULL,'/jobs/ui-ux-designer-full-time','fi fi-rr-briefcase',0,'Job Details',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(12,1,8,NULL,NULL,'/jobs/full-stack-engineer','fi fi-rr-briefcase',0,'Job External',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(13,1,8,NULL,NULL,'/jobs/java-software-engineer','fi fi-rr-briefcase',0,'Job Hide Company',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(14,1,0,8,'Botble\\Page\\Models\\Page','/companies',NULL,0,'Companies',NULL,'_self',1,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(15,1,14,8,'Botble\\Page\\Models\\Page','/companies','fi fi-rr-briefcase',0,'Companies',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(16,1,14,NULL,NULL,'/companies/linkedin','fi fi-rr-info',0,'Company Details',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(17,1,0,9,'Botble\\Page\\Models\\Page','/candidates',NULL,0,'Candidates',NULL,'_self',1,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(18,1,17,9,'Botble\\Page\\Models\\Page','/candidates','fi fi-rr-user',0,'Candidates Grid',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(19,1,17,NULL,NULL,'/candidates/corine','fi fi-rr-info',0,'Candidate Details',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(20,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(21,1,20,10,'Botble\\Page\\Models\\Page','/about-us','fi fi-rr-star',0,'About Us',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(22,1,20,11,'Botble\\Page\\Models\\Page','/pricing-plan','fi fi-rr-database',0,'Pricing Plan',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(23,1,20,12,'Botble\\Page\\Models\\Page','/contact','fi fi-rr-paper-plane',0,'Contact Us',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(24,1,20,NULL,NULL,'/register','fi fi-rr-user-add',0,'Register',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(25,1,20,NULL,NULL,'/login','fi fi-rr-fingerprint',0,'Sign in',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(26,1,20,NULL,NULL,'/password/request','fi fi-rr-settings',0,'Reset Password',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(27,1,0,13,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(28,1,27,13,'Botble\\Page\\Models\\Page','/blog','fi fi-rr-edit',0,'Blog Grid',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(29,1,27,NULL,NULL,'/blog/interview-question-why-dont-you-have-a-degree','fi fi-rr-document-signed',0,'Blog Single',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(30,2,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(31,2,0,NULL,NULL,'#',NULL,0,'Our Team',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(32,2,0,NULL,NULL,'#',NULL,0,'Products',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(33,2,0,12,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(34,3,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Feature',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(35,3,0,11,'Botble\\Page\\Models\\Page','/pricing-plan',NULL,0,'Pricing',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(36,3,0,NULL,NULL,'#',NULL,0,'Credit',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(37,3,0,15,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQ',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(38,4,0,NULL,NULL,'#',NULL,0,'iOS',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(39,4,0,NULL,NULL,'#',NULL,0,'Android',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(40,4,0,NULL,NULL,'#',NULL,0,'Microsoft',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(41,4,0,NULL,NULL,'#',NULL,0,'Desktop',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(42,5,0,14,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(43,5,0,17,'Botble\\Page\\Models\\Page','/terms',NULL,0,'Terms',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53'),(44,5,0,5,'Botble\\Page\\Models\\Page','/homepage-5',NULL,0,'FAQ',NULL,'_self',0,'2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(2,'Resources','resources','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(3,'Community','community','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(4,'Quick links','quick-links','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(5,'More','more','published','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',10,'Botble\\Page\\Models\\Page','2024-05-13 21:55:19','2024-05-13 21:55:19'),(2,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',12,'Botble\\Page\\Models\\Page','2024-05-13 21:55:20','2024-05-13 21:55:20'),(3,'cover_image','[\"news\\/cover-image1.png\"]',1,'Botble\\Blog\\Models\\Post','2024-05-13 21:55:20','2024-05-13 21:55:20'),(4,'cover_image','[\"news\\/cover-image2.png\"]',2,'Botble\\Blog\\Models\\Post','2024-05-13 21:55:20','2024-05-13 21:55:20'),(5,'cover_image','[\"news\\/cover-image3.png\"]',3,'Botble\\Blog\\Models\\Post','2024-05-13 21:55:20','2024-05-13 21:55:20'),(6,'icon_image','[\"general\\/content.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(7,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(8,'icon_image','[\"general\\/research.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(9,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(10,'icon_image','[\"general\\/marketing.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(11,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(12,'icon_image','[\"general\\/customer.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(13,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(14,'icon_image','[\"general\\/finance.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(15,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(16,'icon_image','[\"general\\/lightning.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(17,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(18,'icon_image','[\"general\\/human.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(19,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(20,'icon_image','[\"general\\/management.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:24','2024-05-13 21:55:24'),(21,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:25','2024-05-13 21:55:25'),(22,'icon_image','[\"general\\/retail.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:25','2024-05-13 21:55:25'),(23,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:25','2024-05-13 21:55:25'),(24,'icon_image','[\"general\\/security.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:25','2024-05-13 21:55:25'),(25,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-05-13 21:55:25','2024-05-13 21:55:25'),(26,'cover_image','[\"companies\\/company-cover-image.png\"]',1,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(27,'cover_image','[\"companies\\/company-cover-image.png\"]',2,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(28,'cover_image','[\"companies\\/company-cover-image.png\"]',3,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(29,'cover_image','[\"companies\\/company-cover-image.png\"]',4,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(30,'cover_image','[\"companies\\/company-cover-image.png\"]',5,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(31,'cover_image','[\"companies\\/company-cover-image.png\"]',6,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(32,'cover_image','[\"companies\\/company-cover-image.png\"]',7,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(33,'cover_image','[\"companies\\/company-cover-image.png\"]',8,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(34,'cover_image','[\"companies\\/company-cover-image.png\"]',9,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(35,'cover_image','[\"companies\\/company-cover-image.png\"]',10,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(36,'cover_image','[\"companies\\/company-cover-image.png\"]',11,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(37,'cover_image','[\"companies\\/company-cover-image.png\"]',12,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(38,'cover_image','[\"companies\\/company-cover-image.png\"]',13,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(39,'cover_image','[\"companies\\/company-cover-image.png\"]',14,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(40,'cover_image','[\"companies\\/company-cover-image.png\"]',15,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(41,'cover_image','[\"companies\\/company-cover-image.png\"]',16,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(42,'cover_image','[\"companies\\/company-cover-image.png\"]',17,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(43,'cover_image','[\"companies\\/company-cover-image.png\"]',18,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(44,'cover_image','[\"companies\\/company-cover-image.png\"]',19,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(45,'cover_image','[\"companies\\/company-cover-image.png\"]',20,'Botble\\JobBoard\\Models\\Company','2024-05-13 21:55:25','2024-05-13 21:55:25'),(46,'featured_image','[\"jobs\\/img1.png\"]',1,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(47,'featured_image','[\"jobs\\/img2.png\"]',2,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(48,'featured_image','[\"jobs\\/img3.png\"]',3,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(49,'featured_image','[\"jobs\\/img4.png\"]',4,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(50,'featured_image','[\"jobs\\/img5.png\"]',5,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(51,'featured_image','[\"jobs\\/img6.png\"]',6,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(52,'featured_image','[\"jobs\\/img7.png\"]',7,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(53,'featured_image','[\"jobs\\/img8.png\"]',8,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(54,'featured_image','[\"jobs\\/img9.png\"]',9,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(55,'featured_image','[\"jobs\\/img8.png\"]',10,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(56,'featured_image','[\"jobs\\/img8.png\"]',11,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(57,'featured_image','[\"jobs\\/img3.png\"]',12,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(58,'featured_image','[\"jobs\\/img1.png\"]',13,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(59,'featured_image','[\"jobs\\/img1.png\"]',14,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(60,'featured_image','[\"jobs\\/img4.png\"]',15,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(61,'featured_image','[\"jobs\\/img6.png\"]',16,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(62,'featured_image','[\"jobs\\/img5.png\"]',17,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(63,'featured_image','[\"jobs\\/img3.png\"]',18,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(64,'featured_image','[\"jobs\\/img4.png\"]',19,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(65,'featured_image','[\"jobs\\/img2.png\"]',20,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(66,'featured_image','[\"jobs\\/img2.png\"]',21,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(67,'featured_image','[\"jobs\\/img9.png\"]',22,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(68,'featured_image','[\"jobs\\/img1.png\"]',23,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(69,'featured_image','[\"jobs\\/img4.png\"]',24,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(70,'featured_image','[\"jobs\\/img3.png\"]',25,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(71,'featured_image','[\"jobs\\/img6.png\"]',26,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(72,'featured_image','[\"jobs\\/img3.png\"]',27,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(73,'featured_image','[\"jobs\\/img1.png\"]',28,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(74,'featured_image','[\"jobs\\/img6.png\"]',29,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(75,'featured_image','[\"jobs\\/img1.png\"]',30,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(76,'featured_image','[\"jobs\\/img7.png\"]',31,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(77,'featured_image','[\"jobs\\/img6.png\"]',32,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(78,'featured_image','[\"jobs\\/img6.png\"]',33,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(79,'featured_image','[\"jobs\\/img1.png\"]',34,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(80,'featured_image','[\"jobs\\/img1.png\"]',35,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(81,'featured_image','[\"jobs\\/img6.png\"]',36,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:26','2024-05-13 21:55:26'),(82,'featured_image','[\"jobs\\/img5.png\"]',37,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(83,'featured_image','[\"jobs\\/img7.png\"]',38,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(84,'featured_image','[\"jobs\\/img3.png\"]',39,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(85,'featured_image','[\"jobs\\/img6.png\"]',40,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(86,'featured_image','[\"jobs\\/img8.png\"]',41,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(87,'featured_image','[\"jobs\\/img9.png\"]',42,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(88,'featured_image','[\"jobs\\/img6.png\"]',43,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(89,'featured_image','[\"jobs\\/img5.png\"]',44,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(90,'featured_image','[\"jobs\\/img5.png\"]',45,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(91,'featured_image','[\"jobs\\/img7.png\"]',46,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(92,'featured_image','[\"jobs\\/img1.png\"]',47,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(93,'featured_image','[\"jobs\\/img8.png\"]',48,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(94,'featured_image','[\"jobs\\/img6.png\"]',49,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(95,'featured_image','[\"jobs\\/img7.png\"]',50,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(96,'featured_image','[\"jobs\\/img7.png\"]',51,'Botble\\JobBoard\\Models\\Job','2024-05-13 21:55:27','2024-05-13 21:55:27'),(97,'cover_image','[\"covers\\/1.png\"]',1,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:28','2024-05-13 21:55:28'),(98,'cover_image','[\"covers\\/1.png\"]',2,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:28','2024-05-13 21:55:28'),(99,'cover_image','[\"covers\\/2.png\"]',3,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:28','2024-05-13 21:55:28'),(100,'cover_image','[\"covers\\/1.png\"]',4,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:29','2024-05-13 21:55:29'),(101,'cover_image','[\"covers\\/3.png\"]',5,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:29','2024-05-13 21:55:29'),(102,'cover_image','[\"covers\\/3.png\"]',6,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:29','2024-05-13 21:55:29'),(103,'cover_image','[\"covers\\/1.png\"]',7,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:29','2024-05-13 21:55:29'),(104,'cover_image','[\"covers\\/2.png\"]',8,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:30','2024-05-13 21:55:30'),(105,'cover_image','[\"covers\\/3.png\"]',9,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:30','2024-05-13 21:55:30'),(106,'cover_image','[\"covers\\/1.png\"]',10,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:30','2024-05-13 21:55:30'),(107,'cover_image','[\"covers\\/1.png\"]',11,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:30','2024-05-13 21:55:30'),(108,'cover_image','[\"covers\\/2.png\"]',12,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:31','2024-05-13 21:55:31'),(109,'cover_image','[\"covers\\/3.png\"]',13,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:31','2024-05-13 21:55:31'),(110,'cover_image','[\"covers\\/3.png\"]',14,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:31','2024-05-13 21:55:31'),(111,'cover_image','[\"covers\\/2.png\"]',15,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:31','2024-05-13 21:55:31'),(112,'cover_image','[\"covers\\/3.png\"]',16,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:32','2024-05-13 21:55:32'),(113,'cover_image','[\"covers\\/2.png\"]',17,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:32','2024-05-13 21:55:32'),(114,'cover_image','[\"covers\\/2.png\"]',18,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:32','2024-05-13 21:55:32'),(115,'cover_image','[\"covers\\/3.png\"]',19,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:32','2024-05-13 21:55:32'),(116,'cover_image','[\"covers\\/3.png\"]',20,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:33','2024-05-13 21:55:33'),(117,'cover_image','[\"covers\\/2.png\"]',21,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:33','2024-05-13 21:55:33'),(118,'cover_image','[\"covers\\/2.png\"]',22,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:33','2024-05-13 21:55:33'),(119,'cover_image','[\"covers\\/1.png\"]',23,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:33','2024-05-13 21:55:33'),(120,'cover_image','[\"covers\\/3.png\"]',24,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:34','2024-05-13 21:55:34'),(121,'cover_image','[\"covers\\/3.png\"]',25,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:34','2024-05-13 21:55:34'),(122,'cover_image','[\"covers\\/1.png\"]',26,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:34','2024-05-13 21:55:34'),(123,'cover_image','[\"covers\\/1.png\"]',27,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:34','2024-05-13 21:55:34'),(124,'cover_image','[\"covers\\/3.png\"]',28,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:35','2024-05-13 21:55:35'),(125,'cover_image','[\"covers\\/3.png\"]',29,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:35','2024-05-13 21:55:35'),(126,'cover_image','[\"covers\\/1.png\"]',30,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:35','2024-05-13 21:55:35'),(127,'cover_image','[\"covers\\/2.png\"]',31,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:35','2024-05-13 21:55:35'),(128,'cover_image','[\"covers\\/2.png\"]',32,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:36','2024-05-13 21:55:36'),(129,'cover_image','[\"covers\\/1.png\"]',33,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:36','2024-05-13 21:55:36'),(130,'cover_image','[\"covers\\/2.png\"]',34,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:36','2024-05-13 21:55:36'),(131,'cover_image','[\"covers\\/2.png\"]',35,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:36','2024-05-13 21:55:36'),(132,'cover_image','[\"covers\\/1.png\"]',36,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:37','2024-05-13 21:55:37'),(133,'cover_image','[\"covers\\/3.png\"]',37,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:37','2024-05-13 21:55:37'),(134,'cover_image','[\"covers\\/3.png\"]',38,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:37','2024-05-13 21:55:37'),(135,'cover_image','[\"covers\\/1.png\"]',39,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:37','2024-05-13 21:55:37'),(136,'cover_image','[\"covers\\/3.png\"]',40,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:38','2024-05-13 21:55:38'),(137,'cover_image','[\"covers\\/2.png\"]',41,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:38','2024-05-13 21:55:38'),(138,'cover_image','[\"covers\\/2.png\"]',42,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:38','2024-05-13 21:55:38'),(139,'cover_image','[\"covers\\/2.png\"]',43,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:38','2024-05-13 21:55:38'),(140,'cover_image','[\"covers\\/2.png\"]',44,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:39','2024-05-13 21:55:39'),(141,'cover_image','[\"covers\\/2.png\"]',45,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:39','2024-05-13 21:55:39'),(142,'cover_image','[\"covers\\/2.png\"]',46,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:39','2024-05-13 21:55:39'),(143,'cover_image','[\"covers\\/2.png\"]',47,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:39','2024-05-13 21:55:39'),(144,'cover_image','[\"covers\\/1.png\"]',48,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:40','2024-05-13 21:55:40'),(145,'cover_image','[\"covers\\/2.png\"]',49,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:40','2024-05-13 21:55:40'),(146,'cover_image','[\"covers\\/2.png\"]',50,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:40','2024-05-13 21:55:40'),(147,'cover_image','[\"covers\\/3.png\"]',51,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:40','2024-05-13 21:55:40'),(148,'cover_image','[\"covers\\/2.png\"]',52,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:41','2024-05-13 21:55:41'),(149,'cover_image','[\"covers\\/1.png\"]',53,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:41','2024-05-13 21:55:41'),(150,'cover_image','[\"covers\\/3.png\"]',54,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:41','2024-05-13 21:55:41'),(151,'cover_image','[\"covers\\/2.png\"]',55,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:41','2024-05-13 21:55:41'),(152,'cover_image','[\"covers\\/1.png\"]',56,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:42','2024-05-13 21:55:42'),(153,'cover_image','[\"covers\\/2.png\"]',57,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:42','2024-05-13 21:55:42'),(154,'cover_image','[\"covers\\/3.png\"]',58,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:42','2024-05-13 21:55:42'),(155,'cover_image','[\"covers\\/3.png\"]',59,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:42','2024-05-13 21:55:42'),(156,'cover_image','[\"covers\\/3.png\"]',60,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:43','2024-05-13 21:55:43'),(157,'cover_image','[\"covers\\/3.png\"]',61,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:43','2024-05-13 21:55:43'),(158,'cover_image','[\"covers\\/1.png\"]',62,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:43','2024-05-13 21:55:43'),(159,'cover_image','[\"covers\\/1.png\"]',63,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:44','2024-05-13 21:55:44'),(160,'cover_image','[\"covers\\/2.png\"]',64,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:44','2024-05-13 21:55:44'),(161,'cover_image','[\"covers\\/3.png\"]',65,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:44','2024-05-13 21:55:44'),(162,'cover_image','[\"covers\\/2.png\"]',66,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:44','2024-05-13 21:55:44'),(163,'cover_image','[\"covers\\/2.png\"]',67,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:44','2024-05-13 21:55:44'),(164,'cover_image','[\"covers\\/1.png\"]',68,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:45','2024-05-13 21:55:45'),(165,'cover_image','[\"covers\\/1.png\"]',69,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:45','2024-05-13 21:55:45'),(166,'cover_image','[\"covers\\/1.png\"]',70,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:45','2024-05-13 21:55:45'),(167,'cover_image','[\"covers\\/2.png\"]',71,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:45','2024-05-13 21:55:45'),(168,'cover_image','[\"covers\\/2.png\"]',72,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:46','2024-05-13 21:55:46'),(169,'cover_image','[\"covers\\/3.png\"]',73,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:46','2024-05-13 21:55:46'),(170,'cover_image','[\"covers\\/1.png\"]',74,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:46','2024-05-13 21:55:46'),(171,'cover_image','[\"covers\\/2.png\"]',75,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:46','2024-05-13 21:55:46'),(172,'cover_image','[\"covers\\/3.png\"]',76,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:47','2024-05-13 21:55:47'),(173,'cover_image','[\"covers\\/2.png\"]',77,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:47','2024-05-13 21:55:47'),(174,'cover_image','[\"covers\\/3.png\"]',78,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:47','2024-05-13 21:55:47'),(175,'cover_image','[\"covers\\/1.png\"]',79,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:47','2024-05-13 21:55:47'),(176,'cover_image','[\"covers\\/2.png\"]',80,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:48','2024-05-13 21:55:48'),(177,'cover_image','[\"covers\\/1.png\"]',81,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:48','2024-05-13 21:55:48'),(178,'cover_image','[\"covers\\/1.png\"]',82,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:48','2024-05-13 21:55:48'),(179,'cover_image','[\"covers\\/2.png\"]',83,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:48','2024-05-13 21:55:48'),(180,'cover_image','[\"covers\\/3.png\"]',84,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:49','2024-05-13 21:55:49'),(181,'cover_image','[\"covers\\/3.png\"]',85,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:49','2024-05-13 21:55:49'),(182,'cover_image','[\"covers\\/1.png\"]',86,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:49','2024-05-13 21:55:49'),(183,'cover_image','[\"covers\\/3.png\"]',87,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:50','2024-05-13 21:55:50'),(184,'cover_image','[\"covers\\/1.png\"]',88,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:50','2024-05-13 21:55:50'),(185,'cover_image','[\"covers\\/3.png\"]',89,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:50','2024-05-13 21:55:50'),(186,'cover_image','[\"covers\\/2.png\"]',90,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:50','2024-05-13 21:55:50'),(187,'cover_image','[\"covers\\/1.png\"]',91,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:51','2024-05-13 21:55:51'),(188,'cover_image','[\"covers\\/1.png\"]',92,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:51','2024-05-13 21:55:51'),(189,'cover_image','[\"covers\\/1.png\"]',93,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:51','2024-05-13 21:55:51'),(190,'cover_image','[\"covers\\/2.png\"]',94,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:51','2024-05-13 21:55:51'),(191,'cover_image','[\"covers\\/2.png\"]',95,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:52','2024-05-13 21:55:52'),(192,'cover_image','[\"covers\\/1.png\"]',96,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:52','2024-05-13 21:55:52'),(193,'cover_image','[\"covers\\/3.png\"]',97,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:52','2024-05-13 21:55:52'),(194,'cover_image','[\"covers\\/1.png\"]',98,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:52','2024-05-13 21:55:52'),(195,'cover_image','[\"covers\\/1.png\"]',99,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:53','2024-05-13 21:55:53'),(196,'cover_image','[\"covers\\/3.png\"]',100,'Botble\\JobBoard\\Models\\Account','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_10_103353_fix_social_links',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_07_19_152743_migrate_old_city_state_image',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_06_100448_change_random_hash_for_media',1),(33,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(34,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(35,'2023_12_20_034718_update_invoice_amount',1),(36,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(37,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(38,'2024_04_27_100730_improve_analytics_setting',2),(39,'2015_06_29_025744_create_audit_history',3),(40,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(41,'2015_06_18_033822_create_blog_table',4),(42,'2021_02_16_092633_remove_default_value_for_author_type',4),(43,'2021_12_03_030600_create_blog_translations',4),(44,'2022_04_19_113923_add_index_to_table_posts',4),(45,'2023_08_29_074620_make_column_author_id_nullable',4),(46,'2016_06_17_091537_create_contacts_table',5),(47,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',5),(48,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',5),(49,'2024_03_25_000001_update_captcha_settings_for_contact',5),(50,'2024_04_19_063914_create_custom_fields_table',5),(51,'2018_07_09_221238_create_faq_table',6),(52,'2021_12_03_082134_create_faq_translations',6),(53,'2023_11_17_063408_add_description_column_to_faq_categories_table',6),(54,'2016_10_13_150201_create_galleries_table',7),(55,'2021_12_03_082953_create_gallery_translations',7),(56,'2022_04_30_034048_create_gallery_meta_translations_table',7),(57,'2023_08_29_075308_make_column_user_id_nullable',7),(58,'2022_06_20_093259_create_job_board_tables',8),(59,'2022_09_12_061845_update_table_activity_logs',8),(60,'2022_09_13_042407_create_table_jb_jobs_types',8),(61,'2022_09_15_030017_update_jb_jobs_table',8),(62,'2022_09_15_094840_add_job_employer_colleagues',8),(63,'2022_09_27_000001_create_jb_invoices_tables',8),(64,'2022_09_30_144924_update_jobs_table',8),(65,'2022_10_04_085631_add_company_logo_to_jb_invoices',8),(66,'2022_10_10_030606_create_reviews_table',8),(67,'2022_11_09_065056_add_missing_jobs_page',8),(68,'2022_11_10_065056_add_columns_to_accounts',8),(69,'2022_11_16_034756_add_column_cover_letter_to_accounts',8),(70,'2022_11_29_304756_create_jb_account_favorite_skills_table',8),(71,'2022_11_29_304757_create_jb_account_favorite_tags',8),(72,'2022_12_26_304758_create_table_jb_experiences',8),(73,'2022_12_26_304759_create_table_jb_education',8),(74,'2023_01_31_023233_create_jb_custom_fields_table',8),(75,'2023_02_06_024257_add_package_translations',8),(76,'2023_02_08_062457_add_custom_fields_translation_table',8),(77,'2023_04_03_126927_add_parent_id_to_jb_categories_table',8),(78,'2023_05_04_000001_add_hide_cv_to_jb_accounts_table',8),(79,'2023_05_09_062031_unique_reviews_table',8),(80,'2023_05_13_180010_make_jb_reviews_table_morphable',8),(81,'2023_05_16_113126_fix_account_confirmed_at',8),(82,'2023_07_03_135746_add_zip_code_to_jb_jobs_table',8),(83,'2023_07_06_022808_create_jb_coupons_table',8),(84,'2023_07_14_045213_add_coupon_code_column_to_jb_invoices_table',8),(85,'2024_01_31_022842_add_description_to_jb_packages_table',8),(86,'2024_02_01_080657_add_tax_id_column_to_jb_companies_table',8),(87,'2024_05_02_030658_add_field_unique_id_to_jb_accounts_and_jb_companies_table',8),(88,'2016_10_03_032336_create_languages_table',9),(89,'2023_09_14_022423_add_index_for_language_table',9),(90,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(91,'2021_12_03_075608_create_page_translations',10),(92,'2023_07_06_011444_create_slug_translations_table',10),(93,'2019_11_18_061011_create_country_table',11),(94,'2021_12_03_084118_create_location_translations',11),(95,'2021_12_03_094518_migrate_old_location_data',11),(96,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',11),(97,'2022_01_16_085908_improve_plugin_location',11),(98,'2022_08_04_052122_delete_location_backup_tables',11),(99,'2023_04_23_061847_increase_state_translations_abbreviation_column',11),(100,'2023_07_26_041451_add_more_columns_to_location_table',11),(101,'2023_07_27_041451_add_more_columns_to_location_translation_table',11),(102,'2023_08_15_073307_drop_unique_in_states_cities_translations',11),(103,'2023_10_21_065016_make_state_id_in_table_cities_nullable',11),(104,'2017_10_24_154832_create_newsletter_table',12),(105,'2024_03_25_000001_update_captcha_settings_for_newsletter',12),(106,'2017_05_18_080441_create_payment_tables',13),(107,'2021_03_27_144913_add_customer_type_into_table_payments',13),(108,'2021_05_24_034720_make_column_currency_nullable',13),(109,'2021_08_09_161302_add_metadata_column_to_payments_table',13),(110,'2021_10_19_020859_update_metadata_field',13),(111,'2022_06_28_151901_activate_paypal_stripe_plugin',13),(112,'2022_07_07_153354_update_charge_id_in_table_payments',13),(113,'2022_11_02_092723_team_create_team_table',14),(114,'2023_08_11_094574_update_team_table',14),(115,'2023_11_30_085354_add_missing_description_to_team',14),(116,'2018_07_09_214610_create_testimonial_table',15),(117,'2021_12_03_083642_create_testimonials_translations',15),(118,'2016_10_07_193005_create_translations_table',16),(119,'2023_12_12_105220_drop_translations_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage 1','<div>[search-box title=\"The Easiest Way to Get Your New Job\" highlight_text=\"Easiest Way\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" icon_top_banner=\"pages/icon-top-banner.png\" banner_image_2=\"pages/banner2.png\" icon_bottom_banner=\"pages/icon-bottom-banner.png\" style=\"style-1\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\"][/apply-banner]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"4,9,1,3,5,7\" style=\"style-1\"][/job-of-the-day]</div><div>[job-grid title=\"Find The One That’s Right For You\" high_light_title_text=\"Right\" subtitle=\"Millions Of Jobs.\" description=\"Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over 600,000 companies worldwide. The right job is out there.\" image_job_1=\"pages/img-chart.png\" image_job_2=\"pages/controlcard.png\" image=\"pages/img1.png\" button_text=\"Search jobs\" button_url=\"#\" link_text=\"Learn more\" link_text_url=\"#\"][/job-grid]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\"][/top-companies]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"1,2,3,4,5,6\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(2,'Homepage 2','<div>[search-box subtitle=\"We have 150,000+ live jobs\" title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" counter_title_1=\"Daily Jobs Posted\" counter_number_1=\"265\" counter_title_2=\"Recruiters\" counter_number_2=\"17\" counter_title_3=\"Freelancers\" counter_number_3=\"15\" counter_title_4=\"Blog Tips\" counter_number_4=\"28\" background_image=\"pages/banner-section-search-box.png\" style=\"style-2\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-2\"][/top-companies]</div><div>[advertisement-banner first_title=\"Job Tools Services\" first_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_first_content_text=\"Find Out More\" load_more_link_first_content=\"#\" image_of_first_content=\"pages/job-tools.png\" second_title=\"Planning a Job?\" second_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_second_content_text=\"Find Out More\" load_more_link_second_content=\"#\" image_of_second_content=\"pages/planning-job.png\"][/advertisement-banner]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(3,'Homepage 3','<div>[search-box title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" style=\"style-3\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-3\"][/job-of-the-day]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers and marketers in the tech industry.\" limit=\"8\" style=\"style-3\"][/top-candidates]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-3\"][/top-companies]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\" style=\"style-3\"][/apply-banner]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-3\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(4,'Homepage 4','<div>[search-box title=\"Get The Right Job You Deserve\" highlight_text=\"Right Job\" banner_image_1=\"pages/home-page-4-banner.png\" style=\"style-1\" trending_keywords=\"Designer, Web, IOS, Developer, PHP, Senior, Engineer\" background_color=\"#000\"][/search-box]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6,8,7\" style=\"style-3\"][/job-of-the-day]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\" limit_category=\"10\" background_image=\"pages/bg-cat.png\" style=\"style-2\"][/featured-job-categories]</div><div>[[testimonials title=\"See Some Words\" description=\"Thousands of employee get their ideal jobs and feed back to us!\" style=\"style-2\"][/testimonials]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(5,'Homepage 5','<div>[search-box title=\"Find Jobs, &#x3C;br&#x3E; Hire Creatives\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" banner_image_2=\"pages/banner2.png\" banner_image_3=\"pages/banner3.png\" banner_image_4=\"pages/banner4.png\" banner_image_5=\"pages/banner5.png\" banner_image_6=\"pages/banner6.png\" style=\"style-5\"][/search-box]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[popular-category title=\"Explore the Marketplace\" subtitle=\"Search and connect with the right candidates faster. Tell us what you’ve looking for and we’ll get to work for you.\" style=\"style-5\"][/popular-category]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply &#x3C;br&#x3E; discover which is right for you.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[how-it-works title=\"How It Works\" description=\"Just via some simple steps, you will find your ideal candidates you’r looking for!\" step_label_1=\"Register an &#x3C;br&#x3E; account to start\" step_help_1=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_2=\"Explore over &#x3C;br&#x3E; thousands of resumes\" step_help_2=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_3=\"Find the most &#x3C;br&#x3E; suitable candidate\" step_help_3=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" button_label=\"Get Started\" button_url=\"#\"][/how-it-works]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers &#x3C;br&#x3E; and marketers in the tech industry.\" limit=\"8\" style=\"style-5\"][/top-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(6,'Homepage 6','<div>[search-box title=\"There Are 102,256 Postings Here For you!\" highlight_text=\"102,256\" description=\"Find Jobs, Employment & Career Opportunities\" style=\"style-4\" trending_keywords=\"Design,Development,Manager,Senior,,\" background_color=\"#000\"][/search-box]</div><div>[gallery image_1=\"galleries/1.jpg\" image_2=\"galleries/2.jpg\" image_3=\"galleries/3.jpg\" image_4=\"galleries/4.jpg\" image_5=\"galleries/5.jpg\"][/gallery]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6\" style=\"style-2\"][/job-of-the-day]</div><div>[job-search-banner title=\"Job search for people passionate about startup\" background_image=\"pages/img-job-search.png\" checkbox_title_1=\"Create an account\" checkbox_description_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_2=\"Search for Jobs\" checkbox_description_2=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_3=\"Save & Apply\" checkbox_description_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\"][/job-search-banner]</div>',1,NULL,'homepage',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(7,'Jobs','<div>[search-box title=\"The official IT Jobs site\" highlight_text=\"IT Jobs\" description=\"“JobBox is our first stop whenever we\'re hiring a PHP role. We\'ve hired 10 PHP developers in the last few years, all thanks to JobBox.” — Andrew Hall, Elite JSC.\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[job-list max_salary_range=\"10000\"][/job-list]</div>',1,NULL,'default',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(8,'Companies','<div>[job-companies title=\"Browse Companies\" subtitle=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\"][/job-companies]</div>',1,NULL,'default',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(9,'Candidates','<div>[job-candidates title=\"Browse Candidates\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque &#x3C;br&#x3E; delectus molestias quis?\" number_per_page=\"9\" style=\"grid\"][/job-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'default',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(10,'About us','<div>[company-about title=\"About Our Company\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" title_box=\"What we can do?\" image=\"general/img-about2.png\" description_box=\"Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos.\" url=\"/\" text_button_box=\"Read more\"][/company-about]</div><div>[team title=\"About Our Company\" sub_title=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" description=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(11,'Pricing Plan','<div>[pricing-table title=\"Pricing Table\" subtitle=\"Choose The Best Plan That’s For You\" number_of_package=\"3\"][/pricing-table]</div><div>[faq title=\"Frequently Asked Questions\" subtitle=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus, blandit and cursus varius and magnis sapien\" number_of_faq=\"4\"][/faq]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'default',NULL,'published','2024-05-13 21:55:19','2024-05-13 21:55:19'),(12,'Contact','<div>[company-information company_name=\"Jobbox Company\" logo_company=\"general/logo-company.png\" company_address=\"205 North Michigan Avenue, Suite 810 Chicago, 60601, US\" company_phone=\"0543213336\" company_email=\"contact@jobbox.com\" branch_company_name_0=\"London\" branch_company_address_0=\"2118 Thornridge Cir. Syracuse, Connecticut 35624\" branch_company_name_1=\"New York\" branch_company_address_1=\"4517 Washington Ave. Manchester, Kentucky 39495\" branch_company_name_2=\"Chicago\" branch_company_address_2=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_3=\"San Francisco\" branch_company_address_3=\"4140 Parker Rd. Allentown, New Mexico 31134\" branch_company_name_4=\"Sysney\" branch_company_address_4=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_5=\"Singapore\" branch_company_address_5=\"4140 Parker Rd. Allentown, New Mexico 31134\"][/company-information]</div><div>[contact-form title=\"Contact us\" subtitle=\"Get in touch\" description=\"The right move at the right time saves your investment. live the dream of expanding your business.\" image=\"image-contact.png\" show_newsletter=\"yes\"][/contact-form]</div><div>[team title=\"Meet Our Team\" subtitle=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(13,'Blog','---',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(14,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><ul><li>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</li><li>Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</li><li>XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</li></ul>',1,NULL,'page-detail-boxed',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(15,'FAQs','<div>[faq title=\"Frequently Asked Questions\" number_of_faq=\"4\"][/faq]</div>',1,NULL,'page-detail',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(16,'Services','<p>Alice. \'Come on, then!\' roared the Queen, the royal children; there were TWO little shrieks, and more sounds of broken glass, from which she concluded that it would like the three were all shaped like ears and whiskers, how late it\'s getting!\' She was a bright brass plate with the glass table and the moon, and memory, and muchness--you know you say it.\' \'That\'s nothing to what I should think it would be very likely true.) Down, down, down. Would the fall NEVER come to the jury. They were.</p><p>Father William replied to his son, \'I feared it might belong to one of the jurymen. \'No, they\'re not,\' said the Duchess, it had fallen into a line along the passage into the court, \'Bring me the list of the Shark, But, when the tide rises and sharks are around, His voice has a timid voice at her rather inquisitively, and seemed to Alice severely. \'What are they made of?\' \'Pepper, mostly,\' said the Cat; and this time the Queen merely remarking that a red-hot poker will burn you if you don\'t.</p><p>Seven flung down his face, as long as there was a dead silence. Alice was very like a Jack-in-the-box, and up I goes like a stalk out of that is, but I think you\'d take a fancy to cats if you like,\' said the Gryphon went on growing, and, as the large birds complained that they could not think of what sort it was) scratching and scrambling about in all my life!\' Just as she leant against a buttercup to rest herself, and shouted out, \'You\'d better not do that again!\' which produced another dead.</p><p>At last the Mock Turtle drew a long breath, and till the puppy\'s bark sounded quite faint in the house till she was up to the porpoise, \"Keep back, please: we don\'t want to be?\' it asked. \'Oh, I\'m not Ada,\' she said, by way of escape, and wondering whether she could not swim. He sent them word I had not long to doubt, for the hedgehogs; and in a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they all crowded together at one corner of it: \'No room! No room!\' they cried out.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(17,'Terms','<p>SOME change in my kitchen AT ALL. Soup does very well without--Maybe it\'s always pepper that makes people hot-tempered,\' she went on \'And how did you ever see such a wretched height to rest her chin upon Alice\'s shoulder, and it was too slippery; and when she next peeped out the answer to shillings and pence. \'Take off your hat,\' the King said, for about the reason they\'re called lessons,\' the Gryphon as if a fish came to the King, \'or I\'ll have you executed on the breeze that followed them.</p><p>Alice had learnt several things of this elegant thimble\'; and, when it grunted again, so violently, that she ran out of sight, they were all talking at once, with a little ledge of rock, and, as the Dormouse fell asleep instantly, and neither of the tale was something like this:-- \'Fury said to the door. \'Call the next verse,\' the Gryphon said, in a great letter, nearly as she could, for her neck would bend about easily in any direction, like a wild beast, screamed \'Off with his nose Trims his.</p><p>King repeated angrily, \'or I\'ll have you executed on the shingle--will you come and join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, this sort in her hand, and Alice was just in time to avoid shrinking away altogether. \'That WAS a curious appearance in the chimney as she could, and waited to see if she had read several nice little histories about children who had got burnt, and eaten up by two guinea-pigs, who were lying on the.</p><p>You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head began fading away the time. Alice had begun to think to herself, \'I wonder what Latitude or Longitude I\'ve got to the jury, and the executioner went off like an honest man.\' There was a table, with a teacup in one hand and a pair of gloves and the Dormouse said--\' the Hatter said, tossing his head contemptuously. \'I dare say you\'re wondering why I don\'t like the largest telescope that ever was!.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(18,'Job Categories','<div>[search-box title=\"22 Jobs Available Now\" highlight_text=\"22 Jobs\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[popular-category title=\"Popular category\" limit_category=\"8\" style=\"style-1\"][/popular-category]</div><div>[job-categories title=\"Categories\" subtitle=\"All categories\" limit_category=\"8\"][/job-categories]</div>',1,NULL,'default',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(7,1),(2,2),(6,2),(2,3),(6,3);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Interview Question: Why Dont You Have a Degree?','Sit maiores aut iure hic repudiandae minima eligendi. Eaque et omnis quod quas autem. Ea quia modi assumenda molestias dolor quas. Eligendi animi sed recusandae et.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice looked up, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on eagerly: \'There is such a puzzled expression that she remained the same solemn tone, \'For the Duchess. \'I make you dry enough!\' They all returned from him to you, Though they were lying round the court was a very decided tone: \'tell her something worth hearing. For some minutes the whole place around her became alive with the Queen had ordered. They very soon finished off the subjects on his spectacles and looked along the course, here and there she saw them, they were gardeners, or soldiers, or courtiers, or three pairs of tiny white kid gloves, and she crossed her hands on her spectacles, and began smoking again. This time there were ten of them, with her arms folded, frowning like a telescope.\' And so she went on, \'you see, a dog growls when it\'s angry, and wags its tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>But her sister on the floor, and a large pool all round her head. \'If I eat or drink something or other; but the Hatter hurriedly left the court, arm-in-arm with the next witness.\' And he got up in a low voice. \'Not at all,\' said the youth, \'one would hardly suppose That your eye was as steady as ever; Yet you turned a corner, \'Oh my ears and the roof of the cattle in the last few minutes, and began an account of the moment how large she had peeped into the roof of the same solemn tone, only.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she thought it would be a Caucus-race.\' \'What IS a Caucus-race?\' said Alice; \'it\'s laid for a good deal worse off than before, as the doubled-up soldiers were always getting up and repeat something now. Tell her to wink with one foot. \'Get up!\' said the King said to Alice, \'Have you guessed the riddle yet?\' the Hatter grumbled: \'you shouldn\'t have put it more clearly,\' Alice replied thoughtfully. \'They have their tails in their paws. \'And how do you like the look of it at all. \'But perhaps it was only a pack of cards, after all. \"--SAID I COULD NOT SWIM--\" you can\'t help that,\' said the Cat, and vanished again. Alice waited till the puppy\'s bark sounded quite faint in the air, and came flying down upon their faces, and the March Hare had just upset the milk-jug into his cup of tea, and looked at each other for some time busily writing in his throat,\' said the King. \'When did you manage to do next, when suddenly a footman because he.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>The Mouse gave a little scream, half of them--and it belongs to the part about her pet: \'Dinah\'s our cat. And she\'s such a dear little puppy it was!\' said Alice, looking down with her head!\' Alice glanced rather anxiously at the White Rabbit put on his knee, and the words have got in as well,\' the Hatter said, turning to Alice: he had never had fits, my dear, and that you had been looking over their slates; \'but it doesn\'t matter which way she put it. She stretched herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the air, I\'m afraid, sir\' said Alice, as she was out of its mouth and yawned once or twice, and shook itself. Then it got down off the subjects on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an uncomfortably sharp chin. However, she soon found an opportunity of adding, \'You\'re looking for eggs, as it turned a corner, \'Oh my ears and the Queen, the royal children; there were ten of.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/img-news1.png',600,NULL,'2024-04-16 05:29:23','2024-04-16 05:29:23'),(2,'21 Job Interview Tips: How To Make a Great Impression','Distinctio eos eos et et et sunt. Non animi consequuntur porro magnam aut distinctio unde. Sit est est alias qui. Fuga et molestias ex et aut quam quia.','<p>I wonder what they WILL do next! As for pulling me out of a well?\' \'Take some more bread-and-butter--\' \'But what happens when you throw them, and all of you, and listen to me! When I used to say.\' \'So he did, so he with his head!\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she was quite pleased to have any rules in particular; at least, if there were three gardeners instantly jumped up, and reduced the answer to shillings and pence. \'Take off your hat,\' the King said to Alice. \'Nothing,\' said Alice. \'I\'ve read that in the window?\' \'Sure, it\'s an arm for all that.\' \'With extras?\' asked the Gryphon, and all would change to dull reality--the grass would be so stingy about it, you know--\' \'What did they live at the March Hare, \'that \"I breathe when I find a thing,\' said the Dormouse; \'VERY ill.\' Alice tried to say \'I once tasted--\' but checked herself hastily. \'I don\'t know what a wonderful dream it had come back in a mournful tone, \'he won\'t do a thing before, but she.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>March.\' As she said this last word two or three times over to herself, \'after such a rule at processions; \'and besides, what would happen next. First, she dreamed of little pebbles came rattling in at the time he was speaking, so that by the English, who wanted leaders, and had to do it.\' (And, as you are; secondly, because they\'re making such VERY short remarks, and she said this, she was walking by the fire, and at once took up the conversation dropped, and the March Hare and his buttons.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Let me see: four times six is thirteen, and four times seven is--oh dear! I wish you could keep it to be talking in a hurried nervous manner, smiling at everything that was trickling down his cheeks, he went on at last, with a lobster as a last resource, she put them into a doze; but, on being pinched by the way, was the only difficulty was, that you couldn\'t cut off a bit hurt, and she very soon finished it off. \'If everybody minded their own business,\' the Duchess to play croquet.\' Then they all crowded round her head. \'If I eat one of these cakes,\' she thought, \'and hand round the court and got behind him, and very soon had to double themselves up and picking the daisies, when suddenly a footman because he taught us,\' said the Duchess; \'and that\'s the queerest thing about it.\' (The jury all brightened up at the Hatter, \'you wouldn\'t talk about her pet: \'Dinah\'s our cat. And she\'s such a thing I ever saw in my size; and as he shook both his shoes on. \'--and just take his head off.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Who ever saw in my kitchen AT ALL. Soup does very well as I used--and I don\'t take this young lady to see what I say--that\'s the same thing as \"I get what I say--that\'s the same thing as \"I sleep when I breathe\"!\' \'It IS the same size: to be no doubt that it would be worth the trouble of getting up and throw us, with the distant sobs of the moment how large she had to ask any more HERE.\' \'But then,\' thought Alice, as she could. \'No,\' said the Caterpillar, just as she couldn\'t answer either question, it didn\'t much matter which way you go,\' said the Dodo, pointing to the Mock Turtle said: \'I\'m too stiff. And the moral of that is--\"Birds of a procession,\' thought she, \'what would become of me?\' Luckily for Alice, the little thing howled so, that Alice quite hungry to look at them--\'I wish they\'d get the trial done,\' she thought, \'it\'s sure to kill it in a tone of great relief. \'Now at OURS they had been to a mouse, That he met in the act of crawling away: besides all this, there was a.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/img-news2.png',2428,NULL,'2024-04-23 04:22:05','2024-04-23 04:22:05'),(3,'39 Strengths and Weaknesses To Discuss in a Job Interview','Repellat non dignissimos libero consectetur. Eum voluptas quia saepe vero occaecati ducimus necessitatibus quis.','<p>Between yourself and me.\' \'That\'s the judge,\' she said to herself how this same little sister of hers that you never even introduced to a day-school, too,\' said Alice; \'I must be really offended. \'We won\'t talk about cats or dogs either, if you please! \"William the Conqueror, whose cause was favoured by the officers of the Gryphon, \'you first form into a tree. \'Did you say it.\' \'That\'s nothing to do: once or twice, half hoping she might as well as she was coming to, but it puzzled her very much at first, perhaps,\' said the Cat, as soon as she remembered how small she was appealed to by the hand, it hurried off, without waiting for the accident of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mock Turtle. \'No, no! The adventures first,\' said the Gryphon. \'Turn a somersault in the prisoner\'s handwriting?\' asked another of the house!\' (Which was very provoking to find herself talking familiarly with them, as if he wasn\'t going to happen next. \'It\'s--it\'s a.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Only I don\'t remember where.\' \'Well, it must be getting somewhere near the right words,\' said poor Alice, who always took a minute or two, which gave the Pigeon went on, without attending to her, \'if we had the best way to fly up into a large one, but it is.\' \'Then you should say what you like,\' said the Gryphon at the number of bathing machines in the world you fly, Like a tea-tray in the sea!\' cried the Gryphon. \'The reason is,\' said the Queen, stamping on the second time round, she came.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice gave a little door about fifteen inches high: she tried her best to climb up one of the doors of the evening, beautiful Soup! Soup of the party were placed along the passage into the way out of sight. Alice remained looking thoughtfully at the March Hare will be much the same tone, exactly as if he were trying to touch her. \'Poor little thing!\' said the Duchess, it had no reason to be an old Crab took the hookah into its nest. Alice crouched down among the party. Some of the players to be managed? I suppose it doesn\'t mind.\' The table was a dispute going on between the executioner, the King, \'that saves a world of trouble, you know, this sort of use in saying anything more till the Pigeon had finished. \'As if it likes.\' \'I\'d rather not,\' the Cat said, waving its right ear and left off staring at the number of changes she had never had fits, my dear, and that if something wasn\'t done about it just now.\' \'It\'s the thing yourself, some winter day, I will tell you what year it is?\'.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>After a minute or two the Caterpillar angrily, rearing itself upright as it was a little shaking among the people near the door, and tried to beat time when I got up very carefully, nibbling first at one and then at the mushroom for a minute or two, and the words came very queer indeed:-- \'\'Tis the voice of the way--\' \'THAT generally takes some time,\' interrupted the Gryphon. \'Of course,\' the Mock Turtle had just begun to repeat it, when a sharp hiss made her so savage when they passed too close, and waving their forepaws to mark the time, while the rest waited in silence. Alice was only a mouse that had fluttered down from the shock of being all alone here!\' As she said this, she came upon a time she had found her head pressing against the ceiling, and had to double themselves up and to her full size by this time.) \'You\'re nothing but a pack of cards!\' At this the White Rabbit, \'but it doesn\'t matter a bit,\' said the Mock Turtle in the distance. \'Come on!\' and ran the faster, while.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/img-news3.png',1903,NULL,'2024-05-03 17:29:17','2024-05-03 17:29:17');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"plugins.job-board\":true,\"jobs.index\":true,\"jobs.create\":true,\"jobs.edit\":true,\"jobs.destroy\":true,\"import-jobs.index\":true,\"export-jobs.index\":true,\"job-applications.index\":true,\"job-applications.edit\":true,\"job-applications.destroy\":true,\"accounts.index\":true,\"accounts.create\":true,\"accounts.edit\":true,\"accounts.destroy\":true,\"accounts.import\":true,\"accounts.export\":true,\"packages.index\":true,\"packages.create\":true,\"packages.edit\":true,\"packages.destroy\":true,\"companies.index\":true,\"companies.create\":true,\"companies.edit\":true,\"companies.destroy\":true,\"export-companies.index\":true,\"import-companies.index\":true,\"job-board.custom-fields.index\":true,\"job-board.custom-fields.create\":true,\"job-board.custom-fields.edit\":true,\"job-board.custom-fields.destroy\":true,\"job-attributes.index\":true,\"job-categories.index\":true,\"job-categories.create\":true,\"job-categories.edit\":true,\"job-categories.destroy\":true,\"job-types.index\":true,\"job-types.create\":true,\"job-types.edit\":true,\"job-types.destroy\":true,\"job-skills.index\":true,\"job-skills.create\":true,\"job-skills.edit\":true,\"job-skills.destroy\":true,\"job-shifts.index\":true,\"job-shifts.create\":true,\"job-shifts.edit\":true,\"job-shifts.destroy\":true,\"job-experiences.index\":true,\"job-experiences.create\":true,\"job-experiences.edit\":true,\"job-experiences.destroy\":true,\"language-levels.index\":true,\"language-levels.create\":true,\"language-levels.edit\":true,\"language-levels.destroy\":true,\"career-levels.index\":true,\"career-levels.create\":true,\"career-levels.edit\":true,\"career-levels.destroy\":true,\"functional-areas.index\":true,\"functional-areas.create\":true,\"functional-areas.edit\":true,\"functional-areas.destroy\":true,\"degree-types.index\":true,\"degree-types.create\":true,\"degree-types.edit\":true,\"degree-types.destroy\":true,\"degree-levels.index\":true,\"degree-levels.create\":true,\"degree-levels.edit\":true,\"degree-levels.destroy\":true,\"job-board.tag.index\":true,\"job-board.tag.create\":true,\"job-board.tag.edit\":true,\"job-board.tag.destroy\":true,\"job-board.settings\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"invoice-template.index\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,1,1,'2024-05-13 21:55:17','2024-05-13 21:55:17');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-05-13 21:55:17'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"gallery\",\"job-board\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]',NULL,'2024-05-13 21:55:17'),(6,'language_hide_default','1',NULL,NULL),(7,'language_switcher_display','dropdown',NULL,NULL),(8,'language_display','all',NULL,NULL),(9,'language_hide_languages','[]',NULL,NULL),(10,'show_admin_bar','1',NULL,NULL),(11,'theme','jobbox',NULL,NULL),(12,'admin_logo','general/logo-light.png',NULL,NULL),(13,'admin_favicon','general/favicon.png',NULL,NULL),(14,'theme-jobbox-site_title','JobBox - Laravel Job Board Script',NULL,NULL),(15,'theme-jobbox-seo_description','JobBox is a neat, clean and professional job board website script for your organization. It’s easy to build a complete Job Board site with JobBox script.',NULL,NULL),(16,'theme-jobbox-copyright','©2024 Archi Elite JSC. All right reserved.',NULL,NULL),(17,'theme-jobbox-favicon','general/favicon.png',NULL,NULL),(18,'theme-jobbox-logo','general/logo.png',NULL,NULL),(19,'theme-jobbox-hotline','+(123) 345-6789',NULL,NULL),(20,'theme-jobbox-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(21,'theme-jobbox-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(22,'theme-jobbox-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(23,'theme-jobbox-homepage_id','1',NULL,NULL),(24,'theme-jobbox-blog_page_id','13',NULL,NULL),(25,'theme-jobbox-preloader_enabled','no',NULL,NULL),(26,'theme-jobbox-job_categories_page_id','18',NULL,NULL),(27,'theme-jobbox-job_candidates_page_id','9',NULL,NULL),(28,'theme-jobbox-default_company_cover_image','general/cover-image.png',NULL,NULL),(29,'theme-jobbox-job_companies_page_id','8',NULL,NULL),(30,'theme-jobbox-job_list_page_id','7',NULL,NULL),(31,'theme-jobbox-email','contact@jobbox.com',NULL,NULL),(32,'theme-jobbox-404_page_image','general/404.png',NULL,NULL),(33,'theme-jobbox-background_breadcrumb','pages/bg-breadcrumb.png',NULL,NULL),(34,'theme-jobbox-blog_page_template_blog','blog_gird_1',NULL,NULL),(35,'theme-jobbox-background_blog_single','pages/img-single.png',NULL,NULL),(36,'theme-jobbox-auth_background_image_1','authentication/img-1.png',NULL,NULL),(37,'theme-jobbox-auth_background_image_2','authentication/img-2.png',NULL,NULL),(38,'theme-jobbox-background_cover_candidate_default','pages/background-cover-candidate.png',NULL,NULL),(39,'theme-jobbox-job_board_max_salary_filter','10000',NULL,NULL),(40,'theme-jobbox-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"socials\\/facebook.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"socials\\/linkedin.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/linkedin.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"socials\\/twitter.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}]]',NULL,NULL),(41,'media_random_hash','75294205790846cd580e175c2cfd5e47',NULL,NULL),(42,'permalink-botble-blog-models-post','blog',NULL,NULL),(43,'permalink-botble-blog-models-category','blog',NULL,NULL),(44,'payment_cod_status','1',NULL,NULL),(45,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(46,'payment_bank_transfer_status','1',NULL,NULL),(47,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(48,'payment_stripe_payment_type','stripe_checkout',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage-1',1,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(2,'homepage-2',2,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(3,'homepage-3',3,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(4,'homepage-4',4,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(5,'homepage-5',5,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(6,'homepage-6',6,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(7,'jobs',7,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(8,'companies',8,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(9,'candidates',9,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(10,'about-us',10,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:19','2024-05-13 21:55:19'),(11,'pricing-plan',11,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(12,'contact',12,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(13,'blog',13,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(14,'cookie-policy',14,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(15,'faqs',15,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(16,'services',16,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(17,'terms',17,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(18,'job-categories',18,'Botble\\Page\\Models\\Page','','2024-05-13 21:55:20','2024-05-13 21:55:20'),(19,'design',1,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(20,'lifestyle',2,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(21,'travel-tips',3,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(22,'healthy',4,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(23,'travel-tips',5,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(24,'hotel',6,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(25,'nature',7,'Botble\\Blog\\Models\\Category','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(26,'new',1,'Botble\\Blog\\Models\\Tag','tag','2024-05-13 21:55:20','2024-05-13 21:55:20'),(27,'event',2,'Botble\\Blog\\Models\\Tag','tag','2024-05-13 21:55:20','2024-05-13 21:55:20'),(28,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(29,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(30,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','blog','2024-05-13 21:55:20','2024-05-13 21:55:23'),(31,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-13 21:55:21','2024-05-13 21:55:21'),(32,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-13 21:55:21','2024-05-13 21:55:21'),(33,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-13 21:55:21','2024-05-13 21:55:21'),(34,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-13 21:55:21','2024-05-13 21:55:21'),(35,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-13 21:55:21','2024-05-13 21:55:21'),(36,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-05-13 21:55:21','2024-05-13 21:55:21'),(37,'content-writer',1,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(38,'market-research',2,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(39,'marketing-sale',3,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(40,'customer-help',4,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(41,'finance',5,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(42,'software',6,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(43,'human-resource',7,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:24','2024-05-13 21:55:24'),(44,'management',8,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:25','2024-05-13 21:55:25'),(45,'retail-products',9,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:25','2024-05-13 21:55:25'),(46,'security-analyst',10,'Botble\\JobBoard\\Models\\Category','job-categories','2024-05-13 21:55:25','2024-05-13 21:55:25'),(47,'linkedin',1,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(48,'adobe-illustrator',2,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(49,'bing-search',3,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(50,'dailymotion',4,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(51,'linkedin',5,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(52,'quora-jsc',6,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(53,'nintendo',7,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(54,'periscope',8,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(55,'newsum',9,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(56,'powerhome',10,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(57,'whopcom',11,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(58,'greenwood',12,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(59,'kentucky',13,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(60,'equity',14,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(61,'honda',15,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(62,'toyota',16,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(63,'lexus',17,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(64,'ondo',18,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(65,'square',19,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(66,'visa',20,'Botble\\JobBoard\\Models\\Company','companies','2024-05-13 21:55:25','2024-05-13 21:55:25'),(67,'illustrator',1,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(68,'adobe-xd',2,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(69,'figma',3,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(70,'sketch',4,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(71,'lunacy',5,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(72,'php',6,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(73,'python',7,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(74,'javascript',8,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-05-13 21:55:26','2024-05-13 21:55:26'),(75,'ui-ux-designer-full-time',1,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(76,'full-stack-engineer',2,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(77,'java-software-engineer',3,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(78,'digital-marketing-manager',4,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(79,'frontend-developer',5,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(80,'react-native-web-developer',6,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(81,'senior-system-engineer',7,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(82,'products-manager',8,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(83,'lead-quality-control-qa',9,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(84,'principal-designer-design-systems',10,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(85,'devops-architect',11,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(86,'senior-software-engineer-npm-cli',12,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(87,'senior-systems-engineer',13,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(88,'software-engineer-actions-platform',14,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(89,'staff-engineering-manager-actions',15,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(90,'staff-engineering-manager-actions-runtime',16,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(91,'staff-engineering-manager-packages',17,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(92,'staff-software-engineer',18,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(93,'systems-software-engineer',19,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(94,'senior-compensation-analyst',20,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(95,'senior-accessibility-program-manager',21,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(96,'analyst-relations-manager-application-security',22,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(97,'senior-enterprise-advocate-emea',23,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(98,'deal-desk-manager',24,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(99,'director-revenue-compensation',25,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(100,'program-manager',26,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(101,'sr-manager-deal-desk-intl',27,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(102,'senior-director-product-management-actions-runners-and-compute-services',28,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(103,'alliances-director',29,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(104,'corporate-sales-representative',30,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(105,'country-leader',31,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(106,'customer-success-architect',32,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(107,'devops-account-executive-us-public-sector',33,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(108,'enterprise-account-executive',34,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(109,'senior-engineering-manager-product-security-engineering-paved-paths',35,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(110,'customer-reliability-engineer-iii',36,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:26','2024-05-13 21:55:26'),(111,'support-engineer-enterprise-support-japanese',37,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(112,'technical-partner-manager',38,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(113,'sr-manager-inside-account-management',39,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(114,'services-sales-representative',40,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(115,'services-delivery-manager',41,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(116,'senior-solutions-engineer',42,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(117,'senior-service-delivery-engineer',43,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(118,'senior-director-global-sales-development',44,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(119,'partner-program-manager',45,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(120,'principal-cloud-solutions-engineer',46,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(121,'senior-cloud-solutions-engineer',47,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(122,'senior-customer-success-manager',48,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(123,'inside-account-manager',49,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(124,'ux-jobs-board',50,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(125,'senior-laravel-developer-tall-stack',51,'Botble\\JobBoard\\Models\\Job','jobs','2024-05-13 21:55:27','2024-05-13 21:55:27'),(126,'mazie',1,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:28','2024-05-13 21:55:28'),(127,'jade',2,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:28','2024-05-13 21:55:28'),(128,'sarah',3,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:28','2024-05-13 21:55:28'),(129,'steven',4,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:29','2024-05-13 21:55:29'),(130,'william',5,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:29','2024-05-13 21:55:29'),(131,'malcolm',6,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:29','2024-05-13 21:55:29'),(132,'shad',7,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:29','2024-05-13 21:55:29'),(133,'hassan',8,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:30','2024-05-13 21:55:30'),(134,'torrance',9,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:30','2024-05-13 21:55:30'),(135,'gay',10,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:30','2024-05-13 21:55:30'),(136,'anibal',11,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:30','2024-05-13 21:55:30'),(137,'alta',12,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:31','2024-05-13 21:55:31'),(138,'everette',13,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:31','2024-05-13 21:55:31'),(139,'stephan',14,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:31','2024-05-13 21:55:31'),(140,'soledad',15,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:31','2024-05-13 21:55:31'),(141,'beulah',16,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:32','2024-05-13 21:55:32'),(142,'adriel',17,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:32','2024-05-13 21:55:32'),(143,'laurence',18,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:32','2024-05-13 21:55:32'),(144,'sid',19,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:32','2024-05-13 21:55:32'),(145,'winifred',20,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:33','2024-05-13 21:55:33'),(146,'sister',21,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:33','2024-05-13 21:55:33'),(147,'colin',22,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:33','2024-05-13 21:55:33'),(148,'chance',23,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:33','2024-05-13 21:55:33'),(149,'meda',24,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:34','2024-05-13 21:55:34'),(150,'ada',25,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:34','2024-05-13 21:55:34'),(151,'alberto',26,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:34','2024-05-13 21:55:34'),(152,'maiya',27,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:34','2024-05-13 21:55:34'),(153,'roel',28,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:35','2024-05-13 21:55:35'),(154,'lola',29,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:35','2024-05-13 21:55:35'),(155,'meghan',30,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:35','2024-05-13 21:55:35'),(156,'emma',31,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:35','2024-05-13 21:55:35'),(157,'mariela',32,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:36','2024-05-13 21:55:36'),(158,'jonathan',33,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:36','2024-05-13 21:55:36'),(159,'maxine',34,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:36','2024-05-13 21:55:36'),(160,'liza',35,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:36','2024-05-13 21:55:36'),(161,'vinnie',36,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:37','2024-05-13 21:55:37'),(162,'afton',37,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:37','2024-05-13 21:55:37'),(163,'beau',38,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:37','2024-05-13 21:55:37'),(164,'jackson',39,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:37','2024-05-13 21:55:37'),(165,'spencer',40,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:38','2024-05-13 21:55:38'),(166,'joanie',41,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:38','2024-05-13 21:55:38'),(167,'kiera',42,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:38','2024-05-13 21:55:38'),(168,'helen',43,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:38','2024-05-13 21:55:38'),(169,'lillian',44,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:39','2024-05-13 21:55:39'),(170,'daryl',45,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:39','2024-05-13 21:55:39'),(171,'wilford',46,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:39','2024-05-13 21:55:39'),(172,'elvis',47,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:39','2024-05-13 21:55:39'),(173,'kiel',48,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:40','2024-05-13 21:55:40'),(174,'gabriella',49,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:40','2024-05-13 21:55:40'),(175,'kelsi',50,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:40','2024-05-13 21:55:40'),(176,'tamia',51,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:40','2024-05-13 21:55:40'),(177,'crawford',52,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:41','2024-05-13 21:55:41'),(178,'zella',53,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:41','2024-05-13 21:55:41'),(179,'katheryn',54,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:41','2024-05-13 21:55:41'),(180,'marvin',55,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:41','2024-05-13 21:55:41'),(181,'bobbie',56,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:42','2024-05-13 21:55:42'),(182,'karson',57,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:42','2024-05-13 21:55:42'),(183,'annamae',58,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:42','2024-05-13 21:55:42'),(184,'toney',59,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:43','2024-05-13 21:55:43'),(185,'darrion',60,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:43','2024-05-13 21:55:43'),(186,'chesley',61,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:43','2024-05-13 21:55:43'),(187,'virginia',62,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:43','2024-05-13 21:55:43'),(188,'prudence',63,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:44','2024-05-13 21:55:44'),(189,'moses',64,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:44','2024-05-13 21:55:44'),(190,'lou',65,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:44','2024-05-13 21:55:44'),(191,'jaqueline',66,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:44','2024-05-13 21:55:44'),(192,'mac',67,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:44','2024-05-13 21:55:44'),(193,'irwin',68,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:45','2024-05-13 21:55:45'),(194,'baby',69,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:45','2024-05-13 21:55:45'),(195,'noemy',70,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:45','2024-05-13 21:55:45'),(196,'janick',71,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:45','2024-05-13 21:55:45'),(197,'isabelle',72,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:46','2024-05-13 21:55:46'),(198,'nathanael',73,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:46','2024-05-13 21:55:46'),(199,'burley',74,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:46','2024-05-13 21:55:46'),(200,'evie',75,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:46','2024-05-13 21:55:46'),(201,'emmie',76,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:47','2024-05-13 21:55:47'),(202,'corine',77,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:47','2024-05-13 21:55:47'),(203,'hershel',78,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:47','2024-05-13 21:55:47'),(204,'judd',79,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:47','2024-05-13 21:55:47'),(205,'emil',80,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:48','2024-05-13 21:55:48'),(206,'katelin',81,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:48','2024-05-13 21:55:48'),(207,'wallace',82,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:48','2024-05-13 21:55:48'),(208,'sidney',83,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:48','2024-05-13 21:55:48'),(209,'serena',84,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:49','2024-05-13 21:55:49'),(210,'tristian',85,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:49','2024-05-13 21:55:49'),(211,'evert',86,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:49','2024-05-13 21:55:49'),(212,'heber',87,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:50','2024-05-13 21:55:50'),(213,'lois',88,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:50','2024-05-13 21:55:50'),(214,'pamela',89,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:50','2024-05-13 21:55:50'),(215,'avery',90,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:50','2024-05-13 21:55:50'),(216,'nick',91,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:51','2024-05-13 21:55:51'),(217,'gunner',92,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:51','2024-05-13 21:55:51'),(218,'josie',93,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:51','2024-05-13 21:55:51'),(219,'kamryn',94,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:51','2024-05-13 21:55:51'),(220,'roman',95,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:52','2024-05-13 21:55:52'),(221,'tiana',96,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:52','2024-05-13 21:55:52'),(222,'jakayla',97,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:52','2024-05-13 21:55:52'),(223,'beau',98,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:52','2024-05-13 21:55:52'),(224,'roel',99,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:53','2024-05-13 21:55:53'),(225,'obie',100,'Botble\\JobBoard\\Models\\Account','candidates','2024-05-13 21:55:53','2024-05-13 21:55:53'),(226,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(227,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(228,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(229,'design',1,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(230,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(231,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(232,'healthy',4,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(233,'travel-tips',5,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(234,'hotel',6,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(235,'nature',7,'Botble\\Blog\\Models\\Category','','2024-05-13 21:55:54','2024-05-13 21:55:54'),(236,'jack-persion',1,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(237,'tyler-men',2,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(238,'mohamed-salah',3,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(239,'xao-shin',4,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(240,'peter-cop',5,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(241,'jacob-jones',6,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(242,'court-henry',7,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54'),(243,'theresa',8,'Botble\\Team\\Models\\Team','teams','2024-05-13 21:55:54','2024-05-13 21:55:54');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,NULL,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(2,'England','england','EN',2,0,NULL,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(3,'New York','new-york','NY',1,0,NULL,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(4,'Holland','holland','HL',4,0,NULL,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(5,'Denmark','denmark','DN',5,0,NULL,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23'),(6,'Germany','germany','GER',1,0,NULL,0,'published','2024-05-13 21:55:23','2024-05-13 21:55:23');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'New',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20'),(2,'Event',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-05-13 21:55:20','2024-05-13 21:55:20');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Jack Persion','teams/1.png','Developer Fullstack','USA','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Tyler Men','teams/2.png','Business Analyst','Qatar','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Mohamed Salah','teams/3.png','Developer Fullstack','India','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Xao Shin','teams/4.png','Developer Fullstack','China','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Peter Cop','teams/5.png','Designer','Russia','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Jacob Jones','teams/6.png','Frontend Developer','New York, US','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Court Henry','teams/7.png','Backend Developer','Portugal','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Theresa','teams/8.png','Backend Developer','Thailand','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-05-13 21:55:53','2024-05-13 21:55:53',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Ellis Kim','The Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little shaking among the bright flower-beds and the words don\'t FIT you,\' said Alice, \'a great girl like you,\' (she might well.','testimonials/1.png','Digital Artist','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(2,'John Smith','But I\'ve got to see what I say,\' the Mock Turtle yet?\' \'No,\' said Alice. \'Of course they were\', said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Cat: \'we\'re all mad.','testimonials/2.png','Product designer','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(3,'Sayen Ahmod','For some minutes the whole court was a general chorus of \'There goes Bill!\' then the other, and growing sometimes taller and sometimes shorter, until she had nothing yet,\' Alice replied in an.','testimonials/3.png','Developer','published','2024-05-13 21:55:53','2024-05-13 21:55:53'),(4,'Tayla Swef','Pool of Tears \'Curiouser and curiouser!\' cried Alice hastily, afraid that it was labelled \'ORANGE MARMALADE\', but to open it; but, as the soldiers had to kneel down on one knee. \'I\'m a poor man.','testimonials/4.png','Graphic designer','published','2024-05-13 21:55:53','2024-05-13 21:55:53');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fay.kari@kilback.net',NULL,'$2y$12$fF4LN2BGJVFsE/b8APyrlOxRoallxYJo5ATcJxybzh8cxsIAA0ZHK',NULL,'2024-05-13 21:55:17','2024-05-13 21:55:17','Gaetano','Hodkiewicz','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'NewsletterWidget','pre_footer_sidebar','jobbox',0,'{\"id\":\"NewsletterWidget\",\"title\":\"New Things Will Always <br> Update Regularly\",\"background_image\":\"general\\/newsletter-background-image.png\",\"image_left\":\"general\\/newsletter-image-left.png\",\"image_right\":\"general\\/newsletter-image-right.png\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(2,'SiteInformationWidget','footer_sidebar','jobbox',1,'{\"introduction\":\"JobBox is the heart of the design community and the best resource to discover and connect with designers and jobs worldwide.\",\"facebook_url\":\"#\",\"twitter_url\":\"#\",\"linkedin_url\":\"#\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(3,'CustomMenuWidget','footer_sidebar','jobbox',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Resources\",\"menu_id\":\"resources\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(4,'CustomMenuWidget','footer_sidebar','jobbox',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Community\",\"menu_id\":\"community\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(5,'CustomMenuWidget','footer_sidebar','jobbox',4,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(6,'CustomMenuWidget','footer_sidebar','jobbox',5,'{\"id\":\"CustomMenuWidget\",\"name\":\"More\",\"menu_id\":\"more\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(7,'DownloadWidget','footer_sidebar','jobbox',6,'{\"app_store_url\":\"#\",\"app_store_image\":\"general\\/app-store.png\",\"android_app_url\":\"#\",\"google_play_image\":\"general\\/android.png\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(8,'BlogSearchWidget','primary_sidebar','jobbox',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(9,'BlogCategoriesWidget','primary_sidebar','jobbox',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(10,'BlogPostsWidget','primary_sidebar','jobbox',3,'{\"id\":\"BlogPostsWidget\",\"type\":\"popular\",\"name\":\"Popular Posts\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(11,'BlogTagsWidget','primary_sidebar','jobbox',4,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(12,'BlogSearchWidget','blog_sidebar','jobbox',0,'{\"id\":\"BlogSearchWidget\",\"name\":\"Blog Search\",\"description\":\"Search blog posts\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(13,'BlogPostsWidget','blog_sidebar','jobbox',1,'{\"id\":\"BlogPostsWidget\",\"name\":\"Blog posts\",\"description\":\"Blog posts widget.\",\"type\":\"popular\",\"number_display\":5}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(14,'AdsBannerWidget','blog_sidebar','jobbox',2,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(15,'GalleryWidget','blog_sidebar','jobbox',3,'{\"id\":\"GalleryWidget\",\"name\":\"Gallery\",\"title_gallery\":\"Gallery\",\"number_image\":8}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(16,'AdsBannerWidget','candidate_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-05-13 21:55:21','2024-05-13 21:55:21'),(17,'AdsBannerWidget','company_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-05-13 21:55:21','2024-05-13 21:55:21');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 11:55:55
