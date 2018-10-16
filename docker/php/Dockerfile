FROM php:7.1-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev\
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    unzip \
    wget

RUN apt-get install -y libmcrypt-dev \ 
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-install gd \
    && docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install gd \
    && rm -r /var/lib/apt/lists/*

COPY ./docker/php/laravel.ini /usr/local/etc/php/conf.d
COPY ./docker/php/laravel.pool.conf /usr/local/etc/php-fpm.d/

COPY ./src /var/www/app

WORKDIR /var/www/app

RUN chmod u+x artisan

CMD ["php-fpm"]

EXPOSE 9000