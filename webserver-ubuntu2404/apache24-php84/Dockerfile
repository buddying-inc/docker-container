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

# Install Apache 2.4 and PHP 8.4
RUN apt-get install -y \
        apache2 \
        php8.4 \
        php8.4-cli \
        php8.4-fpm \
        php8.4-common \
        libapache2-mod-php8.4 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install additional PHP 8.4 modules
RUN apt-get update && apt-get install -y \
        php8.4-curl \
        php8.4-dev \
        php8.4-gd \
        php8.4-intl \
        php8.4-mbstring \
        php8.4-mysql \
        php8.4-opcache \
        php8.4-soap \
        php8.4-xml \
        php8.4-xsl \
        php8.4-zip \
        php8.4-apcu \
        php8.4-xdebug \
        php8.4-memcached \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy Apache custom configuration
COPY webserver-ubuntu2404/apache24-php84/files/apache2/custom.conf /etc/apache2/conf-available/custom.conf

# Enable custom Apache configuration
RUN a2enconf custom

# Copy PHP custom configuration
COPY webserver-ubuntu2404/apache24-php84/files/php/99-custom.ini /etc/php/8.4/apache2/conf.d/99-custom.ini
COPY webserver-ubuntu2404/apache24-php84/files/php/99-custom.ini /etc/php/8.4/cli/conf.d/99-custom.ini
COPY webserver-ubuntu2404/apache24-php84/files/php/99-custom.ini /etc/php/8.4/fpm/conf.d/99-custom.ini

# Copy docker entrypoint script
COPY webserver-ubuntu2404/apache24-php84/files/docker-entrypoint.sh /docker-entrypoint.sh

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
