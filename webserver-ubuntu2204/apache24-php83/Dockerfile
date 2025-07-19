FROM ghcr.io/buddying-inc/ubuntu:2204

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# Update system and install basic packages
RUN apt-get update && apt-get install -y \
        software-properties-common \
        curl \
        wget \
        zip \
        unzip \
        postfix \
    && add-apt-repository ppa:ondrej/php -y \
    && apt-get update

# Install Apache and PHP 8.3 packages
RUN apt-get install -y \
        apache2 \
        php8.3 \
        php8.3-apache2 \
        php8.3-common \
        php8.3-ctype \
        php8.3-curl \
        php8.3-dev \
        php8.3-fileinfo \
        php8.3-gd \
        php8.3-intl \
        php8.3-mbstring \
        php8.3-mysql \
        php8.3-opcache \
        php8.3-pdo \
        php8.3-apcu \
        php8.3-phar \
        php8.3-session \
        php8.3-simplexml \
        php8.3-soap \
        php8.3-xml \
        php8.3-xsl \
        php8.3-zip \
        php8.3-zlib \
        php8.3-xdebug \
        php8.3-memcached \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy setting files (adjust paths for Ubuntu)
COPY ${GITHUB_WORKSPACE}/webserver-ubuntu2204/apache24-php83/files/apache2/custom.conf /etc/apache2/conf-available/
COPY ${GITHUB_WORKSPACE}/webserver-ubuntu2204/apache24-php83/files/php/99-custom.ini /etc/php/8.3/apache2/conf.d/
COPY ${GITHUB_WORKSPACE}/webserver-ubuntu2204/apache24-php83/files/docker-entrypoint.sh /

# Directory setup, permissions, and configuration
RUN mkdir -p /var/log/php \
    && chmod 777 -R /var/log/php \
    && chmod 777 -R /var/lib/php/sessions \
    && usermod -u 1000 www-data \
    && groupmod -g 1000 www-data \
    && echo "ServerName 127.0.0.1:80" >> /etc/apache2/apache2.conf \
    && sed -i.dist 's/^inet_interfaces = loopback-only$/inet_interfaces = all/g' /etc/postfix/main.cf \
    && a2enmod rewrite \
    && a2enmod php8.3 \
    && a2enconf custom \
    && chmod 700 /docker-entrypoint.sh

# env, port
ENV HOME=/root
WORKDIR /var/www/html
EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
