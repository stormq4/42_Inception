#!/bin/bash
echo "Kamaaan"

if [ ! -f /etc/ssl/certs/certificate.crt ]
then
	echo "Configuring new OPENSSL certificate"
	openssl req \
	-nodes \
	-new \
	-newkey rsa:2048 \
	-sha256 \
	-x509 \
	-days 365 \
	-out /etc/ssl/certs/certificate.crt \
	-keyout /etc/ssl/private/certificate.key \
	-subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=sde-quai.42.fr"
else
	echo "OPENSSL certificate present"
fi

exec "$@"