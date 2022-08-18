#! /bin/bash
#uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc;

#update and install dependencies
sudo apt-get update;

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release;

#generate keys
sudo mkdir -p /etc/apt/keyrings;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg;

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;

#install docker engine
sudo apt-get update;
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin;

# add current user to docker group
sudo groupadd docker;
sudo usermod -aG docker $USER;
newgrp docker;