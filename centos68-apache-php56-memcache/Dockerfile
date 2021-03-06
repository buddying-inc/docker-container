FROM ghcr.io/buddying-inc/centos68:latest

RUN yum install -y httpd \
 && yum install -y postfix \
 && yum install -y zip unzip

RUN rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm \
 && yum install -y --enablerepo=remi-php56 \
        php \
        php-devel \
        php-dom \
        php-gd \
        php-intl \
        php-mbstring \
        php-mcrypt \
        php-mysqlnd \
        php-pdo \
        php-pecl-xdebug \
        php-pecl-apcu \
        php-posix \
        php-simplexml \
        php-soap \
        php-xml \
        php-xmlwriter \
        php-xsl

RUN yum install -y \
        memcached \
        memcache \
        php56-php-pecl-memcache \
        php56-php-pecl-memcached

RUN rm -rf /var/tmp/* /var/lib/yum/* /var/cache/yum/* \
 && yum clean all

RUN cp -ap /opt/remi/php56/root/usr/lib64/php/modules/memcache.so /usr/lib64/php/modules/memcache.so
#RUN cp -ap /opt/remi/php56/root/usr/lib64/php/modules/memcached.so /usr/lib64/php/modules/memcached.so

# Settings
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56-memcache/setup/httpd_development.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56-memcache/setup/php_development.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56-memcache/setup/entrypoint.sh /

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
