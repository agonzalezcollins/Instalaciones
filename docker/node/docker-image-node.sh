#!/usr/bin/env bash

directorio_dockerfile=~/Proyectos/pfc-utn/APIRestSuper/
nombre_imagen=pfc-utn/webservicenodejs

docker build -t $nombre_imagen $directorio_dockerfile