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
    sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
    sudo apt update
    sudo apt install ubuntu-make
    umake android
}

descargar_aplicacion() {
    echo "Descargar Android https://developer.android.com/sdk/index.html"
    echo "Se puede descargar chequeando la nueva version: wget https://dl.google.com/dl/android/studio/ide-zips/3.1.3.0/android-studio-ide-173.4819257-linux.zip"
    sudo unzip android-studio-ide-* -d /opt
}

opciones() {
    echo
    printf "$COLOR_LIGHT_BLUE Desea agregar ubuntu-make al repositorio e instalar android con 'umake'? (Y)es/(N)o: $COLOR_RESET"
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

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
opciones
sudo cp androidstudio.desktop ~/.local/share/applications/androidstudio.desktop


