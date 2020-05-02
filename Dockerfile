FROM centos:7

RUN \
    yum -y install \
    httpd \
    php \
    php-cli \
    php-common \
    mod_ssl \
    openssl

RUN echo "<?php phpinfo(); ?>" > /var/www/html/hola.php

LABEL openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout docker.key -out docker.crt

COPY grayscale /var/www/html/

COPY ssl.conf /etc/httpd/conf.d/default.conf

COPY docker.crt /docker.crt

COPY docker.key /docker.key

EXPOSE 443

CMD apachectl -DFOREGROUND