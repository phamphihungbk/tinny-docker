#Install depedencies
yum install -y git
yum install -y yum-utils
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Download Resource
cd /home && git clone "https://github.com/phamphihungbk/tinny-docker.git"
cp /home/tinny-docker/config/env.prod /home/tinny-docker/.env

#Start container
systemctl start docker
cd /home/tinny-docker
docker-compose -f ./environment/docker-compose.yml build -d --remove-orphans workspace-php nginx mysql phpmyadmin
docker-compose -f ./environment/docker-compose.yml --env-file .env up -d --remove-orphans workspace-php nginx mysql phpmyadmin syslog-ng

#Instantiate DB info and install php packages
docker exec -it tinny-mysql sh -c "mysql -u root < /docker-entrypoint-initdb.d/createdb.sql"
docker exec -it tinny-php sh -c "composer install"
