FROM buddyingdevelopment/centos:7.5

RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
 && yum update -y \
 && yum install -y httpd \
 && yum install -y --enablerepo=remi-php80 \
        php80 \
        php80-php \
        php80-php-devel \
        php80-php-dom \
        php80-php-gd \
        php80-php-intl \
        php80-php-mbstring \
        php80-php-mcrypt \
        php80-php-mysqlnd \
        php80-php-pdo \
        php80-php-pecl-xdebug \
        php80-php-pecl-apcu \
        php80-php-posix \
        php80-php-simplexml \
        php80-php-soap \
        php80-php-xml \
        php80-php-xmlwriter \
        php80-php-xsl \
        php80-php-zip

RUN ln -s /usr/bin/php80 /usr/bin/php
RUN ln -s /var/opt/remi/php80/lib/php /var/lib/php

RUN yum install -y postfix

RUN yum install -y zip unzip

RUN rm -rf /var/tmp/* /var/lib/yum/* /var/cache/yum/* \
    && yum clean all

# Settings
COPY ${GITHUB_WORKSPACE}/buddying-centos75-apache-php80/setup/httpd_development.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/buddying-centos75-apache-php80/setup/php_development.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/buddying-centos75-apache-php80/setup/entrypoint.sh /

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
