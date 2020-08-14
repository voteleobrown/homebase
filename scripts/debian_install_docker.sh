#!/bin/bash
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
deb [arch=amd64] https://download.docker.com/linux/debian buster stable
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose
sudo usermod -aG docker $USER
newgrp docker

