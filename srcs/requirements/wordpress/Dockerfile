FROM debian:buster

RUN apt-get update && apt-get -y install \
		php7.3 \
		php-fpm \
		php-mysql \
		php-gd \
		wget \
		curl \
		libfcgi0ldbl \
		vim \
		mariadb-client

# https://wp-cli.org/
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp cli update

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d
RUN mkdir -p /var/www/html
RUN mkdir -p /run/php
COPY /conf/wp-config.php /var/www/html/wp-config.php
COPY /tools/setup.sh /tmp/
# RUN chmod 755 /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/
RUN chmod -R 755 /var/www/
RUN chmod 777 /tmp/setup.sh

ENTRYPOINT /tmp/setup.sh
