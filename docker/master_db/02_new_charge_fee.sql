ALTER TABLE push_count 
ADD user_id int(10) NOT NULL DEFAULT 0,
ADD platform tinyint NOT NULL DEFAULT 0 COMMENT "1:iOS 2:Android OS",
ADD count_type int(1) NOT NULL DEFAULT 0 COMMENT "1:realtime_bulk_admin
2:schedule_bulk_admin
3:schedule_segment_admin
4:realtime_segment_admin
5:repeated_bulk_admin'
6:time_distributed_bulk_admin
7:realtime_bulk_api
8:schedule_bulk_api
9:realtime_segment_api
10:realtime_individual_api
11:schedule_individual_api
12:time_distributed_bulk_api",
ADD count int(10) NOT NULL DEFAULT 0;

CREATE UNIQUE INDEX push_count_date_idx ON push_count (config_id, user_id, platform, count_type, date);

ALTER TABLE iphone_ab_base ADD registered_from tinyint COMMENT "1:admin 2:api";
ALTER TABLE android_ab_base ADD registered_from tinyint COMMENT "1:admin 2:api";


CREATE TABLE `android_individual_queue_group` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE android_push_request_queue
ADD sent_date timestamp NULL;

RENAME TABLE android_push_request_queue TO android_individual_balancing_queue;

ALTER TABLE android_schedule_individual
ADD status int(11) NOT NULL DEFAULT 0 COMMENT "0: APIコール成功 1:キュー作成中 2:キュー作成済 3:配信中 4:配信済",
ADD payload LONGTEXT NULL,
ADD total_count int(11) NOT NULL DEFAULT 0,
ADD sent_count int(11) NOT NULL DEFAULT 0,
ADD failed_count int(11) NOT NULL DEFAULT 0,
ADD created_at timestamp NULL,
ADD updated_at timestamp NULL;

RENAME TABLE android_schedule_individual TO android_individual_schedule_queue_group;
