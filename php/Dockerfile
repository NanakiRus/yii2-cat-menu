FROM php:7.2-fpm-alpine

WORKDIR /tire

ADD ./php-fpm.conf /usr/local/etc/php-fpm.d/
ADD ./wait-db.sh /

RUN set -xe \
    && chmod +x /wait-db.sh \
    && apk update \
    && apk upgrade \
    && apk add --no-cache autoconf \
        curl \
        g++ \
        gcc \
        make \
        netcat-openbsd \
    && pecl install redis \
    && pecl install xdebug \
    && docker-php-ext-enable redis xdebug \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENTRYPOINT sh /wait-db.sh mariadb-container 3306