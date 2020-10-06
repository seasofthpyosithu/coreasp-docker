FROM base-php:latest

RUN echo "include_path = $(php -r 'echo get_include_path();'):/var/www/api/libs_ver2.0:/var/www/api/libs_ver2.0/php" >> /etc/php.ini
COPY ["./docker/api-php-fpm/*.conf", "/etc/php-fpm.d/"]

WORKDIR /var/www/api
# RUN chown -R root:apache  /var/www/mng/tmp && chmod 777 /var/www/mng/tmp
COPY ./src/api .

RUN chown -R root:apache  /var/www/api/log && chmod 777 /var/www/api/log

EXPOSE 9000

CMD [ "php-fpm"]