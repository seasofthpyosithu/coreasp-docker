-- -------------------------------------------------------------
-- TablePlus 4.5.2(402)
--
-- https://tableplus.com/
--
-- Database: coreasp_v2_master
-- Generation Time: 2022-01-17 08:44:36.3950
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
) ENGINE=InnoDB AUTO_INCREMENT=38475906 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `action_mst` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '3桁数値のアクションキー',
  `action_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクション名',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `alert_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `apns` int(10) DEFAULT NULL,
  `alert` int(10) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx1` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='アクセス解析ログ保存用テーブル';

CREATE TABLE `android_ab_base` (
  `ab_base_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ab_type` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ab_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=167154 DEFAULT CHARSET=utf8;

CREATE TABLE `android_ab_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) NOT NULL,
  `time_to_start` datetime DEFAULT NULL,
  `time_to_limit` datetime DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_reserve` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2708209 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2207 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `android_config_category` (
  `android_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`android_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1643 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `android_config_key` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0:非アクティブ、1:アクティブ',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `android_config_sub_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `sub_category_id` int(2) NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=242761 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
  KEY `idx` (`queue_group`),
  KEY `android_error_token_is_delete_idx` (`is_delete`) USING BTREE,
  KEY `android_error_token_config_id_idx` (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105098303 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `android_geo_notify` (
  `geo_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL COMMENT 'geo_event.event_id',
  `config_id` int(10) NOT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=40594 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=25818 DEFAULT CHARSET=utf8;

CREATE TABLE `android_last_plan` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=85835952 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=107574 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=29468 DEFAULT CHARSET=utf8;

CREATE TABLE `android_queue_group_copy` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

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
  `registered_from` int(1) DEFAULT NULL COMMENT '1:admin 2:api',
  PRIMARY KEY (`schedule_id`),
  KEY `config_id_index` (`config_id`),
  KEY `finish_index` (`finish`)
) ENGINE=InnoDB AUTO_INCREMENT=13094 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `android_schedule_copy` (
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
  `registered_from` int(1) DEFAULT NULL COMMENT '1:admin 2:api',
  PRIMARY KEY (`schedule_id`),
  KEY `config_id_index` (`config_id`),
  KEY `finish_index` (`finish`)
) ENGINE=InnoDB AUTO_INCREMENT=1000000 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `android_schedule_individual` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(1) NOT NULL COMMENT '通知方式：1=GCM、2=C2DM',
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `request_group` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cb_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `config_id_index` (`config_id`),
  KEY `finish_index` (`finish`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11704 DEFAULT CHARSET=utf8;

CREATE TABLE `android_schedule_segment_copy` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  KEY `token_index` (`device_token`(255)),
  KEY `device_name` (`device_name`),
  KEY `os_version` (`os_version`)
) ENGINE=InnoDB AUTO_INCREMENT=94726847 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=177863 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=16393647 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `contact_forum_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `thread_id` int(10) NOT NULL DEFAULT '0',
  `type` varchar(40) DEFAULT '',
  `body` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_checked` tinyint(1) NOT NULL DEFAULT '0',
  `user_checked` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `is_manual_reply` tinyint(1) NOT NULL DEFAULT '0',
  `handle_name` varchar(255) DEFAULT NULL,
  `handle_method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `thread_id` (`thread_id`),
  KEY `admin_checked` (`admin_checked`),
  KEY `user_checked` (`user_checked`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='見込み顧客';

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `information` (
  `information_id` int(10) NOT NULL,
  `html` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_ab_base` (
  `ab_base_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int(11) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ab_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ab_base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=23895 DEFAULT CHARSET=utf8;

CREATE TABLE `iphone_ab_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ab_base_id` int(11) NOT NULL,
  `time_to_start` datetime DEFAULT NULL,
  `time_to_limit` datetime DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_reserve` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3199450 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `title` text NOT NULL,
  `push_type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '0',
  `code` int(2) DEFAULT '-1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`queue_group`),
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `idx3` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2262 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_config_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3384 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_config_key` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0:非アクティブ、1:アクティブ',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_config_sub_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `sub_category_id` int(2) NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=283561 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=utf8;

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
  KEY `idx` (`queue_group`),
  KEY `iphone_error_token_is_delete_idx` (`is_delete`) USING BTREE,
  KEY `iphone_error_token_config_id_idx` (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `iphone_geo_notify` (
  `geo_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL COMMENT 'geo_event.event_id',
  `config_id` int(10) NOT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_history` (
  `history_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `queue_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `send_count` int(10) NOT NULL,
  `failed_count` int(10) NOT NULL,
  `send_time` int(10) NOT NULL COMMENT '送信時間（秒）',
  `reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `confId` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=304432 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=18995 DEFAULT CHARSET=utf8;

CREATE TABLE `iphone_individual_balancing_queue` (
  `queue_id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `custom_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `send_flg` tinyint(1) DEFAULT '0' COMMENT '0: 未送信、1: 送信済み',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `badge` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_key` varchar(300) COLLATE utf8_unicode_ci DEFAULT '',
  `request_group` varchar(40) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `fcm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_date` timestamp NULL DEFAULT NULL,
  `push_type` tinyint(1) NOT NULL DEFAULT '0',
  `user_deleted_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`),
  KEY `request_group` (`request_group`),
  KEY `push_type` (`push_type`),
  KEY `send_flg` (`send_flg`)
) ENGINE=InnoDB AUTO_INCREMENT=15061191 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_individual_queue_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_group` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0: APIコール成功 1:キュー作成中 2:キュー作成済 3:配信中 4:配信済',
  `payload` longtext COLLATE utf8_unicode_ci,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `sent_count` int(11) NOT NULL DEFAULT '0',
  `failed_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `config_id` (`config_id`),
  KEY `request_group` (`request_group`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_individual_schedule_queue_group` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `type` int(1) NOT NULL COMMENT '通知方式：1=GCM、2=C2DM',
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `request_group` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cb_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0: APIコール成功 1:キュー作成中 2:キュー作成済 3:配信中 4:配信済',
  `payload` longtext COLLATE utf8_unicode_ci,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `sent_count` int(11) NOT NULL DEFAULT '0',
  `failed_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `config_id_index` (`config_id`),
  KEY `finish_index` (`finish`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_last_plan` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=52023561 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=1275405 DEFAULT CHARSET=utf8;

CREATE TABLE `iphone_push_request_queue_new` (
  `queue_id` bigint(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `custom_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `send_flg` tinyint(1) DEFAULT '0' COMMENT '0: 未送信、1: 送信済み',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `badge` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  `custom_key` varchar(300) COLLATE utf8_unicode_ci DEFAULT '',
  `request_group` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`),
  KEY `requestGroup` (`request_group`)
) ENGINE=InnoDB AUTO_INCREMENT=1973738 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_queue` (
  `queue_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `config_id` int(11) NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `device_token` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `user_deleted_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50817 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `iphone_queue_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) DEFAULT NULL,
  `queue_group` varchar(30) NOT NULL COMMENT 'config_id + timestamp',
  `user_id` int(10) DEFAULT NULL,
  `category_ids` text,
  `url` text,
  `message` text,
  `title` text,
  `status` tinyint(1) DEFAULT '1' COMMENT '1：実行前、2：実行中、3：終了',
  `total` int(10) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '実行終了時間',
  PRIMARY KEY (`id`),
  KEY `idx1` (`config_id`),
  KEY `idx2` (`queue_group`)
) ENGINE=InnoDB AUTO_INCREMENT=110247 DEFAULT CHARSET=utf8;

CREATE TABLE `iphone_repeat_schedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `iphone_schedule` (
  `schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `category_id` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `finish` int(1) NOT NULL COMMENT '送信済みフラグ（0:未送信、1:送信済）',
  `segment_key` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registered_from` int(1) DEFAULT NULL COMMENT '1:admin 2:api',
  PRIMARY KEY (`schedule_id`),
  KEY `Index` (`config_id`) USING BTREE,
  KEY `Index 2` (`finish`)
) ENGINE=InnoDB AUTO_INCREMENT=15185 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=12341 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=303180124 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=148753 DEFAULT CHARSET=utf8;

CREATE TABLE `iphone_token_relation` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `app_user_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `idx` (`config_id`,`app_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76446451 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2344071 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `level` int(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '発生場所',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17108921 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ログ格納テーブル';

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `push_count` (
  `config_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `date` date NOT NULL,
  `android_count` int(11) NOT NULL DEFAULT '0',
  `ios_count` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `push_count_config_id_date_idx` (`config_id`,`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `push_type_count` (
  `push_type` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `status` tinyint(1) NOT NULL COMMENT '0:利用可能状態 / 1:メールアドレス確認状態 / 2:審査状態 / 3:利用停止状態 / 4:削除済み',
  `need_exchange_plan` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1879 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_option` (
  `user_id` int(10) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:利用中 1:停止中',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最終更新日時',
  `comment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'コメント'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;