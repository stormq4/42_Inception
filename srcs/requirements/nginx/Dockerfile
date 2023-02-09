FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl

# fast cgi 
RUN apt-get install -y libfcgi0ldbl

COPY conf/nginx.conf etc/nginx/conf.d/default.conf

# why deamon off;
ENTRYPOINT ["nginx", "-g", "deamon off;"] 
