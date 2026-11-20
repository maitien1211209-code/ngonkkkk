
FROM php:8.3-apache

RUN sed -i 's/Listen 80/Listen 10000/' /etc/apache2/ports.conf \
 && sed -i 's/:80>/:10000>/' /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY index.php /var/www/html/index.php

RUN mkdir -p /var/www/html/.data/by_key \
 && chown -R www-data:www-data /var/www/html/.data \
 && chmod -R 700 /var/www/html/.data

EXPOSE 10000

CMD ["apache2-foreground"]
