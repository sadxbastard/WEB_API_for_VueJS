-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_laravel
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `types_of_activity_id` bigint unsigned NOT NULL,
  `date_of_completion` date DEFAULT NULL,
  `actual_score` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activity_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_user_id_foreign` (`user_id`),
  KEY `activities_types_of_activity_id_foreign` (`types_of_activity_id`),
  CONSTRAINT `activities_types_of_activity_id_foreign` FOREIGN KEY (`types_of_activity_id`) REFERENCES `types_of_activity` (`id`),
  CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (2,1,4,NULL,NULL,'2024-12-08 14:06:56','2024-12-08 14:06:56','Моделирование систем'),(3,1,4,NULL,NULL,'2024-12-08 14:06:56','2024-12-08 14:06:56','Технологии мультимедиа');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (15,'2014_10_12_000000_create_users_table',1),(16,'2014_10_12_100000_create_password_reset_tokens_table',1),(17,'2019_08_19_000000_create_failed_jobs_table',1),(18,'2019_12_14_000001_create_personal_access_tokens_table',1),(19,'2024_02_13_063845_modification_users_table',1),(20,'2024_02_13_064635_create_types_of_activity_table',1),(21,'2024_02_13_065326_create_activities_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (9,'App\\Models\\User',1,'myapptoken','e2b7398811bd101da7d37532e1f32009c732f8df0740b4b826344b44b78a355f','[\"*\"]','2024-12-09 10:28:20',NULL,'2024-12-09 02:33:29','2024-12-09 10:28:20'),(10,'App\\Models\\User',2,'myapptoken','3f954942b24ab963a204e4fc80bde8403a63333c794bb82fce2000d45690ec30','[\"*\"]','2024-12-09 02:42:13',NULL,'2024-12-09 02:35:43','2024-12-09 02:42:13'),(11,'App\\Models\\User',1,'myapptoken','0f3fdb22523f0961b4e4cf7ba9050203b1688d6dfb21e87acbc0ef53c65d1f94','[\"*\"]',NULL,NULL,'2024-12-09 05:30:46','2024-12-09 05:30:46'),(12,'App\\Models\\User',2,'myapptoken','8da87f41aacacea1646bc804623135f50393429288ecb63c10cf21af763f1fd7','[\"*\"]','2024-12-09 05:35:18',NULL,'2024-12-09 05:31:34','2024-12-09 05:35:18'),(13,'App\\Models\\User',2,'myapptoken','8f57419a31f7adccfafa02e2ba832146bbb1f53fa8ebd1215811d92c1b15a78f','[\"*\"]',NULL,NULL,'2024-12-09 05:32:17','2024-12-09 05:32:17'),(14,'App\\Models\\User',2,'myapptoken','85c659620c7f526cdf03dd89d6e937ef3b5b06244a108dc5301cb6cdc00354c9','[\"*\"]','2024-12-09 05:34:14',NULL,'2024-12-09 05:32:29','2024-12-09 05:34:14'),(15,'App\\Models\\User',1,'myapptoken','8ad03236d79d8be555dd14616f3ab2f159d0f981894e447f2faa3dd1cb8cb055','[\"*\"]','2024-12-09 05:35:10',NULL,'2024-12-09 05:34:19','2024-12-09 05:35:10'),(16,'App\\Models\\User',1,'myapptoken','74104b10d6c0daa4611d783e8f6031f601cab5eaa41eb184d160b4080ce97c64','[\"*\"]','2024-12-09 05:35:21',NULL,'2024-12-09 05:35:13','2024-12-09 05:35:21'),(17,'App\\Models\\User',2,'myapptoken','ecd84454bc943ecd724707d6246cd94d875d628b34ca5cfa7c5e46d21fca006b','[\"*\"]',NULL,NULL,'2024-12-09 05:35:25','2024-12-09 05:35:25'),(18,'App\\Models\\User',2,'myapptoken','00a72c5b21fb69041213eca256c214997463cefa8e84feb96d247ce49029eaa8','[\"*\"]','2024-12-09 05:36:58',NULL,'2024-12-09 05:36:30','2024-12-09 05:36:58'),(19,'App\\Models\\User',1,'myapptoken','f1784742001b511fae95304dd6ee6b437ad853594c2b385b109f15a8d8200d6a','[\"*\"]','2024-12-09 05:36:59',NULL,'2024-12-09 05:36:53','2024-12-09 05:36:59'),(20,'App\\Models\\User',1,'myapptoken','0ab2c0d97433bbfb9737a94df6429bb2bab911726a17497997c685936de31930','[\"*\"]',NULL,NULL,'2024-12-09 05:43:12','2024-12-09 05:43:12'),(21,'App\\Models\\User',2,'myapptoken','336d3549ed71ec3f9169761f6cc8958be1ba15f4e3042f983f78051f384bc996','[\"*\"]',NULL,NULL,'2024-12-09 05:45:14','2024-12-09 05:45:14'),(22,'App\\Models\\User',2,'myapptoken','0f5c56f0638b68d8957c97be8b03abdf5ecdc1c1ca63087b8ae89aa0a19b577d','[\"*\"]','2024-12-09 06:41:53',NULL,'2024-12-09 05:45:27','2024-12-09 06:41:53'),(23,'App\\Models\\User',2,'myapptoken','ab252784eba819d273228d93643007f6779d097ff42515df3d2ebff88c1b9dec','[\"*\"]',NULL,NULL,'2024-12-09 06:43:55','2024-12-09 06:43:55'),(24,'App\\Models\\User',1,'myapptoken','a947c3b53f7348f1e0bba0819814fe5598e876db45661bac409ace66338facbe','[\"*\"]','2024-12-09 08:09:29',NULL,'2024-12-09 06:47:32','2024-12-09 08:09:29'),(25,'App\\Models\\User',1,'myapptoken','da6d0cd04b365c72c7f08a333494b8f65db2b58017d0d29587ee1bd5f0fd0d27','[\"*\"]','2024-12-09 09:09:41',NULL,'2024-12-09 09:04:07','2024-12-09 09:09:41'),(26,'App\\Models\\User',1,'myapptoken','1f684a86d44adbf2646d6d569db1a5386e3c184db8da648340cb6255c01e3bb9','[\"*\"]','2024-12-09 09:16:54',NULL,'2024-12-09 09:10:08','2024-12-09 09:16:54'),(27,'App\\Models\\User',1,'myapptoken','9a9fb381de09ad431576b1cf452d0a0ce6fe42ff2415efb3e4afb29f78982600','[\"*\"]','2024-12-16 02:42:27',NULL,'2024-12-09 09:30:06','2024-12-16 02:42:27'),(28,'App\\Models\\User',2,'myapptoken','197f1d3e6b4f2ba6aa04f14a25fc705fafa6c0090430e048aea13839513acbd7','[\"*\"]','2024-12-16 04:17:34',NULL,'2024-12-09 10:29:04','2024-12-16 04:17:34'),(29,'App\\Models\\User',2,'myapptoken','92388e11f8100f59299b3057881e02ba55c34b27880c5366e6900ea511e9951d','[\"*\"]',NULL,NULL,'2024-12-16 03:58:50','2024-12-16 03:58:50'),(30,'App\\Models\\User',1,'myapptoken','e970f669773f5a4ad05e2a053223894e5632977d93f9b59b32629b598b4c9033','[\"*\"]','2024-12-16 03:59:58',NULL,'2024-12-16 03:59:12','2024-12-16 03:59:58'),(31,'App\\Models\\User',1,'myapptoken','78bb41e4bd7df0c6d4e91b46f0a7de5ca931a03dc852c201bdc9a8518d0d0345','[\"*\"]','2024-12-16 04:03:26',NULL,'2024-12-16 04:00:01','2024-12-16 04:03:26'),(32,'App\\Models\\User',1,'myapptoken','103136cc6a0118146e4125302c695c846f7b6fad9bb1b18a29a244d68f00d538','[\"*\"]','2024-12-16 04:09:27',NULL,'2024-12-16 04:03:39','2024-12-16 04:09:27'),(33,'App\\Models\\User',1,'myapptoken','858504b78f41348cbd2fdde4dfee9a2aeffa533f8d9a32097a08bf493c2ac934','[\"*\"]','2024-12-16 04:52:47',NULL,'2024-12-16 04:09:30','2024-12-16 04:52:47'),(34,'App\\Models\\User',1,'myapptoken','9792ea71e8d111643e8690f96e5a5d918d78524cb1ad6b43790389ca06358c58','[\"*\"]','2024-12-16 04:53:41',NULL,'2024-12-16 04:52:55','2024-12-16 04:53:41'),(35,'App\\Models\\User',1,'myapptoken','8ce858cd0f022fefea6018da0b4f1c39608517553faa320b0b94c7681ad69290','[\"*\"]','2024-12-16 11:50:57',NULL,'2024-12-16 04:53:48','2024-12-16 11:50:57'),(36,'App\\Models\\User',1,'myapptoken','253793df037cc17b60795955ceb9c30b4538cad54f1e33fdbd7e1980767f0661','[\"*\"]','2024-12-16 13:52:33',NULL,'2024-12-16 10:13:50','2024-12-16 13:52:33'),(37,'App\\Models\\User',1,'myapptoken','f30051a3b7144e9285757f9539af7130d87f4ec8da9598758aa169c4e31f158d','[\"*\"]','2024-12-16 12:00:56',NULL,'2024-12-16 11:51:24','2024-12-16 12:00:56'),(38,'App\\Models\\User',1,'myapptoken','927c82d9eae025353547a6d597820170ff6d5d99f46075597406c9db56e1a6a9','[\"*\"]','2024-12-16 12:01:20',NULL,'2024-12-16 12:01:06','2024-12-16 12:01:20'),(39,'App\\Models\\User',1,'myapptoken','e90653b96fb10af2e62b801f8583393a5c8e72a6f8334e0f0900d29d38e0df70','[\"*\"]','2024-12-16 12:01:31',NULL,'2024-12-16 12:01:23','2024-12-16 12:01:31'),(40,'App\\Models\\User',1,'myapptoken','9848bd1848a707310abc41953b47f7e8887737dea544863f70509e052648a86f','[\"*\"]','2024-12-16 12:04:04',NULL,'2024-12-16 12:01:33','2024-12-16 12:04:04'),(41,'App\\Models\\User',1,'myapptoken','f4cbbd8ad86666aa14dc1c19878180370bf18c84c1094509e3c5c4330bcaf601','[\"*\"]','2024-12-16 12:10:45',NULL,'2024-12-16 12:04:07','2024-12-16 12:10:45'),(42,'App\\Models\\User',1,'myapptoken','ff44fd604d5fdd6fd560be2a0cbc0f4330d7c3bf7a1d19b3f2a5550eae2f807f','[\"*\"]','2024-12-16 13:44:52',NULL,'2024-12-16 12:15:59','2024-12-16 13:44:52'),(43,'App\\Models\\User',1,'myapptoken','6e024fd9f4c8ad147535efded2680cb1f3effa3cb7fc9dbbe5c6f5a0540abf62','[\"*\"]','2024-12-16 13:45:17',NULL,'2024-12-16 13:45:05','2024-12-16 13:45:17'),(44,'App\\Models\\User',1,'myapptoken','06ea8c42204227071384ece5e3f09ca410cb7b3dfd1f7afb13a176fcf70fc2f1','[\"*\"]','2024-12-16 14:14:20',NULL,'2024-12-16 13:45:38','2024-12-16 14:14:20');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_of_activity`
