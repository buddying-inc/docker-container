#!/bin/bash

xdebug=${PHP_XDEBUG:-off}
xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

if [ "$xdebug" != 'on' ] && [ -e /opt/remi/php56/root/etc/php.d/15-xdebug.ini ]; then
  mv /opt/remi/php56/root/etc/php.d/15-xdebug.ini /opt/remi/php56/root/etc/php.d/15-xdebug.ini.disable
fi

service postfix start
service memcached start
/usr/sbin/httpd -DFOREGROUND
