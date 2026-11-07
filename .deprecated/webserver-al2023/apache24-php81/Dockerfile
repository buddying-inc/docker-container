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
           php8.1-pdo \
           php8.1-soap \
           php8.1-xml \
    && dnf clean all

RUN yes 'y' | dnf install php-pear \
    && yes '' | pecl install APCu \
    && yes '' | pecl install zip \
    && echo "extension=apcu.so" > /etc/php.d/50-pecl-apcu.ini \
    && echo "extension=zip.so" > /etc/php.d/50-pecl-zip.ini

# https://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/mem-ug/Appendix.PHPAutoDiscoverySetup.Installing.html
# https://github.com/aws-samples/aws-refarch-moodle/blob/master/templates/04-web.yaml#L497C35-L497C133
# PHP8.1 向けには ARM 向けは提供していない。PHP8.2 向けにはあるが使えない。
# RUN wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.2/latest-64bit-`if [ $(uname -a | grep -c "x86_64") == "1" ]; then echo "X86"; else echo "arm-X86"; fi`-openssl3 -O amazon-elasticache-cluster-client.tar \
RUN wget https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-8.1/latest-64bit-X86-openssl3 -O amazon-elasticache-cluster-client.tar \
    && tar -zxvf amazon-elasticache-cluster-client.tar \
    && mv amazon-elasticache-cluster-client.so /usr/lib64/php/modules \
    && echo "extension=amazon-elasticache-cluster-client.so" >> /etc/php.d/50-elasticache.ini

## copy setting files
COPY ${GITHUB_WORKSPACE}/webserver-al2023/apache24-php81/files/httpd/custom.conf /etc/httpd/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-al2023/apache24-php81/files/php/99-custom.ini /etc/php.d/
COPY ${GITHUB_WORKSPACE}/webserver-al2023/apache24-php81/files/docker-entrypoint.sh /

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
