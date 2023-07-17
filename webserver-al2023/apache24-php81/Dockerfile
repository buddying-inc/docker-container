FROM ghcr.io/buddying-inc/amazonlinux:2023

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN dnf install -y \
        httpd \
        wget \
        postfix \
        libzip  \
        libzip-devel \
        zip \
        unzip \
    && dnf install -y \
           php \
           php-common \
           php-ctype \
           php-curl \
           php-devel \
           php-fileinfo \
           php-gd \
           php-hash \
           php-intl \
           php-json \
           php-libxml \
           php-mbstring \
           php-mysqlnd \
           php-openssl \
           php-opcache \
           php-pdo \
           php-pear \
           php-posix \
           php-phar \
           php-session \
           php-simplexml \
           php-soap \
           php-xml \
           php-xmlwriter \
           php-xsl \
           php-zlib \
    && dnf clean all

RUN yes '' | pecl install \
    apcu \
    zip

RUN echo -e "extension=apcu.so\n" >> /etc/php.ini \
 && echo -e "extension=zip.so\n" >> /etc/php.ini

## copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-al2023/apache24-php81/files/httpd/custom.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-al2023/apache24-php81/files/php/99-custom.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-al2023/apache24-php81/files/docker-entrypoint.sh /

## directory, permission, ...
RUN mkdir -p /run/php-fpm \
 && mkdir -p /var/log/php \
 && chmod 777 -R /run/php-fpm \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/lib/php/session \
 && usermod -u 1000 apache \
 && groupmod -g 1000 apache \
 && sed -i.dist 's,^#ServerName.*$,ServerName 127.0.0.1:80,g' /etc/httpd/conf/httpd.conf \
 && sed -i.dist 's/^inet_interfaces = localhost$/inet_interfaces = all/g' /etc/postfix/main.cf \
 && chmod 700 /docker-entrypoint.sh

## env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /docker-entrypoint.sh
