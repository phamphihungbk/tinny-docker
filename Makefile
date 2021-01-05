up:
	docker-compose -f ./environment/docker-compose.yml up --remove-orphans -d

build: copy-files
	docker-compose -f ./environment/docker-compose.yml build

down:
	docker-compose -f ./environment/docker-compose.yml down --remove-orphans

create-db:
	docker exec -it web-mysql sh -c "mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql"

copy-files:
	cp ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql.example ./environment/mysql/docker-entrypoint-initdb.d/createdb.sql
