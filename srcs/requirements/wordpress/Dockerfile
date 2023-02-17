
FROM debian:buster


RUN apt-get update && apt upgrade -y && apt-get install -y wget mariadb-client wget curl vim 

RUN apt-get update && apt-get -y install  php-fpm php-mysql php-gd

# https://wp-cli.org/
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp cli update

RUN mkdir -p var/www/html

