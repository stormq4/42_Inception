all:
	mkdir -p ~/data
	mkdir -p ~/data/WordPress
	mkdir -p ~/data/DB
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

purge: stop
	sudo docker compose -f srcs/docker-compose.yml down -v
	sudo docker system prune -af --volumes
	sudo rm -rf home/debian/data/WordPress home/debian/data/DB