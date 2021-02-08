FROM alpine

RUN apk add nginx; \
    mkdir /run/nginx/; \
    echo "<h1>Hello world (HTTPS - 2)!</h1>" > /var/www/localhost/htdocs/index.html;

# CONFIGUTATIONS
COPY conf/nginx/default.conf /etc/nginx/conf.d

# keys and certs
COPY cert/nginx-selfsigned.key /etc/ssl/private/
COPY cert/nginx-selfsigned.crt /etc/ssl/certs/

WORKDIR /var/www/localhost/htdocs

EXPOSE 80
EXPOSE 443

CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]