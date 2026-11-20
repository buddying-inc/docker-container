FROM ghcr.io/buddying-inc/almalinux:10

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# packages
RUN dnf install -y \
        httpd \
        zip \
        unzip \
    && dnf install -y https://rpms.remirepo.net/enterprise/remi-release-10.rpm \
    && dnf module reset -y php \
    && dnf module install -y php:remi-8.5 \
    && dnf install -y \
           php \
           php-common \
           php-ctype \
           php-curl \
           php-devel \
           php-fileinfo \
           php-fpm \
           php-gd \
           php-hash \
           php-intl \
           php-json \
           php-libxml \
           php-mbstring \
           php-mcrypt \
           php-mysqlnd \
           php-openssl \
           php-opcache \
           php-pdo \
           php-pecl-apcu \
           php-posix \
           php-phar \
           php-session \
           php-simplexml \
           php-soap \
           php-xml \
           php-xmlwriter \
           php-xsl \
           php-zip \
           php-zlib \
           php-pecl-xdebug3 \
           php-pecl-memcached \
    && dnf clean all

# copy setting files
COPY webserver-almalinux10/apache24-php85/files/httpd/custom.conf /etc/httpd/conf.d/
COPY webserver-almalinux10/apache24-php85/files/php/99-custom.ini /etc/php.d/
COPY webserver-almalinux10/apache24-php85/files/docker-entrypoint.sh /

# directory, permission, ...
RUN mkdir -p /var/log/php \
    && chmod 777 -R /var/log/php \
    && chmod 777 -R /var/lib/php/session \
    && usermod -u 1000 apache \
    && groupmod -g 1000 apache \
    && chown -R apache /var/log/php-fpm \
    && chgrp -R apache /var/lib/php/opcache /var/lib/php/wsdlcache \
    && sed -i.dist 's,^#ServerName.*$,ServerName 127.0.0.1:80,g' /etc/httpd/conf/httpd.conf \
    && sed -i.dist 's/^;clear_env = no$/clear_env = no/' /etc/php-fpm.d/www.conf \
    && chmod 700 /docker-entrypoint.sh

# env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /docker-entrypoint.sh
