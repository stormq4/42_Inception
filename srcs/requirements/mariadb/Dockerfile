# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get -y install \
										mariadb-server 

EXPOSE 3306

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld
RUN chmod 777 /var/run/mysqld
	
# RUN	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --skip-test-db > /dev/null
#> /dev/null

# RUN sed -i 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i 's/skip-networking/#skip-networking/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i "s/bind-address.*/bind-address = mariadb/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/dbSetup /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

ENTRYPOINT ["sh", "/tmp/setup.sh"]
CMD ["mysqld"]

