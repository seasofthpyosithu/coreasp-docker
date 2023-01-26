FROM base-php:latest

RUN echo "" > /etc/ld.so.conf.d/custom-libs.conf

RUN ldconfig

RUN yum install -y gearmand \
    gearman

RUN echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/custom-libs.conf
RUN echo '/usr/local/lib' >> /etc/ld.so.conf.d/custom-libs.conf

RUN ldconfig



WORKDIR /app
COPY ./docker/queue/entrypoint.sh .
RUN chmod 777 /app/entrypoint.sh

# RUN gearmand --help

EXPOSE 7001 7002 7003 7004 7005 7006 7007 7008 8001 8002 8003 8004 8005 8006 8007 8008

CMD [ "/app/entrypoint.sh" ]

