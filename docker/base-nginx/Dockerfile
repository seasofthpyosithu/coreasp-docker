FROM centos:6.10

# ENV PHP_FPM_LINK=php-fpm

COPY "./docker/yum.repos.d/." "/etc/yum.repos.d/"
COPY "./docker/rpm-gpg/." "/etc/pki/rpm-gpg/"

RUN yum clean all

ENV nginxversion="1.14.0-1" \
    os="centos" \
    osversion="6"

RUN yum install -y wget openssl initscripts php-fpm &&\
    yum clean all

RUN wget http://nginx.org/packages/$os/$osversion/x86_64/RPMS/nginx-$nginxversion.el$osversion.ngx.x86_64.rpm &&\
    rpm -iv nginx-$nginxversion.el$osversion.ngx.x86_64.rpm

CMD ["/bin/bash"]