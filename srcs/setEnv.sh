#!bin/bash

cat > .env << STOP 
DOMAIN_NAME=sde-quai.42.fr
# Certificates
CERTS_=./asdfasdfasf

# WordPress
WP_USER=wpUser
WP_PASSWORD=wpPassword

WP_ADMIN_USER=wpAdminU
WP_ADMIN_PASSWORD=wpAdminP

WP_DB_NAME=WordPress

MDB_NAME=mariadb
STOP

echo HOME_DIR=$HOME >> .env