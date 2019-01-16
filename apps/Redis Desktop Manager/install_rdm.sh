#!/usr/bin/env bash

echo "WEB: https://redisdesktop.com/"
sudo snap install redis-desktop-manager
snap info redis-desktop-manager

sudo cp RedisDesktopManager.desktop /usr/share/applications/RedisDesktopManager.desktop