#!/bin/sh

set -e

envsubst < /cert.pem > /etc/ssl/cert.pem
envsubst < /privkey.pem > /etc/ssl/privkey.pem
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/nginx.conf

nginx -g 'daemon off;'
