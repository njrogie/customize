# execute chmod on this file first

sudo apt update -y
sudo apt upgrade -y

# install vim if possible
sudo apt install vim

# install minikube and kubernetes

sudo apt install qemu-system libvirt-daemon-system
sudo usermod -a -G libvirt nrogie

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64


