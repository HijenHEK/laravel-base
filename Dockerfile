FROM php:8.2-fpm

# Arguments defined in docker-compose.yml

RUN apt-get update && apt-get install -y curl libc-dev libmcrypt-dev libpng-dev libonig-dev libxml2-dev libzip-dev zlib1g-dev zip unzip
RUN pecl install mcrypt-1.0.6
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip intl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
