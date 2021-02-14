up-node:
	docker-compose -f ./environment/docker-compose.yml up workspace-node nginx mysql phpmyadmin --remove-orphans -d

up-php:
	docker-compose -f ./environment/docker-compose.yml up workspace-php nginx mysql phpmyadmin --remove-orphans -d

build-node: copy-files
	docker-compose -f ./environment/docker-compose.yml build workspace-node nginx mysql phpmyadmin

build-php: copy-files
	docker-compose -f ./environment/docker-compose.yml build workspace-php nginx mysql phpmyadmin

down:
	docker-compose -f ./environment/docker-compose.yml down --remove-orphans

create-db: copy-files
	docker exec -it web-mysql sh -c "mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql"

copy-files:
	cp ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql.example ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql
