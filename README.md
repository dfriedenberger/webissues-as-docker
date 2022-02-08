# webissues-as-docker


## Installation
```
docker-compose  -f docker-compose-db.yml up -d 
docker-compose  -f docker-compose-webissues.yml up -d
```


### Configure database

```
docker exec -it webissues-db bash
root@aaaa:/#mysql -u root -p
> ALTER USER 'root'@'localhost' IDENTIFIED BY '<root-password>';
> CREATE USER 'webissues'@'%' IDENTIFIED WITH mysql_native_password BY '<webissues-password>';
> CREATE DATABASE webissues;
> GRANT ALL PRIVILEGES ON `webissues` . * TO 'webissues'@'%';
```

### maria db
SET old_passwords=0;
CREATE USER 'webissues'@'%' IDENTIFIED WITH BY '<webissues-password>';

#### Test connection
```
>docker run -it --rm mysql bash
root@aaaa:/# mysql -h <hostname> -u webissues -p
```

### Installation of WebIsuues
```
http://localhost:8080/ => database hostname 192.168.2.210
```

## Usage 
http://localhost:8080/

