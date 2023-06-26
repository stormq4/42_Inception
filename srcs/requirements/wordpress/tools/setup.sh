#!/bin/bash

set -x
echo "-----------START script for wordpress------------"
# https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html

if [ ! -f "/var/www/html/wordpress/index.php" ]
then
	echo "------START Connecting to database------"
	while mariadb -h$MDB_HOST -u$WP_USER -p$WP_PASSWORD 
	do
	# > /dev/null
		sleep 1
	done
	echo "------wordpress Connected to mariadb------"
	echo "------Installing Wordpress------"
	wp core download --allow-root;
	# sleep 10;

	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_USER --dbpass=$WP_PASSWORD --dbhost=$MDB_HOST --allow-root;
	wp core install --url=$DOMAIN_NAME/wordpress --title="Hallo Wereld!" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root;

	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root;
	echo "------Wordpress Installed------"
else
	echo "------wordpress already present------"
fi

exec php-fpm7.3 --nodaemonize
echo "-----------END script for wordpress------------"
