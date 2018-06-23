#!/usr/bin/env bash

directorio_dockerfile=~/Proyectos/pfc-utn/APIRestSuper/command/
nombre_imagen=pfc-utn/webservicemysql

docker build -t $nombre_imagen $directorio_dockerfile

#--build-arg db_root_pw=rootalvear --build-arg db_name=alvear --build-arg db_username=user --build-arg db_pw=user

# docker run -it -v /data/:/var/lib/mysql --name mysql-server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=alvear centurylink/mysql