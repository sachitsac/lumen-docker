FROM nginx:latest

COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./src /var/www/app

WORKDIR /var/www/app

EXPOSE 8080 443