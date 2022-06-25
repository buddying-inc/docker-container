FROM ghcr.io/buddying-inc/amazonlinux:2

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN yum install -y \
        httpd \
        mod_ssl \
        postfix \
    && yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum install -y libzstd --enablerepo=epel --disablerepo=amzn2-core \
    && yum install -y --enablerepo=epel,remi,remi-php80 \
           php80 \
           php80-php \
           php80-php-common \
           php80-php-ctype \
           php80-php-curl \
           php80-php-devel \
           php80-php-fileinfo \
           php80-php-gd \
           php80-php-hash \
           php80-php-intl \
           php80-php-json \
           php80-php-libxml \
           php80-php-mbstring \
           php80-php-mcrypt \
           php80-php-mysqlnd \
           php80-php-openssl \
           php80-php-opcache \
           php80-php-pdo \
           php80-php-pecl-apcu \
           php80-php-posix \
           php80-php-phar \
           php80-php-session \
           php80-php-simplexml \
           php80-php-soap \
           php80-php-xml \
           php80-php-xmlwriter \
           php80-php-xsl \
           php80-php-zip \
           php80-php-zlib \
           php80-php-pecl-memcached \
           php80-php-pecl-mongodb \
    && yum clean all \
    && ln -s /usr/bin/php80 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php80/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php80/setup/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php80/setup/php_dev.ini /etc/opt/remi/php80/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php80/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/opt/remi/php80/lib/php/session \
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
