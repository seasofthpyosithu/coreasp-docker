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