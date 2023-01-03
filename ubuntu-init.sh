#!/bin/bash

# execute chmod on this file first

#Update repositories
sudo apt update -y
sudo apt upgrade -y

# install vim if necessary
sudo apt install vim

# install tmux 
sudo apt install tmux -y

# install docker -- https://docs.docker.com/engine/install/debian/
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# install minikube and kubernetes
sudo apt install -y qemu-system libvirt-daemon-system
sudo usermod -a -G libvirt $USER 

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64


