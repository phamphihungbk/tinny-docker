.PHONY: up-node ## docker up node env
up-node:
	docker-compose -f ./environment/docker-compose.yml --env-file .env up -d --remove-orphans workspace-node nginx mysql phpmyadmin

.PHONY: up-php ## docker up php env
up-php:
	docker-compose -f ./environment/docker-compose.yml --env-file .env up -d --remove-orphans workspace-php nginx mysql phpmyadmin syslog-ng
	docker exec -it tinny-php sh -c "composer install"

.PHONY: build-node ## docker build node env
build-node: copy-files
	cp -R ./environment/nginx/config/node-config/ ./environment/nginx/config/conf.d
	docker-compose -f ./environment/docker-compose.yml --env-file .env build workspace-node nginx mysql phpmyadmin

.PHONY: build-php ## docker build php env
build-php: copy-files
	cp -R ./environment/nginx/config/php-config/ ./environment/nginx/config/conf.d
	docker-compose -f ./environment/docker-compose.yml --env-file .env build workspace-php nginx mysql phpmyadmin syslog-ng

.PHONY: docker-down ## docker stop
down:
	docker-compose -f ./environment/docker-compose.yml down --remove-orphans

.PHONY: db-create ## create db table by sql statement
db-create:
	docker exec -it tinny-mysql sh -c "mysql -u root < /docker-entrypoint-initdb.d/createdb.sql"

.PHONY: copy-files ## copy env and sql file
copy-files:
	cp ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql.example ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql
	cp ./config/env.local ./.env

.PHONY: terraform-validate ## validate terraform plan
terraform-validate:
	terraform -chdir=deployment validate

.PHONY: terraform-init ## initialize terraform
terraform-init:
	terraform -chdir=deployment init

.PHONY: terraform-plan ## show entire terraform plan
terraform-plan:
	terraform -chdir=deployment plan

.PHONY: terraform-apply ## run terraform plan with actual result
terraform-apply:
	terraform -chdir=deployment apply -auto-approve

.PHONY: terraform-destroy ## destroy instance with terraform
terraform-destroy:
	terraform -chdir=deployment destroy -auto-approve
