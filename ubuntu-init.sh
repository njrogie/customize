#!/bin/bash

# execute chmod on this file first

# setup github cli
type -p curl >/dev/null || (sudo apt update -y && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null 

#Update repositories
sudo apt update -y
sudo apt upgrade -y

if ! command -v unzip &> /dev/null
then
    sudo apt install unzip -y
fi

if ! command -v gh &> /dev/null
then
    sudo apt install gh -y
fi

# install neovim if necessary

if ! command -v nvim &> /dev/null
then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage
fi

mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
cp -r ./nvim/lua/custom/* ~/.config/nvim/lua/custom/
# Don't forget to use MasonInstallAll & TSInstall cpp
nvim --headless +MasonInstallAll +q
nvim --headless +TSInstall\ cpp +q

# install tmux 
if ! command -v tmux &> /dev/null
then
    sudo apt install tmux -y
fi

# c++ build
sudo apt install build-essential
# SSL
sudo apt install libssl-dev

# install docker -- https://docs.docker.com/engine/install/debian/
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add CMake
wget https://github.com/Kitware/CMake/releases/download/v3.30.2/cmake-3.30.2.tar.gz
tar -xzvf cmake-3.30.2.tar.gz
cd cmake-3.30.2
./configure
make -j8
sudo make install


# Login to github
gh auth login
