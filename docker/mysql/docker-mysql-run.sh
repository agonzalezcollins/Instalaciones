#!/usr/bin/env bash

docker run -p 3307:3306 -e MYSQL_ROOT_PASSWORD=rootalvear -e MYSQL_DATABASE=alvear --name contenedor-mysql pfc-utn/webservicemysql