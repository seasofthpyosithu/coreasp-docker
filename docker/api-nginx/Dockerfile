FROM base-nginx:latest

COPY ./docker/api-nginx/nginx.conf /etc/nginx/conf.d/default.conf

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /var/www/api
COPY ./src/api .

CMD ["nginx", "-g", "daemon off;"]