FROM ghcr.io/buddying-inc/centos:75

# packages
RUN yum install -y \
        httpd \
        postfix \
        zip \
        unzip \
    && rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
    && yum install -y --enablerepo=remi-php71 \
           php71-php \
           php71-php-devel \
           php71-php-dom \
           php71-php-gd \
           php71-php-intl \
           php71-php-mbstring \
           php71-php-mcrypt \
           php71-php-mysqlnd \
           php71-php-pdo \
           php71-php-pecl-xdebug \
           php71-php-pecl-apcu \
           php71-php-posix \
           php71-php-simplexml \
           php71-php-soap \
           php71-php-xml \
           php71-php-xmlwriter \
           php71-php-xsl \
           php71-php-zip \
    && yum clean all \
    && ln -s /usr/bin/php71 /usr/bin/php \
    && curl -sS https://getcomposer.org/installer | php71 -- --install-dir=/usr/local/bin --filename=composer1 --1 \
    && curl -sS https://getcomposer.org/installer | php71 -- --install-dir=/usr/local/bin --filename=composer

# copy setting files
COPY ${GITHUB_WORKSPACE}/centos75-apache-php71/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/centos75-apache-php71/setup/php_dev.ini /etc/opt/remi/php71/php.d/
COPY ${GITHUB_WORKSPACE}/centos75-apache-php71/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/opt/remi/php71/lib/php/session \
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
