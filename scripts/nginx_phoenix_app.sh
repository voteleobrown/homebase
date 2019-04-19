#!/bin/bash

echo "Updatinging apt..."
sudo apt-get update
echo "Installing nginx..."
sudo apt-get install nginx
echo "Installing Let's Encrypt..."
sudo apt-get install letsencrypt

SCRIPT_PATH=$PWD

DHPARAM_PATH="/etc/ssl/certs/dhparam.pem"
echo "Determining whether or not dhparam.pem already exists."
if test -f "$DHPARAM_PATH"; then
	echo "File dhparam.pem already exists."
else
	echo "File dhparam.pem does not exist. Generating dhparam..."
	cd /etc/ssl/certs
	sudo openssl dhparam -out dhparam.pem 4096
	cd $SCRIPT_PATH
fi

echo "Before proceeding, please make sure that your domain is set up"
echo "to direct to this IP Address."
echo "Type the domain name of this server, followed by [ENTER]."
read DOMAIN

sudo service nginx stop
sudo certbot certonly --standalone -d $DOMAIN
cp nginx_default.template default
sed -e "s/\${hostname}/$DOMAIN/" default
sudo mv default /etc/nginx/sites-available/default
sudo service nginx start

