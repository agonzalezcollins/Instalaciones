#!/usr/bin/env bash

wget https://dl.pstmn.io/download/latest/linux64
tar xzf Postman-linux-x64-*.tar.gz
sudo mv Postman /opt/
cp Postman.desktop ~/.local/share/applications/