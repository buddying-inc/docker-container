#!/bin/bash

# Exit on any error
set -e

echo "Starting Docker entrypoint script..."

# Function to control Xdebug
configure_xdebug() {
    local xdebug=${PHP_XDEBUG:-off}
    xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

    echo "Configuring Xdebug: $xdebug"

    # List of PHP SAPI directories to check
    local sapi_dirs=("cli" "fpm")

    for sapi in "${sapi_dirs[@]}"; do
        local conf_dir="/etc/php/8.3/${sapi}/conf.d"

        # Find actual xdebug config file (may have different numbering)
        local xdebug_conf=$(find "$conf_dir" -name "*xdebug.ini" 2>/dev/null | head -1)
        local xdebug_disabled="${xdebug_conf}.disable"

        # If no active config found, check for disabled one
        if [ -z "$xdebug_conf" ]; then
            xdebug_disabled=$(find "$conf_dir" -name "*xdebug.ini.disable" 2>/dev/null | head -1)
            if [ -n "$xdebug_disabled" ]; then
                xdebug_conf="${xdebug_disabled%.disable}"
            fi
        fi

        if [ "$xdebug" = "on" ]; then
            # Enable Xdebug
            if [ -e "$xdebug_disabled" ]; then
                echo "Enabling Xdebug for $sapi..."
                mv "$xdebug_disabled" "$xdebug_conf"
            elif [ -e "$xdebug_conf" ]; then
                echo "Xdebug already enabled for $sapi"
            else
                echo "Warning: Xdebug config not found for $sapi (searched in $conf_dir)"
            fi
        else
            # Disable Xdebug
            if [ -e "$xdebug_conf" ]; then
                echo "Disabling Xdebug for $sapi..."
                mv "$xdebug_conf" "$xdebug_disabled"
            elif [ -e "$xdebug_disabled" ]; then
                echo "Xdebug already disabled for $sapi"
            else
                echo "Warning: Xdebug config not found for $sapi (searched in $conf_dir)"
            fi
        fi
    done
}

# Configure Xdebug based on environment variable
configure_xdebug

# Enable Apache modules if needed (optional)
# a2enmod rewrite
# a2enmod ssl

# Start PHP-FPM
echo "Starting PHP-FPM..."
mkdir -p /run/php
php-fpm8.3 -D

# Start Apache in foreground
echo "Starting Apache2 in foreground..."
exec apache2ctl -DFOREGROUND
