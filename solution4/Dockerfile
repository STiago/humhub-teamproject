FROM nginx:alpine

#!/bin/sh

COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*

EXPOSE 3000

ENTRYPOINT ["nginx", "-g", "daemon off;"]
