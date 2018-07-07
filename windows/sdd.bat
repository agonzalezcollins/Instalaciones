@echo off
color 30

echo #Comandos Post Instalación SDD:

echo 1) Configurar el modo AHCI, si la BIOS lo permite, y siempre antes de la instalación del S.O. En caso de necesitar hacerlo después de la instalación, será necesario hacerlo a mano en el sistema operativo, cambiando el valor de 3 a 0 en la siguiente clave del registro: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\msahci

regedit
pause>nul
cls

echo 2) Eliminar archivo de paginación (pagefile.sys), pasándolo a una unidad secundaria. Esto se hace en rendimiento del sistema.

SystemPropertiesPerformance
pause
cls

echo 3) Deshabilitar la desfragmentación del disco SSD. A partir de Windows 7, el propio S.O. lo hace automáticamente, pero conviene comprobarlo. Un disco SSD no necesita desfragmentación, no tiene platos ni cabezales que necesiten un desplazamiento, con lo cual, nos dará igual que los archivos se fragmenten. Sin embargo, la desfragmentación conlleva muchas operaciones de escritura y lectura, que le restará vida al disco. Tanto Windows 7 como Windows 8 han incorporado el comando TRIM, que ayuda a mantener cierta limpieza en el sistema de archivos. Para corroborar que se encuentra activado, se deberá teclear como administrador lo siguiente: fsutil behavior query DisableDeleteNotify (Si el resultado es DisableDeleteNotify=0 es que se encuentra activado)

fsutil behavior query DisableDeleteNotify
set /p opcion= Desea Activar DisableDeleteNotify? (y/n):
if /I "%opcion%" == "y" fsutil behavior set DisableDeleteNotify 1
pause
cls

echo 4) Deshabilitar superprefetch y prefetch (esto ya lo hace Windows 8 automáticamente): [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters], “EnableSuperfetch”=dword:00000000 ; “EnablePrefetcher”=dword:00000000

regedit
pause
cls

echo 5) Para ahorrar espacio, deshabilitar la indexación del disco (botón derecho sobre el mismo, y opción propiedades del menú contextual)

pause
cls

echo 6) Deshabilitar la hibernación del sistema operativo, ya que consumirá espacio y, realmente, arrancar con un disco de éstos es tan rápido como arrancar desde hibernación, así que es innecesario. Para ello, teclear el siguiente comando en el CMD, como administrador:

set /p opcion= Deshabilitar la hibernación del sistema operativo? (y/n):
if /I "%opcion%" == "y" powercfg -h off
else goto exit

pause
cls

echo Todas las configuraciones de SSD para windows finalizadas.

:exit
exit
