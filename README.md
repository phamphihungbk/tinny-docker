## Tinny Docker

![alt text](images/logo.jpg)

I implemented some instant Docker image and Terraform script.
By using it you can easily to deploy your codebase from local to server with just one command.

## Features:

```txt
- Workspace for NodeJS
- Workspace for PHP
- Workspace for Python
- Nginx
- MySql
- Phpmyadmin
- Quickly deploy with Terraform
- Centralize logs with Syslog-ng
```

## Folder Structure:

```bash
├── config                     # contains env files for different environments
├── deloyment                  # contains Terraform scripts that supports for deployment
├── environment                # contains Dockerfile
└── web                        # where to put web sourcecode (example: Wordpress)
```

## Available commands (Makefile):

```txt
- Run make up-node to start container with NodeJS environment
- Run make up-php to start container with PHP environment
- Run make up-python to start container with Python environment
- Run make build-node to build container with NodeJS environment
- Run make build-php to build container with PHP environment
- Run make build-python to build container with Python environment
- Run make down to stop container
- Run make db-create to create a new table on MySQL
- Run make terraform-validate to check all Terraform config
- Run make terraform-init to install Terraform dependencies
- Run make terraform-plan will show execution plan
- Run make terraform-apply to instantiate new droplet
```
