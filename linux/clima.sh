#!/usr/bin/env bash

IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
#curl ifconfig.co
#wget -qO- ifconfig.co/ip 
#dig +short myip.opendns.com @resolver1.opendns.com
#dig TXT +short o-o.myaddr.l.google.com @ns1.google.com

echo "Comando para saber el clima actual"
echo "Mi IP publica: ${IP}"

echo "Clima en Santa Fe, Argentina"
#curl wttr.in/santa+fe

curl wttr.in/@$IP

#curl wttr.in/:help
