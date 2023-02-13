all:
	sudo docker compose -f srcs/docker-compose.yml up --build

push:
	./gitp.sh
