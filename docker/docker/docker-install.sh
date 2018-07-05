#!/usr/bin/env bash
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
echo "Cierre la sesión completamente de su cuenta y vuelva a iniciar sesión"
