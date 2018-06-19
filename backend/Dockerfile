FROM ubuntu:bionic

WORKDIR /tmp

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    php7.2-cli \
    php7.2-mbstring \
    php7.2-mysqlnd \
    php7.2-apcu \
    php7.2-memcached \
    php7.2-imap \
    php7.2-pgsql \
    php7.2-intl \
    php7.2-redis \
    php7.2-mongo \
    php7.2-sqlite \
    php7.2-curl \
    php7.2-json \
    php7.2-ssh2 \
    php7.2-gd \
    php7.2-gmp \
    php-pear \
    php7.2-dev make \
    php7.2-zip \
    wget \
    git \
    vim \
    cron \
    sudo \
    zip \
    unzip \
    nginx \
    php7.2-fpm \
    supervisor \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx /var/run/php-fpm /var/log/supervisor

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisor.conf /etc/supervisor/conf.d/laravel.conf
COPY vhost.conf /etc/nginx/sites-enabled/default
COPY startup.sh /startup.sh

RUN mkdir -p /run/php

RUN mkdir -p /etc/cron.d/
COPY cron /etc/cron.d/laravel
RUN touch /var/log/cron.log
RUN chmod 644 /etc/cron.d/laravel

ADD ./laravel /var/www

WORKDIR /var/www

RUN mkdir bootstrap/cache
RUN touch /var/www/storage/logs/laravel.log

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install

RUN php artisan config:cache

RUN chown -R www-data:www-data /var/www

VOLUME /var/www/public/uploads

EXPOSE 80 9000

CMD ["/startup.sh"]
