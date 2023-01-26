FROM --platform=x86_64 mysql:8.0.31
ENV MYSQL_DATABASE=coreasp_v2_master
ENV MYSQL_USER=coreaspdbmaster
ENV MYSQL_PASSWORD='Ns918\$jaH82NmRr!eGw7'
ENV MYSQL_ROOT_PASSWORD=root

RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./docker/master_db_8/*.sql /docker-entrypoint-initdb.d/