all:
	sudo docker compose -f srcs/docker-compose.yml --build

push:
	./gitp.sh
