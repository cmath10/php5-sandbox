FROM php:5.6.40-apache

ENV TIMEZONE "Asia/Vladivostok"

#
# Зависимости
#

RUN apt-get update && apt-get install -y \
    curl \
    cron \
    unzip \
    git \
    vim \
    libfreetype6-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libjpeg-dev \
    libxml2-dev \
    libicu-dev \
    libssl-dev \
    libmcrypt-dev \
    libgearman-dev \
    libcurl3-dev \
    openssl \
    gearman-tools \
    zlib1g-dev \
    wget \
    unzip \
    fontconfig \
    locales \
    gconf-service \
    libasound2 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    gnupg

#
# Расширения php
#

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype2 --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql gd mbstring zip intl bcmath xml curl \
    && pecl install xdebug-2.5.5 \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#
# Очистка кеша apt-get
#

RUN apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#
# Настройка часового пояса
#

RUN echo "${TIMEZONE}" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

#
# Конфигурация php, apache
#

COPY config/apache/sites-available/* /etc/apache2/sites-available/
COPY config/apache /etc/apache2/
COPY config/php /usr/local/etc/php/

EXPOSE 8080

RUN a2dissite 000-default \
    && a2ensite php5-sandbox \
    && a2enmod rewrite \
    && a2enmod headers \
    && a2enmod ssl \
    && a2enmod deflate
