all: debian
	mkdir -p $(HOME)/data/WordPress
	mkdir -p $(HOME)/data/DB
	sudo docker compose -f srcs/docker-compose.yml up --build

stop:
	sudo docker compose -f srcs/docker-compose.yml stop

push:
	./gitp.sh

pull:
	git pull 
	$(MAKE)

kill:
	compose -f srcs/docker-compose.yml kill

nginx:
	sudo docker exec -it nginx /bin/bash

wordpress:
	sudo docker exec -it wordpress /bin/bash

mariadb:
	sudo docker exec -it mariadb /bin/bash

purge: stop
	sudo docker compose -f srcs/docker-compose.yml down -v
	sudo docker system prune -af --volumes
	sudo rm -rvf $(HOME)/data/WordPress $(HOME)/data/DB
	sudo docker pull debian:buster

debian:
	sudo docker pull debian:buster

ppull: purge pull