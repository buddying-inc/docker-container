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
           php72 \
           php72-php \
           php72-php-common \
           php72-php-ctype \
           php72-php-curl \
           php72-php-devel \
           php72-php-fileinfo \
           php72-php-gd \
           php72-php-hash \
           php72-php-intl \
           php72-php-json \
           php72-php-libxml \
           php72-php-mbstring \
           php72-php-mcrypt \
           php72-php-mysqlnd \
           php72-php-openssl \
           php72-php-opcache \
           php72-php-pdo \
           php72-php-pecl-apcu \
           php72-php-posix \
           php72-php-phar \
           php72-php-session \
           php72-php-simplexml \
           php72-php-soap \
           php72-php-xml \
           php72-php-xmlwriter \
           php72-php-xsl \
           php72-php-zip \
           php72-php-zlib \
           php72-php-pecl-memcached \
           php72-php-pecl-mongodb \
    && yum clean all \
    && ln -s /usr/bin/php72 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php72/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php72/setup/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php72/setup/php_dev.ini /etc/opt/remi/php72/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php72/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
    && mkdir /var/www/html \
    && mkdir /var/log/php \
    && chmod 777 -R /var/log/php \
    && chmod 777 -R /var/opt/remi/php72/lib/php/session \
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
