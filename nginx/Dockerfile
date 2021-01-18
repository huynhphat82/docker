FROM nginx:latest

ENV TZ UTC

ARG APP_URL=localhost
COPY config/default.conf /tmp

RUN sed -i "s|http://localhost:8000|${APP_URL}|g" /tmp/default.conf
RUN cp -rf /tmp/default.conf /etc/nginx/conf.d/default.conf

COPY config/nginx.conf /etc/nginx/nginx.conf