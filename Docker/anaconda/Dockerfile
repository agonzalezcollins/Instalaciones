# Trae la imagen de la comunidad: https://hub.docker.com:
FROM continuumio/anaconda3

# Agrego Autor:
MAINTAINER Agustin Gonzalez agonzalezcollins@gmail.com
MAINTAINER version: 0.1

# Especifico el directorio donde trabajare dentro del contenedor:
WORKDIR /app

# Instalo jupyter en la imagen continuumio/anaconda3:
RUN /opt/conda/bin/conda install jupyter -y --quiet
RUN mkdir /opt/notebooks
#RUN /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser

# Agrego el codigo de la aplicacion en WORKDIR:
#COPY . ./

# Abro el puerto por defecto para la conexion
EXPOSE 8888

# Establesco las carpetas de tranferencia
VOLUME .:/app
VOLUME /data/anaconda/notebooks/:/opt/notebooks

# Levanto "npm" cuando se crea el contenedor (run)
CMD [ "/bin/bash" ]

