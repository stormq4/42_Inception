FROM debian:buster

# fast cgi for the niging server https://bobcares.com/blog/docker-compose-nginx-php-fpm-mysql-wordpress/
RUN apt-get update && \
	apt-get -y install 	nginx \
						openssl 


EXPOSE 443

# COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
# COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY	conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN     rm -rf /etc/nginx/sites-enabled/*
RUN     ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf


RUN mkdir -p /etc/nginx/ssl/

RUN openssl req \
-nodes \
-new \
-newkey rsa:2048 \
-sha256 \
-x509 \
-days 365 \
-out /etc/ssl/certs/certificate.crt \
-keyout /etc/ssl/private/certificate.key \
-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=sde-quai.42.fr"

RUN mkdir -p /var/www/html

COPY tools/setup.sh /tmp/

# CMD nginx -t
ENTRYPOINT ["sh", "tmp/setup.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
