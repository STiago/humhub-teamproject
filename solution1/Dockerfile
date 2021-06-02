FROM webdevops/php-nginx:7.4
#onerpm/ubuntu-nginx-php7
MAINTAINER Victoria Santiago <victoriasantiagoalcala@gmail.com>

# Update ubuntu software repository
RUN apt-get update

# Install requirements
RUN apt-get install -y \
    curl \
    tzdata \
    sqlite \
    supervisor \
    && apt-get clean

RUN mkdir /var/www/localhost

# Get HumHub
WORKDIR /usr/src/
RUN curl -sLO "https://www.humhub.com/download/package/humhub-1.8.2.tar.gz" && tar xf humhub-1.8.2.tar.gz
RUN mv humhub-1.8.2 humhub && rm humhub-1.8.2.tar.gz
RUN mv humhub /var/www/localhost/htdocs
RUN cd /var/www/localhost/htdocs && ls -l

# File permissions
RUN chown -R www-data:www-data /var/www/localhost/htdocs

RUN cd /var/www/html/ && ls -l

WORKDIR /usr/src/humhub

# Customize memory limit to 1G (Defaul values used from the webdevops)
RUN echo memory_limit = 1 G >> /opt/docker/etc/php/php.ini
RUN ls /etc/nginx/sites-enabled/
COPY humhub.conf /humhub.conf
COPY /humhub.conf /etc/nginx/sites-available/humhub.conf
RUN ln -s /etc/nginx/sites-available/humhub.conf /etc/nginx/sites-enabled/humhub.conf

CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]

WORKDIR /usr/src/humhub

#RUN cd /var/www/ && mkdir localhost
#RUN cp -r . /var/www/localhost/htdocs/

# Volumes
RUN mkdir -p /usr/src/humhub/protected/config/ && \
    cp -R /var/www/localhost/htdocs/protected/config/* /usr/src/humhub/protected/config/ && \
    rm -f var/www/localhost/htdocs/protected/config/common.php /usr/src/humhub/protected/config/common.php && \
    echo "1.8.2" >  /usr/src/humhub/.version
 
VOLUME /var/www/localhost/htdocs/uploads
VOLUME /var/www/localhost/htdocs/protected/config
VOLUME /var/www/localhost/htdocs/protected/modules
#RUN mkdir -p /usr/src/humhub/protected/config/ && \
#    cp -R /var/www/humhub/protected/config/* /usr/src/humhub/protected/config/ && \
#    rm -f var/www/humhub/protected/config/common.php /usr/src/humhub/protected/config/common.php && \
#    echo "1.8.2" >  /usr/src/humhub/.version
 
#VOLUME /var/www/humhub/uploads
#VOLUME /var/www/humhub/protected/config
#VOLUME /var/www/humhub/protected/modules

# Pending to update this configuration  
COPY entrypoint.sh /entrypoint.sh
RUN chmod 600 /etc/nginx && \
    chmod 777 /entrypoint.sh  
     
ENTRYPOINT ["/entrypoint.sh"]
CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]

EXPOSE 80 800
