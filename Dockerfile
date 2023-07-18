FROM debian:bookworm

RUN apt-get update

RUN apt-get -y install apache2

RUN apt-get -y install php libapache2-mod-php

RUN apt-get -y install php-mbstring php-mysqli php-imap
RUN apt-get -y install wget zip

RUN wget https://github.com/mimecorg/webissues/releases/download/v2.0.3/webissues-server-2.0.3.zip
RUN unzip webissues-server-2.0.3.zip
RUN rm /var/www/html/*
RUN cp -r webissues-server-2.0.3/* /var/www/html
RUN chown -R www-data /var/www/html/*
RUN chgrp -R www-data /var/www/html/*


RUN openssl req -x509 -nodes -subj '/CN=localhost' -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

COPY default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY ssl-params.conf /etc/apache2/conf-available/ssl-params.conf

RUN a2enmod ssl
RUN a2enmod headers
RUN a2ensite default-ssl
RUN a2enconf ssl-params


EXPOSE 443

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY entrypoint.sh entrypoint.sh
RUN chmod 0777 entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["apachectl", "-D", "FOREGROUND"]
