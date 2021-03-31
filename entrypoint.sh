#!/bin/sh

set -e

envsubst < /cert.pem > /etc/nginx/cert.pem
envsubst < /privkey.pem > /etc/nginx/privkey.pem
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'
