FROM base-php:latest

RUN echo "" > /etc/ld.so.conf.d/custom-libs.conf

RUN ldconfig

RUN yum install -y inotify-tools

RUN echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/custom-libs.conf
RUN echo '/usr/local/lib' >> /etc/ld.so.conf.d/custom-libs.conf

RUN ldconfig

RUN echo "include_path = $(php -r 'echo get_include_path();'):/var/www/queue_worker/libs_ver2.0:/var/www/queue_worker/libs_ver2.0/php" >> /etc/php.ini

RUN mkdir /app
COPY ./docker/queue_worker/entrypoint.sh /app/entrypoint.sh
RUN chmod 777 /app/entrypoint.sh

WORKDIR /var/www/queue_worker

COPY ./src/queue_worker .

CMD [ "/app/entrypoint.sh" ]