FROM centos

LABEL version=1.0
LABEL description="this is a apache image"
LABEL vendor="yo naranjas"

RUN yum install httpd -y

COPY Bell /var/www/html/

RUN echo "$(whoami)" > /var/www/html/user1.html

RUN useradd edison

USER edison

RUN echo "$(whoami)" > /tmp/user2.html

VOLUME /var/www/html

USER root

RUN cp /tmp/user2.html /var/www/html/user2.html

CMD apachectl -D FOREGROUND