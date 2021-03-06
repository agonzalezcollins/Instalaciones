#!/bin/bash

########################
##  Variables         ##
########################

COLOR_RESET="\033[0m"
COLOR_BLACK="\033[22;30m"
COLOR_WHITE="\033[01;37m"
COLOR_BLUE="\033[22;34m"
COLOR_RED="\033[22;31m"
COLOR_GREEN="\033[22;32m"
COLOR_BROWN="\033[22;33m"
COLOR_MAGENTA="\033[22;35m"
COLOR_CYAN="\033[22;36m"
COLOR_GRAY="\033[22;37m"
COLOR_YELLOW="\033[01;33m"
COLOR_DARK_GRAY="\033[01;30m"
COLOR_LIGHT_RED="\033[01;31m"
COLOR_LIGHT_GREEN="\033[01;32m"
COLOR_LIGHT_BLUE="\033[01;34m"
COLOR_LIGHT_MAGENTA="\033[01;35m"
COLOR_LIGHT_CYAN="\033[01;36m"

########################
##  Funciones         ##
########################

list_aplicacion() {
    # 1: Add the following line to /etc/apt/sources.list:
    deb http://linux.dropbox.com/ubuntu trusty main
    # 2: Update the package index:
    sudo apt-get update
    # 3: Install GPG key of the repository:
    sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
    # 4: Install dropbox deb package:
    sudo apt-get install dropbox
}

descargar_aplicacion() {
    echo "Descargar dropbox https://pkgs.org/download/dropbox"
    echo "Se puede descargar chequeando la nueva version: wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
    echo "sudo dpkg -i dropbox_*"
}

opciones() {
    echo
    printf "$COLOR_LIGHT_BLUE Desea agregar dropbox al repositorio e instalarlo? (Y)es/(N)o: $COLOR_RESET"
    read -n1 input

    if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
    then
        list_aplicacion
    else
        echo
	    printf "$COLOR_LIGHT_BLUE Desea descargar aplicacion en /opt ? (Y)es/(N)o: $COLOR_RESET"
        read -n1 input

        if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
        then
            descargar_aplicacion
        else
            echo
	        echo -e "$COLOR_LIGHT_RED Cancelado. Puede descargar la aplicacion de la web oficial$COLOR_RESET"
        fi
    fi
}

########################
##  Ejecucion         ##
########################

sudo apt-get install dropbox || opciones
echo "Directorio de icon: /usr/share/icons/hicolor/scalable/status/"

