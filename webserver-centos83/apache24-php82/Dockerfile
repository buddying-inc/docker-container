FROM ghcr.io/buddying-inc/centos:83

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN dnf install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && dnf install -y http://rpms.famillecollet.com/enterprise/remi-release-8.7.rpm \
    && dnf module reset -y php \
    && dnf module install -y php:remi-8.2 \
    && dnf install -y --enablerepo=remi \
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
           php-pecl-memcached \
    && dnf clean all

# copu setting files
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php82/files/httpd/custom.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php82/files/php/99-custom.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php82/files/docker-entrypoint.sh /

# directory, permission, ...
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

# env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /docker-entrypoint.sh
