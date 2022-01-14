FROM base-centos:latest

RUN yum install -y php \
    php-mysql \
    php-pear \
    php-mbstring \
    php-fpm \
    php-devel \
    epel-release \
    libgearman \
    libgearman-devel

RUN yum clean all

RUN pear install MDB2-beta
RUN pear install MDB2_Driver_mysql-beta
RUN pear install XML_Parser
RUN pecl install gearman-1.1.1

COPY ./docker/base-php/php.ini /etc/php.ini

CMD ["/bin/bash"]