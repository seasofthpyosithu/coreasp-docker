FROM centos:6.6

RUN yum install -y php \
    php-mysql \
    php-pear \
    php-mbstring \
    php-fpm \
    php-devel \
    epel-release

RUN sed -i "s/mirrorlist=https/mirrorlist=http/" "/etc/yum.repos.d/epel.repo"

RUN yum groupinstall -y 'Development Tools'

RUN yum install -y libgearman \
    libgearman-devel

RUN pear install MDB2-beta
RUN pear install MDB2_Driver_mysql-beta
RUN pear install XML_Parser
RUN pecl install gearman

COPY ./docker/base-php/php.ini /etc/php.ini