# Trae la imagen de la comunidad: https://hub.docker.com:
FROM node:carbon

# Agrego Autor:
MAINTAINER Agustin Gonzalez agonzalezcollins@gmail.com
MAINTAINER version: 0.1

# Especifico el directorio donde trabajare dentro del contenedor:
WORKDIR /usr/src/app

# Instala las dependencias de la Aplicacion (package.json AND package-lock.json):
COPY package*.json ./

# Instalo libreria para que node se levante automaticamente
RUN npm install nodemon -g

# Instalo npm en la imagen node:carbon (Si es para produccion cambiar por "RUN npm install --only=production"):
RUN npm install

# Agrego el codigo de la aplicacion:
COPY . ./

# Abro el puerto por defecto para la conexion
EXPOSE 4000

# Levanto "npm" cuando se crea el contenedor (run)
CMD [ "npm", "start"]