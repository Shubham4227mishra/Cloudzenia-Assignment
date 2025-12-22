#!/bin/bash
apt update
apt install -y nginx docker.io certbot python3-certbot-nginx

docker run -d -p 8080:80 nginx
echo "Namaste from Container" > /var/www/html/index.html

