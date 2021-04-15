FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="sachajw@gmail.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl

USER root

RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

COPY ./cert.pem /etc/ssl/cert.pem
COPY ./privkey.pem /etc/ssl/privkey.pem
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080 443

USER nginx

CMD ["/entrypoint.sh"]

