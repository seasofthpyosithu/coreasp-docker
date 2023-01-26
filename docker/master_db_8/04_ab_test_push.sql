create table android_ab_test_push_device
(
    request_group varchar(255)                  not null,
    group_name    tinyint     default 1         not null,
    row_index     int                           not null,
    device_token  varchar(255)                  null,
    status        varchar(50) default 'pending' null,
    sent_at       datetime                      null,
    primary key (request_group, group_name, row_index)
);
create index android_ab_test_push_device_status_index
    on android_ab_test_push_device (status);

create table android_ab_test_push_request (
    id varchar(255) not null primary key,
    config_id int null,
    payload_a mediumtext null,
    payload_b mediumtext null,
    total_device int not null,
    success_count_a int default 0 not null,
    success_count_b int default 0 not null,
    fail_count_a int default 0 null,
    fail_count_b int default 0 null,
    source_type varchar(25) not null,
    status int default 0 not null comment '0: pending, 1: finish',
    created_at datetime default CURRENT_TIMESTAMP not null
);
create index android_ab_test_push_request_config_id_index on android_ab_test_push_request (config_id);


create table iphone_ab_test_push_device
(
    request_group varchar(255)                  not null,
    group_name    tinyint     default 1         not null,
    row_index     int                           not null,
    device_token  varchar(255)                  null,
    status        varchar(50) default 'pending' null,
    sent_at       datetime                      null,
    primary key (request_group, group_name, row_index)
);
create index iphone_ab_test_push_device_status_index
    on iphone_ab_test_push_device (status);

create table iphone_ab_test_push_request (
    id varchar(255) not null primary key,
    config_id int null,
    payload_a mediumtext null,
    payload_b mediumtext null,
    total_device int not null,
    success_count_a int default 0 not null,
    success_count_b int default 0 not null,
    fail_count_a int default 0 null,
    fail_count_b int default 0 null,
    source_type varchar(25) not null,
    status int default 0 not null comment '0: pending, 1: finish',
    created_at datetime default CURRENT_TIMESTAMP not null
);
create index iphone_ab_test_push_request_config_id_index on iphone_ab_test_push_request (config_id);