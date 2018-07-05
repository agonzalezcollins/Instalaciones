set directorio_dockerfile=~/Proyectos/pfc-utn/APIRestSuper/
set nombre_imagen=pfc-utn/webservicenodejs

docker build -t %nombre_imagen% %directorio_dockerfile%