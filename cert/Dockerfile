FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="sachajw@gmail.com"

COPY . template/default.conf.tpl /etc/nginx/default.conf.tpl
COPY . cert/cert.pem /etc/nginx/cert.pem
COPY . cert/privkey.pem /etc/nginx/privkey.pem

ENV LISTEN_PORT=8080

USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static
RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER nginx

CMD ["/entrypoint.sh"]
