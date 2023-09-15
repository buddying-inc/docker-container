FROM ghcr.io/buddying-inc/amazonlinux:2

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN yum install -y \
        httpd \
        mod_ssl \
        postfix \
    && yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum install -y libzstd --enablerepo=epel --disablerepo=amzn2-core \
    && yum install -y --enablerepo=epel \
           php81 \
           php81-php \
           php81-php-common \
           php81-php-ctype \
           php81-php-curl \
           php81-php-devel \
           php81-php-fileinfo \
           php81-php-gd \
           php81-php-hash \
           php81-php-intl \
           php81-php-json \
           php81-php-libxml \
           php81-php-mbstring \
           php81-php-mcrypt \
           php81-php-mysqlnd \
           php81-php-openssl \
           php81-php-opcache \
           php81-php-pdo \
           php81-php-pecl-apcu \
           php81-php-posix \
           php81-php-phar \
           php81-php-session \
           php81-php-simplexml \
           php81-php-soap \
           php81-php-xml \
           php81-php-xmlwriter \
           php81-php-xsl \
           php81-php-zip \
           php81-php-zlib \
           php81-php-pecl-memcached \
           php81-php-pecl-mongodb \
    && yum clean all \
    && ln -s /usr/bin/php81 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php81/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php81/setup/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php81/setup/php_dev.ini /etc/opt/remi/php81/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php81/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/opt/remi/php81/lib/php/session \
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
