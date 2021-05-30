# humhub-teamproject
Deployment of a containerized application with Docker

The purpose of this project is automate the deployment of a containerized application with Docker and Kubernetes.
Two solutions have been developed:

1. Docker image created from a customized Dockerfile + Docker-compose.yml file.
2. Docker-compose running an existing image from dockerhub.

## Requirements

### Humhub requirements
- Webserver:  Nginx.
- Memory: 64MB RAM for PHP, 500MB disk space for the apps and 100MB disk space for the databse.
- PHP 7.4. + Extensions (GG, CurL, MBString, ZIP, EXIF, INTL, FileInfo)
- MariaDB 10.4

### System requirements
1. Before running this service or its tests:
     - Ensure you have installed the following packages: docker, docker-compose

	 1.1. Install Docker

		- Uninstall old versions: sudo apt-get remove docker docker-engine docker.io
		- Update the apt package index: sudo apt-get update
		- Install the latest version or a specific version of Docker: sudo apt-get install docker-ce or sudo apt-get install docker-ce=<VERSION>
	 
	 1.2. Install Compose

		- Download the latest version of Docker Compose: sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
		- Apply executable permissions to the binary: sudo chmod +x /usr/local/bin/docker-compose



## Permisions docker running no-root

``sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo systemctl restart docker ```

For more information please visit the following page: https://docs.docker.com/engine/security/rootless/

## Solutions 

### Solution 1.

### Solution 2.

## Endpoint


