FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl

# fast cgi for the niging server https://bobcares.com/blog/docker-compose-nginx-php-fpm-mysql-wordpress/
# RUN apt-get install -y libfcgi0ldbl

# COPY conf/nginx.conf etc/nginx/conf.d/default.conf
COPY conf/nginx.conf etc/nginx/nginx.conf

RUN openssl req -nodes -newkey rsa:4096 -keyout /etc/nginx/storm.key -out /etc/nginx/storm.crt \
-subj "/C=NL/ST=Poepstate/L=Kipdorp/O=dikkelul Inc./CN=adsf. hoi" -x509

RUN mkdir -p /var/www/html
COPY index.html /var/www/html

# EXPOSE 443

# why deamon off;
ENTRYPOINT ["nginx", "-g", "daemon off;"] 
