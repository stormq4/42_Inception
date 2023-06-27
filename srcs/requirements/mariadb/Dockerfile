# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get -y install \
										mariadb-server 

EXPOSE 3306

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/dbSetup /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

# RUN sed -i "s/bind-address.*/bind-address = mariadb/" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["sh", "/tmp/setup.sh"]
CMD ["mysqld"]

