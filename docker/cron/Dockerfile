FROM base-php:latest

RUN yum install -y cronie
RUN yum install -y inotify-tools

RUN echo "include_path = $(php -r 'echo get_include_path();'):/var/www/management/libs_ver2.0:/var/www/management/libs_ver2.0/php" >> /etc/php.ini


#Add your cron file
ADD ./docker/cron/mngcron /etc/cron.d/mngcron
RUN chmod 0644 /etc/cron.d/mngcron

#This will add it to the cron table (crontab -e)
RUN crontab /etc/cron.d/mngcron

RUN mkdir /app
COPY ./docker/cron/entrypoint.sh /app/entrypoint.sh
RUN chmod 777 /app/entrypoint.sh


WORKDIR /var/www/management

COPY ./src/mng .

CMD [ "/app/entrypoint.sh" ]