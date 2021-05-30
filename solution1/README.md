# Solution 1 - Container created with customized Dockerfile 
===========================================================

Dockerfile customized using webdevops/php-nginx:7.4 .

https://hub.docker.com/r/webdevops/php-nginx

This image already contains Nginx PHP-FPM, then I have install Humhub.

## Repository structure:
This repository contains 3 files:

- Dockerfile. 
- docker-compose.yml
- entrypoint.sh

Dockerfile and entrypoint.sh need more updates (mainly nginx and database configurations).

## Steps to build the container:

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


Docker compose up will display a failure when it genates the container humhub due to this image needs to be updated.


## Image in dockerhub

The image generated was uploaded to the personal respository "stiago/dummy-humhub"

Link: https://hub.docker.com/repository/docker/stiago/dummy-humhub

![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/dummy_humhub_dockerhub.png)
