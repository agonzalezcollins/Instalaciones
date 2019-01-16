#!/usr/bin/env bash

export http_proxy=''
export https_proxy=''

source venv/bin/activate

fuser -k 5000/tcp
nombre=$1

if [ -z "$nombre" ]
then
  nombre=version_docker
fi

python -m rasa_core.run \
        -d models/${nombre}/dialogue \
        -u models/${nombre}/nlu \
        -o logs/out_${nombre}.log \
        --cors '*' \
        -v

#--cors '*'        / * para incluir todos los orígenes
#--auth_token AUTH_TOKEN     / Habilite la autenticación basada en token. Las solicitudes necesitan proporcionar el token para ser aceptado.
#-p 5005