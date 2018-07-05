#!/usr/bin/env bash

# Variable pasada como primer parametro
id_volume=$1

if [ -z "$id_volume" ]
then
    echo -e "\e[0;31mRequerido: Introducir ID Volume\e[0m"
    echo -e "Observacion: Para eliminar todos los volúmenes no utilizados y liberar espacio: \e[1;34mdocker volume prune\e[0m"
    docker volume ls
else
    docker volume inspect $id_volume
fi
