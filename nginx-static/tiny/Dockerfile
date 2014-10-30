FROM scratch
MAINTAINER Amin Jams <aminjam@outlook.com>

ADD ./rootfs.tar /

RUN mkdir -p /var/lib/nginx

RUN rm /etc/nginx/nginx.conf /etc/nginx/mime.types
RUN mkdir /etc/nginx/ssl
ADD ./app-config/nginx.conf /etc/nginx/nginx.conf
ADD ./app-config/mime.types /etc/nginx/mime.types
ADD ./app-config/default /etc/nginx/sites-enabled/default
ADD ./app-config/default-ssl /etc/nginx/sites-available/default-ssl
RUN mkdir -p /home/app
##################### INSTALLATION END #####################

RUN echo 'nginx:' `nginx -v`
EXPOSE 80 443
WORKDIR /home/app
CMD ["nginx"]
