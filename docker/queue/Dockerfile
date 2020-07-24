FROM base-php:latest

RUN yum install -y gearmand \
    gearman


WORKDIR /app
COPY ./docker/queue/entrypoint.sh .
RUN chmod 777 /app/entrypoint.sh

# RUN gearmand --help

EXPOSE 7001 7002 7003 7004 7005 7006

CMD [ "/app/entrypoint.sh" ]

