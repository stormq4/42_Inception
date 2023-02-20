all:
	sudo docker compose -f srcs/docker-compose.yml up --build

stop:
	sudo docker compose -f srcs/docker-compose.yml stop

push:
	./gitp.sh

kill:
	compose -f srcs/docker-compose.yml kill

nginx:
	sudo docker eec -it nginx /bin/bash