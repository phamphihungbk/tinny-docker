## Tinny Docker

####What's inside this repository

- Workspace for NodeJS
- Workspace for PHP-FPM
- Nginx reserve proxy
- Mysql
- PhpMyAdmin
- Automated deployment on Service Provider with Terraform (Digital Ocean)
- Shell script for different environment deployment (local & prod)

####How to use:

- Config `tinny-docker.local` on hosts
- Run make up-node to start container with NodeJS environment
- Run make up-php to start container with PHP environment
- Run make build-node to build container with NodeJS environment
- Run make build-php to build container with PHP environment
- Run make down to stop container

####Terraform Guidelines:

After git clone this repo, then replace digital ocean token in `deployment/variable.tf`

- Run terraform validate to check all Terraform config
- Run terraform init to install Terraform dependencies
- Run terraform plan will show execution plan
- Run terraform apply to instantiate new droplet
