#!/bin/bash

#xdebug=${PHP_XDEBUG:-off}
#xdebug=`echo $xdebug | tr '[A-Z]' '[a-z]'`
#
#cd /etc/php.d
#if [ $xdebug != 'on' -a -e 15-xdebug.ini ]; then
#    mv 15-xdebug.ini 15-xdebug.ini.disable
#fi

/usr/sbin/postfix start
/usr/sbin/httpd

while true
do
  sleep 10000
done