echo "Inportante ejecutar como administrador"
w32tm /query /configuration
w32tm /query /source
w32tm /query /status
w32tm /configure /manualpeerlist:south-america.pool.ntp.org,0x1 /syncfromflags:manual /update
w32tm /resync /rediscover
w32tm /resync /force

# Localiza el servicio Hora de Windows y establécelo en Automático. Comprueba que esté iniciado. Cierra la consola de servicios.
services.msc
