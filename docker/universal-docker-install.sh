#!/bin/bash

# Check the Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Unsupported Linux distribution"
    exit 1
fi

# Install Docker according to the distribution
if [ $OS = "ubuntu" ] || [ $OS = "debian" ]; then
    # Install Docker on Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    curl -fsSL https://download.docker.com/linux/$OS/gpg | sudo apt-key add -
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$OS $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
elif [ $OS = "centos" ] || [ $OS = "rhel" ]; then
    # Install Docker on CentOS/RHEL
    sudo yum install -y yum-utils
    sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/$OS/docker-ce.repo
    sudo yum install -y docker-ce docker-ce-cli containerd.io
else
    echo "Unsupported Linux distribution"
    exit 1
fi

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# allow user to interact with docker without password

sudo usermod -aG docker $user

