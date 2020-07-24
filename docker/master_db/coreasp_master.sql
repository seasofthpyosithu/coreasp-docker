-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: coreasp-v2-dbclust.cluster-ckhlsz9lb8ej.ap-northeast-1.rds.amazonaws.com    Database: coreasp_v2_master
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `action_log`
--

DROP TABLE IF EXISTS `action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_type` int(1) DEFAULT NULL COMMENT '1:iPhone、2:Android',
  `push_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参加中のジオ通知イベント',
  `config_id` int(10) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `device_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクションテーブル参照',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `idx` (`push_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `action_mst`
--

DROP TABLE IF EXISTS `action_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_mst` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '3桁数値のアクションキー',
  `action_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクション名',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alert_setting`
--

DROP TABLE IF EXISTS `alert_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alert_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `apns` int(10) DEFAULT NULL,
  `alert` int(10) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analytics_log`
--

DROP TABLE IF EXISTS `analytics_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_type` int(1) DEFAULT NULL COMMENT '1:iPhone、2:Android',
  `event_id` int(10) DEFAULT NULL COMMENT '参加中のジオ通知イベント',
  `config_id` int(10) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `device_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクションテーブル参照',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='アクセス解析ログ保存用テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_ab_base`
--

DROP TABLE IF EXISTS `android_ab_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_ab_base` (
  `ab_base_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ab_type` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ab_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_ab_log`
--

DROP TABLE IF EXISTS `android_ab_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_ab_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) DEFAULT NULL,
  `ab_time_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `queue_group` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `device_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `device_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `device_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `os_version` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `action_key` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `andoroid_ab_log_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_ab_time`
--

