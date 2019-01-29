FROM php5-sandbox-app

WORKDIR /var/www/php5-sandbox

# Установка composer

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Пользователь

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN useradd -m -U -s /bin/bash hostuser

RUN chown hostuser:hostuser /var/www

CMD ["php", "-a"]
