# Trae la imagen de la comunidad: https://hub.docker.com:
#FROM mysql
FROM centurylink/mysql

# Agrego Autor:
MAINTAINER Agustin Gonzalez agonzalezcollins@gmail.com
MAINTAINER version: 0.1

# Install requirement (wget)
#RUN apt-get update

#ENV MYSQL_ROOT_PASSWORD=rootalvear
#ENV MYSQL_DATABASE=alvear
#ENV MYSQL_USER=user
#ENV MYSQL_PASSWORD=useralvear
 
# Crea un destino backup
RUN mkdir -p /backup/utn-pfc
 
# Permite montar el directorio backup
VOLUME ["/backup/utn-pfc"]
