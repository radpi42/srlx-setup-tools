#!/bin/bash

# inital setup
apt update 
apt upgrade -y
apt install -y tmux curl git qemu-guest-agent sudo nfs-common python3 python3-pip openssh-server 

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# install docker
apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# reboot
reboot