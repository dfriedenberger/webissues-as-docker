FROM debian:buster

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

EXPOSE 80

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY entrypoint.sh entrypoint.sh
RUN chmod 0777 entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
CMD ["apachectl", "-D", "FOREGROUND"]