--

DROP TABLE IF EXISTS `types_of_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_of_activity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type_of_activity_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maximum_score` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `picture_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_of_activity_user_id_foreign` (`user_id`),
  CONSTRAINT `types_of_activity_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_of_activity`
--

LOCK TABLES `types_of_activity` WRITE;
/*!40000 ALTER TABLE `types_of_activity` DISABLE KEYS */;
INSERT INTO `types_of_activity` VALUES (2,1,'Спорт',100,'2024-12-08 08:20:14','2024-12-08 08:20:14','https://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/icons8-sport-100.png'),(3,1,'Игры',100,'2024-12-08 08:20:27','2024-12-08 08:20:27','https://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/icons8-ps-controller-100.png'),(4,1,'Учеба',100,'2024-12-08 08:20:56','2024-12-08 08:20:56','https://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/icons8-study-100.png'),(5,2,'Научная',100,'2024-12-08 08:31:58','2024-12-08 08:31:58','https://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/icons8-study-100.png'),(10,1,'Дроны',666,'2024-12-16 13:43:35','2024-12-16 13:43:35','http://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/89878_icons8-drone-100.png'),(11,1,'Баскетбол',33,'2024-12-16 13:48:53','2024-12-16 13:48:53','http://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/77307_icons8-basketball-100.png'),(12,1,'Теннис',25,'2024-12-16 13:59:26','2024-12-16 13:59:26','http://storage.yandexcloud.net/sdxbstrdbacket/types_of_activity_pictures/11793_icons8-tennis-player-80.png');
/*!40000 ALTER TABLE `types_of_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Дмитрий','sam@mail.ru',NULL,'$2y$12$JuAb4qB3.S09/kL19NVLjOMLyhRpPhXcKDmlE9N90zMr4RM78Ofuu',NULL,NULL,NULL,'Самойлов','Артурович','2003-11-19'),(2,'Данил','ruz@mail.ru',NULL,'$2y$12$4h9CNugH2qtd8cTQW4NcoOIU57cg4vG39Wfxgmn8SkI8S9Nd3Io9y',NULL,NULL,NULL,'Рузин','Евгеньевич','2003-10-21');
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

-- Dump completed on 2025-02-17 14:52:11