DROP TABLE IF EXISTS `android_ab_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_ab_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) NOT NULL,
  `time_to_start` datetime DEFAULT NULL,
  `time_to_limit` datetime DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_reserve` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_ab_tmp`
--

DROP TABLE IF EXISTS `android_ab_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_ab_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) DEFAULT NULL,
  `ab_time_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `ab_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time_to_start` datetime DEFAULT NULL,
  `time_to_limit` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `device_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `push_type` tinyint(4) DEFAULT NULL,
  `queueGroup` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `code` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` int(11) DEFAULT NULL,
  `message_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iphone_ab_tmp_id_uindex` (`id`),
  KEY `ab_base_id` (`ab_base_id`),
  KEY `ab_time_id` (`ab_time_id`),
  KEY `config_id` (`config_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_action_label`
--

DROP TABLE IF EXISTS `android_action_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_action_label` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT 'アプリの設定キー',
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '3桁数値のアクションキー',
  `action_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクション名',
  `use_flg` tinyint(1) DEFAULT '1' COMMENT '1:使用する, 2:使用しない',
  PRIMARY KEY (`action_id`),
  KEY `config_id` (`config_id`),
  KEY `action_key` (`action_key`),
  KEY `use_flg` (`use_flg`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_balancing_queue`
--

DROP TABLE IF EXISTS `android_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `category_id` text NOT NULL,
  `device_token` text NOT NULL,
  `url` text NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `push_type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_config`
--

DROP TABLE IF EXISTS `android_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_config` (
  `config_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `auth_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL COMMENT '1:入金確認 2:利用可能 3:一時停止 4:停止',
  `plan` int(1) NOT NULL COMMENT 'plan nonuse:0 free:1 / standard:2 / professional:3',
  `client_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_id` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `private_key` longtext COLLATE utf8_unicode_ci,
  `use_fcm` int(1) DEFAULT NULL,
  PRIMARY KEY (`config_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2067 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_config_category`
--

DROP TABLE IF EXISTS `android_config_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_config_category` (
  `android_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`android_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_config_key`
--

DROP TABLE IF EXISTS `android_config_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_config_key` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0:非アクティブ、1:アクティブ',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_config_sub_category`
--

DROP TABLE IF EXISTS `android_config_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_config_sub_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `sub_category_id` int(2) NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_error_remove_reserve`
--

DROP TABLE IF EXISTS `android_error_remove_reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_error_remove_reserve` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(20) NOT NULL,
  `type` int(1) DEFAULT '0' COMMENT '1: status_code IN (1,2,4), 2: status_code NOT IN (1,2,4), 3: ALL',
  `finish_flg` tinyint(1) DEFAULT '0' COMMENT '0: 未実行, 1: 実行済み',
  `total` int(10) DEFAULT '0' COMMENT 'エラー総数',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`),
  KEY `idx3` (`finish_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_error_token`
--

DROP TABLE IF EXISTS `android_error_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_error_token` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_id` int(10) NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status_code` int(4) DEFAULT '0',
  `status_message` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `is_resend` int(1) DEFAULT '0',
  `is_delete` int(1) DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `idx` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_expenses`
--

DROP TABLE IF EXISTS `android_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_expenses` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `year` int(4) NOT NULL DEFAULT '1',
  `month` int(2) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_geo_notify`
--

DROP TABLE IF EXISTS `android_geo_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_geo_notify` (
  `geo_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL COMMENT 'geo_event.event_id',
  `config_id` int(10) NOT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_history`
--

DROP TABLE IF EXISTS `android_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35692 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_history_segment`
--

DROP TABLE IF EXISTS `android_history_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_history_segment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `history_id` int(10) DEFAULT NULL,
  `queue_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(3) DEFAULT NULL,
  `category_value` varchar(40) DEFAULT NULL,
  `device_name` varchar(40) DEFAULT NULL,
  `os_version` varchar(40) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `radius` int(8) DEFAULT NULL,
  `term_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `term_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`history_id`),
  KEY `idx3` (`queue_group`),
  KEY `idx4` (`config_id`,`category_id`,`category_value`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_last_plan`
--

DROP TABLE IF EXISTS `android_last_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_last_plan` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_multi_category`
--

DROP TABLE IF EXISTS `android_multi_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_multi_category` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(10) DEFAULT NULL,
  `category_value` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`config_id`,`category_id`),
  KEY `deviceToken` (`device_token`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_panelist_balancing_queue`
--

DROP TABLE IF EXISTS `android_panelist_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_panelist_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `questionnaire_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `config_id` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_panelist_history`
--

DROP TABLE IF EXISTS `android_panelist_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_panelist_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `queue_group` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_panelist_queue_group`
--

DROP TABLE IF EXISTS `android_panelist_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_panelist_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_push_request_queue`
--

DROP TABLE IF EXISTS `android_push_request_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_push_request_queue` (
  `queue_id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `custom_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `send_flg` tinyint(1) DEFAULT '0' COMMENT '0: 未送信、1: 送信済み',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `custom_key` varchar(1000) COLLATE utf8_unicode_ci DEFAULT '',
  `request_group` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`),
  KEY `requestGroup` (`request_group`)
) ENGINE=InnoDB AUTO_INCREMENT=11895 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_queue`
--

DROP TABLE IF EXISTS `android_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_queue_group`
--

DROP TABLE IF EXISTS `android_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `category_ids` text,
  `url` text,
  `title` text,
  `message` text,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`)
) ENGINE=InnoDB AUTO_INCREMENT=24683 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_repeat_schedule`
--

DROP TABLE IF EXISTS `android_repeat_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_repeat_schedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `segment_key` varchar(20) NOT NULL,
  `is_daily` tinyint(1) DEFAULT '0',
  `is_weekly` tinyint(1) DEFAULT '0',
  `is_monthly` tinyint(1) DEFAULT '0',
  `day_0` tinyint(1) DEFAULT '0' COMMENT '日曜日',
  `day_1` tinyint(1) DEFAULT '0' COMMENT '月曜日',
  `day_2` tinyint(1) DEFAULT '0' COMMENT '火曜日',
  `day_3` tinyint(1) DEFAULT '0' COMMENT '水曜日',
  `day_4` tinyint(1) DEFAULT '0' COMMENT '木曜日',
  `day_5` tinyint(1) DEFAULT '0' COMMENT '金曜日',
  `day_6` tinyint(1) DEFAULT '0' COMMENT '土曜日',
  `week_num` tinyint(1) DEFAULT '0' COMMENT '第何◯曜日か',
  `day` int(2) DEFAULT '0' COMMENT '日にち',
  `hour` int(2) DEFAULT '0' COMMENT '時',
  `minutes` int(2) DEFAULT '0' COMMENT '分',
  `status` tinyint(1) DEFAULT '0' COMMENT '0: Active, 1:Stop',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_schedule`
--

DROP TABLE IF EXISTS `android_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_schedule` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL COMMENT '通知方式：1=GCM、2=C2DM',
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `segment_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_schedule_individual`
--

DROP TABLE IF EXISTS `android_schedule_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_schedule_individual` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(1) NOT NULL COMMENT '通知方式：1=GCM、2=C2DM',
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `request_group` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cb_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_schedule_segment`
--

DROP TABLE IF EXISTS `android_schedule_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_schedule_segment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `segment_key` varchar(20) NOT NULL,
  `type` int(1) DEFAULT '0' COMMENT '1: Category, 2: OS, 3, DeviceName, 4: Location, 5: Term',
  `category_id` int(3) DEFAULT NULL,
  `category_value` varchar(40) DEFAULT NULL,
  `device_name` varchar(40) DEFAULT NULL,
  `os_version` varchar(40) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `radius` int(8) DEFAULT NULL,
  `term_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `term_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`segment_key`),
  KEY `idx3` (`type`),
  KEY `idx4` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_survey_balancing_queue`
--

DROP TABLE IF EXISTS `android_survey_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_survey_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `questionnaire_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  `device_token` text NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `configId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_survey_history`
--

DROP TABLE IF EXISTS `android_survey_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_survey_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `queue_group` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_survey_queue_group`
--

DROP TABLE IF EXISTS `android_survey_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_survey_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_token`
--

DROP TABLE IF EXISTS `android_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_token` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` tinyint(2) NOT NULL,
  `device_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '端末名',
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'OSバージョン',
  `latitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `longitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `token_index` (`device_token`(255))
) ENGINE=InnoDB AUTO_INCREMENT=76504217 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_token_count`
--

DROP TABLE IF EXISTS `android_token_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_token_count` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `sub_category_id` int(10) DEFAULT '0',
  `device_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '端末名',
  `os_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'OSバージョン',
  `user_id` int(10) DEFAULT '0',
  `count` int(10) DEFAULT '0',
  `is_os` int(1) NOT NULL DEFAULT '0' COMMENT '0: OS以外での集計, 1: OSでの集計',
  `is_device` int(1) NOT NULL DEFAULT '0' COMMENT '0: デバイス名以外での集計, 1: デバイス名での集計',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`config_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_token_relation`
--

DROP TABLE IF EXISTS `android_token_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_token_relation` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `app_user_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `idx` (`config_id`,`app_user_id`),
  KEY `deviceToken` (`device_token`(255))
) ENGINE=InnoDB AUTO_INCREMENT=15784242 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `android_token_research_relation`
--

DROP TABLE IF EXISTS `android_token_research_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `android_token_research_relation` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `uuid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `idx` (`uuid`),
  KEY `idx2` (`device_token`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choice` (
  `choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `questionnaire_id` int(11) NOT NULL DEFAULT '0',
  `num` int(3) NOT NULL DEFAULT '0' COMMENT '何問目の選択肢か',
  `choice_index` int(3) NOT NULL DEFAULT '0' COMMENT '何問目の何番目の選択肢か',
  `text` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '選択肢の内容',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`choice_id`),
  KEY `idx1` (`user_id`),
  KEY `idx2` (`questionnaire_id`),
  KEY `idx3` (`num`),
  KEY `idx4` (`choice_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_forum_data`
--

DROP TABLE IF EXISTS `contact_forum_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_forum_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `thread_id` int(10) NOT NULL DEFAULT '0',
  `type` varchar(40) NOT NULL DEFAULT '',
  `body` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_checked` tinyint(1) NOT NULL DEFAULT '0',
  `user_checked` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`),
  KEY `admin_checked` (`admin_checked`),
  KEY `user_checked` (`user_checked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_history`
--

DROP TABLE IF EXISTS `contact_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `body` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_checked` tinyint(1) NOT NULL DEFAULT '0',
  `user_checked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `admin_checked` (`admin_checked`),
  KEY `user_checked` (`user_checked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_type` int(1) NOT NULL COMMENT '1:資料請求、2:問い合わせ、3:会員登録済み',
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contents` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL COMMENT '状態（仮作成）',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='見込み顧客';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `d_answer`
--

DROP TABLE IF EXISTS `d_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `d_answer` (
  `d_choice_id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL DEFAULT '0',
  `num` int(3) NOT NULL DEFAULT '0' COMMENT '何問目の選択肢か',
  `choice_index` int(3) NOT NULL DEFAULT '0' COMMENT '何問目の何番目の選択肢か',
  `text` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `platform` int(2) NOT NULL DEFAULT '0' COMMENT '1: iOS, 2: Android',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`d_choice_id`),
  KEY `idx1` (`questionnaire_id`),
  KEY `idx2` (`num`),
  KEY `idx3` (`choice_index`),
  KEY `idx4` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_log_android`
--

DROP TABLE IF EXISTS `error_log_android`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log_android` (
  `error_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1:DEBUG, 2:INFO, 3:WARN, 4:ERROR, 5:FATAL',
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'エラー内容など',
  `server` varchar(100) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT 'エラー発生サーバ',
  `filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'エラー発生PHPファイル名',
  `function` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT 'エラー発生関数（関数以外の場合は空）',
  `complete_flg` tinyint(2) NOT NULL DEFAULT '0' COMMENT '対応完了フラグ 0:未完了、1:完了',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`error_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_log_ios`
--

DROP TABLE IF EXISTS `error_log_ios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log_ios` (
  `error_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1:DEBUG, 2:INFO, 3:WARN, 4:ERROR, 5:FATAL',
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'エラー内容など',
  `server` varchar(100) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT 'エラー発生サーバ',
  `filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'エラー発生PHPファイル名',
  `function` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT 'エラー発生関数（関数以外の場合は空）',
  `complete_flg` tinyint(2) NOT NULL DEFAULT '0' COMMENT '対応完了フラグ 0:未完了、1:完了',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`error_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense` (
  `user_id` int(10) NOT NULL,
  `OS` int(11) NOT NULL COMMENT '1:iOS 2:Android OS',
  `config_id` int(10) NOT NULL,
  `config_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `plan` int(1) NOT NULL,
  `token_count` int(10) NOT NULL,
  `year` varchar(4) CHARACTER SET latin1 NOT NULL,
  `month` varchar(2) CHARACTER SET latin1 NOT NULL,
  `save_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geo_event`
--

DROP TABLE IF EXISTS `geo_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_event` (
  `event_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `radius` int(10) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `interval` int(10) NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `finish` tinyint(1) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `information_id` int(10) NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_ab_base`
--

DROP TABLE IF EXISTS `iphone_ab_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_ab_base` (
  `ab_base_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ab_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ab_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_ab_log`
--

DROP TABLE IF EXISTS `iphone_ab_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_ab_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) DEFAULT NULL,
  `ab_time_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `queue_group` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `device_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `device_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `device_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `os_version` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `action_key` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iphone_ab_log_id_uindex` (`id`),
  KEY `iphone_ab_log_action_key_index` (`action_key`),
  KEY `iphone_ab_log_ab_base_id_index` (`ab_base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_ab_time`
--

DROP TABLE IF EXISTS `iphone_ab_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_ab_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) NOT NULL,
  `time_to_start` datetime DEFAULT NULL,
  `time_to_limit` datetime DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_reserve` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_ab_tmp`
--

DROP TABLE IF EXISTS `iphone_ab_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_ab_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) DEFAULT NULL,
  `ab_time_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `ab_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `time_to_start` datetime DEFAULT NULL,
  `time_to_limit` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `device_token` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `push_type` tinyint(4) DEFAULT NULL,
  `queueGroup` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `code` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `token_id` int(11) DEFAULT NULL,
  `message_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iphone_ab_tmp_id_uindex` (`id`),
  KEY `ab_base_id` (`ab_base_id`),
  KEY `ab_time_id` (`ab_time_id`),
  KEY `config_id` (`config_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_action_label`
--

DROP TABLE IF EXISTS `iphone_action_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_action_label` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT 'アプリの設定キー',
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '3桁数値のアクションキー',
  `action_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクション名',
  `use_flg` tinyint(1) DEFAULT '1' COMMENT '1:使用する, 2:使用しない',
  PRIMARY KEY (`action_id`),
  KEY `config_id` (`config_id`),
  KEY `action_key` (`action_key`),
  KEY `use_flg` (`use_flg`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_balancing_queue`
--

DROP TABLE IF EXISTS `iphone_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `category_id` text NOT NULL,
  `device_token` text NOT NULL,
  `url` text NOT NULL,
  `message` text NOT NULL,
  `push_type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '0',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `idx3` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_config`
--

DROP TABLE IF EXISTS `iphone_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_config` (
  `config_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `pem_production` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '本番環境用pemファイル',
  `pem_sandbox` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '開発環境用pemファイル',
  `status` int(1) NOT NULL COMMENT '1:入金確認 2:利用可能 3:一時停止 4:停止',
  `plan` int(1) NOT NULL COMMENT 'plan nonuse:0 free:1 / standard:2 / professional:3',
  `project_id` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `private_key` text COLLATE utf8_unicode_ci,
  `client_email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_fcm` int(1) DEFAULT NULL,
  `bundle_id` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_key` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`config_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `iphone_config_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_config_category`
--

DROP TABLE IF EXISTS `iphone_config_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_config_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_config_key`
--

DROP TABLE IF EXISTS `iphone_config_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_config_key` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0:非アクティブ、1:アクティブ',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_config_sub_category`
--

DROP TABLE IF EXISTS `iphone_config_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_config_sub_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `sub_category_id` int(2) NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_error_remove_reserve`
--

DROP TABLE IF EXISTS `iphone_error_remove_reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_error_remove_reserve` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(20) NOT NULL,
  `type` int(1) DEFAULT '0' COMMENT '1: status_code IN (1,2,4), 2: status_code NOT IN (1,2,4), 3: ALL',
  `finish_flg` tinyint(1) DEFAULT '0' COMMENT '0: 未実行, 1: 実行済み',
  `total` int(10) DEFAULT '0' COMMENT 'エラー総数',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`schedule_id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`),
  KEY `idx3` (`finish_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_error_token`
--

DROP TABLE IF EXISTS `iphone_error_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_error_token` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_id` int(10) NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status_code` int(4) DEFAULT '0',
  `status_message` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `is_resend` int(1) DEFAULT '0',
  `is_delete` int(1) DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `idx` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_error_token_rich`
--

DROP TABLE IF EXISTS `iphone_error_token_rich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_error_token_rich` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_id` int(10) NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status_code` int(4) DEFAULT '0',
  `status_message` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `is_resend` int(1) DEFAULT '0',
  `is_delete` int(1) DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`config_id`),
  KEY `idx3` (`device_token`(255)),
  KEY `idx4` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_expenses`
--

DROP TABLE IF EXISTS `iphone_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_expenses` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `year` int(4) NOT NULL DEFAULT '1',
  `month` int(2) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_geo_notify`
--

DROP TABLE IF EXISTS `iphone_geo_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_geo_notify` (
  `geo_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL COMMENT 'geo_event.event_id',
  `config_id` int(10) NOT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_history`
--

DROP TABLE IF EXISTS `iphone_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_history_segment`
--

DROP TABLE IF EXISTS `iphone_history_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_history_segment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `history_id` int(10) DEFAULT NULL,
  `queue_group` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(3) DEFAULT NULL,
  `category_value` varchar(40) DEFAULT NULL,
  `device_name` varchar(40) DEFAULT NULL,
  `os_version` varchar(40) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `radius` int(8) DEFAULT NULL,
  `term_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `term_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`history_id`),
  KEY `idx3` (`queue_group`),
  KEY `idx4` (`config_id`,`category_id`,`category_value`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_last_plan`
--

DROP TABLE IF EXISTS `iphone_last_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_last_plan` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_multi_category`
--

DROP TABLE IF EXISTS `iphone_multi_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_multi_category` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(10) DEFAULT NULL,
  `category_value` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`config_id`,`category_id`),
  KEY `deviceToken` (`device_token`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_panelist_balancing_queue`
--

DROP TABLE IF EXISTS `iphone_panelist_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_panelist_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `questionnaire_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `config_id` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_panelist_history`
--

DROP TABLE IF EXISTS `iphone_panelist_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_panelist_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `queue_group` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_panelist_queue_group`
--

DROP TABLE IF EXISTS `iphone_panelist_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_panelist_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_pem_status`
--

DROP TABLE IF EXISTS `iphone_pem_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_pem_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0: 期限切れ、1: 正常、2: 期限間近',
  `expire` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_id` (`config_id`),
  KEY `index1` (`user_id`),
  KEY `index2` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_push_request_queue`
--

DROP TABLE IF EXISTS `iphone_push_request_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_push_request_queue` (
  `queue_id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `custom_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `send_flg` tinyint(1) DEFAULT '0' COMMENT '0: 未送信、1: 送信済み',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `badge` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_key` varchar(300) COLLATE utf8_unicode_ci DEFAULT '',
  `request_group` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_queue`
--

DROP TABLE IF EXISTS `iphone_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_queue_group`
--

DROP TABLE IF EXISTS `iphone_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `category_ids` text,
  `url` text,
  `message` text,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_repeat_schedule`
--

DROP TABLE IF EXISTS `iphone_repeat_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_repeat_schedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `segment_key` varchar(20) NOT NULL,
  `is_daily` tinyint(1) DEFAULT '0',
  `is_weekly` tinyint(1) DEFAULT '0',
  `is_monthly` tinyint(1) DEFAULT '0',
  `day_0` tinyint(1) DEFAULT '0' COMMENT '日曜日',
  `day_1` tinyint(1) DEFAULT '0' COMMENT '月曜日',
  `day_2` tinyint(1) DEFAULT '0' COMMENT '火曜日',
  `day_3` tinyint(1) DEFAULT '0' COMMENT '水曜日',
  `day_4` tinyint(1) DEFAULT '0' COMMENT '木曜日',
  `day_5` tinyint(1) DEFAULT '0' COMMENT '金曜日',
  `day_6` tinyint(1) DEFAULT '0' COMMENT '土曜日',
  `week_num` tinyint(1) DEFAULT '0' COMMENT '第何◯曜日か',
  `day` int(2) DEFAULT '0' COMMENT '日にち',
  `hour` int(2) DEFAULT '0' COMMENT '時',
  `minutes` int(2) DEFAULT '0' COMMENT '分',
  `status` tinyint(1) DEFAULT '0' COMMENT '0: Active, 1:Stop',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_rich_balancing_queue`
--

DROP TABLE IF EXISTS `iphone_rich_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_rich_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `category_id` text NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `device_token` text NOT NULL,
  `file_type` int(1) NOT NULL,
  `file` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `push_type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `configId` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_rich_file`
--

DROP TABLE IF EXISTS `iphone_rich_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_rich_file` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `file_type` int(1) NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `expire` datetime NOT NULL,
  `is_delete` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  PRIMARY KEY (`file_id`),
  KEY `idx1` (`user_id`),
  KEY `idx2` (`file_type`),
  KEY `idx3` (`user_id`),
  KEY `idx4` (`is_delete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_rich_history`
--

DROP TABLE IF EXISTS `iphone_rich_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_rich_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` int(1) NOT NULL,
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_rich_queue_group`
--

DROP TABLE IF EXISTS `iphone_rich_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_rich_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `category_ids` text COLLATE utf8_unicode_ci,
  `category` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` int(1) NOT NULL,
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_rich_schedule`
--

DROP TABLE IF EXISTS `iphone_rich_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_rich_schedule` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `file_type` int(1) NOT NULL,
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `segment_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `configId` (`config_id`),
  KEY `finish` (`finish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_schedule`
--

DROP TABLE IF EXISTS `iphone_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_schedule` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `segment_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_schedule_individual`
--

DROP TABLE IF EXISTS `iphone_schedule_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_schedule_individual` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(1) NOT NULL COMMENT '通知方式：1=GCM、2=C2DM',
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `request_group` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cb_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_schedule_segment`
--

DROP TABLE IF EXISTS `iphone_schedule_segment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_schedule_segment` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `segment_key` varchar(20) NOT NULL,
  `type` int(1) DEFAULT '0' COMMENT '1: Category, 2: OS, 3, DeviceName, 4: Location, 5: Term',
  `category_id` int(3) DEFAULT NULL,
  `category_value` varchar(40) DEFAULT NULL,
  `device_name` varchar(40) DEFAULT NULL,
  `os_version` varchar(40) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `radius` int(8) DEFAULT NULL,
  `term_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `term_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`segment_key`),
  KEY `idx3` (`type`),
  KEY `idx4` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_survey_balancing_queue`
--

DROP TABLE IF EXISTS `iphone_survey_balancing_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_survey_balancing_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(30) NOT NULL,
  `queue_index` int(10) NOT NULL DEFAULT '1',
  `questionnaire_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `uuid` varchar(128) NOT NULL,
  `device_token` text NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `configId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_survey_history`
--

DROP TABLE IF EXISTS `iphone_survey_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_survey_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `queue_group` (`queue_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_survey_queue_group`
--

DROP TABLE IF EXISTS `iphone_survey_queue_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_survey_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`),
  KEY `questionnaire_id` (`questionnaire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_token`
--

DROP TABLE IF EXISTS `iphone_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_token` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` tinyint(2) NOT NULL,
  `device_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '端末名',
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'OSバージョン',
  `latitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `longitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fcm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `token_index` (`device_token`(255))
) ENGINE=InnoDB AUTO_INCREMENT=801 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_token_count`
--

DROP TABLE IF EXISTS `iphone_token_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_token_count` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `sub_category_id` int(10) DEFAULT '0',
  `device_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '端末名',
  `os_version` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'OSバージョン',
  `user_id` int(10) DEFAULT '0',
  `count` int(10) DEFAULT '0',
  `is_device` int(1) NOT NULL DEFAULT '0' COMMENT '0: デバイス名以外での集計, 1: デバイス名での集計',
  `is_os` int(1) NOT NULL DEFAULT '0' COMMENT '0: OS以外での集計, 1: OSでの集計',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`config_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_token_relation`
--

DROP TABLE IF EXISTS `iphone_token_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_token_relation` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `app_user_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `idx` (`config_id`,`app_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_token_research_relation`
--

DROP TABLE IF EXISTS `iphone_token_research_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_token_research_relation` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `uuid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `idx` (`uuid`),
  KEY `idx2` (`device_token`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `iphone_token_rich`
--

DROP TABLE IF EXISTS `iphone_token_rich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iphone_token_rich` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` tinyint(2) NOT NULL,
  `device_id` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '端末名',
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'OSバージョン',
  `latitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `longitude` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `token_index` (`device_token`(255)),
  KEY `cateory` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `level` int(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '発生場所',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=255316 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ログ格納テーブル';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oem_user`
--

DROP TABLE IF EXISTS `oem_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oem_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_domain` varchar(40) DEFAULT NULL COMMENT 'サブドメイン',
  `user_id` int(10) NOT NULL,
  `manage_user_id` int(10) DEFAULT NULL,
  `is_manager` tinyint(1) DEFAULT '0' COMMENT '0:一般、1:管理者',
  `copyright` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`sub_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panelist_history`
--

DROP TABLE IF EXISTS `panelist_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panelist_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `questionnaire_id` int(10) DEFAULT NULL,
  `panelist_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `ios_data` text COLLATE utf8_unicode_ci NOT NULL,
  `android_data` text COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  KEY `panelist_group` (`panelist_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `push_count`
--

DROP TABLE IF EXISTS `push_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_count` (
  `config_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `date` date NOT NULL,
  `android_count` int(11) NOT NULL DEFAULT '0',
  `ios_count` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `push_count_config_id_date_idx` (`config_id`,`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `questionnaire_id` int(11) NOT NULL DEFAULT '0',
  `num` int(3) NOT NULL DEFAULT '0' COMMENT '何問目の選択肢か',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '1: 選択肢、2: フリーワード',
  `text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '問題の内容',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`),
  KEY `idx1` (`user_id`),
  KEY `idx2` (`questionnaire_id`),
  KEY `idx3` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questionnaire`
--

DROP TABLE IF EXISTS `questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionnaire` (
  `questionnaire_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `title` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(3) NOT NULL DEFAULT '1',
  `thankyou` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'サンキュー画面',
  `start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `send_flg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '送信済みフラグ 0:未送信、1:送信済み',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`questionnaire_id`),
  KEY `idx1` (`user_id`),
  KEY `idx2` (`send_flg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ユーザID',
  `company` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '名前',
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `login_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ログインID',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'パスワード',
  `mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'メールアドレス',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登録日',
  `reg_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0:利用可能状態 / 1:メールアドレス確認状態 / 2:審査状態 / 3:利用停止状態',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1796 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_option`
--

DROP TABLE IF EXISTS `user_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_option` (
  `user_id` int(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:利用中 1:停止中',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最終更新日時',
  `comment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'コメント'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


INSERT INTO `user` (`user_id`, `company`, `name`, `address`, `tel`, `login_id`, `password`, `mail`, `reg_date`, `reg_key`, `status`) VALUES
('1', 'admin company', 'admin name', 'admin address', '123456', 'cp-admin', 'a13f54aaee45293a8318fd0f27cbf605', 'test@test.com', '2020-04-24 07:22:00', NULL, '0'),
('1793', 'root company', 'root name', 'root address', '123456', 'wanyay', '626348da744faee616f49f52d68bd719', 'test@test.com', '2020-04-24 16:22:00', NULL, '0');

INSERT INTO `iphone_config` (`config_id`, `config_name`, `user_id`, `pem_production`, `pem_sandbox`, `status`, `plan`, `project_id`, `private_key`, `client_email`, `use_fcm`, `bundle_id`, `auth_key`) VALUES
('1', 'iOSCoreASP', '1793', 'Bag Attributes\r\n    friendlyName: Apple Push Services: asia.seasoft.corepush\r\n    localKeyID: 9C 92 92 C0 4B 68 1C 24 BF 6E 8A BB 1F 58 70 4B 6A 05 A5 EA \r\nsubject=/UID=asia.seasoft.corepush/CN=Apple Push Services: asia.seasoft.corepush/OU=7XE8AX56C2/O=SEASOFT TECHNOLOGY VIETNAM COMPANY LIMITED/C=VN\r\nissuer=/C=US/O=Apple Inc./OU=Apple Worldwide Developer Relations/CN=Apple Worldwide Developer Relations Certification Authority\r\n-----BEGIN CERTIFICATE-----\r\nMIIGRTCCBS2gAwIBAgIIQQAx7EvUWFcwDQYJKoZIhvcNAQELBQAwgZYxCzAJBgNV\r\nBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMSwwKgYDVQQLDCNBcHBsZSBXb3Js\r\nZHdpZGUgRGV2ZWxvcGVyIFJlbGF0aW9uczFEMEIGA1UEAww7QXBwbGUgV29ybGR3\r\naWRlIERldmVsb3BlciBSZWxhdGlvbnMgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkw\r\nHhcNMjAwNjEyMDUwMDExWhcNMjEwNzEyMDUwMDExWjCBszElMCMGCgmSJomT8ixk\r\nAQEMFWFzaWEuc2Vhc29mdC5jb3JlcHVzaDEzMDEGA1UEAwwqQXBwbGUgUHVzaCBT\r\nZXJ2aWNlczogYXNpYS5zZWFzb2Z0LmNvcmVwdXNoMRMwEQYDVQQLDAo3WEU4QVg1\r\nNkMyMTMwMQYDVQQKDCpTRUFTT0ZUIFRFQ0hOT0xPR1kgVklFVE5BTSBDT01QQU5Z\r\nIExJTUlURUQxCzAJBgNVBAYTAlZOMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB\r\nCgKCAQEA3luAK+Q5QrxuQdPkOB2hK71IHyUPljxPOe16ciZNt9SClQbvPnCYhqVF\r\nUxo2bFJ4UkXJJbpj3/cpg5cPJNkmmlbM3f2JVHyZx+I2OIsfigZeTljz5xqByc7W\r\nmGNjYhFKkfCXpco0Wb5YIjCe1SmHqX2WTe1010HAIknAZylRT0RQ5kq7hQMCF8ov\r\nhJI9yrRj5WaUbJw9ZYT+Z63R6VigrCIoDOJkJI8iUbXm+WrShAbl76b6DChZ580N\r\no9EXBKwJoXPRv7+cByhGXrjVeWfHLfxNoLfRwelbew0EM0c1+/YF/ODIfTrTBmbD\r\n1iF/TVNW4YgXPJyW9RXi0WsCHkAY5QIDAQABo4ICdjCCAnIwDAYDVR0TAQH/BAIw\r\nADAfBgNVHSMEGDAWgBSIJxcJqbYYYIvs67r2R1nFUlSjtzCCARwGA1UdIASCARMw\r\nggEPMIIBCwYJKoZIhvdjZAUBMIH9MIHDBggrBgEFBQcCAjCBtgyBs1JlbGlhbmNl\r\nIG9uIHRoaXMgY2VydGlmaWNhdGUgYnkgYW55IHBhcnR5IGFzc3VtZXMgYWNjZXB0\r\nYW5jZSBvZiB0aGUgdGhlbiBhcHBsaWNhYmxlIHN0YW5kYXJkIHRlcm1zIGFuZCBj\r\nb25kaXRpb25zIG9mIHVzZSwgY2VydGlmaWNhdGUgcG9saWN5IGFuZCBjZXJ0aWZp\r\nY2F0aW9uIHByYWN0aWNlIHN0YXRlbWVudHMuMDUGCCsGAQUFBwIBFilodHRwOi8v\r\nd3d3LmFwcGxlLmNvbS9jZXJ0aWZpY2F0ZWF1dGhvcml0eTATBgNVHSUEDDAKBggr\r\nBgEFBQcDAjAwBgNVHR8EKTAnMCWgI6Ahhh9odHRwOi8vY3JsLmFwcGxlLmNvbS93\r\nd2RyY2EuY3JsMB0GA1UdDgQWBBSckpLAS2gcJL9uirsfWHBLagWl6jAOBgNVHQ8B\r\nAf8EBAMCB4AwEAYKKoZIhvdjZAYDAQQCBQAwEAYKKoZIhvdjZAYDAgQCBQAwgYYG\r\nCiqGSIb3Y2QGAwYEeDB2DBVhc2lhLnNlYXNvZnQuY29yZXB1c2gwBQwDYXBwDBph\r\nc2lhLnNlYXNvZnQuY29yZXB1c2gudm9pcDAGDAR2b2lwDCJhc2lhLnNlYXNvZnQu\r\nY29yZXB1c2guY29tcGxpY2F0aW9uMA4MDGNvbXBsaWNhdGlvbjANBgkqhkiG9w0B\r\nAQsFAAOCAQEAnp8SBbURTOw+F64t+nmD+/0t/Ixon5NLrt+pH2IAgAUqTqg94U5f\r\nep/cj0RPX0LJk1uMNj1DzSE0RLKaT70du85U4IoNIBr93KfU71CIW+K+C/vuUAIm\r\nBcQr8ZAypWYC5F8KLPLcxc4ME2wmfi+k35J0rpawBD5O0tkOzK1j9RRdezHskFR3\r\nqE3UqesbNjfobDS0zwdHYhSgVZpjUREj09j6DSh7o+lvodEY1qrcXeL0e6m8SsiE\r\nSIFFr+ZkzDBIps6AUuUmjmavobh1RoFmE7u+1TdhMCdryuvOheg6IHHnl4YAU4Hc\r\nUz8HiwmLniG4kFsRn6vuFFrXe+TzRGAvLA==\r\n-----END CERTIFICATE-----\r\nBag Attributes\r\n    friendlyName: Quang Tri\r\n    localKeyID: 9C 92 92 C0 4B 68 1C 24 BF 6E 8A BB 1F 58 70 4B 6A 05 A5 EA \r\nKey Attributes: <No Attributes>\r\n-----BEGIN PRIVATE KEY-----\r\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDeW4Ar5DlCvG5B\r\n0+Q4HaErvUgfJQ+WPE857XpyJk231IKVBu8+cJiGpUVTGjZsUnhSRcklumPf9ymD\r\nlw8k2SaaVszd/YlUfJnH4jY4ix+KBl5OWPPnGoHJztaYY2NiEUqR8JelyjRZvlgi\r\nMJ7VKYepfZZN7XTXQcAiScBnKVFPRFDmSruFAwIXyi+Ekj3KtGPlZpRsnD1lhP5n\r\nrdHpWKCsIigM4mQkjyJRteb5atKEBuXvpvoMKFnnzQ2j0RcErAmhc9G/v5wHKEZe\r\nuNV5Z8ct/E2gt9HB6Vt7DQQzRzX79gX84Mh9OtMGZsPWIX9NU1bhiBc8nJb1FeLR\r\nawIeQBjlAgMBAAECggEAX3RcU3tH8ZQ+qNezsztVAxfgrC4WwOHnCPEfjX1QA8ig\r\nviUZ824WrEaqugAYuOu2Z2s57I5VbcIG+kyQ3bqyzbLRg8Lhf3l18s7zg9aFlZUi\r\nSvP40I8ahG3cxdJ0yZausnPcRfnF+3ixEQxaQxvu9x3Itm9npzi8qHuMszyTgTj/\r\nY4pXMkP6p27JYjEv+OkVa4iP2IhAftOmZarch6wfX15fxuSmRL4xqtMLA+dm73zr\r\nv4ISZh5g6s9zGMUxnxmAmAW5Obt4MKdEnshTy68gJHuvtb4zxIQdoLn8KGx6TyjJ\r\n0VM0rB8BdbdPP1IooYw40Et/xezwhVK2b/BNhgp0AQKBgQD9Rt609mc3bOVJbYV3\r\nBErx9rTUmOkjjUQVV8i8D9Qkp9YWaPIAFbzqhOLXwVMygo3W8mLR4FJo9j+s0EX7\r\nUO77xGECV1sTJSoQxYXY+6NE7NQBZqqukXtIqJcr16Phsix6lHbbc/D1GDgSNIWE\r\nh7gpbjWIWNrXP2/P/QDUv1EDgQKBgQDgv4bco98+3wB7AB1MoADRc4tfw8G5KfIi\r\nuLZG1ePamYKLj0LyillkwnaFWx7u6Cjv3aOAFkgOKOQTyiHOs3k2ZW7PoZEDSRx/\r\nnJykaOv7so34wT/qgxt8o7GCqCz1cLjrmtCMR8RwPaFtashB278B4NbFQRKn50Pg\r\nP/Y9HAk3ZQKBgQCOPez5aKDTKd8je9TG4KxOc6Ve+HmGs+GWsvRTWfhklbXQZCP1\r\nFEBC3VqgnTxiU5vhKcOB5x+hPxrHrTiAShXNY56vt+u4NtkHDkd7cudg4Di4iLY2\r\n0BGS3sv3nWW2bWA5f4O4/8ZFf9KNtt19btNowTJjXrOYy1G6V3bOBJw1AQKBgCER\r\nrVtLtW5/y4dNpgH/TP+Em85UdG21UU5wlUlo8WTZz46PXs9nMe4UevH2TV/jwxpA\r\nJ22SWbnTpHOQ+1Z5q+0oEZz1bevo1wuj1JyQX6CiTid679emwOWfBGBwNGVM17i7\r\nB9KMQMgvGVCLNLoUBk/VcGSHxaH08lTNtIKbXHPNAoGBAKMH4fdWkos9V30cDEjY\r\njNSXD7dK5tP/OVaAyHxoB4hUWNyJl5xVauNR/D7nYbPmsulaFm8GjoWmnteqHrJx\r\nVe+ZQ0gAN8Qf/5LRGrXVJwx2i7Cb2b3eUg3RdmzM+F9Fp2r6PSAwAF0IQimAOQGs\r\nBl6lZkklRerCixhKKjYwz+0C\r\n-----END PRIVATE KEY-----', 'Bag Attributes\r\n    friendlyName: Apple Development IOS Push Services: asia.seasoft.corepush\r\n    localKeyID: 9C 92 92 C0 4B 68 1C 24 BF 6E 8A BB 1F 58 70 4B 6A 05 A5 EA \r\nsubject=/UID=asia.seasoft.corepush/CN=Apple Development IOS Push Services: asia.seasoft.corepush/OU=7XE8AX56C2/C=VN\r\nissuer=/C=US/O=Apple Inc./OU=Apple Worldwide Developer Relations/CN=Apple Worldwide Developer Relations Certification Authority\r\n-----BEGIN CERTIFICATE-----\r\nMIIFjzCCBHegAwIBAgIIGiksI3dGGNMwDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV\r\nBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMSwwKgYDVQQLDCNBcHBsZSBXb3Js\r\nZHdpZGUgRGV2ZWxvcGVyIFJlbGF0aW9uczFEMEIGA1UEAww7QXBwbGUgV29ybGR3\r\naWRlIERldmVsb3BlciBSZWxhdGlvbnMgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkw\r\nHhcNMjAwNjEyMDQ1OTQ1WhcNMjEwNjEyMDQ1OTQ1WjCBjjElMCMGCgmSJomT8ixk\r\nAQEMFWFzaWEuc2Vhc29mdC5jb3JlcHVzaDFDMEEGA1UEAww6QXBwbGUgRGV2ZWxv\r\ncG1lbnQgSU9TIFB1c2ggU2VydmljZXM6IGFzaWEuc2Vhc29mdC5jb3JlcHVzaDET\r\nMBEGA1UECwwKN1hFOEFYNTZDMjELMAkGA1UEBhMCVk4wggEiMA0GCSqGSIb3DQEB\r\nAQUAA4IBDwAwggEKAoIBAQDeW4Ar5DlCvG5B0+Q4HaErvUgfJQ+WPE857XpyJk23\r\n1IKVBu8+cJiGpUVTGjZsUnhSRcklumPf9ymDlw8k2SaaVszd/YlUfJnH4jY4ix+K\r\nBl5OWPPnGoHJztaYY2NiEUqR8JelyjRZvlgiMJ7VKYepfZZN7XTXQcAiScBnKVFP\r\nRFDmSruFAwIXyi+Ekj3KtGPlZpRsnD1lhP5nrdHpWKCsIigM4mQkjyJRteb5atKE\r\nBuXvpvoMKFnnzQ2j0RcErAmhc9G/v5wHKEZeuNV5Z8ct/E2gt9HB6Vt7DQQzRzX7\r\n9gX84Mh9OtMGZsPWIX9NU1bhiBc8nJb1FeLRawIeQBjlAgMBAAGjggHlMIIB4TAJ\r\nBgNVHRMEAjAAMB8GA1UdIwQYMBaAFIgnFwmpthhgi+zruvZHWcVSVKO3MIIBDwYD\r\nVR0gBIIBBjCCAQIwgf8GCSqGSIb3Y2QFATCB8TCBwwYIKwYBBQUHAgIwgbYMgbNS\r\nZWxpYW5jZSBvbiB0aGlzIGNlcnRpZmljYXRlIGJ5IGFueSBwYXJ0eSBhc3N1bWVz\r\nIGFjY2VwdGFuY2Ugb2YgdGhlIHRoZW4gYXBwbGljYWJsZSBzdGFuZGFyZCB0ZXJt\r\ncyBhbmQgY29uZGl0aW9ucyBvZiB1c2UsIGNlcnRpZmljYXRlIHBvbGljeSBhbmQg\r\nY2VydGlmaWNhdGlvbiBwcmFjdGljZSBzdGF0ZW1lbnRzLjApBggrBgEFBQcCARYd\r\naHR0cDovL3d3dy5hcHBsZS5jb20vYXBwbGVjYS8wEwYDVR0lBAwwCgYIKwYBBQUH\r\nAwIwTQYDVR0fBEYwRDBCoECgPoY8aHR0cDovL2RldmVsb3Blci5hcHBsZS5jb20v\r\nY2VydGlmaWNhdGlvbmF1dGhvcml0eS93d2RyY2EuY3JsMB0GA1UdDgQWBBSckpLA\r\nS2gcJL9uirsfWHBLagWl6jALBgNVHQ8EBAMCB4AwEAYKKoZIhvdjZAYDAQQCBQAw\r\nDQYJKoZIhvcNAQEFBQADggEBABWKI6haUcEdWFDK7sWWSi0kFubZCAYCVMxuXFOl\r\nLYyA3P4rw3ArZSIhwN4+djlioazeG5C6ZJvBCR9nY5cUBebeC8+cwDNNdIKkOcYA\r\nNpPYALLRBAspCdEuT7F6Ll66OG4TSPifxUXZ2g6GcN9GYLLNDnbXeOAoYlaaU11z\r\n7ZEwX7Qpe7aHNss2OuDqtbwqNFGQD6McOh37QRhopxpUYV6iBhO4pbk9qKPPeH9N\r\nBywokwC8iKbBfBFi19Bhl/0gDdabaQPEGfU19Qc0rmb/VjrLbfc8JA/EZIwln6hY\r\nf3E1xQCNikn7MakkHJwdreuyR3ISh0zKejRdS7/wBYRPCEk=\r\n-----END CERTIFICATE-----\r\nBag Attributes\r\n    friendlyName: Quang Tri\r\n    localKeyID: 9C 92 92 C0 4B 68 1C 24 BF 6E 8A BB 1F 58 70 4B 6A 05 A5 EA \r\nKey Attributes: <No Attributes>\r\n-----BEGIN PRIVATE KEY-----\r\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDeW4Ar5DlCvG5B\r\n0+Q4HaErvUgfJQ+WPE857XpyJk231IKVBu8+cJiGpUVTGjZsUnhSRcklumPf9ymD\r\nlw8k2SaaVszd/YlUfJnH4jY4ix+KBl5OWPPnGoHJztaYY2NiEUqR8JelyjRZvlgi\r\nMJ7VKYepfZZN7XTXQcAiScBnKVFPRFDmSruFAwIXyi+Ekj3KtGPlZpRsnD1lhP5n\r\nrdHpWKCsIigM4mQkjyJRteb5atKEBuXvpvoMKFnnzQ2j0RcErAmhc9G/v5wHKEZe\r\nuNV5Z8ct/E2gt9HB6Vt7DQQzRzX79gX84Mh9OtMGZsPWIX9NU1bhiBc8nJb1FeLR\r\nawIeQBjlAgMBAAECggEAX3RcU3tH8ZQ+qNezsztVAxfgrC4WwOHnCPEfjX1QA8ig\r\nviUZ824WrEaqugAYuOu2Z2s57I5VbcIG+kyQ3bqyzbLRg8Lhf3l18s7zg9aFlZUi\r\nSvP40I8ahG3cxdJ0yZausnPcRfnF+3ixEQxaQxvu9x3Itm9npzi8qHuMszyTgTj/\r\nY4pXMkP6p27JYjEv+OkVa4iP2IhAftOmZarch6wfX15fxuSmRL4xqtMLA+dm73zr\r\nv4ISZh5g6s9zGMUxnxmAmAW5Obt4MKdEnshTy68gJHuvtb4zxIQdoLn8KGx6TyjJ\r\n0VM0rB8BdbdPP1IooYw40Et/xezwhVK2b/BNhgp0AQKBgQD9Rt609mc3bOVJbYV3\r\nBErx9rTUmOkjjUQVV8i8D9Qkp9YWaPIAFbzqhOLXwVMygo3W8mLR4FJo9j+s0EX7\r\nUO77xGECV1sTJSoQxYXY+6NE7NQBZqqukXtIqJcr16Phsix6lHbbc/D1GDgSNIWE\r\nh7gpbjWIWNrXP2/P/QDUv1EDgQKBgQDgv4bco98+3wB7AB1MoADRc4tfw8G5KfIi\r\nuLZG1ePamYKLj0LyillkwnaFWx7u6Cjv3aOAFkgOKOQTyiHOs3k2ZW7PoZEDSRx/\r\nnJykaOv7so34wT/qgxt8o7GCqCz1cLjrmtCMR8RwPaFtashB278B4NbFQRKn50Pg\r\nP/Y9HAk3ZQKBgQCOPez5aKDTKd8je9TG4KxOc6Ve+HmGs+GWsvRTWfhklbXQZCP1\r\nFEBC3VqgnTxiU5vhKcOB5x+hPxrHrTiAShXNY56vt+u4NtkHDkd7cudg4Di4iLY2\r\n0BGS3sv3nWW2bWA5f4O4/8ZFf9KNtt19btNowTJjXrOYy1G6V3bOBJw1AQKBgCER\r\nrVtLtW5/y4dNpgH/TP+Em85UdG21UU5wlUlo8WTZz46PXs9nMe4UevH2TV/jwxpA\r\nJ22SWbnTpHOQ+1Z5q+0oEZz1bevo1wuj1JyQX6CiTid679emwOWfBGBwNGVM17i7\r\nB9KMQMgvGVCLNLoUBk/VcGSHxaH08lTNtIKbXHPNAoGBAKMH4fdWkos9V30cDEjY\r\njNSXD7dK5tP/OVaAyHxoB4hUWNyJl5xVauNR/D7nYbPmsulaFm8GjoWmnteqHrJx\r\nVe+ZQ0gAN8Qf/5LRGrXVJwx2i7Cb2b3eUg3RdmzM+F9Fp2r6PSAwAF0IQimAOQGs\r\nBl6lZkklRerCixhKKjYwz+0C\r\n-----END PRIVATE KEY-----', '1', '2', 'coreasp-d8f88', '-----BEGIN PRIVATE KEY-----\r\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCeHklCrqpeFeWl\r\npbwx9pYRGbvFBTvJoLSXShuBL6jJMk8i2mV3oN0ssIeMbh2to6+TIfpRugrfe8xv\r\n3rhYH5nPIknetxmuE6xP1jmity+rdxzFAxcMyASah3Jrooo+ZJYUBOCnmFh85v7H\r\nfnPqKMnUP7LMfyhAsuwp3i4bHB0LxS+YH3cciiilg3PLujkIQGkkmNEvd50ezHUG\r\nQJ47wJgFFUyhXEIkChgMMAqaw/Aw5hrkFaPY2R63H4hcl4JQF+kNzIii5tyN4Jy1\r\nD0imiGnbsvJ793voEgT/yjMrugc93r411nJhlt6Ys90XO748k3SozO8sk2xc+rpj\r\nyi7j+ZhZAgMBAAECggEAE4FqSYmWhr4YyFMmYNt/LmOISwkW6Qv5ezhZ0EP62bxq\r\nZW2fsB7uFJc/rCPhZrbsmoVJ208iDD5kvTWHyYc3HYWoqzWB5iboeNN/5KzIeqna\r\nU2DK387E5/M8OumgODYxtWKB/EAfmmOR8TY47R1UWJSgZU3Cah4oYrnVN47uSQc7\r\nzl5oImIgS+Wizs1cl2EzAXWGFQauHGREOFUWgHFdJ87Kxqjp4DbXcp013TTjo4js\r\n4Mme8/7uKL+cNC6a325eM3QKpJ77uD56U9f1FH0VhmKKrJhjlirL2aTGDcFqc/L+\r\nV8kGspOKaw5aMAUTUT7JjP8wFqIBcLfvhr4RWpWuiQKBgQDYlOqMZlRjPcY4fRcl\r\n6Mo/Yh/Iglj83IPWevYLY6aHDhU32F9dliNfU7w+tBv9VKyW9iPh+gaPxvK6ELnM\r\nKfDd0kbokMHjLldKbTx915epCe+M3un6j2ASvPlBqBo/g7enAfG/AgKQsQakXDGF\r\nvIHAfzG08Svy3MqVyEdSi8/b3wKBgQC65WnzPHtkJq44p5FXKGXP1Of1vo2rn9S0\r\n3AQ1fWWRbH/yVHiPEM1hFuCU9bRl2ooD+GDC8CLl1jeVfwLKE14cNeYoa4O5yyCe\r\nhPhGei3NeyWsGxEA9Z03QWHPLDQiVHZu/s0AA9P7iUp45JuKkMOHldBDcRAI9kEm\r\nW/ZJZhASxwKBgQDCTtAjSEdbhfeJhIi5BSI2PWWAcZk+uuQ5D7Ygv7WOo07b/G6K\r\nuwFfK/POWa5m2InDIm9M9RDf+0CXOBxJFDO5/0aIrh6VIGVGK7zCtiKlkHlvbCqF\r\nFg6+oPYLNrLd2uFwnyjxEe+VOo1X9jKj5lyOhE7nJBwm1nmWacm7QB4rBwKBgQCb\r\nFa87RV7mlipPnMy/1CfXs8XfZ4XLek9Y3JEpiap0Z+IrxehcXwbtn7wwH0rYkeWg\r\nscQpPnbW3VE2XjSEVlnrctZPiBfAXkvs/k2+vbewIJX8IGGVuDoDFeABt55zNj8o\r\nj4qwjnyi5yPC+YAQFVwK8EfnDrTNmvooyHqwIV8JFQKBgQCbKcA3PolOP7lSokXp\r\nF54eU+Ojf1Z8z6DIsRkouOQktrmADHEeBdUkzyMk3lYBufKXuSuvyKB4s3enBOYL\r\n6I/pIDanQJLX00tQH510jwMPnjhMacuh+k8XUFMX0VDoa5V3PhYkNHk/5OWSoxIU\r\nJreZ866ULn66Qtp5L+eWXouEQw==\r\n-----END PRIVATE KEY-----\r\n', 'firebase-adminsdk-nwwez@coreasp-d8f88.iam.gserviceaccount.com', '1', 'asia.seasoft.corepush', 'AAAAOgmMeJI:APA91bGBHZosiKa47PXv_vcO1ZG3x_SndihxSXf1Ia54SABTOTqhgdFl9sOtDKj92ZOMUuf_QK3D4Z0JOv8uGMzafQ3YJZ1BKX9uc-q5zBZ_rrH-lKqYWZ4-wfkSyu-Jc9i5XnSRKnrB');

INSERT INTO `android_config` (`config_id`, `config_name`, `user_id`, `auth_key`, `status`, `plan`, `client_email`, `project_id`, `private_key`, `use_fcm`) VALUES
('2060', 'SITHU_TEST', '1793', 'AAAAOgmMeJI:APA91bGBHZosiKa47PXv_vcO1ZG3x_SndihxSXf1Ia54SABTOTqhgdFl9sOtDKj92ZOMUuf_QK3D4Z0JOv8uGMzafQ3YJZ1BKX9uc-q5zBZ_rrH-lKqYWZ4-wfkSyu-Jc9i5XnSRKnrB', '1', '2', 'firebase-adminsdk-nwwez@coreasp-d8f88.iam.gserviceaccount.com', 'coreasp-d8f88', '-----BEGIN PRIVATE KEY-----\r\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCeHklCrqpeFeWl\r\npbwx9pYRGbvFBTvJoLSXShuBL6jJMk8i2mV3oN0ssIeMbh2to6+TIfpRugrfe8xv\r\n3rhYH5nPIknetxmuE6xP1jmity+rdxzFAxcMyASah3Jrooo+ZJYUBOCnmFh85v7H\r\nfnPqKMnUP7LMfyhAsuwp3i4bHB0LxS+YH3cciiilg3PLujkIQGkkmNEvd50ezHUG\r\nQJ47wJgFFUyhXEIkChgMMAqaw/Aw5hrkFaPY2R63H4hcl4JQF+kNzIii5tyN4Jy1\r\nD0imiGnbsvJ793voEgT/yjMrugc93r411nJhlt6Ys90XO748k3SozO8sk2xc+rpj\r\nyi7j+ZhZAgMBAAECggEAE4FqSYmWhr4YyFMmYNt/LmOISwkW6Qv5ezhZ0EP62bxq\r\nZW2fsB7uFJc/rCPhZrbsmoVJ208iDD5kvTWHyYc3HYWoqzWB5iboeNN/5KzIeqna\r\nU2DK387E5/M8OumgODYxtWKB/EAfmmOR8TY47R1UWJSgZU3Cah4oYrnVN47uSQc7\r\nzl5oImIgS+Wizs1cl2EzAXWGFQauHGREOFUWgHFdJ87Kxqjp4DbXcp013TTjo4js\r\n4Mme8/7uKL+cNC6a325eM3QKpJ77uD56U9f1FH0VhmKKrJhjlirL2aTGDcFqc/L+\r\nV8kGspOKaw5aMAUTUT7JjP8wFqIBcLfvhr4RWpWuiQKBgQDYlOqMZlRjPcY4fRcl\r\n6Mo/Yh/Iglj83IPWevYLY6aHDhU32F9dliNfU7w+tBv9VKyW9iPh+gaPxvK6ELnM\r\nKfDd0kbokMHjLldKbTx915epCe+M3un6j2ASvPlBqBo/g7enAfG/AgKQsQakXDGF\r\nvIHAfzG08Svy3MqVyEdSi8/b3wKBgQC65WnzPHtkJq44p5FXKGXP1Of1vo2rn9S0\r\n3AQ1fWWRbH/yVHiPEM1hFuCU9bRl2ooD+GDC8CLl1jeVfwLKE14cNeYoa4O5yyCe\r\nhPhGei3NeyWsGxEA9Z03QWHPLDQiVHZu/s0AA9P7iUp45JuKkMOHldBDcRAI9kEm\r\nW/ZJZhASxwKBgQDCTtAjSEdbhfeJhIi5BSI2PWWAcZk+uuQ5D7Ygv7WOo07b/G6K\r\nuwFfK/POWa5m2InDIm9M9RDf+0CXOBxJFDO5/0aIrh6VIGVGK7zCtiKlkHlvbCqF\r\nFg6+oPYLNrLd2uFwnyjxEe+VOo1X9jKj5lyOhE7nJBwm1nmWacm7QB4rBwKBgQCb\r\nFa87RV7mlipPnMy/1CfXs8XfZ4XLek9Y3JEpiap0Z+IrxehcXwbtn7wwH0rYkeWg\r\nscQpPnbW3VE2XjSEVlnrctZPiBfAXkvs/k2+vbewIJX8IGGVuDoDFeABt55zNj8o\r\nj4qwjnyi5yPC+YAQFVwK8EfnDrTNmvooyHqwIV8JFQKBgQCbKcA3PolOP7lSokXp\r\nF54eU+Ojf1Z8z6DIsRkouOQktrmADHEeBdUkzyMk3lYBufKXuSuvyKB4s3enBOYL\r\n6I/pIDanQJLX00tQH510jwMPnjhMacuh+k8XUFMX0VDoa5V3PhYkNHk/5OWSoxIU\r\nJreZ866ULn66Qtp5L+eWXouEQw==\r\n-----END PRIVATE KEY-----\r\n', '1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 16:58:53
