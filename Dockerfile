FROM ubuntu:18.04
RUN apt-get -y update
RUN apt-get install -y nginx
WORKDIR code
COPY ./code/index.html /code
COPY ./nginx-conf/nginx-front.conf /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]
