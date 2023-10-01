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
           php74 \
           php74-php \
           php74-php-common \
           php74-php-ctype \
           php74-php-curl \
           php74-php-devel \
           php74-php-fileinfo \
           php74-php-gd \
           php74-php-hash \
           php74-php-intl \
           php74-php-json \
           php74-php-libxml \
           php74-php-mbstring \
           php74-php-mcrypt \
           php74-php-mysqlnd \
           php74-php-openssl \
           php74-php-opcache \
           php74-php-pdo \
           php74-php-pecl-apcu \
           php74-php-posix \
           php74-php-phar \
           php74-php-session \
           php74-php-simplexml \
           php74-php-soap \
           php74-php-xml \
           php74-php-xmlwriter \
           php74-php-xsl \
           php74-php-zip \
           php74-php-zlib \
           php74-php-pecl-mongodb \
    && yum clean all \
    && ln -s /usr/bin/php74 /usr/bin/php

RUN yum install -y zlib-devel perl-IPC-Cmd \
    && curl -O https://www.openssl.org/source/openssl-3.1.1.tar.gz \
    && tar zxvf openssl-3.1.1.tar.gz \
    && cd openssl-3.1.1 \
    && ./Configure \
    && make \
    && make install \
    && ln -s /usr/local/lib64/libssl.so.3 /usr/lib64/libssl.so.3 \
    && ln -s /usr/local/lib64/libcrypto.so.3 /usr/lib64/libcrypto.so.3 \
    && wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-7.4/latest-64bit-X86-openssl3 -O amazon-elasticache-cluster-client.tar \
    && tar -zxvf amazon-elasticache-cluster-client.tar \
    && mv amazon-elasticache-cluster-client.so /opt/remi/php74/root/usr/lib64/php/modules \
    && echo "extension=amazon-elasticache-cluster-client.so" >> /etc/opt/remi/php74/php.ini

# copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php74/setup/httpd_dev.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php74/setup/ssl.conf /etc/httpd/conf.d/ssl.conf
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php74/setup/php_dev.ini /etc/opt/remi/php74/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-amzn2/apache24-php74/setup/entrypoint.sh /

# directory, permission, ...
RUN rm -rf /var/www/* \
 && mkdir /var/www/html \
 && mkdir /var/log/php \
 && chmod 777 -R /var/log/php \
 && chmod 777 -R /var/opt/remi/php74/lib/php/session \
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
