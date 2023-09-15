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
           php82 \
           php82-php \
           php82-php-common \
           php82-php-ctype \
           php82-php-curl \
           php82-php-devel \
           php82-php-fileinfo \
           php82-php-gd \
           php82-php-hash \
           php82-php-intl \
           php82-php-json \
           php82-php-libxml \
           php82-php-mbstring \
           php82-php-mcrypt \
           php82-php-mysqlnd \
           php82-php-openssl \
           php82-php-opcache \
           php82-php-pdo \
           php82-php-pecl-apcu \
           php82-php-posix \
           php82-php-phar \
           php82-php-session \
           php82-php-simplexml \
           php82-php-soap \
           php82-php-xml \
           php82-php-xmlwriter \
           php82-php-xsl \
           php82-php-zip \
           php82-php-zlib \
           php82-php-pecl-memcached \
           php82-php-pecl-mongodb \
    && yum clean all \
    && ln -s /usr/bin/php82 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php82/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php82/setup/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php82/setup/php_dev.ini /etc/opt/remi/php82/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php82/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/opt/remi/php82/lib/php/session \
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
