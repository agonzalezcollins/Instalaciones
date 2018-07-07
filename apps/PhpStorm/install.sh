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

create_install() {
    sudo cp -rd PhpStorm-173.4127.29/ /opt/
    echo "La ejecucion crea un icono. Sino buscar en /usr/share/icons/hicolor/scalable/status/"
}

descargar_aplicacion() {
    echo "Descargar version mas reciente, check PhpStorm-2017.3.2.tar.gz"
    echo "wget https://download.jetbrains.com/webide/PhpStorm-2018.1.6.tar.gz"
}

opciones() {
    echo
    printf "$COLOR_LIGHT_BLUE Desea descargar phpStorm? (Y)es/(N)o: $COLOR_RESET"
    read -n1 input

    if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
    then
        descargar_aplicacion
    else
        echo
	    printf "$COLOR_LIGHT_BLUE Desea agregar instalacion en /opt (Y)es/(N)o: $COLOR_RESET"
        read -n1 input

        if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
        then
            create_install
        else
            echo
	        echo -e "$COLOR_LIGHT_RED Cancelado. Puede descargar la aplicacion de la web oficial$COLOR_RESET"
        fi
    fi
}

########################
##  Ejecucion         ##
########################

echo "Es recomendado descargar JetBrains Toolbox"
echo "Check nueva version: wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.9.3935.tar.gz"
opciones


