FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl

COPY conf/nginx.conf etc/niginx/conf.d/default.conf

# why deamon off;
ENTRYPOINT nginx -g "deamon off;" 
