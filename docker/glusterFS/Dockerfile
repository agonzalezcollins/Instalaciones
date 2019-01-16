FROM debian:9-slim

MAINTAINER Agustin Gonzalez <agonzalezcollins@santafe.gob.ar>

ENV DEBIAN_FRONTEND noninteractive

# Si es necesario agregar arg para proxy
ARG proxy
ARG https_proxy
ARG noproxy

# Si es necesario agregar variables ENVIRONMENT para el proxy
ENV http_proxy="$proxy"
ENV https_proxy="$https_proxy"
ENV no_proxy="$noproxy"

RUN apt-get clean && \
    apt-get update -q && \
    apt-get install -y locales

# Generate a local to suppress warnings
RUN locale-gen es_ES.UTF-8

RUN apt-get install -y wget attr software-properties-common psmisc

RUN apt-get install -y gpg apt-transport-https ca-certificates

ADD add_gluster_5.sh /tmp/

RUN chmod +x /tmp/add_gluster_5.sh && ./tmp/add_gluster_5.sh && rm /tmp/add_gluster_5.sh && \
	apt-get update && \
	apt-get install -y glusterfs-server

VOLUME ["/data", "/var/lib/glusterd"]

EXPOSE 111 111/udp 24007 24009 49152

CMD ["/usr/sbin/glusterd","-N"]