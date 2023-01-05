FROM --platform=x86_64 centos:6.10

COPY "./docker/base-centos/yum.repos.d/." "/etc/yum.repos.d/"
COPY "./docker/base-centos/rpm-gpg/." "/etc/pki/rpm-gpg/"

RUN yum install -y pcre \
    pcre-devel \
    zlib \     
    zlib-devel \
    wget

# RUN yum groupinstall -y Base

CMD ["/bin/bash"]