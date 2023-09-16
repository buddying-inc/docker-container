FROM ghcr.io/buddying-inc/centos:68

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# packages
RUN yum install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && rpm -ivh https://rpms.remirepo.net/enterprise/remi-release-6.rpm \
    && yum install -y \
           php70-php \
           php70-php-devel \
           php70-php-dom \
           php70-php-gd \
           php70-php-intl \
           php70-php-mbstring \
           php70-php-mcrypt \
           php70-php-mysqlnd \
           php70-php-pdo \
           php70-php-pecl-xdebug \
           php70-php-pecl-apcu \
           php70-php-posix \
           php70-php-simplexml \
           php70-php-soap \
           php70-php-xml \
           php70-php-xmlwriter \
           php70-php-xsl \
    && yum clean all \
    && ln -s /usr/bin/php70 /usr/bin/php

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-centos68/apache-php70/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos68/apache-php70/setup/php_dev.ini /etc/opt/remi/php70/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-centos68/apache-php70/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/opt/remi/php70/lib/php/session \
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
