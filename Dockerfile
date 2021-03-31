FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="sachajw@gmail.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl

#ENV LISTEN_PORT=8080

USER root

RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

COPY ./cert.pem /etc/nginx/cert.pem
COPY ./privkey.pem /etc/nginx/privkey.pem
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080

USER nginx

CMD ["/entrypoint.sh"]
