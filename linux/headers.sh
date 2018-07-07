#!/usr/bin/env bash

echo "Comando para ver los HEADER"
dpkg -l | grep headers

echo "Problemas con headers nuevos... volver a viejos"
echo "synaptic -> linux-headers-generic -> Actual: linux-headers-4.13.0-16-generic"
echo "synaptic -> linux-headers-generic -> Ver: linux-headers-4.10.0-19-generic"
echo "synaptic -> linux-headers-generic -> Ver: linux-headers-4.13.0-25-generic"