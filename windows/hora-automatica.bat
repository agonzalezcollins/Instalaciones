echo "Inportante ejecutar como administrador"
echo "Techa Windows + X , Ejecutar Shell como administrador"

# Opcion 1
w32tm /query /configuration
w32tm /query /source
w32tm /query /status
w32tm /configure /manualpeerlist:south-america.pool.ntp.org,0x1 /syncfromflags:manual /update
w32tm /resync /rediscover
w32tm /resync /force

# Opcion 2
# Localiza el servicio Hora de Windows y establécelo en Automático. Comprueba que esté iniciado. Cierra la consola de servicios.
services.msc

# Opcion 3
# Proceso de examen del sistema
sfc /scannow

# Opcion 4
echo "Comprobar la configuracion de la Hora en la BIOS"

