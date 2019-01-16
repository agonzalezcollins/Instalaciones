#!/usr/bin/env bash

DEBID=$(grep 'VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
DEBVER=$(grep 'VERSION=' /etc/os-release | grep -Eo '[a-z]+')
DEBARCH=$(dpkg --print-architecture)

wget -O - https://download.gluster.org/pub/gluster/glusterfs/5/rsa.pub | apt-key add -
echo deb https://download.gluster.org/pub/gluster/glusterfs/LATEST/Debian/${DEBID}/${DEBARCH}/apt ${DEBVER} main > /etc/apt/sources.list.d/gluster.list

# Fuente: https://docs.gluster.org/en/latest/Install-Guide/Install/#for-debian