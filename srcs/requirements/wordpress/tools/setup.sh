#!/bin/bash

# https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html
cd var/www/html
wp core download --allow-root

wp core config --dbhost=WordPress --dbname=WordPress \
--dbuser=${WP_ADMIN_USER} --dbpass=${WP_ADMIN_PASSWORD} --allow-root

chmod 600 wp-config.php 

wp core install --url=${DOMAIN_NAME} --title="Hallo Wereld!" \
--admin_name=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} \
--admin_email=kidsachterderits@42.fr --allow-root

wp user create ${WP_USER} emaillalala@42.fr --user-pass=${WP_PASSWORD} \
--allow-root
