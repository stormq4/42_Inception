# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server maraidb-client

COPY tools/dbSetup /tmp/
COPY conf/50-server.cnf /etc/my.cnf

RUN chmod 777 /tmp/dbSetup

ENTRYPOINT ["sh", "/tmp/dbSetup"]
