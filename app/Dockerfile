FROM php:7.3-fpm

ARG PROJECT_FOLDER
ENV PROJECT_FOLDER $PROJECT_FOLDER

ENV TZ UTC
ENV COMPOSER_ALLOW_SUPERUSER 1

# Library
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libpq-dev git zip unzip vim nano iputils-ping postgresql-client sendmail && \
    apt-get clean && \
    apt-get install -y cron && \
    rm -rf /var/cache/apt

RUN apt-get update && apt-get install -y \
        libwebp-dev \
        libpng-dev \
        libxpm-dev \
        libfreetype6-dev \
        zlib1g-dev \
        libzip-dev \
        libarmadillo-dev \
        libhdf4-alt-dev \
        libhdf5-dev \
        libjpeg-dev \
        libmlpack-dev \
        libnetcdf-dev \
        libtiff5-dev \
        libjpeg62-turbo-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-webp-dir=/usr/include/ --with-xpm-dir=/usr/include/ \
    && docker-php-ext-install gd zip bcmath pcntl exif

# Extension
RUN docker-php-ext-install mbstring pdo pdo_pgsql
RUN docker-php-ext-install intl

# Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

COPY config/php.ini /usr/local/etc/php/php.ini

# Nodejs
RUN apt-get install -y nodejs
RUN apt-get install -y npm

# Custom bash script
RUN apt-get install -y dos2unix
# COPY config/queues_entrypoint.sh /usr/local/bin/queues_entrypoint.sh
# RUN dos2unix /usr/local/bin/queues_entrypoint.sh
# RUN chmod a+x /usr/local/bin/queues_entrypoint.sh

# Change owner
RUN chown www-data:www-data -R ./
# Work directory
WORKDIR /var/www/${PROJECT_FOLDER}
