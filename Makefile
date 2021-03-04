up-node:
	docker-compose -f ./environment/docker-compose.yml --env-file ../.env up -d --remove-orphans workspace-node nginx mysql phpmyadmin

up-php:
	docker-compose -f ./environment/docker-compose.yml --env-file ../.env up -d --remove-orphans workspace-php nginx mysql phpmyadmin
	docker exec -it tinny-php sh -c "composer install"

build-node: copy-files
	cp -R ./environment/nginx/config/node-config/ ./environment/nginx/config/conf.d
	docker-compose -f ./environment/docker-compose.yml --env-file ../.env build workspace-node nginx mysql phpmyadmin

build-php: copy-files
	cp -R ./environment/nginx/config/php-config/ ./environment/nginx/config/conf.d
	docker-compose -f ./environment/docker-compose.yml --env-file ../.env build workspace-php nginx mysql phpmyadmin

down:
	docker-compose -f ./environment/docker-compose.yml down --remove-orphans

create-db:
	docker exec -it tinny-mysql sh -c "mysql -u root < /docker-entrypoint-initdb.d/createdb.sql"

copy-files:
	cp ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql.example ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql
	cp ./config/env.local ./.env

terraform-validate:
	terraform -chdir=deployment validate

terraform-init:
	terraform -chdir=deployment init

terraform-plan:
	terraform -chdir=deployment plan

terraform-apply:
	terraform -chdir=deployment apply -auto-approve

terraform-destroy:
	terraform -chdir=deployment destroy -auto-approve
