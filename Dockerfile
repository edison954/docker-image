FROM centos

RUN yum install httpd -y

COPY Bell /var/www/html/
CMD apachectl -D FOREGROUND