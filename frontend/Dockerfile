FROM vcarreira/nginx-php5-fpm

WORKDIR /tmp

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz
RUN tar zxvf latest.tar.gz
RUN mv wordpress /var/www/wordpress

ADD ./theme /var/www/wordpress/wp-content/theme/networkmap
ADD wp-config.php /var/www/wordpress/wp-config.php
ADD vhost.conf ./nginx/sites:/etc/nginx/sites-enabled/default

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/wordpress
