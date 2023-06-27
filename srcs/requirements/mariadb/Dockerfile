# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get -y install \
										mariadb-server 

EXPOSE 3306

COPY tools/dbSetup /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

ENTRYPOINT ["sh", "/tmp/setup.sh"]
CMD ["mysqld"]

