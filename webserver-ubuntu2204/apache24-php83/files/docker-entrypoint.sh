#!/bin/bash
set -e

xdebug=${PHP_XDEBUG:-off}
xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

if [ "$xdebug" != 'on' ] && [ -e /etc/php/8.3/apache2/conf.d/15-xdebug.ini ]; then
  mv /etc/php/8.3/apache2/conf.d/15-xdebug.ini /etc/php/8.3/apache2/conf.d/15-xdebug.ini.disable
fi

/usr/sbin/postfix start
/usr/sbin/httpd -DFOREGROUND
