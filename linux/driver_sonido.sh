#!/usr/bin/env bash
sudo aptitude install build-essential libncurses-dev gettext xmlto xmltoman linux-headers-`uname -r`

HDA-Intel - HDA Intel PCH

# Carpetas
/usr/share/doc/alsa-base/driver
/etc/modprobe.d

# Modelo Placa Solido: 
less /proc/asound/card0/codec#0
Realtek ALC233

# Configurar Modelo
sudo pluma /etc/modprobe.d/alsa-base.conf
Agregar -> options snd-hda-intel model=asus
sudo alsa force-reload

# Modelos ASUS
A7J model= asus-a7j
A7M model=asus-a7m
F2/F3 model= asus-laptop
F6A-2 model=6stack
enable_msi=1
single_cmd=1
G50v model=g50v
G71v model=g71v
H13 model=h13
M2R32-MVP model=6stack
M51SN-AP067G model=lenovo
NV80 model=g50v position_fix=0
X20G, U1E model=lenovo
W2JC model=w2jc
Eeepc P701 model=eeepc-p701
Eeepc-EP20 model=eeepc-ep20

# Agregar Versiones de Desarrollo
sudo add-apt-repository ppa:ubuntu-audio-dev/ppa
sudo apt-get update
sudo apt-get install linux-alsa-driver-modules-$(uname -r)
sudo reboot
