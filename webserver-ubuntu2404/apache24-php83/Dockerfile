FROM ghcr.io/buddying-inc/ubuntu:2404

# Set timezone to Japan/Tokyo
ENV TZ=Asia/Tokyo

# Update package manager and clear cache
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
        software-properties-common \
        curl \
        wget \
        zip \
        unzip \
        postfix \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add PHP PPA repository
RUN add-apt-repository ppa:ondrej/php -y \
    && apt-get update

# Install Apache 2.4 and PHP 8.3
RUN apt-get install -y \
        apache2 \
        php8.3 \
        php8.3-cli \
        php8.3-fpm \
        php8.3-common \
        libapache2-mod-php8.3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install additional PHP 8.3 modules
RUN apt-get update && apt-get install -y \
        php8.3-curl \
        php8.3-dev \
        php8.3-gd \
        php8.3-intl \
        php8.3-mbstring \
        php8.3-mysql \
        php8.3-opcache \
        php8.3-soap \
        php8.3-xml \
        php8.3-xsl \
        php8.3-zip \
        php8.3-apcu \
        php8.3-xdebug \
        php8.3-memcached \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy Apache custom configuration
COPY webserver-ubuntu2404/apache24-php83/files/apache2/custom.conf /etc/apache2/conf-available/custom.conf

# Enable custom Apache configuration
RUN a2enconf custom

# Copy PHP custom configuration
COPY webserver-ubuntu2404/apache24-php83/files/php/99-custom.ini /etc/php/8.3/apache2/conf.d/99-custom.ini
COPY webserver-ubuntu2404/apache24-php83/files/php/99-custom.ini /etc/php/8.3/cli/conf.d/99-custom.ini
COPY webserver-ubuntu2404/apache24-php83/files/php/99-custom.ini /etc/php/8.3/fpm/conf.d/99-custom.ini

# Copy docker entrypoint script
COPY webserver-ubuntu2404/apache24-php83/files/docker-entrypoint.sh /docker-entrypoint.sh

# Create PHP log directory
RUN mkdir -p /var/log/php \
    && chmod 777 -R /var/log/php \
    && chown www-data:www-data /var/log/php \

# Set execute permission for entrypoint script
RUN chmod +x /docker-entrypoint.sh

# Set environment variables
ENV HOME=/root

# Expose port 80
EXPOSE 80

# Set working directory
WORKDIR /var/www/html

# Set entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

# Copy composer versions
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1
