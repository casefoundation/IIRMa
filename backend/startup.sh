#!/bin/bash
sudo -u www-data /usr/bin/php /var/www/artisan config:cache
service cron stop
/usr/bin/supervisord
