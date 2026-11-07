FROM ghcr.io/buddying-inc/amazonlinux:2023

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

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
           php8.5 \
           php8.5-common \
           php8.5-devel \
           php8.5-gd \
           php8.5-intl \
           php8.5-mbstring \
           php8.5-mysqlnd \
           php8.5-pdo \
           php8.5-pecl-apcu \
           php8.5-soap \
           php8.5-xml \
           php8.5-zip \
    && dnf clean all

# 2026-11-07 OpenSSL3.0 対応版無し
## https://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/mem-ug/Appendix.PHPAutoDiscoverySetup.Installing.html
## https://github.com/aws-samples/aws-refarch-moodle/blob/master/templates/04-web.yaml#L497C35-L497C133
#RUN wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.5/latest-64bit-`if [ $(uname -a | grep -c "x86_64") == "1" ]; then echo "x86"; else echo "arm"; fi`-amzlinux-openssl3 -O amazon-elasticache-cluster-client.tar \
#    && tar -zxvf amazon-elasticache-cluster-client.tar \
#    && mv amazon-elasticache-cluster-client.so /usr/lib64/php8.5/modules \
#    && echo "extension=amazon-elasticache-cluster-client.so" >> /etc/php.d/50-elasticache.ini

## copy setting files
COPY webserver-al2023/apache24-php85/files/httpd/custom.conf /etc/httpd/conf.d/
COPY webserver-al2023/apache24-php85/files/php/99-custom.ini /etc/php.d/
COPY webserver-al2023/apache24-php85/files/docker-entrypoint.sh /

## directory, permission, ...
RUN mkdir -p /var/log/php \
    && chmod 777 -R /var/log/php \
    && chmod 777 -R /var/lib/php/session \
    && usermod -u 1000 apache \
    && groupmod -g 1000 apache \
    && sed -i.dist 's,^#ServerName.*$,ServerName 127.0.0.1:80,g' /etc/httpd/conf/httpd.conf \
    && sed -i.dist 's/^inet_interfaces = localhost$/inet_interfaces = all/g' /etc/postfix/main.cf \
    && sed -i.dist -e 's/^#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/g' \
                   -e 's/^LoadModule mpm_event_module/#LoadModule mpm_event_module/g' /etc/httpd/conf.modules.d/00-mpm.conf \
    && chmod 700 /docker-entrypoint.sh

## env, port
ENV HOME=/root
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT /docker-entrypoint.sh
