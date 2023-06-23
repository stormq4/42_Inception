FROM debian:buster

# fast cgi for the niging server https://bobcares.com/blog/docker-compose-nginx-php-fpm-mysql-wordpress/
RUN apt-get update && \
	apt-get -y install 	nginx \
						openssl \
						libfcgi0ldbl


COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
# COPY conf/nginx.conf etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -nodes -newkey rsa:4096 -x509 \
-keyout /etc/nginx/ssl/storm.key \
-out /etc/nginx/ssl/storm.pem \
-subj "/C=NL/ST=Poepstate/L=Kipdorp/O=dikkelul Inc./CN=adsf.hoi" 

RUN mkdir -p /var/www/html


# RUN nginx -t
RUN ["nginx", "-g", "daemon off;"] 
