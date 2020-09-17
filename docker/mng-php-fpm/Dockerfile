FROM base-php:latest

RUN echo "include_path = $(php -r 'echo get_include_path();'):/var/www/management/libs_ver2.0:/var/www/management/libs_ver2.0/php" >> /etc/php.ini
COPY ["./docker/mng-php-fpm/*.conf", "/etc/php-fpm.d/"]

WORKDIR /var/www/management
COPY ./src/mng .

# RUN chown -R root:apache  /var/www/management/tmp && chmod 777 /var/www/management/tmp

RUN chmod -R 777 pem/

EXPOSE 9000

CMD [ "php-fpm"]