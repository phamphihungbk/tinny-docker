## Tinny Docker

![alt text](images/logo.jpg)
#### What's inside this repository

- Workspace for NodeJS
- Workspace for PHP-FPM
- Nginx reserve proxy
- MySql
- PHPMyAdmin
- Automated deployment on Service Provider with Terraform (Digital Ocean)
- Shell script for different environment deployment (local & prod)

#### Folder Structure:

- config: contain env file
- deployment: contain Terraform script for automatic deployment
- environment: contain Dockerfile to initialize docker instances
- web: will contain your web sourcecode

#### Docker Guidelines:

- Run make up-node to start container with NodeJS environment
- Run make up-php to start container with PHP environment
- Run make build-node to build container with NodeJS environment
- Run make build-php to build container with PHP environment
- Run make down to stop container
- Run make create-db to create a new table on MySQL

#### How to use PHPMyAdmin and access website:

- Config `tinny-docker.local` and `admin.tinny-docker.local` on hosts
- `tinny-docker.local`: website
- `admin.tinny-docker.local`: phpmyadmin

#### Terraform Guidelines:

After git clone this repo, then replace digital ocean token and ssh key in `deployment/variable.tf`

- Run `make terraform-validate` to check all Terraform config
- Run `make terraform-init` to install Terraform dependencies
- Run `make terraform-plan` will show execution plan
- Run `make terraform-apply` to instantiate new droplet

#### Auto Deployment for Wordpress:

- Replace DB info inside /config/env.prod
- Run Terraform to trigger Digital Ocean create new Droplet
