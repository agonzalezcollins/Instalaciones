#!/bin/bash

set -e

function print_help {
    echo "Available options:"
    echo " start commands (Rasa NLU cmdline arguments)  - Start Rasa NLU server"
    echo " train                                        - Train a nlu model"
    echo " start -h                                     - Print Rasa NLU help"
    echo " help                                         - Print this help"
    echo " run                                          - Run an arbitrary command inside the container"
}

case ${1} in
    server)
        exec ./command/rasa_nlu_docker_server.sh "${@:2}"
        ;;
    start)
        exec ./command/rasa_nlu_docker_train.sh &
        exec ./command/rasa_nlu_docker_server.sh "${@:2}"
        ;;
    run)
        exec "${@:2}"
        ;;
    train)
        exec ./command/rasa_nlu_docker_train.sh "${@:2}"
        ;;

    bash)
        exec /bin/bash
        ;;
    *)
        print_help
        ;;
esac


