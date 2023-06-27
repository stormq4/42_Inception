#!/bin/bash

set -x
echo "-----------START script for wordpress------------"
# https://blog.sucuri.net/2022/11/wp-cli-how-to-install-wordpress-via-ssh.html

if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "------START Connecting to database------"

	mariadb -h$DB_HOST -u$DB_USER -p$DB_PW 
	
	echo "------wordpress Connected to mariadb------"
	
	wp core download --allow-root;

	echo "------Downloaded Wordpress------"

	wp config create \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PW \
	--dbhost=$DB_HOST \
	--allow-root;
	
	echo "-------Created Config file-------"

	wp core install \
	--url=$DOMAIN_NAME \
	--title="Hallo Wereld!" \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_USER@$DOMAIN_NAME \
	--skip-email \
	--allow-root;
	
	echo "------Installed Wordpress------"

	wp user create \
	$WP_USER $WP_USER@$DOMAIN_NAME \
	--role=author \
	--user_pass=$WP_PASSWORD \
	--allow-root;

	echo "------Wordpress Installed------"
else
	echo "------Wordpress already present------"
fi

exec "$@"
# exec php-fpm7.3 --nodaemonize
echo "-----------END script for wordpress------------"
