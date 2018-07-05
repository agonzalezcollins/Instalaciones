#!/usr/bin/env bash

# Variable pasada como primer parametro
id_contenedor=$1

if [ -z "$id_contenedor" ]
then
    echo -e "\e[0;31mRequerido: Introducir ID Contenedor\e[0m"
    docker ps -a
else
    docker exec -it $id_contenedor bash
fi


