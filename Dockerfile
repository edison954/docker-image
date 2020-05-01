FROM centos

RUN yum install httpd -y

WORKDIR /var/www/html/

COPY Bell .

ENV contenido prueba

RUN echo "$contenido" > /var/www/html/prueba.html

EXPOSE 81

CMD apachectl -D FOREGROUND