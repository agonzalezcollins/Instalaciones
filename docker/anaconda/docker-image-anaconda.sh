#!/usr/bin/env bash

directorio_dockerfile=~/Proyectos/Instalaciones/Docker/anaconda/
nombre_imagen=investigacion/anaconda

docker build -t $nombre_imagen $directorio_dockerfile