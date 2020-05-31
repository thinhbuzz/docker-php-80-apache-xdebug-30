FROM php:7.4-apache

RUN apt-get update -y && apt-get install -y libpng-dev git

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install gd
RUN pecl install xdebug-2.9.1
RUN curl -L https://getcomposer.org/composer-stable.phar -o /usr/local/bin/composer && chmod +x /usr/local/bin/composer

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
COPY "./php-upload.ini" "$PHP_INI_DIR/conf.d/php-upload.ini"
COPY "./php-xdebug.ini" "$PHP_INI_DIR/conf.d/php-xdebug.ini"

RUN docker-php-ext-enable xdebug
RUN a2enmod rewrite