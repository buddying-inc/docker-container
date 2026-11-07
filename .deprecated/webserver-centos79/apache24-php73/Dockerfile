FROM ghcr.io/buddying-inc/centos:79

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN yum install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm \
    && yum install -y \
           php73 \
           php73-php \
           php73-php-common \
           php73-php-ctype \
           php73-php-curl \
           php73-php-devel \
           php73-php-fileinfo \
           php73-php-gd \
           php73-php-hash \
           php73-php-intl \
           php73-php-json \
           php73-php-libxml \
           php73-php-mbstring \
           php73-php-mcrypt \
           php73-php-mysqlnd \
           php73-php-openssl \
           php73-php-opcache \
           php73-php-pdo \
           php73-php-pecl-apcu \
           php73-php-posix \
           php73-php-phar \
           php73-php-session \
           php73-php-simplexml \
           php73-php-soap \
           php73-php-xml \
           php73-php-xmlwriter \
           php73-php-xsl \
           php73-php-zip \
           php73-php-zlib \
           php73-php-pecl-memcached \
    && yum clean all \
    && ln -s /usr/bin/php73 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-centos79/apache24-php73/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos79/apache24-php73/setup/php_dev.ini /etc/opt/remi/php73/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos79/apache24-php73/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
    && mkdir /var/www/html \
    && mkdir /var/log/php \
    && chmod 777 -R /var/log/php \
    && chmod 777 -R /var/opt/remi/php73/lib/php/session \
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
