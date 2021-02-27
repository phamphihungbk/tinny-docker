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

create-db:
	docker exec -it tinny-mysql sh -c "mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql"

copy-files:
	cp ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql.example ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql
	cp ./config/env.local ./web/.env

terraform-validate:
	terraform -chdir=deployment validate

terraform-init:
	terraform -chdir=deployment init

terraform-plan:
	terraform -chdir=deployment plan

terraform-apply:
	terraform -chdir=deployment apply

terraform-destroy:
	terraform -chdir=deployment destroy
