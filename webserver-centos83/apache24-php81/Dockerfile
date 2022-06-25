FROM ghcr.io/buddying-inc/centos:83

# packages
RUN dnf install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && dnf install -y http://rpms.famillecollet.com/enterprise/remi-release-8.rpm \
    && dnf module reset -y php \
    && dnf module install -y php:remi-8.1 \
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
    && dnf clean all \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer1 --1 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# copu setting files
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php81/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php81/setup/php_dev.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php81/setup/entrypoint.sh /

# directory, permission, ...
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

# env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /entrypoint.sh
