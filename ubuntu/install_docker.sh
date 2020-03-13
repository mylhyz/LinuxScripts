#! /bin/bash

echo "start install docker"

echo "step1"
# uninstall old docker first
sudo apt-get remove docker docker-engine docker.io containerd runc

echo "step2"
# update apt package index
sudo apt-get update

echo "step3"
# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "step4"
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "step5"
# Verify
sudo apt-key fingerprint 0EBFCD88

echo "step6"
# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "step7"
# update apt package index
sudo apt-get update

echo "step8"
# Install the latest version of Docker Engine
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "step9"
# Verify that Docker Engine
sudo docker run hello-world

echo "end install docker"