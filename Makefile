all:
	sudo docker compose -f srcs/docker-compose.yml up --build

stop:
	sudo docker compose -f srcs/docker-compose.yml stop

push:
	./gitp.sh

kill:
	compose -f srcs/docker-compose.yml kill