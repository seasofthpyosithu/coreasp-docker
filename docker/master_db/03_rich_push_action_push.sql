SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES';


-- Master_db & queue_db

ALTER TABLE  iphone_queue_group
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  iphone_balancing_queue
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  android_queue_group
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  android_balancing_queue
ADD file_url varchar(255),
ADD file_type tinyint(4);




Master_db

ALTER TABLE  iphone_schedule
ADD file_url varchar(255),
ADD file_type tinyint(4); 

ALTER TABLE  iphone_repeat_schedule
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  iphone_ab_tmp
ADD file_url varchar(255),
ADD file_type tinyint(4);

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES';
ALTER TABLE  iphone_history
ADD file_url varchar(255),
ADD file_type tinyint(4);




ALTER TABLE  android_schedule
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  android_repeat_schedule
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  android_ab_tmp
ADD file_url varchar(255),
ADD file_type tinyint(4);

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES';
ALTER TABLE  android_history
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  iphone_individual_balancing_queue
ADD file_url varchar(255),
ADD file_type tinyint(4);

ALTER TABLE  android_individual_balancing_queue
ADD file_url varchar(255),
ADD file_type tinyint(4);

CREATE TABLE `android_rich_file` (
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

CREATE TABLE `iphone_action_handling` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `action_push_id` int(10) NOT NULL,
  `app_user_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `push_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:waiting 1:ready 2:sending 3:sent 4: Not sending',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `action_key_condition` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resend_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `action_type` tinyint(4) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `iphone_action_push` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` tinyint(4) NOT NULL,
  `action_key` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_key_condition` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `happened_flag` tinyint(4) DEFAULT NULL,
  `delay_time` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radius` int(8) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` int(1) DEFAULT NULL,
  `resend_time` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `iphone_action_tracking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `latitude` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクションテーブル参照',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `android_action_handling` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `action_push_id` int(10) NOT NULL,
  `app_user_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `push_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:waiting 1:ready 2:sending 3:sent 4: Not sending',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `action_key_condition` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resend_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `action_type` tinyint(4) NOT NULL DEFAULT '0',
  `title` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci,
  `file_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `android_action_push` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` tinyint(4) NOT NULL,
  `action_key` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_key_condition` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `happened_flag` tinyint(4) DEFAULT NULL,
  `delay_time` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radius` int(8) DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `file_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` int(1) DEFAULT NULL,
  `resend_time` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `android_action_tracking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config_id` int(10) NOT NULL,
  `latitude` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `os_version` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action_key` varchar(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'アクションテーブル参照',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





