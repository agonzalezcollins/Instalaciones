#!/usr/bin/env bash

echo "Ver ultima version en: https://robomongo.org/download"
wget https://download.robomongo.org/1.2.1/linux/robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
tar -xvzf robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz
rm robo3t*.tar.gz
sudo mkdir -p /usr/local/bin/robomongo
sudo mv robo3t-1.2.1-linux-x86_64-3e50a65/ /usr/local/bin/robomongo
cd /usr/local/bin/robomongo/bin
sudo echo "alias robomongo='/usr/local/bin/robomongo/bin/robo3t'" >> ~/.bashrc
source ~/.bashrc
robomongo

echo "Create ICONS:"
sudo mkdir -p /usr/share/applications/myicons/
cd /usr/share/applications/myicons/
sudo wget https://blog.robomongo.org/content/images/2015/12/robomongo-128x128.png -O robomongo.png

sudo cp Robomongo.desktop /usr/share/applications/Robomongo.desktop

# Si desea agregarlo en el PATH
export PATH=/usr/bin/robomongo/bin:$PATH
set PATH $PATH /usr/local/bin/robomongo/bin