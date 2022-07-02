# execute chmod on this file first

sudo apt update -y
sudo apt upgrade -y
sudo apt install vim
sudo rm -rf /usr/local/go
# https://github.com/canha/golang-tools-install-script
wget -q -O - https://git.io/vQhTU | bash
