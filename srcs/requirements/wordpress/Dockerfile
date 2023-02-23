
FROM debian:buster


RUN apt-get update && apt upgrade -y && apt-get install -y wget mariadb-client wget curl vim 

RUN apt-get update && apt-get -y install  php-fpm php-mysql php-gd

# https://wp-cli.org/
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp


COPY conf/www.conf /etc/php/7.3/fpm/pool.d

RUN wp cli update

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www

RUN chmod -R 755 /var/www/

COPY tools/setup.sh /tmp/
RUN chmod 777 /tmp/setup.sh 

WORKDIR /var/www/html/

ENTRYPOINT ["sh", "./tmp/setup.sh"]


