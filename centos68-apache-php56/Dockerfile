FROM ghcr.io/buddying-inc/centos68:latest

# packages
RUN yum install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm \
    && yum install -y --enablerepo=remi-php56 \
           php \
           php-devel \
           php-dom \
           php-gd \
           php-intl \
           php-mbstring \
           php-mcrypt \
           php-mysqlnd \
           php-pdo \
           php-pecl-xdebug \
           php-pecl-apcu \
           php-posix \
           php-simplexml \
           php-soap \
           php-xml \
           php-xmlwriter \
           php-xsl \
    && yum clean all \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer1 --1 \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# copy setting files
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56/setup/httpd_development.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56/setup/php_development.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/centos68-apache-php56/setup/entrypoint.sh /

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
