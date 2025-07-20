#!/bin/bash

# Exit on any error
set -e

echo "Starting Docker entrypoint script..."

# Function to handle signals for graceful shutdown
cleanup() {
    echo "Received signal, shutting down services..."
    # Stop postfix
    if pgrep -x "master" > /dev/null; then
        echo "Stopping postfix..."
        postfix stop
    fi
    # Apache will be stopped by the signal
    echo "Services stopped."
    exit 0
}

# Function to control Xdebug
configure_xdebug() {
    local xdebug=${PHP_XDEBUG:-off}
    xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

    echo "Configuring Xdebug: $xdebug"

    # List of PHP SAPI directories to check
    local sapi_dirs=("apache2" "cli" "fpm")

    for sapi in "${sapi_dirs[@]}"; do
        local xdebug_conf="/etc/php/8.3/${sapi}/conf.d/15-xdebug.ini"
        local xdebug_disabled="${xdebug_conf}.disable"

        if [ "$xdebug" = "on" ]; then
            # Enable Xdebug
            if [ -e "$xdebug_disabled" ]; then
                echo "Enabling Xdebug for $sapi..."
                mv "$xdebug_disabled" "$xdebug_conf"
            elif [ -e "$xdebug_conf" ]; then
                echo "Xdebug already enabled for $sapi"
            else
                echo "Warning: Xdebug config not found for $sapi"
            fi
        else
            # Disable Xdebug
            if [ -e "$xdebug_conf" ]; then
                echo "Disabling Xdebug for $sapi..."
                mv "$xdebug_conf" "$xdebug_disabled"
            elif [ -e "$xdebug_disabled" ]; then
                echo "Xdebug already disabled for $sapi"
            else
                echo "Warning: Xdebug config not found for $sapi"
            fi
        fi
    done
}

# Set up signal handlers for graceful shutdown
trap cleanup SIGTERM SIGINT

# Configure Xdebug based on environment variable
configure_xdebug

# Start postfix
echo "Starting postfix..."
service postfix start

# Check if postfix started successfully
if ! pgrep -x "master" > /dev/null; then
    echo "Warning: Postfix may not have started properly"
fi

# Enable Apache modules if needed (optional)
a2enmod rewrite
# a2enmod ssl

# Start Apache in foreground
echo "Starting Apache2 in foreground..."
exec apache2ctl -DFOREGROUND
