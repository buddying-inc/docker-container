FROM ghcr.io/buddying-inc/centos68:latest

# packages
RUN yum install -y \
        httpd \
        postfix \
        zip \
        unzip \
        memcached \
        memcache \
    && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm \
    && yum install -y --enablerepo=remi-php56 \
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
    && yum clean all
    && ln -s /usr/bin/php56 /usr/bin/php \
    && cp -ap /opt/remi/php56/root/usr/lib64/php/modules/memcache.so /usr/lib64/php/modules/memcache.so \
    && curl -sS https://getcomposer.org/installer | php56 -- --install-dir=/usr/local/bin --filename=composer1 --1 \
    && curl -sS https://getcomposer.org/installer | php56 -- --install-dir=/usr/local/bin --filename=composer

# copy setting files
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56-memcache/setup/httpd_development.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56-memcache/setup/php_development.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56-memcache/setup/entrypoint.sh /

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
