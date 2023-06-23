# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server \
mariadb-client


RUN mkdir -p /run/mysqld

RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /run/mysqld
	
RUN	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --skip-test-db > /dev/null
#> /dev/null

RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/skip-networking/#skip-networking/g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 777 /tmp/dbSetup

COPY tools/dbSetup /tmp/

ENTRYPOINT ["sh", "/tmp/dbSetup"]
