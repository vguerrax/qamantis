-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: bugtracker
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `mantis_api_token_table`
--

DROP TABLE IF EXISTS `mantis_api_token_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_api_token_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `hash` varchar(128) NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_used` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id_name` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_api_token_table`
--

LOCK TABLES `mantis_api_token_table` WRITE;
/*!40000 ALTER TABLE `mantis_api_token_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_api_token_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_file_table`
--

DROP TABLE IF EXISTS `mantis_bug_file_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bug_file_bug_id` (`bug_id`),
  KEY `idx_diskfile` (`diskfile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_file_table`
--

LOCK TABLES `mantis_bug_file_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_file_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bug_file_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_history_table`
--

DROP TABLE IF EXISTS `mantis_bug_history_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_history_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_name` varchar(64) NOT NULL,
  `old_value` varchar(255) NOT NULL,
  `new_value` varchar(255) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `date_modified` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_history_bug_id` (`bug_id`),
  KEY `idx_history_user_id` (`user_id`),
  KEY `idx_bug_history_date_modified` (`date_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_history_table`
--

LOCK TABLES `mantis_bug_history_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_history_table` DISABLE KEYS */;
INSERT INTO `mantis_bug_history_table` VALUES (1,1,1,'','','',1,1568602520);
/*!40000 ALTER TABLE `mantis_bug_history_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_monitor_table`
--

DROP TABLE IF EXISTS `mantis_bug_monitor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_monitor_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`bug_id`),
  KEY `idx_bug_id` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_monitor_table`
--

LOCK TABLES `mantis_bug_monitor_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_monitor_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bug_monitor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_relationship_table`
--

DROP TABLE IF EXISTS `mantis_bug_relationship_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_relationship_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `destination_bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relationship_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relationship_source` (`source_bug_id`),
  KEY `idx_relationship_destination` (`destination_bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_relationship_table`
--

LOCK TABLES `mantis_bug_relationship_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_relationship_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bug_relationship_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_revision_table`
--

DROP TABLE IF EXISTS `mantis_bug_revision_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_revision_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL,
  `bugnote_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_rev_type` (`type`),
  KEY `idx_bug_rev_id_time` (`bug_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_revision_table`
--

LOCK TABLES `mantis_bug_revision_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_revision_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bug_revision_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_table`
--

DROP TABLE IF EXISTS `mantis_bug_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `handler_id` int(10) unsigned NOT NULL DEFAULT '0',
  `duplicate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority` smallint(6) NOT NULL DEFAULT '30',
  `severity` smallint(6) NOT NULL DEFAULT '50',
  `reproducibility` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `resolution` smallint(6) NOT NULL DEFAULT '10',
  `projection` smallint(6) NOT NULL DEFAULT '10',
  `eta` smallint(6) NOT NULL DEFAULT '10',
  `bug_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '',
  `fixed_in_version` varchar(64) NOT NULL DEFAULT '',
  `build` varchar(32) NOT NULL DEFAULT '',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `summary` varchar(128) NOT NULL DEFAULT '',
  `sponsorship_total` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `target_version` varchar(64) NOT NULL DEFAULT '',
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `due_date` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug_sponsorship_total` (`sponsorship_total`),
  KEY `idx_bug_fixed_in_version` (`fixed_in_version`),
  KEY `idx_bug_status` (`status`),
  KEY `idx_project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_table`
--

LOCK TABLES `mantis_bug_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_table` DISABLE KEYS */;
INSERT INTO `mantis_bug_table` VALUES (1,1,1,0,0,30,50,70,10,10,10,10,1,'','','','','','',0,10,'Teste de Criação de Tarefa',0,0,'',2,1568602520,1,1568602520);
/*!40000 ALTER TABLE `mantis_bug_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_tag_table`
--

DROP TABLE IF EXISTS `mantis_bug_tag_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_tag_table` (
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_attached` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`bug_id`,`tag_id`),
  KEY `idx_bug_tag_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_tag_table`
--

LOCK TABLES `mantis_bug_tag_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_tag_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bug_tag_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bug_text_table`
--

DROP TABLE IF EXISTS `mantis_bug_text_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bug_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `steps_to_reproduce` longtext NOT NULL,
  `additional_information` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bug_text_table`
--

LOCK TABLES `mantis_bug_text_table` WRITE;
/*!40000 ALTER TABLE `mantis_bug_text_table` DISABLE KEYS */;
INSERT INTO `mantis_bug_text_table` VALUES (1,'Teste de Criação de Tarefa','Teste de Criação de Tarefa','Teste de Criação de Tarefa');
/*!40000 ALTER TABLE `mantis_bug_text_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bugnote_table`
--

DROP TABLE IF EXISTS `mantis_bugnote_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bugnote_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bug_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reporter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bugnote_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `note_type` int(11) DEFAULT '0',
  `note_attr` varchar(250) DEFAULT '',
  `time_tracking` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bug` (`bug_id`),
  KEY `idx_last_mod` (`last_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bugnote_table`
--

LOCK TABLES `mantis_bugnote_table` WRITE;
/*!40000 ALTER TABLE `mantis_bugnote_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bugnote_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_bugnote_text_table`
--

DROP TABLE IF EXISTS `mantis_bugnote_text_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_bugnote_text_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_bugnote_text_table`
--

LOCK TABLES `mantis_bugnote_text_table` WRITE;
/*!40000 ALTER TABLE `mantis_bugnote_text_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_bugnote_text_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_category_table`
--

DROP TABLE IF EXISTS `mantis_category_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_category_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_category_project_name` (`project_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_category_table`
--

LOCK TABLES `mantis_category_table` WRITE;
/*!40000 ALTER TABLE `mantis_category_table` DISABLE KEYS */;
INSERT INTO `mantis_category_table` VALUES (1,0,0,'General',0),(2,1,0,'teste',0),(3,1,0,'teste 2',0);
/*!40000 ALTER TABLE `mantis_category_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_config_table`
--

DROP TABLE IF EXISTS `mantis_config_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_config_table` (
  `config_id` varchar(64) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `access_reqd` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '90',
  `value` longtext NOT NULL,
  PRIMARY KEY (`config_id`,`project_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_config_table`
--

LOCK TABLES `mantis_config_table` WRITE;
/*!40000 ALTER TABLE `mantis_config_table` DISABLE KEYS */;
INSERT INTO `mantis_config_table` VALUES ('database_version',0,0,90,1,'209');
/*!40000 ALTER TABLE `mantis_config_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_custom_field_project_table`
--

DROP TABLE IF EXISTS `mantis_custom_field_project_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_custom_field_project_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_custom_field_project_table`
--

LOCK TABLES `mantis_custom_field_project_table` WRITE;
/*!40000 ALTER TABLE `mantis_custom_field_project_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_custom_field_project_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_custom_field_string_table`
--

DROP TABLE IF EXISTS `mantis_custom_field_string_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_custom_field_string_table` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `text` longtext,
  PRIMARY KEY (`field_id`,`bug_id`),
  KEY `idx_custom_field_bug` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_custom_field_string_table`
--

LOCK TABLES `mantis_custom_field_string_table` WRITE;
/*!40000 ALTER TABLE `mantis_custom_field_string_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_custom_field_string_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_custom_field_table`
--

DROP TABLE IF EXISTS `mantis_custom_field_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_custom_field_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `possible_values` text,
  `default_value` varchar(255) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `access_level_r` smallint(6) NOT NULL DEFAULT '0',
  `access_level_rw` smallint(6) NOT NULL DEFAULT '0',
  `length_min` int(11) NOT NULL DEFAULT '0',
  `length_max` int(11) NOT NULL DEFAULT '0',
  `require_report` tinyint(4) NOT NULL DEFAULT '0',
  `require_update` tinyint(4) NOT NULL DEFAULT '0',
  `display_report` tinyint(4) NOT NULL DEFAULT '0',
  `display_update` tinyint(4) NOT NULL DEFAULT '1',
  `require_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `display_closed` tinyint(4) NOT NULL DEFAULT '0',
  `require_closed` tinyint(4) NOT NULL DEFAULT '0',
  `filter_by` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_custom_field_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_custom_field_table`
--

LOCK TABLES `mantis_custom_field_table` WRITE;
/*!40000 ALTER TABLE `mantis_custom_field_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_custom_field_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_email_table`
--

DROP TABLE IF EXISTS `mantis_email_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_email_table` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `metadata` longtext NOT NULL,
  `body` longtext NOT NULL,
  `submitted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_email_table`
--

LOCK TABLES `mantis_email_table` WRITE;
/*!40000 ALTER TABLE `mantis_email_table` DISABLE KEYS */;
INSERT INTO `mantis_email_table` VALUES (4,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=84&confirm_hash=2MaRvJauD1aidAM9SDQbdRuIo1WOMDCGS-_FuCBfQfG7G_dawCYuXcVLq-LXq5zpk4ZWgWzMa0QXd4GAweJz\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580861924),(5,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580861924),(6,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580861924),(7,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580861924),(8,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=93&confirm_hash=GTzOPNQSGOlsLFPgAvOXO5tvrDfmPpvAN-W_A2V0ky4zfN_YKBxhmG47mGeaJmMoOVzB3-2JgPe41pB87i1D\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580863900),(9,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580863900),(10,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580863900),(11,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580863900),(12,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=102&confirm_hash=l-Ff10tknE32bMcvo6NkT8aguw8iXqUiiTO_LkcAnZYGFGecvtvIutmR-hlt4Bo1Agzb1fLRlS8zH7IPoW6a\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580864808),(13,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580864809),(14,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580864809),(15,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580864809),(16,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=103&confirm_hash=UON8ngwxyc4UPor3F-FvVxNER0xwjv4uM5cdOIHPx9nlRGZxktpU5cmykjaU2FP6sLMG0_KwCbSBXCJn49xO\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580865167),(17,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580865167),(18,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580865167),(19,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580865167),(20,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=104&confirm_hash=IpyCnqNEzYWmGrhzOeq2pUqb1QIq93_h8vZEt57_l_7F5Ue9DfHNs-4pFyCbK-lvgIZK0zeGlBMyOtKN2eRH\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580865734),(21,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580865734),(22,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580865734),(23,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580865734),(24,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=105&confirm_hash=Uwx2lrkhIWzzJcmqgV7LXnC1t5gX4D8wnEuhTSwP8shSBh5dxfyuDsqdMTHl36YabqGzeWVo6CoebkcNFCMh\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580866353),(25,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866353),(26,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866353),(27,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866353),(28,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=106&confirm_hash=cFck1aM6QoaLrFCEstSLeNmgD9IhAvC0EhGd6mhFDxUytyA6dlU-bHM_HIZ557MYEypcQwpR4EG-sMHSZj8W\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580866409),(29,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866409),(30,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866409),(31,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866409),(32,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=107&confirm_hash=KDyVRiFo8g93B5215peJEUWNrOSMdlE4FXFsJ4geaDw2z915lGAk16SWojtGsA0XkXWKBTIF8PDd_hbwPt6P\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580866659),(33,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866659),(34,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866659),(35,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866659),(36,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=110&confirm_hash=2obnH90fL9YjXN_ipksTE-Irixnd1ZvRFc722TT6w1L_cFGa2XnBHVvevpGnIDHvx93UJK5zFPU4Z1_tTVF5\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580866719),(37,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866719),(38,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866719),(39,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580866719),(40,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=125&confirm_hash=AjV7FJ7UcvUHq_zNmv6hEmPcu2MtqmTFFpePvDJqqXZOxDqeFMjyuFO9wjJ5qLrIRpkNyE1kI2is8q-l7CC_\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580920500),(41,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580920501),(42,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580920501),(43,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580920501),(44,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=134&confirm_hash=aePcCb42OXQUJ2JmzT-mHr9uFf53licj7abHzuiOLqfwk2Zs8Lv8booWFFE7e6U6hefriWsy9ukTv418BPI0\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580920853),(45,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580920853),(46,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580920853),(47,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580920853),(48,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=143&confirm_hash=fq9pMR3o9BVepP2aVTcGaUg1tjG_vioRGFH8W-cEqHDvkDy_0F9qJS_QPy4edK0Qjw6Sq1k0ocSD2I53g8gu\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580949052),(49,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=152&confirm_hash=KIgrafkhqoHUSOimZx-qaOgyWfA0vezDOYchfAPK5WoiGEFp1BMrWq3gU6JY5y8HMDL2P8SsYX2IOp9jd96W\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580955666),(50,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=153&confirm_hash=n-XmVL3PMxvLxOCaHIrSY1JnD6qFujs-DnB_2Xd0MtrhWBFxtLCmm5Z17MNJ73afP2vCc-GsSyOVgeJSNT4m\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1580956062),(51,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580956062),(52,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580956062),(53,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1580956062),(54,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=154&confirm_hash=5jpHqkP5s9gugEQOLPpjIeJlvrbAoGjvi_YhinkzXOxFeEJh96vbuhtKKyTTG5a2ycDoe08eOPOWRc2CriBV\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580956149),(55,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=155&confirm_hash=AGdeKTF1WpPpOJ7tJNWAWzzcGbG2kouCKWWWXtMhNvILsvx957ZT5Wbu8g13F1N9LZfRFGDGLXs8_VSANLiR\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580956169),(56,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=156&confirm_hash=Lgwy41_Q520aErP4QmY4A2McnPY-jQnNRap3wMVAE9qEje3wqdmnHZA2UqYFONpYUej7cxdr4W3O340uYVc_\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580956189),(57,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=157&confirm_hash=_-fp4gdgZaontMSZsq1yffBT7guoTzYHtEWXE-d6WWkoMkbGU3y8dMrJy9dgFSDmVpDrczgqLTj6iI95EBPL\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580956209),(58,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=158&confirm_hash=aoFHTSE2D594T59xqdUXSuhkRpng2-DBbBVNhoWSrMGcjRIZhpmrZEJCKSFR4hGhMpFP1hvtqToBzIA8ag8R\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580956228),(59,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=159&confirm_hash=ZnHBccZJShvCoE6zJtmFhjXBVJTU22xShdzoWo4NEj6Kyk1WXtHUil0OnyRy5ttEa-9wlC0WBcQcwB12bnci\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1580956250),(60,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581006653),(61,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581006932),(62,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581006974),(63,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=186&confirm_hash=DZr2Z8h_Zj762NGDHr1ysQZBkxoOFy6YyqzsWnURegYvLKt7iY0JDhw_I9Uj81DOofPXFV4qRejmS8diQ1L9\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1581007142),(64,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581007142),(65,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581007142),(66,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581007142),(67,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581007142),(68,'admin@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581007142),(69,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=192&confirm_hash=9XNrjo7pRDLFcrvuLMnAF1fcmZVRDsqMppmVJ46HgzYNS7hbD96mkvdNytCMEmPfsFCQBkj-82jGpB0BSZhf\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581007230),(70,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=194&confirm_hash=cRjGnV42Do8n1luBCkuMdNDRTwLsyIzWtgZhqgcAlXuliwxN68-Pd2XVTf5eDe42Ewz9J8i4BBTK6QsoMbim\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581007252),(71,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=196&confirm_hash=M1q8Mjcj2xthxbXwUGliaFU17xeoPJIhm7l_mi4856GbBa338b8JvpNEfv1vb7SaKTJ6l7hNaaJ3NnaCp-Qe\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581007274),(72,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=198&confirm_hash=1FJ3m6NbW340KleLCHcC_IaXw9XFLS1il8_XizFcfRwe-HEyy3wybm2x5cFTbIKdhcm9UABgLSkgsdQQpcrM\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581007296),(73,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=200&confirm_hash=GYCeB89D1iaMAsR-nAv_wnSNkK2wxx_NOARezFkdutyMU5OU5OT6YibXLXCKD254WaTuYqdtbaYnv36SGl8c\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581007317),(74,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=202&confirm_hash=Q7-qusFYBTwSZzrHjnu5ltOxjRWMyEoM42OVGAOK96xSdOx2WqkugygbM6EfKJU256PKwqR3pWl7wCARtnY4\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581007338),(75,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581007399),(76,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=227&confirm_hash=_k6JKFhEtAGaV0jhLFjrsTIFaNK-ExW4UyjTf49f8h1uVeGlP59Po8YkHrRdx05J7w1sdPcizxr4nHpNuFnX\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1581102356),(77,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581102356),(78,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581102356),(79,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581102356),(80,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581102356),(81,'admin@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581102356),(82,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=233&confirm_hash=EJcnNYwhullljUOdAz9I4jUSX9K8oIebw0GahkjlsI67RhQC1yWh_Z3bzSZShjvlWiKsvcufFwkZYBn_NCTg\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581102456),(83,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=235&confirm_hash=Qo6sKSFrDba6LuWR889GVX8ZpSH9RMhlmtbMJx7nSQBkDwIpnrUJm8Pcym88MXLEVdIrCUfcOHsVs1b6BXHQ\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581102476),(84,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=237&confirm_hash=RTYdSo5MvUXxa-WhNNzQZI9h7UtHKYKuR5G8D4Qo-DOl474IyPjQU9iZZhSjotou7OPOwhurvgrqQ6X1ihxk\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581102500),(85,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=239&confirm_hash=H-SEgP1lH22JQcBeeOCZO35Im17mPSqy4t03jfiHspPNEoCq_eR45A6q6nFcq7xlg4udGgvv6vyflYjmlSMq\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581102523),(86,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=241&confirm_hash=F0GHgbV11fe1eDcZ2D1n_Nt8DaYPVNeVj2kEr188ji0KcWbn4_WztKjhc5jYV1Mjzh4VfF8Nnl9LHjsyZ63n\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581102545),(87,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=243&confirm_hash=dSkdblXIxTsiU-Y8Thi6w2rbHs4OTyLK_avKGkqxT6wza-5SO8jEIMwSEdiL6xuuFmezaaPOrui_WPmK6j6H\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581102567),(88,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581102630),(89,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=268&confirm_hash=w9U8oeLHCieKx_lh3vm6cHAQ2tJXaoHhwyJg5JN_nvk-OES6mGIdDkon3GWzdXmmqq2dGv6VRq1-TLP-eMBe\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1581124097),(90,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581124097),(91,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581124097),(92,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581124097),(93,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581124097),(94,'admin@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581124097),(95,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=274&confirm_hash=_sVaPlLpWhXi6PxOf0bS7cQHVO7u-1ERfTqHSJIFkvvD1Er17xJxpNUqg9l5LVmHEn4aSr7-eVqLFdVxFuCz\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581124190),(96,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=276&confirm_hash=5EJYl7Wq_glawoRUiUEVYHTTymy1rYjKt79xqMt_nH6xAeIE8fU6qIE52tvyl08qy4adZUhvGqFYGk3qbkLK\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581124210),(97,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=278&confirm_hash=s_e87yQ5eYiXqqiI7M9W-siJXAOaDkuYHavgSxGl-66yZhtonGCAFEoXxlV9VDW-eCY6T3_lDgvLe3oXi-RO\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581124231),(98,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=280&confirm_hash=qcnlv-A_VXJ6PyQuK62e24QNTMgITYTVgPDFiBg3ikLHodkw6J3IF4MYg745r4hSj6069DuK0pzMZZ8iGC7t\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581124250),(99,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=282&confirm_hash=U0qpFk5_vUNlpDQiiWV6ES0YlCuI3fccuG2zQf-alxQSl-nn7HGb2L1G9x3PyJVViLmfwcgtjSu2ohe5zjk6\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581124271),(100,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=284&confirm_hash=JgddKWFXbZNYv8HXOMOaseT4oGVsZUfrzFLS0rALWBA-dOBkpNuwwwKBCuBkHDS3rVftfQ0ZjcbaLNMuAlRQ\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581124292),(101,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581124350),(102,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=338&confirm_hash=RO1l6L6gwNtNgf4QncVrfXST70b9G0TYjYVp3DScyOWOi3ox5lcikModsojNImOn6NCqDuG0qVTby3p4yFka\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1581131114),(103,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581131115),(104,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581131115),(105,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581131115),(106,'admin@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581131115),(107,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=344&confirm_hash=YV3bpGd-swiajfD8A8E6KCPcYuyBICkbylpJdqtReOT2jTEOn7SagFLEfFsb2Zdt9zbRr20kZ5d00p_DhhGI\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581131275),(108,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=346&confirm_hash=L1mqJGXBT7FdXhwhPB1oPCkGvVlo_kJ58r5EecAktDc6uZz9szyZNddhiKOWKUlz3ltwAiRSPW8PCtR3y4Q-\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581131339),(109,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=348&confirm_hash=sLmiWOoDQSlB5u4g6-TPv0KjGOBrRyquujA3yWyWmgVrH0sINh0t29xl1sax7z5hdMzPYUMxRAC_A0fDWnsn\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581131391),(110,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=350&confirm_hash=6nY6ICC2R6bNF5rGGGQDsR51OxdtuPz0yt2DcO5odR8tdPPGkNufCUQaWlrSAdfdInU0Lfguj8U9VWz7_vDB\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581131433),(111,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=352&confirm_hash=-LS8Fw2lbRAhFxW_2xUFbsmlMA_8xeSDxF7uZqx7jjGewOATw30djmGR-aGMmnKhXCsUTDlNZVy_3wcdUZ2T\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581131466),(112,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=354&confirm_hash=TIJYIXWHyD-OCoKycNc9QJEJ9A4UjsETlo7umnZ9TndwrmXfaBjIPF9yW8VPapHDH-kOw50QMrtkQBPEPURV\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581131513),(113,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581131654),(114,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=390&confirm_hash=PtQcmVIoFJEh6Kjpdr0G3qEmf8R6pHA2LYNsxeGzdvyibQTwF-NBjoYxt5huSkY9VsVUuUQ7-us0Mz1X697m\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581132538),(115,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=392&confirm_hash=8hqgsrHfLx0huzv9U6p8foTS0rLGn8Mq2HO4jGEt9ugimMmSjMAGxiimVfd3gQ-jujGbIXx3io0RVBnL_pif\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581132564),(116,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=394&confirm_hash=8V1msmtLcwnF5hRxpwCx6Y0WOf5VHqlrJGxpdXVjAsHyOOSQCvTw-OEx09xacScTdkHOUqlasHt-cvSt209s\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581132588),(117,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=396&confirm_hash=oXvJIYpxXEo6_LvBkfKQ_q4WSx0ryKx-2aVW8Mr9iNeHz8nks7EOTn29tK_QT-Ct-fzio51vC9f6hAIKse7x\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581132613),(118,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=398&confirm_hash=0LI2d_WRTqnHcEtH9IGiSDQoTKOaJqMEnYRXBomd1FG57F8XKI5Va71ariZ-6Cr4cZkATyBortJF34ekqrXr\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581132636),(119,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=400&confirm_hash=d3gUaZ68gfaqzauCrH1sh1HsGQx_kUWxdqlnwydtPFveZIuNE91i8Md6X0-k1sH_GykYxnHtDaiZbUSXB16k\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581132659),(120,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=404&confirm_hash=FoAnvo_R6subFOJ4p6qv3JSH2UXebR_CQMJTTTcLGu9gYDGhQsm9upXWIl119GCOXO5UHKrrKtW58R0DkYJh\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1581132920),(121,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581132920),(122,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581132920),(123,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581132920),(124,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581132920),(125,'admin@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581132920),(126,'usuario_criar@email.com','[MantisBT] Registro de conta','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Obrigado por se registrar. Você possui uma conta com o nome de usuário \'usuario_criar\'. Para completar seu registro, visite o endereço a seguir (certifique-se que ele seja digitado como uma única linha) e ajuste a sua própria senha de acesso:\n\nhttp://localhost:8090/verify.php?id=411&confirm_hash=jLlaRFQdzTWpi0MMm3cL_5Zd7OpripWf0zCct_XxewJGi5P5ClNjGYk8KievqPJzEw7cR7j1W43RoYywctQu\n\nSe você não solicitou nenhum registro, ignore esta mensagem e nada irá acontecer.\n\nNÃO RESPONDA A ESTA MENSAGEM',1581133324),(127,'admin1@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581133324),(128,'admin00@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581133324),(129,'administrador@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581133324),(130,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581133324),(131,'admin@email.com.br','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The following account has been created:\n\nUsername: usuario_criar\nE-mail: usuario_criar@email.com\nRemote IP address: 10.0.2.2\nhttp://localhost:8090/\n\nDo not reply to this message',1581133324),(132,'criar.conta.visualizador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.visualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=417&confirm_hash=NmASEetonbD_QliiFssRb0aTDeXGnFrqd4xcwrJ-z3h4jclKUU8fU46L9xbP7jKuiZd7KZQfuT_vcUjmZvqe\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581133411),(133,'criar.conta.relator@email','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.relator\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=419&confirm_hash=dyMPLUbVuQfYv3b5o3co9DwKbaDukLAEkaipAKCccQgC-wsWZyg9PJZfvcStW1hMJ-_Kozm63OOzpx7z3AhE\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581133433),(134,'criar.conta.atualizador@mail.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.atualizador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=421&confirm_hash=iMzki78RG4463k-iTLxl_EHtnSSb7TEMMdECCCQKHjaPWVwDRr0wMCBwFe5GJvnAuYpsdet3VdAT-duMRES6\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581133454),(135,'criar.conta.desenvolvedor@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.desenvolvedor\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=423&confirm_hash=whCt0pPFIii6YCW1edbDqUSkC8JXvH-cKmqC5SBNaRcDHmKm2TECYdJe8wk7IaH35ZRFDCtCpIvx9QywrCVy\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581133475),(136,'criar.conta.gerente@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.gerente\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=425&confirm_hash=Txs7f2TsJQFwrUPUYi9yQeAzfuLRa4JqduA5MSP_psPC4oFkyKRlEarkqz_BjsV2Vz0iFUwt7e__gsjTD1dY\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581133496),(137,'criar.conta.administrador@email.com','[MantisBT] Account registration','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','The user admin has created an account for you with username \"criar.conta.administrador\". In order to complete your registration, visit the following URL (make sure it is entered as the single line) and set your own access password:\n\nhttp://localhost:8090/verify.php?id=427&confirm_hash=zk7rYoC4E93c2_bu2DTIfVK0EVf5U7k-vqmreJeIak13Ze9ibAffBZnEeqauaf7DTO5gswCCnkoq85Iemam1\n\nIf you did not request any registration, ignore this message and nothing will happen.\n\nDo not reply to this message',1581133519),(138,'conta.alterada@email.com','[MantisBT] Account updated','a:3:{s:7:\"headers\";a:0:{}s:7:\"charset\";s:5:\"utf-8\";s:8:\"hostname\";s:9:\"localhost\";}','Your account has been updated by an administrator. A list of these changes is provided below. You can update your account details and preferences at any time by visiting the following URL:\n\nhttp://localhost:8090/account_page.php\n\nUsername alteracao.conta => conta.alterada\nReal Name Alteracao Conta => Conta Alterada\nE-mail alteracao.conta@email.com => conta.alterada@email.com\nAccess Level reporter => viewer',1581133604);
/*!40000 ALTER TABLE `mantis_email_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_filters_table`
--

DROP TABLE IF EXISTS `mantis_filters_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_filters_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(4) DEFAULT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `filter_string` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_filters_table`
--

LOCK TABLES `mantis_filters_table` WRITE;
/*!40000 ALTER TABLE `mantis_filters_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_filters_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_news_table`
--

DROP TABLE IF EXISTS `mantis_news_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_news_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `poster_id` int(10) unsigned NOT NULL DEFAULT '0',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `announcement` tinyint(4) NOT NULL DEFAULT '0',
  `headline` varchar(64) NOT NULL DEFAULT '',
  `body` longtext NOT NULL,
  `last_modified` int(10) unsigned NOT NULL DEFAULT '1',
  `date_posted` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_news_table`
--

LOCK TABLES `mantis_news_table` WRITE;
/*!40000 ALTER TABLE `mantis_news_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_news_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_plugin_table`
--

DROP TABLE IF EXISTS `mantis_plugin_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_plugin_table` (
  `basename` varchar(40) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `priority` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`basename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_plugin_table`
--

LOCK TABLES `mantis_plugin_table` WRITE;
/*!40000 ALTER TABLE `mantis_plugin_table` DISABLE KEYS */;
INSERT INTO `mantis_plugin_table` VALUES ('MantisCoreFormatting',1,0,3);
/*!40000 ALTER TABLE `mantis_plugin_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_project_file_table`
--

DROP TABLE IF EXISTS `mantis_project_file_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_project_file_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `diskfile` varchar(250) NOT NULL DEFAULT '',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `content` longblob,
  `date_added` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_file_table`
--

LOCK TABLES `mantis_project_file_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_file_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_project_file_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_project_hierarchy_table`
--

DROP TABLE IF EXISTS `mantis_project_hierarchy_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_project_hierarchy_table` (
  `child_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `inherit_parent` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_project_hierarchy` (`child_id`,`parent_id`),
  KEY `idx_project_hierarchy_child_id` (`child_id`),
  KEY `idx_project_hierarchy_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_hierarchy_table`
--

LOCK TABLES `mantis_project_hierarchy_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_hierarchy_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_project_hierarchy_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_project_table`
--

DROP TABLE IF EXISTS `mantis_project_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_project_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `view_state` smallint(6) NOT NULL DEFAULT '10',
  `access_min` smallint(6) NOT NULL DEFAULT '10',
  `file_path` varchar(250) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `inherit_global` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_name` (`name`),
  KEY `idx_project_view` (`view_state`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_table`
--

LOCK TABLES `mantis_project_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_table` DISABLE KEYS */;
INSERT INTO `mantis_project_table` VALUES (1,'Automação Mantis BT',10,1,10,10,'','',1,1),(2,'Sub1',10,1,10,10,'','',1,1);
/*!40000 ALTER TABLE `mantis_project_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_project_user_list_table`
--

DROP TABLE IF EXISTS `mantis_project_user_list_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_project_user_list_table` (
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `idx_project_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_user_list_table`
--

LOCK TABLES `mantis_project_user_list_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_user_list_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_project_user_list_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_project_version_table`
--

DROP TABLE IF EXISTS `mantis_project_version_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_project_version_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `version` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `released` tinyint(4) NOT NULL DEFAULT '1',
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `date_order` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_project_version` (`project_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_project_version_table`
--

LOCK TABLES `mantis_project_version_table` WRITE;
/*!40000 ALTER TABLE `mantis_project_version_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_project_version_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_sponsorship_table`
--

DROP TABLE IF EXISTS `mantis_sponsorship_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_sponsorship_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(128) NOT NULL DEFAULT '',
  `url` varchar(128) NOT NULL DEFAULT '',
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `date_submitted` int(10) unsigned NOT NULL DEFAULT '1',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_sponsorship_bug_id` (`bug_id`),
  KEY `idx_sponsorship_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_sponsorship_table`
--

LOCK TABLES `mantis_sponsorship_table` WRITE;
/*!40000 ALTER TABLE `mantis_sponsorship_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_sponsorship_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_tag_table`
--

DROP TABLE IF EXISTS `mantis_tag_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_tag_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  `date_updated` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`name`),
  KEY `idx_tag_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_tag_table`
--

LOCK TABLES `mantis_tag_table` WRITE;
/*!40000 ALTER TABLE `mantis_tag_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_tag_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_tokens_table`
--

DROP TABLE IF EXISTS `mantis_tokens_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_tokens_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `value` longtext NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '1',
  `expiry` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_typeowner` (`type`,`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_tokens_table`
--

LOCK TABLES `mantis_tokens_table` WRITE;
/*!40000 ALTER TABLE `mantis_tokens_table` DISABLE KEYS */;
INSERT INTO `mantis_tokens_table` VALUES (3,1,5,'{\"filter\":false,\"profile\":false}',1568602225,1600138225),(83,84,7,'2MaRvJauD1aidAM9SDQbdRuIo1WOMDCGS-_FuCBfQfG7G_dawCYuXcVLq-LXq5zpk4ZWgWzMa0QXd4GAweJz',1580861924,1581466724),(91,93,7,'GTzOPNQSGOlsLFPgAvOXO5tvrDfmPpvAN-W_A2V0ky4zfN_YKBxhmG47mGeaJmMoOVzB3-2JgPe41pB87i1D',1580863900,1581468700),(99,102,7,'l-Ff10tknE32bMcvo6NkT8aguw8iXqUiiTO_LkcAnZYGFGecvtvIutmR-hlt4Bo1Agzb1fLRlS8zH7IPoW6a',1580864808,1581469608),(100,103,7,'UON8ngwxyc4UPor3F-FvVxNER0xwjv4uM5cdOIHPx9nlRGZxktpU5cmykjaU2FP6sLMG0_KwCbSBXCJn49xO',1580865167,1581469967),(101,104,7,'IpyCnqNEzYWmGrhzOeq2pUqb1QIq93_h8vZEt57_l_7F5Ue9DfHNs-4pFyCbK-lvgIZK0zeGlBMyOtKN2eRH',1580865734,1581470534),(102,105,7,'Uwx2lrkhIWzzJcmqgV7LXnC1t5gX4D8wnEuhTSwP8shSBh5dxfyuDsqdMTHl36YabqGzeWVo6CoebkcNFCMh',1580866353,1581471153),(103,106,7,'cFck1aM6QoaLrFCEstSLeNmgD9IhAvC0EhGd6mhFDxUytyA6dlU-bHM_HIZ557MYEypcQwpR4EG-sMHSZj8W',1580866409,1581471209),(104,107,7,'KDyVRiFo8g93B5215peJEUWNrOSMdlE4FXFsJ4geaDw2z915lGAk16SWojtGsA0XkXWKBTIF8PDd_hbwPt6P',1580866659,1581471459),(106,110,7,'2obnH90fL9YjXN_ipksTE-Irixnd1ZvRFc722TT6w1L_cFGa2XnBHVvevpGnIDHvx93UJK5zFPU4Z1_tTVF5',1580866719,1581471519),(119,125,7,'AjV7FJ7UcvUHq_zNmv6hEmPcu2MtqmTFFpePvDJqqXZOxDqeFMjyuFO9wjJ5qLrIRpkNyE1kI2is8q-l7CC_',1580920500,1581525300),(127,134,7,'aePcCb42OXQUJ2JmzT-mHr9uFf53licj7abHzuiOLqfwk2Zs8Lv8booWFFE7e6U6hefriWsy9ukTv418BPI0',1580920853,1581525653),(139,143,7,'fq9pMR3o9BVepP2aVTcGaUg1tjG_vioRGFH8W-cEqHDvkDy_0F9qJS_QPy4edK0Qjw6Sq1k0ocSD2I53g8gu',1580949052,1581553852),(151,152,7,'KIgrafkhqoHUSOimZx-qaOgyWfA0vezDOYchfAPK5WoiGEFp1BMrWq3gU6JY5y8HMDL2P8SsYX2IOp9jd96W',1580955666,1581560466),(152,153,7,'n-XmVL3PMxvLxOCaHIrSY1JnD6qFujs-DnB_2Xd0MtrhWBFxtLCmm5Z17MNJ73afP2vCc-GsSyOVgeJSNT4m',1580956062,1581560862),(154,154,7,'5jpHqkP5s9gugEQOLPpjIeJlvrbAoGjvi_YhinkzXOxFeEJh96vbuhtKKyTTG5a2ycDoe08eOPOWRc2CriBV',1580956149,1581560949),(155,155,7,'AGdeKTF1WpPpOJ7tJNWAWzzcGbG2kouCKWWWXtMhNvILsvx957ZT5Wbu8g13F1N9LZfRFGDGLXs8_VSANLiR',1580956169,1581560969),(156,156,7,'Lgwy41_Q520aErP4QmY4A2McnPY-jQnNRap3wMVAE9qEje3wqdmnHZA2UqYFONpYUej7cxdr4W3O340uYVc_',1580956189,1581560989),(157,157,7,'_-fp4gdgZaontMSZsq1yffBT7guoTzYHtEWXE-d6WWkoMkbGU3y8dMrJy9dgFSDmVpDrczgqLTj6iI95EBPL',1580956209,1581561009),(158,158,7,'aoFHTSE2D594T59xqdUXSuhkRpng2-DBbBVNhoWSrMGcjRIZhpmrZEJCKSFR4hGhMpFP1hvtqToBzIA8ag8R',1580956228,1581561028),(159,159,7,'ZnHBccZJShvCoE6zJtmFhjXBVJTU22xShdzoWo4NEj6Kyk1WXtHUil0OnyRy5ttEa-9wlC0WBcQcwB12bnci',1580956250,1581561050),(178,186,7,'DZr2Z8h_Zj762NGDHr1ysQZBkxoOFy6YyqzsWnURegYvLKt7iY0JDhw_I9Uj81DOofPXFV4qRejmS8diQ1L9',1581007142,1581611942),(180,192,7,'9XNrjo7pRDLFcrvuLMnAF1fcmZVRDsqMppmVJ46HgzYNS7hbD96mkvdNytCMEmPfsFCQBkj-82jGpB0BSZhf',1581007230,1581612030),(182,194,7,'cRjGnV42Do8n1luBCkuMdNDRTwLsyIzWtgZhqgcAlXuliwxN68-Pd2XVTf5eDe42Ewz9J8i4BBTK6QsoMbim',1581007252,1581612052),(184,196,7,'M1q8Mjcj2xthxbXwUGliaFU17xeoPJIhm7l_mi4856GbBa338b8JvpNEfv1vb7SaKTJ6l7hNaaJ3NnaCp-Qe',1581007274,1581612074),(186,198,7,'1FJ3m6NbW340KleLCHcC_IaXw9XFLS1il8_XizFcfRwe-HEyy3wybm2x5cFTbIKdhcm9UABgLSkgsdQQpcrM',1581007296,1581612096),(188,200,7,'GYCeB89D1iaMAsR-nAv_wnSNkK2wxx_NOARezFkdutyMU5OU5OT6YibXLXCKD254WaTuYqdtbaYnv36SGl8c',1581007317,1581612117),(190,202,7,'Q7-qusFYBTwSZzrHjnu5ltOxjRWMyEoM42OVGAOK96xSdOx2WqkugygbM6EfKJU256PKwqR3pWl7wCARtnY4',1581007338,1581612138),(201,227,7,'_k6JKFhEtAGaV0jhLFjrsTIFaNK-ExW4UyjTf49f8h1uVeGlP59Po8YkHrRdx05J7w1sdPcizxr4nHpNuFnX',1581102356,1581707156),(203,233,7,'EJcnNYwhullljUOdAz9I4jUSX9K8oIebw0GahkjlsI67RhQC1yWh_Z3bzSZShjvlWiKsvcufFwkZYBn_NCTg',1581102456,1581707256),(205,235,7,'Qo6sKSFrDba6LuWR889GVX8ZpSH9RMhlmtbMJx7nSQBkDwIpnrUJm8Pcym88MXLEVdIrCUfcOHsVs1b6BXHQ',1581102476,1581707276),(207,237,7,'RTYdSo5MvUXxa-WhNNzQZI9h7UtHKYKuR5G8D4Qo-DOl474IyPjQU9iZZhSjotou7OPOwhurvgrqQ6X1ihxk',1581102500,1581707300),(209,239,7,'H-SEgP1lH22JQcBeeOCZO35Im17mPSqy4t03jfiHspPNEoCq_eR45A6q6nFcq7xlg4udGgvv6vyflYjmlSMq',1581102523,1581707323),(211,241,7,'F0GHgbV11fe1eDcZ2D1n_Nt8DaYPVNeVj2kEr188ji0KcWbn4_WztKjhc5jYV1Mjzh4VfF8Nnl9LHjsyZ63n',1581102545,1581707345),(213,243,7,'dSkdblXIxTsiU-Y8Thi6w2rbHs4OTyLK_avKGkqxT6wza-5SO8jEIMwSEdiL6xuuFmezaaPOrui_WPmK6j6H',1581102567,1581707367),(224,268,7,'w9U8oeLHCieKx_lh3vm6cHAQ2tJXaoHhwyJg5JN_nvk-OES6mGIdDkon3GWzdXmmqq2dGv6VRq1-TLP-eMBe',1581124097,1581728897),(226,274,7,'_sVaPlLpWhXi6PxOf0bS7cQHVO7u-1ERfTqHSJIFkvvD1Er17xJxpNUqg9l5LVmHEn4aSr7-eVqLFdVxFuCz',1581124190,1581728990),(228,276,7,'5EJYl7Wq_glawoRUiUEVYHTTymy1rYjKt79xqMt_nH6xAeIE8fU6qIE52tvyl08qy4adZUhvGqFYGk3qbkLK',1581124210,1581729010),(230,278,7,'s_e87yQ5eYiXqqiI7M9W-siJXAOaDkuYHavgSxGl-66yZhtonGCAFEoXxlV9VDW-eCY6T3_lDgvLe3oXi-RO',1581124231,1581729031),(232,280,7,'qcnlv-A_VXJ6PyQuK62e24QNTMgITYTVgPDFiBg3ikLHodkw6J3IF4MYg745r4hSj6069DuK0pzMZZ8iGC7t',1581124250,1581729050),(234,282,7,'U0qpFk5_vUNlpDQiiWV6ES0YlCuI3fccuG2zQf-alxQSl-nn7HGb2L1G9x3PyJVViLmfwcgtjSu2ohe5zjk6',1581124271,1581729071),(236,284,7,'JgddKWFXbZNYv8HXOMOaseT4oGVsZUfrzFLS0rALWBA-dOBkpNuwwwKBCuBkHDS3rVftfQ0ZjcbaLNMuAlRQ',1581124292,1581729092),(266,338,7,'RO1l6L6gwNtNgf4QncVrfXST70b9G0TYjYVp3DScyOWOi3ox5lcikModsojNImOn6NCqDuG0qVTby3p4yFka',1581131114,1581735914),(268,344,7,'YV3bpGd-swiajfD8A8E6KCPcYuyBICkbylpJdqtReOT2jTEOn7SagFLEfFsb2Zdt9zbRr20kZ5d00p_DhhGI',1581131275,1581736075),(270,346,7,'L1mqJGXBT7FdXhwhPB1oPCkGvVlo_kJ58r5EecAktDc6uZz9szyZNddhiKOWKUlz3ltwAiRSPW8PCtR3y4Q-',1581131338,1581736138),(272,348,7,'sLmiWOoDQSlB5u4g6-TPv0KjGOBrRyquujA3yWyWmgVrH0sINh0t29xl1sax7z5hdMzPYUMxRAC_A0fDWnsn',1581131391,1581736191),(274,350,7,'6nY6ICC2R6bNF5rGGGQDsR51OxdtuPz0yt2DcO5odR8tdPPGkNufCUQaWlrSAdfdInU0Lfguj8U9VWz7_vDB',1581131433,1581736233),(276,352,7,'-LS8Fw2lbRAhFxW_2xUFbsmlMA_8xeSDxF7uZqx7jjGewOATw30djmGR-aGMmnKhXCsUTDlNZVy_3wcdUZ2T',1581131466,1581736266),(278,354,7,'TIJYIXWHyD-OCoKycNc9QJEJ9A4UjsETlo7umnZ9TndwrmXfaBjIPF9yW8VPapHDH-kOw50QMrtkQBPEPURV',1581131513,1581736313),(297,390,7,'PtQcmVIoFJEh6Kjpdr0G3qEmf8R6pHA2LYNsxeGzdvyibQTwF-NBjoYxt5huSkY9VsVUuUQ7-us0Mz1X697m',1581132538,1581737338),(299,392,7,'8hqgsrHfLx0huzv9U6p8foTS0rLGn8Mq2HO4jGEt9ugimMmSjMAGxiimVfd3gQ-jujGbIXx3io0RVBnL_pif',1581132564,1581737364),(301,394,7,'8V1msmtLcwnF5hRxpwCx6Y0WOf5VHqlrJGxpdXVjAsHyOOSQCvTw-OEx09xacScTdkHOUqlasHt-cvSt209s',1581132588,1581737388),(303,396,7,'oXvJIYpxXEo6_LvBkfKQ_q4WSx0ryKx-2aVW8Mr9iNeHz8nks7EOTn29tK_QT-Ct-fzio51vC9f6hAIKse7x',1581132613,1581737413),(305,398,7,'0LI2d_WRTqnHcEtH9IGiSDQoTKOaJqMEnYRXBomd1FG57F8XKI5Va71ariZ-6Cr4cZkATyBortJF34ekqrXr',1581132636,1581737436),(307,400,7,'d3gUaZ68gfaqzauCrH1sh1HsGQx_kUWxdqlnwydtPFveZIuNE91i8Md6X0-k1sH_GykYxnHtDaiZbUSXB16k',1581132659,1581737459),(309,404,7,'FoAnvo_R6subFOJ4p6qv3JSH2UXebR_CQMJTTTcLGu9gYDGhQsm9upXWIl119GCOXO5UHKrrKtW58R0DkYJh',1581132920,1581737720),(310,411,7,'jLlaRFQdzTWpi0MMm3cL_5Zd7OpripWf0zCct_XxewJGi5P5ClNjGYk8KievqPJzEw7cR7j1W43RoYywctQu',1581133324,1581738124),(312,417,7,'NmASEetonbD_QliiFssRb0aTDeXGnFrqd4xcwrJ-z3h4jclKUU8fU46L9xbP7jKuiZd7KZQfuT_vcUjmZvqe',1581133411,1581738211),(314,419,7,'dyMPLUbVuQfYv3b5o3co9DwKbaDukLAEkaipAKCccQgC-wsWZyg9PJZfvcStW1hMJ-_Kozm63OOzpx7z3AhE',1581133433,1581738233),(316,421,7,'iMzki78RG4463k-iTLxl_EHtnSSb7TEMMdECCCQKHjaPWVwDRr0wMCBwFe5GJvnAuYpsdet3VdAT-duMRES6',1581133454,1581738254),(318,423,7,'whCt0pPFIii6YCW1edbDqUSkC8JXvH-cKmqC5SBNaRcDHmKm2TECYdJe8wk7IaH35ZRFDCtCpIvx9QywrCVy',1581133475,1581738275),(320,425,7,'Txs7f2TsJQFwrUPUYi9yQeAzfuLRa4JqduA5MSP_psPC4oFkyKRlEarkqz_BjsV2Vz0iFUwt7e__gsjTD1dY',1581133496,1581738296),(322,427,7,'zk7rYoC4E93c2_bu2DTIfVK0EVf5U7k-vqmreJeIak13Ze9ibAffBZnEeqauaf7DTO5gswCCnkoq85Iemam1',1581133519,1581738319),(326,431,4,'1',1581133598,1581133904),(327,433,4,'1',1581133623,1581133928),(328,435,4,'1',1581133641,1581133946),(329,437,4,'1',1581133661,1581133967),(330,439,4,'1',1581133683,1581133987),(331,441,4,'1',1581133705,1581134009),(332,442,4,'1',1581133711,1581134011),(333,444,4,'1',1581133728,1581134028),(334,451,4,'1',1581133808,1581134108),(335,453,4,'1',1581133825,1581134125),(336,455,4,'1',1581133842,1581134142),(337,457,4,'1',1581133859,1581134159),(338,459,4,'1',1581133877,1581134177),(339,461,4,'1',1581133895,1581134195);
/*!40000 ALTER TABLE `mantis_tokens_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_user_pref_table`
--

DROP TABLE IF EXISTS `mantis_user_pref_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_user_pref_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `project_id` int(10) unsigned NOT NULL DEFAULT '0',
  `default_profile` int(10) unsigned NOT NULL DEFAULT '0',
  `default_project` int(10) unsigned NOT NULL DEFAULT '0',
  `refresh_delay` int(11) NOT NULL DEFAULT '0',
  `redirect_delay` int(11) NOT NULL DEFAULT '0',
  `bugnote_order` varchar(4) NOT NULL DEFAULT 'ASC',
  `email_on_new` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_assigned` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_feedback` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_resolved` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_closed` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_reopened` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_bugnote` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_status` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority` tinyint(4) NOT NULL DEFAULT '0',
  `email_on_priority_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_status_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_bugnote_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_reopened_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_closed_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_resolved_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_feedback_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_assigned_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_on_new_min_severity` smallint(6) NOT NULL DEFAULT '10',
  `email_bugnote_limit` smallint(6) NOT NULL DEFAULT '0',
  `language` varchar(32) NOT NULL DEFAULT 'english',
  `timezone` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_pref_table`
--

LOCK TABLES `mantis_user_pref_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_pref_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_user_pref_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_user_print_pref_table`
--

DROP TABLE IF EXISTS `mantis_user_print_pref_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_user_print_pref_table` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `print_pref` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_print_pref_table`
--

LOCK TABLES `mantis_user_print_pref_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_print_pref_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_user_print_pref_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_user_profile_table`
--

DROP TABLE IF EXISTS `mantis_user_profile_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_user_profile_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `os` varchar(32) NOT NULL DEFAULT '',
  `os_build` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_profile_table`
--

LOCK TABLES `mantis_user_profile_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_profile_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantis_user_profile_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantis_user_table`
--

DROP TABLE IF EXISTS `mantis_user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantis_user_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL DEFAULT '',
  `realname` varchar(191) NOT NULL DEFAULT '',
  `email` varchar(191) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `protected` tinyint(4) NOT NULL DEFAULT '0',
  `access_level` smallint(6) NOT NULL DEFAULT '10',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `lost_password_request_count` smallint(6) NOT NULL DEFAULT '0',
  `failed_login_count` smallint(6) NOT NULL DEFAULT '0',
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '1',
  `date_created` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_cookie_string` (`cookie_string`),
  UNIQUE KEY `idx_user_username` (`username`),
  KEY `idx_enable` (`enabled`),
  KEY `idx_access` (`access_level`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantis_user_table`
--

LOCK TABLES `mantis_user_table` WRITE;
/*!40000 ALTER TABLE `mantis_user_table` DISABLE KEYS */;
INSERT INTO `mantis_user_table` VALUES (460,'admin','admin','admin@email.com.br','21232f297a57a5a743894a0e4a801fc3',1,0,90,0,0,0,'VEVTVEVBVVRPTUFUSVpBRE9NQU5USVMxNTgxMTMzODgx',1581133881,1581133881);
/*!40000 ALTER TABLE `mantis_user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-08 15:47:22
