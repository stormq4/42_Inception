#!bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

mysql_install_db

service mysql stop

cat > /tmp/db.sql << STOP
CREATE DATABASE IF NOT EXISTS WORDPRESS;
CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_USER_PASSWORD';
CREATE USER IF NOT EXISTS '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$WP_ADMIN_PASSWORD';
GRANT ALL RPIVELIGES ON *.* TO '$WP_ADMIN_USER'@'%' WITH GRANT OPTION;
DELETE FROM mysql.user WHERE User='root';
FLUSH PRIVILEGES;
STOP

service mysql start && mysql < /tmp/db.sql

mysqld
