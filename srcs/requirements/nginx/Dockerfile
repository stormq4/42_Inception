FROM debian:buster

# fast cgi for the niging server https://bobcares.com/blog/docker-compose-nginx-php-fpm-mysql-wordpress/
RUN apt-get update && \
	apt-get -y install 	nginx \
						openssl \
						libfcgi0ldbl


# COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY conf/nginx.conf etc/nginx/http.d/inception.conf
# RUN     rm -rf /etc/nginx/sites-enabled/*
# RUN     ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# RUN sed -i "s/SERVER_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-enabled/nginx.conf

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -nodes -newkey rsa:4096 -x509 \
-keyout /etc/nginx/ssl/storm.key \
-out /etc/nginx/ssl/storm.pem \
-subj "/C=NL/ST=Poepstate/L=Kipdorp/O=dikkelul Inc./CN=adsf.hoi" 

RUN mkdir -p /var/www/html


# CMD nginx -t
ENTRYPOINT ["nginx", "-g", "daemon off;"]
