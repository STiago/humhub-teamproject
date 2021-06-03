# Humhub-teamproject


Deployment of a containerized application with Docker and Kubernetes.

The purpose of this project is automate the deployment of a containerized application with Docker and Kubernetes.
Two solutions have been developed with Docker:

- SOLUTION 1: Docker image created from a customized Dockerfile + Docker-compose.yml file.
- SOLUTION 2: Docker-compose running an existing image from dockerhub.

Two solutions developed with Kubernetes.

- SOLUTION 3: Sidecar pattern.
- SOLUTION 4: Ambassador pattern.


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
      
   solution4
   
      database_deployment.yaml
      
      humhub_deployment.yaml
      
      database_service.yaml
      
      humhub_service.yaml
      
      Dockerfile
      
      nginx.conf
      
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


Dockerfile customized using webdevops/php-nginx:7.4 .

https://hub.docker.com/r/webdevops/php-nginx

This image already contains Nginx PHP-FPM, then I have install Humhub.

#### Directory structure:
This repository contains 3 files:

- Dockerfile. 
- docker-compose.yml
- entrypoint.sh

Dockerfile and entrypoint.sh have been re-configured but there is an issue with yii which needs to be fixed before continue the configuration of database.

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


#### Application already configured with a database. 

We just need to setup the next environment variables if we want to run the app with a database already configured and ready to be used from the browser.

Just need to setup the following environment variables:

```
      HUMHUB_AUTO_INSTALL: 1
      HUMHUB_ADMIN_LOGIN: admin
      HUMHUB_ADMIN_EMAIL: admin@example.com
      HUMHUB_ADMIN_PASSWORD: admin
```

#### Steps to build the container:

- docker-compose up 

The console should display the following output:

![Dockercomposeoutput](https://github.com/STiago/Pictures/blob/master/humhub/docker-compose_s2.png)

![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/humhub_final_view.png)



### Solution 3. Kubernetes - Sidecar pattern

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



### Solution 4. Kubernetes - Ambassador pattern

Ambassador is used as a proxy between the application container and one or more outside services. In our case it is between Humhub app and MariaDB.


![Ambassador_pattern](https://github.com/STiago/Pictures/blob/master/humhub/ambassador-pattern.png)



#### Files developed for this solution:

Into the folder /solution4 you can find the following files:

- Dockerfile: fon nginx ambassador container
- nginx.conf: configuration for nginx - mariadb
- humhub_deployment.yaml: Deployment for humhub&ambassador
- humhub_service.yaml: service.
- database_deployment.yaml: MariaDB's deployment
- database_service.yaml: service.


#### Running the solution step by step

##### 0. Generate nginx-ambassador.

This image was uploaded to dockerhub: https://hub.docker.com/repository/docker/stiago/nginx-ambassador
If you want to generate this image you need nginx.conf provided in this repository then run Dockerfile using the command: `docker build --no-cache -t nginx-ambassador . `


##### 1. MariaDB deployment.

Commands:

`kubectl apply -f database_deployment.yaml`

then you should be able to check the deployment and the corresponding pods created:


![Check_database_deployment_pod](https://github.com/STiago/Pictures/blob/master/humhub/db_deployment.png)


Next step is run the service executing: 

`kubectl expose deployment/database` or `kubectl apply -f database_service.yaml `

`kubectl get svc database`

`kubectl describe svc database`

`kubectl get ep database ` 
 
 
![Expose_service](https://github.com/STiago/Pictures/blob/master/humhub/deployment-database-service.png)



##### 2. Humhub (Humhumb + Nginx)

We will continue with this deployment executing:

`kubectl apply -f humhub_deployment.yaml`

The next pictures displays all the deployments that we currently have and the pods, we can see that both are ready and the pods are running.

![all_deployments](https://github.com/STiago/Pictures/blob/master/humhub/all-deployments.png)


![all_pods](https://github.com/STiago/Pictures/blob/master/humhub/get-pods.png)


Now we will run the service using the same commands that we executed before when we exposed the database's service:


![Expose_humhub_service](https://github.com/STiago/Pictures/blob/master/humhub/humhub-service.png)




## Most challenging areas and improves pending

The configuration of the Dockerfile for the Solution 1 has been the most challenging part, it was not finished yet.

Improvements for docker-compose.yml and humhub-deployment.yaml files related with the credentials assignation (for instance using Secrets: https://kubernetes.io/docs/concepts/configuration/secret/) also volumes could use nfs instead of HostPath (https://kubernetes.io/docs/concepts/storage/volumes/). 


## Humhub site


![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/humhub_final_view.png)


