#!/bin/bash
set -e

xdebug=${PHP_XDEBUG:-off}
xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

if [ "$xdebug" != 'on' ] && [ -e /etc/php.d/15-xdebug.ini ]; then
  mv /etc/php.d/15-xdebug.ini /etc/php.d/15-xdebug.ini.disable
fi

mkdir -p /run/php-fpm
/usr/sbin/php-fpm -D
/usr/sbin/httpd -DFOREGROUND
