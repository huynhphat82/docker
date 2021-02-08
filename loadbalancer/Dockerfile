FROM haproxy:latest

RUN apt-get update && apt-get install -y \
    vim \
    systemd

# create dir: /etc/ssl/certs
RUN cd /etc && mkdir ssl
RUN cd /etc/ssl && mkdir certs

# Copy *.crt to dir
COPY conf/pem/elb_app3/nginx-selfsigned-elb_app3.crt /etc/ssl/certs
COPY conf/pem/elb_app4/nginx-selfsigned-elb_app4.crt /etc/ssl/certs

COPY conf/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg