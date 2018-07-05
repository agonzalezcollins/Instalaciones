#!/bin/bash

echo -e '\E[32m'"Script para visualizar redes guardadas."
echo -e "También se pueden visualizar desde WIFI + Editar conexiones.\n" '\e[37m'

unset nombreSID

nombreSID="\"Wifi EvaYMora\""

sleep 0.5

cd /etc/NetworkManager/system-connections
echo -e '\E[32m'"Conexiones existentes...\n"'\e[37m'
ls
echo
sudo cat "Wifi EvaYMora" | grep psk=
echo
