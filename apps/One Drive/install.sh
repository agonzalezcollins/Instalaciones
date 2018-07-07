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

list_aplicacion(){

}

descargar_aplicacion() {
    echo Arquitectura Sistema: $(uname -i)

}

opciones(){
    echo
    printf "$COLOR_LIGHT_BLUE Desea agregar google a sources.list de $(uname) e instalar google chrome? (Y)es/(N)o: $COLOR_RESET"
    read -n1 input

    if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
    then
        list_aplicacion
    else
        echo
	    printf "$COLOR_LIGHT_BLUE Desea descargar .deb google chrome e instalar? (Y)es/(N)o: $COLOR_RESET"
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

echo "ONEDRIVE (https://www.redeszone.net/2014/06/25/como-sincronizar-ubuntu-con-los-servidores-de-microsoft-de-onedrive/)"
echo "git clone https://github.com/xybu/onedrive-d-old.git"
echo  "cd onedrive-d"