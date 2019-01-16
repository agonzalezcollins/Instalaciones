#!/usr/bin/env bash

GLUSTERFS_URL=gluster:/data-nlu-volume

add-apt-repository ppa:gluster/glusterfs-3.5
apt-get update
apt-get install -y glusterfs-client

# Directory to mount GlusterFS
mkdir /data

# Mount the GlusterFS volume over directory (/data)
mount -t glusterfs ${GLUSTERFS_URL} /data

# Test: Verifique que el siguiente comando muestre los archivos de GLUSTERFS
echo "Test..."
df -h | grep "/data"