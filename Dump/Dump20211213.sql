CREATE DATABASE  IF NOT EXISTS `banco_loja` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_loja`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: banco_loja
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `armazems`
--

DROP TABLE IF EXISTS `armazems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armazems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `endereco` longtext COLLATE utf8mb4_unicode_ci,
  `cidade` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armazems`
--

LOCK TABLES `armazems` WRITE;
/*!40000 ALTER TABLE `armazems` DISABLE KEYS */;
INSERT INTO `armazems` VALUES (1,'Nereu Ramos 400','Itaiopolis','2021-12-10 15:14:26','2021-12-10 15:14:26');
/*!40000 ALTER TABLE `armazems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fatAcumulado` double DEFAULT NULL,
  `limCredito` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Leonardo','Getulio Vargas','89999876542',500,10000,'2021-12-10 15:17:34','2021-12-10 15:17:34');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','voyager::seeders.data_rows.roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(24,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(25,9,'endereco','text','Endereco',0,1,1,1,1,1,'{}',2),(26,9,'cidade','text','Cidade',0,1,1,1,1,1,'{}',3),(27,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(28,9,'updated_at','timestamp','Updated At',0,1,1,0,0,0,'{}',5),(29,12,'id','text','Id',1,0,0,0,0,0,'{}',1),(30,12,'nome','text','Nome',1,1,1,1,1,1,'{}',2),(31,12,'endereco','text','Endereco',0,1,1,1,1,1,'{}',3),(32,12,'cpf','text','Cpf',1,1,1,1,1,1,'{}',4),(33,12,'fatAcumulado','text','FatAcumulado',0,1,1,1,1,1,'{}',5),(34,12,'limCredito','text','LimCredito',0,1,1,1,1,1,'{}',6),(35,12,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(36,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(37,14,'id','text','Id',1,0,0,0,0,0,'{}',1),(38,14,'nome','text','Nome',0,1,1,1,1,1,'{}',2),(39,14,'endereco','text','Endereco',0,1,1,1,1,1,'{}',3),(40,14,'cpf','text','Cpf',0,1,1,1,1,1,'{}',4),(41,14,'comissao','text','Comissao',0,1,1,1,1,1,'{}',5),(42,14,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(43,14,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(44,15,'id','text','Id',1,0,0,0,0,0,'{}',1),(45,15,'nome','text','Nome',1,1,1,1,1,1,'{}',2),(46,15,'descricao','text','Descricao',0,1,1,1,1,1,'{}',3),(47,15,'precoUnitario','text','PrecoUnitario',1,1,1,1,1,1,'{}',4),(48,15,'armazem_id','select_dropdown','Armazem Id',1,1,1,1,1,1,'{}',5),(49,15,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',6),(50,15,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(51,15,'produto_belongsto_armazem_relationship','relationship','Armazem',0,1,1,1,1,1,'{\"model\":\"App\\\\Armazem\",\"table\":\"armazems\",\"type\":\"belongsTo\",\"column\":\"armazem_id\",\"key\":\"id\",\"label\":\"endereco\",\"pivot_table\":\"armazems\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(52,16,'id','text','Id',1,0,0,0,0,0,'{}',1),(53,16,'produto_id','select_dropdown','Produto',1,1,1,1,1,1,'{}',2),(54,16,'cliente_id','select_dropdown','Cliente',1,1,1,1,1,1,'{}',3),(55,16,'vendedor_id','select_dropdown','Vendedor',1,1,1,1,1,1,'{}',4),(56,16,'quantidade','text','Quantidade',1,1,1,1,1,1,'{}',5),(57,16,'valorTotal','text','ValorTotal',1,1,1,1,1,1,'{}',6),(58,16,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(59,16,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',8),(60,16,'venda_belongsto_produto_relationship','relationship','Produto',0,1,1,1,1,1,'{\"model\":\"App\\\\Produto\",\"table\":\"produtos\",\"type\":\"belongsTo\",\"column\":\"produto_id\",\"key\":\"id\",\"label\":\"nome\",\"pivot_table\":\"armazems\",\"pivot\":\"0\",\"taggable\":\"0\"}',9),(61,16,'venda_belongsto_vendedore_relationship','relationship','Vendedor',0,1,1,1,1,1,'{\"model\":\"App\\\\Vendedore\",\"table\":\"vendedores\",\"type\":\"belongsTo\",\"column\":\"vendedor_id\",\"key\":\"id\",\"label\":\"nome\",\"pivot_table\":\"armazems\",\"pivot\":\"0\",\"taggable\":\"0\"}',10),(62,16,'venda_belongsto_cliente_relationship','relationship','Cliente',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"nome\",\"pivot_table\":\"armazems\",\"pivot\":\"0\",\"taggable\":\"0\"}',11);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(5,'armazem','armazem','Armazem','Armazems',NULL,'App\\Armazem',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2021-12-09 02:34:09','2021-12-09 02:34:09'),(9,'armazems','armazems','Armazem','Armazems','voyager-archive','App\\Armazem',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-12-09 03:00:12','2021-12-10 15:44:38'),(12,'clientes','clientes','Cliente','Clientes',NULL,'App\\Models\\Cliente',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2021-12-09 03:03:24','2021-12-09 03:03:24'),(14,'vendedores','vendedores','Vendedor','Vendedores',NULL,'App\\Vendedore',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2021-12-09 03:06:54','2021-12-09 03:06:54'),(15,'produtos','produtos','Produto','Produtos',NULL,'App\\Produto',NULL,NULL,NULL,1,0,'{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-12-10 15:08:25','2021-12-10 15:24:26'),(16,'vendas','vendas','Venda','Vendas',NULL,'App\\Venda',NULL,NULL,NULL,1,0,'{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-12-10 15:16:45','2021-12-10 15:23:56');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
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
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Home','','_self','voyager-home','#000000',NULL,1,'2021-12-09 01:42:58','2021-12-10 15:52:39','voyager.dashboard','null'),(2,1,'Media','','_self','voyager-images',NULL,19,3,'2021-12-09 01:42:58','2021-12-10 15:59:55','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,19,2,'2021-12-09 01:42:58','2021-12-10 15:59:55','voyager.users.index',NULL),(4,1,'Permissões','','_self','voyager-lock','#000000',19,1,'2021-12-09 01:42:58','2021-12-10 15:59:33','voyager.roles.index','null'),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,8,'2021-12-09 01:42:58','2021-12-10 15:59:55',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2021-12-09 01:42:58','2021-12-10 15:55:17','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2021-12-09 01:42:58','2021-12-10 15:55:17','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2021-12-09 01:42:58','2021-12-10 15:55:17','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2021-12-09 01:42:58','2021-12-10 15:55:21','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,9,'2021-12-09 01:42:58','2021-12-10 15:59:55','voyager.settings.index',NULL),(13,1,'Armazems','','_self','voyager-archive','#000000',NULL,2,'2021-12-09 03:00:12','2021-12-10 16:00:17','voyager.armazems.index','null'),(14,1,'Clientes','','_self','voyager-person','#000000',NULL,4,'2021-12-09 03:03:24','2021-12-10 16:01:21','voyager.clientes.index','null'),(15,1,'Vendedores','','_self','voyager-group','#000000',NULL,5,'2021-12-09 03:06:54','2021-12-10 16:01:12','voyager.vendedores.index','null'),(16,1,'Produtos','','_self','voyager-list','#000000',NULL,3,'2021-12-10 15:08:25','2021-12-10 16:02:41','voyager.produtos.index','null'),(17,1,'Vendas','','_self','voyager-basket','#000000',NULL,6,'2021-12-10 15:16:45','2021-12-10 16:00:37','voyager.vendas.index','null'),(19,1,'Admin Panel','','_self','voyager-warning','#000000',NULL,7,'2021-12-10 15:55:09','2021-12-10 15:59:55',NULL,''),(20,2,'Armazems','','_self','voyager-archive','#000000',NULL,2,'2021-12-10 16:40:53','2021-12-10 16:41:04','voyager.armazems.index','null'),(21,2,'Produtos','','_self','voyager-list','#000000',NULL,3,'2021-12-10 16:41:42','2021-12-13 16:23:16','voyager.produtos.index','null'),(22,2,'Clientes','','_self','voyager-list','#000000',NULL,4,'2021-12-10 16:42:13','2021-12-13 16:23:16','voyager.clientes.index','null'),(23,2,'Vendedores','','_self','voyager-group','#000000',NULL,5,'2021-12-10 16:43:15','2021-12-13 16:23:16','voyager.vendedores.index','null'),(24,2,'Vendas','','_self','voyager-basket','#000000',NULL,6,'2021-12-10 16:43:51','2021-12-13 16:23:16','voyager.vendas.index','null'),(25,2,'Home','','_self','voyager-home','#000000',NULL,1,'2021-12-13 16:23:11','2021-12-13 16:23:33','voyager.vendas.index','null');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2021-12-09 01:42:58','2021-12-09 01:42:58'),(2,'Vendedor','2021-12-09 02:58:16','2021-12-10 15:34:55');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(26,2),(27,1),(27,2),(28,1),(28,2),(29,1),(29,2),(30,1),(30,2),(36,1),(36,2),(37,1),(37,2),(38,1),(38,2),(39,1),(39,2),(40,1),(40,2),(41,1),(41,2),(42,1),(42,2),(43,1),(43,2),(44,1),(44,2),(45,1),(45,2),(46,1),(46,2),(47,1),(47,2),(48,1),(48,2),(49,1),(49,2),(50,1),(50,2),(51,1),(51,2),(52,1),(52,2),(53,1),(53,2),(54,1),(54,2),(55,1),(55,2),(56,1),(56,2),(57,1),(57,2),(58,1),(58,2),(59,1),(59,2),(60,1),(60,2);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(2,'browse_bread',NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(3,'browse_database',NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(4,'browse_media',NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(5,'browse_compass',NULL,'2021-12-09 01:42:58','2021-12-09 01:42:58'),(6,'browse_menus','menus','2021-12-09 01:42:58','2021-12-09 01:42:58'),(7,'read_menus','menus','2021-12-09 01:42:58','2021-12-09 01:42:58'),(8,'edit_menus','menus','2021-12-09 01:42:58','2021-12-09 01:42:58'),(9,'add_menus','menus','2021-12-09 01:42:58','2021-12-09 01:42:58'),(10,'delete_menus','menus','2021-12-09 01:42:58','2021-12-09 01:42:58'),(11,'browse_roles','roles','2021-12-09 01:42:58','2021-12-09 01:42:58'),(12,'read_roles','roles','2021-12-09 01:42:58','2021-12-09 01:42:58'),(13,'edit_roles','roles','2021-12-09 01:42:58','2021-12-09 01:42:58'),(14,'add_roles','roles','2021-12-09 01:42:58','2021-12-09 01:42:58'),(15,'delete_roles','roles','2021-12-09 01:42:58','2021-12-09 01:42:58'),(16,'browse_users','users','2021-12-09 01:42:58','2021-12-09 01:42:58'),(17,'read_users','users','2021-12-09 01:42:58','2021-12-09 01:42:58'),(18,'edit_users','users','2021-12-09 01:42:58','2021-12-09 01:42:58'),(19,'add_users','users','2021-12-09 01:42:58','2021-12-09 01:42:58'),(20,'delete_users','users','2021-12-09 01:42:58','2021-12-09 01:42:58'),(21,'browse_settings','settings','2021-12-09 01:42:58','2021-12-09 01:42:58'),(22,'read_settings','settings','2021-12-09 01:42:58','2021-12-09 01:42:58'),(23,'edit_settings','settings','2021-12-09 01:42:58','2021-12-09 01:42:58'),(24,'add_settings','settings','2021-12-09 01:42:58','2021-12-09 01:42:58'),(25,'delete_settings','settings','2021-12-09 01:42:58','2021-12-09 01:42:58'),(26,'browse_armazem','armazem','2021-12-09 02:34:09','2021-12-09 02:34:09'),(27,'read_armazem','armazem','2021-12-09 02:34:09','2021-12-09 02:34:09'),(28,'edit_armazem','armazem','2021-12-09 02:34:09','2021-12-09 02:34:09'),(29,'add_armazem','armazem','2021-12-09 02:34:09','2021-12-09 02:34:09'),(30,'delete_armazem','armazem','2021-12-09 02:34:09','2021-12-09 02:34:09'),(36,'browse_armazems','armazems','2021-12-09 03:00:12','2021-12-09 03:00:12'),(37,'read_armazems','armazems','2021-12-09 03:00:12','2021-12-09 03:00:12'),(38,'edit_armazems','armazems','2021-12-09 03:00:12','2021-12-09 03:00:12'),(39,'add_armazems','armazems','2021-12-09 03:00:12','2021-12-09 03:00:12'),(40,'delete_armazems','armazems','2021-12-09 03:00:12','2021-12-09 03:00:12'),(41,'browse_clientes','clientes','2021-12-09 03:03:24','2021-12-09 03:03:24'),(42,'read_clientes','clientes','2021-12-09 03:03:24','2021-12-09 03:03:24'),(43,'edit_clientes','clientes','2021-12-09 03:03:24','2021-12-09 03:03:24'),(44,'add_clientes','clientes','2021-12-09 03:03:24','2021-12-09 03:03:24'),(45,'delete_clientes','clientes','2021-12-09 03:03:24','2021-12-09 03:03:24'),(46,'browse_vendedores','vendedores','2021-12-09 03:06:54','2021-12-09 03:06:54'),(47,'read_vendedores','vendedores','2021-12-09 03:06:54','2021-12-09 03:06:54'),(48,'edit_vendedores','vendedores','2021-12-09 03:06:54','2021-12-09 03:06:54'),(49,'add_vendedores','vendedores','2021-12-09 03:06:54','2021-12-09 03:06:54'),(50,'delete_vendedores','vendedores','2021-12-09 03:06:54','2021-12-09 03:06:54'),(51,'browse_produtos','produtos','2021-12-10 15:08:25','2021-12-10 15:08:25'),(52,'read_produtos','produtos','2021-12-10 15:08:25','2021-12-10 15:08:25'),(53,'edit_produtos','produtos','2021-12-10 15:08:25','2021-12-10 15:08:25'),(54,'add_produtos','produtos','2021-12-10 15:08:25','2021-12-10 15:08:25'),(55,'delete_produtos','produtos','2021-12-10 15:08:25','2021-12-10 15:08:25'),(56,'browse_vendas','vendas','2021-12-10 15:16:45','2021-12-10 15:16:45'),(57,'read_vendas','vendas','2021-12-10 15:16:45','2021-12-10 15:16:45'),(58,'edit_vendas','vendas','2021-12-10 15:16:45','2021-12-10 15:16:45'),(59,'add_vendas','vendas','2021-12-10 15:16:45','2021-12-10 15:16:45'),(60,'delete_vendas','vendas','2021-12-10 15:16:45','2021-12-10 15:16:45');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precoUnitario` double NOT NULL,
  `armazem_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_armazem_id_index` (`armazem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Lixadeira','Lixadeira',500,1,'2021-12-10 15:15:24','2021-12-10 15:15:24');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2021-12-09 01:42:58','2021-12-09 01:42:58'),(2,'Vendedor','Vendedor','2021-12-09 01:42:58','2021-12-10 15:27:17');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Loja XPTO','','text',1,'Site'),(2,'site.description','Site Description','Loja XPTO','','text',2,'Site'),(3,'site.logo','Site Logo','settings/December2021/XycYixQjT50IEokHoTcP.png','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','settings/December2021/i4WDTxA5rBFXFvcUduaV.jpg','','image',5,'Admin'),(6,'admin.title','Admin Title','Loja XPTO Admin','','text',1,'Admin'),(7,'admin.description','Admin Description','Loja XPTO Admin Dashboard','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings/December2021/qgdaoHaKSu6drb8hwXvm.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'admin','admin@admin.com','users/default.png',NULL,'$2y$10$d9sXcZkBlZdnTxbs48yL0.9EMjW0uLSQtC8JHT32qSMKkydJpOClm',NULL,'{\"locale\":\"en\"}','2021-12-09 01:44:31','2021-12-10 19:58:25'),(2,2,'Vendedor 1','vendedor@vendas.com','users/December2021/SHI8qRKd3CB6eEhkSByB.png',NULL,'$2y$10$m.e3DpJhXA5tIZ310jK9BegTSWM13TqamR8EeYe.1rCADS8/Z05/O',NULL,'{\"locale\":\"pt_br\"}','2021-12-10 15:28:48','2021-12-13 16:19:11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `vendedor_id` int NOT NULL,
  `quantidade` double NOT NULL,
  `valorTotal` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendas_produto_id_index` (`produto_id`),
  KEY `vendas_cliente_id_index` (`cliente_id`),
  KEY `vendas_vendedor_id_index` (`vendedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,1,1,1,2,1000,'2021-12-10 19:54:16','2021-12-10 19:54:16');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comissao` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Igor','Nereu Ramos, 700 - Centro - Itaiopolis','28377823898',3,'2021-12-09 03:08:34','2021-12-09 03:08:34'),(2,'Felipe','Getulio vargas','12345678900',300,'2021-12-10 16:51:59','2021-12-10 16:51:59');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-13 10:26:14
