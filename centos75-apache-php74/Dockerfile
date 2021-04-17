FROM ghcr.io/buddying-inc/centos75:latest

RUN yum install -y httpd \
 && yum install -y postfix \
 && yum install -y zip unzip

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
 && yum install -y --enablerepo=remi-php74 \
        php74 \
        php74-php \
        php74-php-common \
        php74-php-ctype \
        php74-php-curl \
        php74-php-devel \
        php74-php-fileinfo \
        php74-php-gd \
        php74-php-hash \
        php74-php-intl \
        php74-php-json \
        php74-php-libxml \
        php74-php-mbstring \
        php74-php-mcrypt \
        php74-php-mysqlnd \
        php74-php-openssl \
        php74-php-opcache \
        php74-php-pdo \
        php74-php-pecl-apcu \
        php74-php-posix \
        php74-php-phar \
        php74-php-session \
        php74-php-simplexml \
        php74-php-soap \
        php74-php-xml \
        php74-php-xmlwriter \
        php74-php-xsl \
        php74-php-zip \
        php74-php-zlib \
        php74-php-pecl-memcached

RUN ln -s /usr/bin/php74 /usr/bin/php
RUN ln -s /var/opt/remi/php74/lib/php /var/lib/php

RUN rm -rf /var/tmp/* /var/lib/yum/* /var/cache/yum/* \
 && yum clean all

# Settings
COPY ${GITHUB_WORKSPACE}/centos75-apache-php74/setup/httpd_development.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/centos75-apache-php74/setup/php_development.ini /etc/opt/remi/php74/php.d/
COPY ${GITHUB_WORKSPACE}/centos75-apache-php74/setup/entrypoint.sh /

# Directory, permission, ... 
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/lib/php/session \
 && usermod -u 1000 apache \
 && groupmod -g 1000 apache \
 && sed -i.dist 's,^#ServerName.*$,ServerName 127.0.0.1:80,g' /etc/httpd/conf/httpd.conf \
 && sed -i.dist 's/^inet_interfaces = localhost$/inet_interfaces = all/g' /etc/postfix/main.cf \
 && chmod 700 /entrypoint.sh

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer1 --1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Environment
ENV HOME=/root LANG=ja_JP.utf-8
WORKDIR /var/www

# Listen
EXPOSE 80

ENTRYPOINT /entrypoint.sh
