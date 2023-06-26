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

RUN openssl req -nodes -newkey rsa:4096 -sha256  -x509 -days 365 \
-out /etc/nginx/ssl/storm.crt \
-keyout /etc/nginx/ssl/storm.key \
-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=sde-quai.42.fr"

RUN mkdir -p /var/www/html

COPY tools/test.sh /tmp/

# CMD nginx -t
# ENTRYPOINT ["sh", "tmp/test.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
