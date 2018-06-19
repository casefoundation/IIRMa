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
COPY supervisor.conf /etc/supervisor/conf.d/wordpress.conf
COPY vhost.conf /etc/nginx/sites-enabled/default
COPY startup.sh /startup.sh
COPY www.conf /etc/php/7.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php

RUN wget https://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz
RUN mv wordpress /var/www/wordpress

COPY wp-config.php /var/www/wordpress/wp-config.php

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/wordpress

CMD ["/startup.sh"]
