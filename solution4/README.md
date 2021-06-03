# Solution 4. Kubernetes - Ambassador

Deployment using Ambassador pattern.


![Ambassador_pattern](https://github.com/STiago/Pictures/blob/master/humhub/ambassador-pattern.png)



## Files:

Into the folder /solution4 you can find the following files:

- Dockerfile: fon nginx ambassador container
- nginx.conf: configuration for nginx - mariadb
- humhub_deployment.yaml: Deployment for humhub&ambassador
- humhub_service.yaml: service.
- database_deployment.yaml: MariaDB's deployment
- database_service.yaml: service.

## Running the solution step by step

### 0. Generate nginx-ambassador.

This image was uploaded to dockerhub: https://hub.docker.com/repository/docker/stiago/nginx-ambassador
If you want to generate this image you need nginx.conf provided in this repository then run Dockerfile using the command: `docker build --no-cache -t nginx-ambassador . `

### 1. MariaDB deployment.

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



### 2. Humhub (Humhumb + Nginx)

We will continue with this deployment executing:

`kubectl apply -f humhub_deployment.yaml`

The next pictures displays all the deployments that we currently have and the pods, we can see that both are ready and the pods are running.

![all_deployments](https://github.com/STiago/Pictures/blob/master/humhub/all-deployments.png)


![all_pods](https://github.com/STiago/Pictures/blob/master/humhub/get-pods.png)


Now we will run the service using the same commands that we executed before when we exposed the database's service:


![Expose_humhub_service](https://github.com/STiago/Pictures/blob/master/humhub/humhub-service.png)



