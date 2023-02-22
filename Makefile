all:
	@mkdir ~/data
	@mdkir ~/data/WordPress
	@mdkir ~/data/DB
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
	sudo docker eec -it nginx /bin/bash