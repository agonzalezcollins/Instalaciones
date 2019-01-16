#Comun: 3.6-slim
FROM python:3.6.6-slim-jessie

# Si es necesario agregar arg para proxy
ARG proxy
ARG https_proxy
ARG noproxy

# Si es necesario agregar variables ENVIRONMENT para el proxy
ENV http_proxy="$proxy"
ENV https_proxy="$https_proxy"
ENV no_proxy="$noproxy"

#ENV DEBIAN_FRONTEND noninteractive

SHELL ["/bin/bash", "-c"]

# Instalacion inicial
RUN apt-get update -qq && \
  apt-get install software-properties-common -y && \
  apt-get update -qq && \
  apt-get install -y \
  apt-utils \
  gnupg \
  build-essential \
  wget \
  openssh-client \
  graphviz-dev \
  pkg-config \
  git-core \
  openssl \
  libssl-dev \
  libffi6 \
  libffi-dev \
  libpng-dev \
  curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Especifico el directorio donde trabajare dentro del contenedor:
WORKDIR /srv/cuci/

# Copiar instaladores
ADD command ./command
ADD requirements_venv_nlu.txt .
ADD entrypoint.sh .
ADD install_gluster-client.sh .
ADD install_venv.sh .

# Install an Create: Virtual Enviroment - Python
RUN ./install_venv.sh

# Requerimientos modulos python
RUN source venv/bin/activate && \
    pip install -r requirements_venv_nlu.txt

# Eliminar archivos instalacion
RUN rm install_gluster-client.sh install_venv.sh

# Install and Mount: GlusterFS-Client
#RUN ./install_gluster-client.sh

EXPOSE 5000

CMD ["./entrypoint.sh server"]