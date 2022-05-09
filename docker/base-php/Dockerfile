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

# RUN yum install -y gearmand \
#     gearman \
#     cronie \
#     inotify-tools

RUN yum clean all

RUN yum groupinstall -y 'Development Tools'

RUN pear install MDB2-beta
RUN pear install MDB2_Driver_mysql-beta
RUN pear install XML_Parser
RUN pecl install gearman-1.1.1

COPY ./docker/base-php/php.ini /etc/php.ini

RUN wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz --no-check-certificate && tar zxvf openssl-1.0.2u.tar.gz
RUN wget https://curl.haxx.se/download/curl-7.56.0.tar.gz --no-check-certificate && tar zxvf curl-7.56.0.tar.gz

WORKDIR /openssl-1.0.2u
RUN ./config shared
RUN make && make test && make install
RUN echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/custom-libs.conf

RUN yum --enablerepo=epel install -y libnghttp2 libnghttp2-devel
RUN rpm -ql libnghttp2
RUN rpm -ql libnghttp2-devel

WORKDIR /curl-7.56.0
RUN ./configure --with-ssl=/usr/local/ssl --with-nghttp2
RUN make && make install

RUN echo '/usr/local/lib' >> /etc/ld.so.conf.d/custom-libs.conf

RUN rm  /openssl-1.0.2u.tar.gz /curl-7.56.0.tar.gz 
RUN rm -rf /openssl-1.0.2u
RUN rm -rf /curl-7.56.0

RUN rm -f /etc/ld.so.cache && ldconfig

WORKDIR /

CMD ["/bin/bash"]