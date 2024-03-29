FROM ghcr.io/buddying-inc/centos:68

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN yum install -y \
        httpd \
        postfix \
        zip \
        unzip \
        memcached \
        memcache \
    && rpm -ivh https://rpms.remirepo.net/enterprise/remi-release-6.rpm \
    && yum install -y \
           php56-php \
           php56-php-devel \
           php56-php-dom \
           php56-php-gd \
           php56-php-intl \
           php56-php-mbstring \
           php56-php-mcrypt \
           php56-php-mysqlnd \
           php56-php-pdo \
           php56-php-pecl-xdebug \
           php56-php-pecl-apcu \
           php56-php-posix \
           php56-php-simplexml \
           php56-php-soap \
           php56-php-xml \
           php56-php-xmlwriter \
           php56-php-xsl \
           php56-php-pecl-memcache \
           php56-php-pecl-memcached \
    && yum clean all \
    && ln -s /usr/bin/php56 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-centos68/apache-php56-memcache/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos68/apache-php56-memcache/setup/php_dev.ini /opt/remi/php56/root/etc/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos68/apache-php56-memcache/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
    && mkdir /var/www/html \
    && mkdir /var/log/php \
    && chmod 777 -R /var/log/php \
    && chmod 777 -R /var/opt/remi/php56/lib/php/session \
    && usermod -u 1000 apache \
    && groupmod -g 1000 apache \
    && sed -i.dist 's,^#ServerName.*$,ServerName 127.0.0.1:80,g' /etc/httpd/conf/httpd.conf \
    && sed -i.dist 's/^inet_interfaces = localhost$/inet_interfaces = all/g' /etc/postfix/main.cf \
    && chmod 700 /entrypoint.sh

# env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /entrypoint.sh
