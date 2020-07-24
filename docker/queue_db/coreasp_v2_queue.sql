-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `action_log`;
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


DROP TABLE IF EXISTS `action_mst`;
CREATE TABLE `action_mst` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT '3桁数値のアクションキー',
  `action_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクション名',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `analytics_log`;
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


DROP TABLE IF EXISTS `android_balancing_queue`;
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
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `idx3` (`status`),
  KEY `idx4` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `android_balancing_queue_old`;
CREATE TABLE `android_balancing_queue_old` (
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
  KEY `idx2` (`queue_group`,`queue_index`),
  KEY `idx3` (`status`),
  KEY `idx4` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `android_config`;
CREATE TABLE `android_config` (
  `config_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `auth_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL COMMENT '1:入金確認 2:利用可能 3:一時停止 4:停止',
  `plan` int(1) NOT NULL COMMENT 'plan nonuse:0 free:1 / standard:2 / professional:3',
  PRIMARY KEY (`config_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_config_category`;
CREATE TABLE `android_config_category` (
  `android_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`android_config_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_config_key`;
CREATE TABLE `android_config_key` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0:非アクティブ、1:アクティブ',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_config_sub_category`;
CREATE TABLE `android_config_sub_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `sub_category_id` int(2) NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `android_error_remove_reserve`;
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


DROP TABLE IF EXISTS `android_error_token`;
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


DROP TABLE IF EXISTS `android_geo_notify`;
CREATE TABLE `android_geo_notify` (
  `geo_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL COMMENT 'geo_event.event_id',
  `config_id` int(10) NOT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_history`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_history_segment`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `android_last_plan`;
CREATE TABLE `android_last_plan` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `android_multi_category`;
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


DROP TABLE IF EXISTS `android_panelist_balancing_queue`;
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


DROP TABLE IF EXISTS `android_panelist_history`;
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


DROP TABLE IF EXISTS `android_panelist_queue_group`;
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


DROP TABLE IF EXISTS `android_push_request_queue`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_queue`;
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


DROP TABLE IF EXISTS `android_queue_group`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `android_schedule`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_schedule_segment`;
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


DROP TABLE IF EXISTS `android_survey_balancing_queue`;
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


DROP TABLE IF EXISTS `android_survey_history`;
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


DROP TABLE IF EXISTS `android_survey_queue_group`;
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


DROP TABLE IF EXISTS `android_token`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_token_count`;
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


DROP TABLE IF EXISTS `android_token_relation`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `android_token_research_relation`;
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


DROP TABLE IF EXISTS `contact_history`;
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


DROP TABLE IF EXISTS `customer`;
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


DROP TABLE IF EXISTS `d_answer`;
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


DROP TABLE IF EXISTS `geo_event`;
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


DROP TABLE IF EXISTS `iphone_balancing_queue`;
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
  KEY `idx3` (`status`),
  KEY `idx4` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iphone_config`;
CREATE TABLE `iphone_config` (
  `config_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) NOT NULL,
  `pem_production` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '本番環境用pemファイル',
  `pem_sandbox` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '開発環境用pemファイル',
  `status` int(1) NOT NULL COMMENT '1:入金確認 2:利用可能 3:一時停止 4:停止',
  `plan` int(1) NOT NULL COMMENT 'plan nonuse:0 free:1 / standard:2 / professional:3',
  PRIMARY KEY (`config_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `iphone_config_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_config_category`;
CREATE TABLE `iphone_config_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `category_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_config_key`;
CREATE TABLE `iphone_config_key` (
  `key_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `key` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '0:非アクティブ、1:アクティブ',
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_config_sub_category`;
CREATE TABLE `iphone_config_sub_category` (
  `iphone_config_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `category_id` int(2) NOT NULL,
  `sub_category_id` int(2) NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iphone_config_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iphone_error_remove_reserve`;
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


DROP TABLE IF EXISTS `iphone_error_token`;
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


DROP TABLE IF EXISTS `iphone_error_token_rich`;
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


DROP TABLE IF EXISTS `iphone_geo_notify`;
CREATE TABLE `iphone_geo_notify` (
  `geo_id` int(10) NOT NULL AUTO_INCREMENT,
  `event_id` int(10) NOT NULL COMMENT 'geo_event.event_id',
  `config_id` int(10) NOT NULL,
  PRIMARY KEY (`geo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_history`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_history_segment`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iphone_last_plan`;
CREATE TABLE `iphone_last_plan` (
  `config_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `plan` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iphone_multi_category`;
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


DROP TABLE IF EXISTS `iphone_panelist_balancing_queue`;
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


DROP TABLE IF EXISTS `iphone_panelist_history`;
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


DROP TABLE IF EXISTS `iphone_panelist_queue_group`;
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


DROP TABLE IF EXISTS `iphone_pem_status`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iphone_push_request_queue`;
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
  PRIMARY KEY (`queue_id`),
  KEY `idx` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_queue`;
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


DROP TABLE IF EXISTS `iphone_queue_group`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `iphone_rich_balancing_queue`;
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


DROP TABLE IF EXISTS `iphone_rich_file`;
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


DROP TABLE IF EXISTS `iphone_rich_history`;
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


DROP TABLE IF EXISTS `iphone_rich_queue_group`;
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


DROP TABLE IF EXISTS `iphone_rich_schedule`;
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


DROP TABLE IF EXISTS `iphone_schedule`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_schedule_segment`;
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


DROP TABLE IF EXISTS `iphone_survey_balancing_queue`;
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


DROP TABLE IF EXISTS `iphone_survey_history`;
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


DROP TABLE IF EXISTS `iphone_survey_queue_group`;
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


DROP TABLE IF EXISTS `iphone_token`;
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
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `token_index` (`device_token`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_token_count`;
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


DROP TABLE IF EXISTS `iphone_token_relation`;
CREATE TABLE `iphone_token_relation` (
  `token_id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `app_user_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `device_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`token_id`),
  KEY `config_id` (`config_id`),
  KEY `idx` (`config_id`,`app_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `iphone_token_research_relation`;
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


DROP TABLE IF EXISTS `iphone_token_rich`;
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


DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `level` int(3) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '発生場所',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ログ格納テーブル';


DROP TABLE IF EXISTS `oem_user`;
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


DROP TABLE IF EXISTS `panelist_history`;
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


DROP TABLE IF EXISTS `question`;
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


DROP TABLE IF EXISTS `questionnaire`;
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


DROP TABLE IF EXISTS `user`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 2020-07-16 06:15:36
