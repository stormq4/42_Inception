#!/bin/bash

set -x
echo "-----------START script for wordpress--------------"
cd /var/www/html
# https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html
wp core download --allow-root;

# wp config create --dbhost=WordPress --dbname=WordPress --dbuser=${WP_ADMIN_USER} --dbpass=${WP_ADMIN_PASSWORD} --allow-root;

# wp core config --dbhost=WordPress --dbname=WordPress \
# --dbuser=${WP_ADMIN_USER} --dbpass=${WP_ADMIN_PASSWORD} --allow-root;

# chmod 600 wp-config.php 

until mysqladmin -h${MDB_NAME} -u${WP_USER} -p${WP_PASSWORD} --silent ping
do
	sleep 10
done
wp core install --url=${DOMAIN_NAME} --title="Hallo Wereld!" \
--admin_name=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} \
--admin_email=kidsachterderits@42.fr --allow-root;

wp user create ${WP_USER} emaillalala@42.fr --user-pass=${WP_PASSWORD} --allow-root;

exec /usr/sbin/php-fpm7.3 --nodaemonize
echo "-----------END script for wordpress--------------"
