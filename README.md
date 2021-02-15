### Tinny Docker

What's inside this repository

- Workspace for NodeJS
- Workspace for PHP-FPM
- Nginx reserve proxy
- Mysql
- PhpMyAdmin
- Automated deployment on Service Provider with Terraform (update later)
- Shell script for different environment deployment (local & prod) (update later)

How to use:

- Config `tinny-docker.local` on hosts
- Run make up-node to start container with NodeJS environment
- Run make up-php to start container with PHP environment
- Run make build-node to build container with NodeJS environment
- Run make build-php to build container with PHP environment
- Run make down to stop container