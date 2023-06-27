FROM debian:buster

RUN apt-get update && apt-get -y install \
		openssl \
		php-phar \
		php-fpm \
		php \
		wget \
		curl \
		libfcgi0ldbl \
		vim \
		mariadb-client \
		php7.3-mysql \
		php-mysqli \
		php-mbstring \
		php-mysql \
		php-gd 

EXPOSE 9000

# https://wp-cli.org/
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php

COPY /tools/setup.sh /tmp/


RUN sed -i "s/listen.*/listen = wordpress:9000/" /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/
RUN chmod -R 755 /var/www/
RUN chmod 777 /tmp/setup.sh

WORKDIR /var/www/html

ENTRYPOINT ["sh", "/tmp/setup.sh"]
CMD ["php-fpm7.3", "--nodaemonize"]