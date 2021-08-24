#!/bin/bash

xdebug=${PHP_XDEBUG:-off}
xdebug=$(echo "$xdebug" | tr "[:upper:]" "[:lower:]")

if [ "$xdebug" != 'on' ] && [ -e /etc/opt/remi/php70/php.d/15-xdebug.ini ]; then
  mv /etc/opt/remi/php70/php.d/15-xdebug.ini /etc/opt/remi/php70/php.d/15-xdebug.ini.disable
fi

service postfix start
/usr/sbin/httpd -DFOREGROUND
