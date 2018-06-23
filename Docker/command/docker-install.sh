#!/usr/bin/env bash
sudo curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
