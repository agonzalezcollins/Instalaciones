#!/usr/bin/env bash

# Instalar Fuentes varias y Windows:
sudo apt-get install -y msttcorefonts \
     t1-xfree86-nonfree \
     gsfonts \
     gsfonts-x11 \
     gsfonts-other \
     fonts-dustin \
     fonts-f500 \
     fonts-larabie-deco \
     fonts-larabie-straight \
     fonts-larabie-uncommon \
     fonts-bpg-georgian \
     fonts-ubuntu-title \
     xfonts-intl-european \
     ttf-isabella \
     ttf-staypuft \
     ttf-summersby \
     ttf-sjfonts \
     ttf-xfree86-nonfree

echo "OBSERVACIONES:"
echo "Si se dispone de archivos OTF - Abrir cada uno he instalar manualmente"
echo "Tambien se puede copiar las fuentes en (/usr/share/fonts) a nivel global o en (/home/usuario/.fonts) a nivel usuario y luego regenerar cache"
echo "DIRECTORIO: /usr/share/fonts/opentype"

# Regenerar caché de fuentes
sudo fc-cache -f -v