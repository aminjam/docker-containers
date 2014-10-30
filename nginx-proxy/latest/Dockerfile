FROM debian:wheezy
MAINTAINER Amin Jams <aminjam@outlook.com>

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get autoremove && \
  apt-get autoclean && \
  apt-get clean
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
RUN echo "deb http://www.nginx.org/packages/debian/ wheezy nginx" > /etc/apt/sources.list.d/nginx.list
RUN apt-get update
RUN apt-get install -qy nginx wget

RUN wget -q --no-check-certificate https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego -P /usr/bin
RUN chmod u+x /usr/bin/forego

RUN wget -q --no-check-certificate https://github.com/jwilder/docker-gen/releases/download/0.3.4/docker-gen-linux-amd64-0.3.4.tar.gz -O docker-gen.tar.gz && \
  tar -xvzf docker-gen.tar.gz && \
  mv docker-gen /usr/bin && \
  chmod u+x /usr/bin/docker-gen &&\
  rm docker-gen.tar.gz

RUN mkdir /etc/nginx/sites-enabled
RUN mkdir /home/app
RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
ADD ./app-config/nginx.conf /etc/nginx/nginx.conf
ADD ./app-config/mime.types /etc/nginx/mime.types
ADD ./app-config/proxy_params /etc/nginx/proxy_params
Add ./app-config/Procfile /home/app/Procfile
Add ./app-config/nginx.tmpl /home/app/nginx.tmpl
##################### INSTALLATION END #####################

RUN echo 'nginx:' `nginx -v`
EXPOSE 80
ENV DOCKER_HOST unix:///tmp/docker.sock
WORKDIR /home/app
CMD ["forego", "start", "-r"]
