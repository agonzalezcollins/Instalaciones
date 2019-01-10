#!/usr/bin/env bash

echo "WEB: https://www.getpostman.com/downloads/"
wget https://dl.pstmn.io/download/latest/linux64
tar xzf Postman-linux-x64-*.tar.gz
sudo mv Postman /opt/
cp Postman.desktop ~/.local/share/applications/