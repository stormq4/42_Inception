push:
	./gitp.sh

all:
	sudo docker-compose -f srcs/docker-compose.yml --build