# humhub-teamproject


Deployment of a containerized application with Docker and Kubernetes.

The purpose of this project is automate the deployment of a containerized application with Docker and Kubernetes.
Two solutions have been developed with Docker:

1. Docker image created from a customized Dockerfile + Docker-compose.yml file.
2. Docker-compose running an existing image from dockerhub.

One solution developed with Kubernetes.

## Project structure

humhub-teamproject

   README.md
   
   solution1
   
      Dockerfile
      
      docker-compose.yml
      
      entrypoint.sh
      
      README.md
      
   solution2
   
      docker-compose.yml
      
      README.md
      
   solution3
   
      humhub-deployment.yaml
      
      README.md

## Requirements

### Humhub requirements
- Webserver:  Nginx.
- Memory: 64MB RAM for PHP, 500MB disk space for the apps and 100MB disk space for the databse.
- PHP 7.4. + Extensions (GG, CurL, MBString, ZIP, EXIF, INTL, FileInfo)
- MariaDB 10.4

### System requirements
1. Before running this service or its tests:
     - Ensure you have installed the following packages: docker, docker-compose, kubernetes.

	 1.1. Install Docker

		- Uninstall old versions: sudo apt-get remove docker docker-engine docker.io
		- Update the apt package index: sudo apt-get update
		- Install the latest version or a specific version of Docker: sudo apt-get install docker-ce or sudo apt-get install docker-ce=<VERSION>
	 
	 1.2. Install Compose

		- Download the latest version of Docker Compose: sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
		- Apply executable permissions to the binary: sudo chmod +x /usr/local/bin/docker-compose



## Permisions docker running no-root

$ sudo chown "$USER":"$USER" /home/"$USER"/.docker -R

$ sudo chmod g+rwx "$HOME/.docker" -R

$ sudo systemctl restart docker 

For more information please visit the following page: https://docs.docker.com/engine/security/rootless/

## Solutions 

### Solution 1. Container created with customized Dockerfile 
===========================================================

Dockerfile customized using webdevops/php-nginx:7.4 .

https://hub.docker.com/r/webdevops/php-nginx

This image already contains Nginx PHP-FPM, then I have install Humhub.

#### Directory structure:
This repository contains 3 files:

- Dockerfile. 
- docker-compose.yml
- entrypoint.sh

Dockerfile and entrypoint.sh need more updates (mainly nginx and database configurations).

#### Steps to build the container:

Change to the director solution1, build the Dockerfile and run docker-compose.

```
$ cd solution1
$ docker build --no-cache -t test-humhub . 
$ docker-compose up 
```

You should get an output similar to the following screenshoot:

- Generate image:
![Humhub](https://github.com/STiago/Pictures/tree/master/humhub/dockerfile_run_s1.png)


![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/output_dockerfile_s1.png)


Docker compose up will display a failure when it generates the container humhub because this image needs to be updated.


#### Image in dockerhub

The image generated was uploaded to the personal respository "stiago/dummy-humhub"

Link: https://hub.docker.com/repository/docker/stiago/dummy-humhub

![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/dummy_humhub_dockerhub.png)



### Solution 2. Alpine-Based PHP-FPM and NGINX HumHub Container 


Build a container from an existing and customized image.
From dockerhub https://hub.docker.com/r/mriedmann/humhub
Dockerfile with requirements: https://github.com/mriedmann/humhub-docker/blob/master/Dockerfile

#### Steps to build the container:

- docker-compose up 

The console should display the following output:

![Dockercomposeoutput](https://github.com/STiago/Pictures/blob/master/humhub/docker-compose_s2.png)

![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/humhub_final_view.png)



### Solution 3. Kubernetes

Deployment with Kubernetes.

The main commands to use for creating, removing and checking the status of the deployment are the following commands:

$ kubectl apply -f humhub-deployment.yaml

$ kubectl delete deployment humhub

$ kubectl get pods

$ kubectl describe pod humhub-8565d97c88-h9fqm

$ kubectl get deployments 


For the deployments you just need to run the command `kubectl apply -f humhub-deployment.yaml`, then you can check the deployments and the pods:

![Check_pod](https://github.com/STiago/Pictures/blob/master/humhub/get_pods.png)

![Describe_pod](https://github.com/STiago/Pictures/blob/master/humhub/describe_pods.png)

## Most challenging areas and improves pending

The configuration of the Dockerfile for the Solution 1 has been the most challenging part, it was not finished yet.

Improvements for docker-compose.yml and humhub-deployment.yaml files related with the credentials assignation (for instance using Secrets: https://kubernetes.io/docs/concepts/configuration/secret/) also volumes could use nfs instead of HostPath (https://kubernetes.io/docs/concepts/storage/volumes/). 


## Endpoint

http://localhost:8080/installer/index


![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/humhub_final_view.png)


