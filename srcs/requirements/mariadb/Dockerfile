# https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-11

FROM debian:buster

RUN sudo apt-get update && sudo apt-get -y install mariadb-server 

COPY tools/dbSetup.sh /tmp/
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

ENTRYPOINT ["sh", "/tmp/dbSetup.sh"]

