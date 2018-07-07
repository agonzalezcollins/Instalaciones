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
    # 1. Add the Spotify repository signing keys to be able to verify downloaded packages
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
    # 2. Add the Spotify repository
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    # 3. Update list of available packages
    sudo apt-get update
    # 4. Install Spotify
    sudo apt-get install spotify-client
}

opciones() {
    echo
    printf "$COLOR_LIGHT_BLUE Desea agregar spotify al repositorio e instalarlo? (Y)es/(N)o: $COLOR_RESET"
    read -n1 input

    if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
    then
        list_aplicacion
    else
        echo
        echo -e "$COLOR_LIGHT_RED Cancelado. Puede descargar la aplicacion de la web oficial$COLOR_RESET"
    fi
}

########################
##  Ejecucion         ## 
########################

sudo apt-get update
sudo apt-get install spotify-client || opciones