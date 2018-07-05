#!/usr/bin/env bash

docker run -p 8080:80 -e MYSQL_ROOT_PASSWORD=root --name contenedor-phpmyadmin phpmyadmin/phpmyadmin
