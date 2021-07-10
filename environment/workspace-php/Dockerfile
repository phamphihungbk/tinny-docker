FROM php:7.3-fpm-stretch

COPY ./config/. /usr/local/etc/

RUN mkdir -p /web \
    && mkdir -p /var/log/fpm \
    && chmod 755 -R /var/log \
    && apt-get update \
    && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    iputils-ping \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl mysqli \
    && docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && groupadd -g 1000 www \
    && useradd -u 1000 -ms /bin/bash -g www www

CMD ["php-fpm"]
