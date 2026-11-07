FROM ghcr.io/buddying-inc/centos:83

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# required "libedit-devel" package
# required "php-devel" module
RUN dnf install -y dnf-plugins-core \
    && dnf config-manager --set-enabled powertools \
    && dnf install -y libedit-devel

# packages
RUN dnf install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.4.rpm \
    && dnf module reset -y php \
    && dnf module install -y php:remi-7.2 \
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

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php72/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php72/setup/php_dev.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos83/apache24-php72/setup/entrypoint.sh /

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
    && sed -i.dist -e 's/^#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/g' \
                   -e 's/^LoadModule mpm_event_module/#LoadModule mpm_event_module/g' /etc/httpd/conf.modules.d/00-mpm.conf \
    && chmod 700 /entrypoint.sh

# env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /entrypoint.sh
