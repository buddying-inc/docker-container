#!/bin/bash

xdebug=${PHP_XDEBUG:-off}
xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

if [ "$xdebug" != 'on' ] && [ -e /opt/remi/php56/root/etc/php.d/15-xdebug.ini ]; then
  mv /opt/remi/php56/root/etc/php.d/15-xdebug.ini /opt/remi/php56/root/etc/php.d/15-xdebug.ini.disable
fi

/etc/init.d/postfix start
/usr/sbin/httpd -DFOREGROUND
