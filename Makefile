up:
	docker-compose -f ./environment/docker-compose.yml up --remove-orphans -d

build:
	docker-compose -f ./environment/docker-compose.yml build

down:
	docker-compose -f ./environment/docker-compose.yml down --remove-orphans
