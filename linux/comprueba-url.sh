#!/bin/bash

##
# Funciones de Utilidad
#

err() {
  errcode=$1
  shift
  msg=$*

  echo $msg >&2
  exit $errcode
}

usage() {
  err 9 "Usage: $0 [-H] url [-t] 2"
}


##
# Procesa opciones de linea de mandatos
#

OPTIND=1 #limpia optargs
curl_connect_timeout=2
URL=

while getopts ":H:t" opt
do
    case "$opt" in
        H) URL=$OPTARG
           ;;
        t) curl_connect_timeout=$OPTARG
           ;;
        *) usage
           ;;
    esac
done
shift $((OPTIND-1))
[ -z "$URL" ] && usage

##
# main
#

json=$(curl -s --connect-timeout ${curl_connect_timeout} ${URL} )
[ -z "${json}" ] && err 3 "No se pudo conseguir la salida JSON"

status_type=$( echo ${json} |  jq --raw-output ".[0].status.type" 2>/dev/null )

case $status_type in
    0|1|2|3)
        status_message=$( echo ${json} |  jq --raw-output ".[0].status.message")
        [ -z "${status_message}" ] || echo "${status_message}"
        exit ${status_type} 
        ;;
    *)
        err 3 "El código de retorno no sirve para icinga: ["$status_type"]"
        ;;
esac

#
# Plugin Return Code | Service State | Host State
# 0 | OK       | UP
# 1 | WARNING  | UP or DOWN/UNREACHABLE*
# 2 | CRITICAL | DOWN/UNREACHABLE
# 3 | UNKNOWN  | DOWN/UNREACHABLE


