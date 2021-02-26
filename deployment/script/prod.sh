#!/bin/sh

#Install depedencies
yum install -y git
yum install -y docker
curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#Download Resource
cd /home && git clone "https://github.com/phamphihungbk/tinny-docker.git"
cp .tinny-docker/config/env.prod /home/tinny-docker/web/.env

#Start
systemctl start docker
docker-compose -f .tinny-docker/environment/docker-compose.yml up workspace-php nginx mysql phpmyadmin --remove-orphans -d
