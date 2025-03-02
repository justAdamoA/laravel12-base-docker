FROM node:22.14.0-alpine3.21 AS development

ARG composer_version=2.8.5
ARG php_exts="phar ctype curl dom fileinfo fpm mbstring openssl pecl-redis pdo_pgsql pcntl session tokenizer xml xmlwriter"

WORKDIR /home/php/app

RUN apk update && apk upgrade
RUN apk add bash curl nginx postgresql-client git unzip zip
RUN for ext in ${php_exts}; do echo "php84-${ext}"; done | xargs apk add
RUN rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/php84 /usr/bin/php

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${composer_version} --filename=composer
RUN echo 'export PATH="$PATH:/root/.composer/vendor/bin"' > /root/.bashrc

RUN npm install -g npm@latest

COPY dockerconfigs/nginx_default_server.conf /etc/nginx/http.d/default.conf
COPY dockerconfigs/php_fpm_d_www.conf /etc/php84/php-fpm.d/www.conf

COPY bin/start-php-nginx /tmp/start-php-nginx
RUN chmod +x /tmp/start-php-nginx

CMD /tmp/start-php-nginx
