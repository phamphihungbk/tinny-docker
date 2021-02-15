#!/bin/sh

cd ~/../home
yum -y update
yum install git
git clone git@github.com:phamphihungbk/tinny-docker.git
cd tinny-docker
docker-compose -f ./environment/docker-compose.yml up workspace-node nginx mysql phpmyadmin --remove-orphans -d