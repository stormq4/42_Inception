FROM debian:buster

RUN apt-get update && apt-get -y install nginx openssl

# fast cgi 
# RUN apt-get install -y libfcgi0ldbl

COPY conf/nginx.conf etc/nginx/conf.d/default.conf

RUN openssl req -nodes -newkey rsa:4096 -keyout /etc/nginx/storm.key -out /etc/nginx/storm.crt \
-subj "/C=NL/ST=FunkyState/L=BlepCity/O=Bloebla Inc./CN=Ms. Fliebel" -x509

# why deamon off;
ENTRYPOINT ["nginx", "-g", "daemon off;"] 
