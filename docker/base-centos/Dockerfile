FROM centos:6.10

COPY "./docker/base-centos/yum.repos.d/." "/etc/yum.repos.d/"
COPY "./docker/base-centos/rpm-gpg/." "/etc/pki/rpm-gpg/"

RUN yum install -y pcre \
    pcre-devel \
    zlib \    
    zlib-devel

RUN yum install -y gearmand \
    gearman

RUN yum groupinstall -y Base
RUN yum groupinstall -y 'Development Tools'

RUN wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz --no-check-certificate && tar zxvf openssl-1.0.2u.tar.gz
RUN wget https://curl.haxx.se/download/curl-7.56.0.tar.gz --no-check-certificate && tar zxvf curl-7.56.0.tar.gz

WORKDIR /openssl-1.0.2u
RUN ./config shared
RUN make install
RUN echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/custom-libs.conf

RUN yum --enablerepo=epel install -y libnghttp2 libnghttp2-devel
RUN rpm -ql libnghttp2
RUN rpm -ql libnghttp2-devel

WORKDIR /curl-7.56.0
RUN ./configure --with-ssl=/usr/local/ssl --with-nghttp2
RUN make install

RUN echo '/usr/local/lib' >> /etc/ld.so.conf.d/custom-libs.conf

CMD ["/bin/bash"]