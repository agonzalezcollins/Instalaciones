# Variable pasada como primer parametro
set id_contenedor=%1

IF "%id_contenedor%"=="" (
    echo "Introducir ID Contenedor"
    docker ps -a
)
else
    docker logs %id_contenedor%

