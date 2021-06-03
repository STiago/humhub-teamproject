# Solution 2 - Alpine-Based PHP-FPM and NGINX HumHub Container 

Build a container from an existing and customized image.
From dockerhub https://hub.docker.com/r/mriedmann/humhub


## Application already configured with a database. 

We just need to setup the next environment variables if we want to run the app with a database already configured and ready to be used from the browser.
 

```environment:
      HUMHUB_DB_USER: humhub
      HUMHUB_DB_PASSWORD: humhub
      HUMHUB_DB_NAME: humhub
      HUMHUB_DB_HOST: db
      HUMHUB_AUTO_INSTALL: 1
      HUMHUB_ADMIN_LOGIN: admin
      HUMHUB_ADMIN_EMAIL: admin@example.com
      HUMHUB_ADMIN_PASSWORD: admin
```

## Steps to build the container:

- docker-compose up 

The console should display the following output:

![Dockercomposeoutput](https://github.com/STiago/Pictures/blob/master/humhub/docker-compose_s2.png)

![Humhub](https://github.com/STiago/Pictures/blob/master/humhub/humhub_final_view.png)
