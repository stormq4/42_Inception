FROM debian:buster

RUN apt-get update && \
	apt-get -y install 	nginx \
						openssl \
						libfcgi0ldbl 


EXPOSE 443

COPY	conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN     rm -rf /etc/nginx/sites-enabled/*
RUN     ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf


RUN mkdir -p /var/www/html

COPY tools/setup.sh /tmp/

ENTRYPOINT ["sh", "tmp/setup.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
