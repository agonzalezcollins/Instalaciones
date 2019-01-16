#!/bin/bash

set -e

function print_help {
    echo "Available options:"
    echo " start commands (Rasa Core cmdline arguments) - Start Rasa Core server"
    echo " train                                        - Train a dialogue model"
    echo " start -h                                     - Print Rasa Core help"
    echo " help                                         - Print this help"
    echo " run                                          - Run an arbitrary command inside the container"
}

case ${1} in
    server)
        exec ./command/rasa_core_docker_server.sh
        ;;
    start)
        exec python -m rasa_core.server "${@:2}"
        ;;
    run)
        exec "${@:2}"
        ;;
    train)
        exec python -m rasa_core.train -s ./stories.md -d ./data/domain.yml -o ./out "${@:2}"
        ;;

    bash)
        exec /bin/bash
        ;;
    *)
        print_help
        ;;
esac


