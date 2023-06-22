# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server \
mariadb-client

COPY tools/dbSetup /tmp/

RUN mkdir -p /run/mysqld

RUN chown -R mysql:mysql /run/mysqld
RUN chmod +x /run/mysqld
	
RUN	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --skip-test-db > /dev/null
#> /dev/null

RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 777 /tmp/dbSetup

ENTRYPOINT ["sh", "/tmp/dbSetup"]
