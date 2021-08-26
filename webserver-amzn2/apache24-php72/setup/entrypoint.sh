#!/bin/bash
set -e

/usr/sbin/postfix start
/usr/sbin/httpd -DFOREGROUND
