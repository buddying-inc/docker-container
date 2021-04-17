#!/bin/bash

xdebug=${PHP_XDEBUG:-off}
xdebug=`echo $xdebug | tr '[A-Z]' '[a-z]'`

cd /etc/php.d
if [ $xdebug != 'on' -a -e 15-xdebug.ini ]; then
    mv 15-xdebug.ini 15-xdebug.ini.disable
fi

service memcached start

service postfix start
/usr/sbin/httpd -DFOREGROUND
