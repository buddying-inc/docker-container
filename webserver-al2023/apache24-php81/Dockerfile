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
           php8.1 \
           php8.1-common \
           php8.1-devel \
           php8.1-gd \
           php8.1-intl \
           php8.1-mbstring \
           php8.1-mysqlnd \
           php8.1-opcache \
           php8.1-pdo \
           php8.1-soap \
           php8.1-xml \
    && dnf clean all

# https://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/mem-ug/Appendix.PHPAutoDiscoverySetup.Installing.html
#RUN wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.1/latest-64bit-X86-openssl3 -O amazon-elasticache-cluster-client.tar \
#    && tar -zxvf amazon-elasticache-cluster-client.tar \
#    && mv amazon-elasticache-cluster-client.so /usr/lib64/php/modules \
#    && echo "extension=amazon-elasticache-cluster-client.so" >> /etc/php.ini

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
