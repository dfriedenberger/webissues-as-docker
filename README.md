# webissues-as-docker


## Installation

docker-compose up

## configure database
docker exec -it webissues-as-docker_db_1 bash

mysql -u root -p
> ALTER USER 'root'@'localhost' IDENTIFIED BY '<root-password>';
> CREATE USER 'webissues'@'%' IDENTIFIED WITH mysql_native_password BY '<webissues-password>';
> CREATE DATABASE webissues;
> GRANT ALL PRIVILEGES ON `webissues` . * TO 'webissues'@'%';

#### Test connection

C:\Users\DirkFriedenberger>docker run -it --rm mysql bash
root@3fdeef6ff619:/# mysql -h <hostname> -u webissues -p

### Installation von WebIsuues

http://localhost:8080/ => datenbank 192.168.2.210


### Usage 
http://localhost:8080/

