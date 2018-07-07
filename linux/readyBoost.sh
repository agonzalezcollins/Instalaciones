#!/usr/bin/env bash

Crear una partición SWAP en la memoria y darle una prioridad altísima para que la utilice como si fuera una extensión de la RAM física.

- Innsertamos la memoria flash (pendrive, SD, lo que sea)

> Debemos desmontarla si es que nuestro sistema la monta automáticamente:
(Tomamos '/media' como el punto donde el sistema monta por defecto).

`umount /media/nombre_del_recurso_montado`

- Creamos la partición SWAP en la memoria: `mkswap /dev/sdb1`

Suponiendo en este ejemplo que sdb1 es el dispositivo usb conectado.
Activamos la SWAP con alta prioridad: `swapon -p 32767 /dev/sdb1`

- Para corroborar que la nueva SWAP esté en uso podemos hacer: `cat /proc/swaps`

Obviamente el hacer esto no es lo mismo que aumentar físicamente la RAM, pero mejora considerablemente la velocidad del sistema, y mas aún si usamos una SD HC (de alta velocidad).

> Si queremos desactivar la SWAP: `swapoff /dev/sdb1`