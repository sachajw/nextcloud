FROM nginx
LABEL maintainer="sachajw@gmail.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl

ENV LISTEN_PORT=80
ENV LISTEN_PORT=443

USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static
RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER nginx

CMD ["/entrypoint.sh"]
