#!/usr/bin/env bash
docker info
echo "CPU maxima compartida entre los contenedores" ; cat /sys/fs/cgroup/cpu/docker/cpu.shares
docker run -it mongo /bin/bash \
      --memory 256M \
      --memory-swap 256M \
      --cpus 1.5 \
      --cpu-shares=512
docker stats
