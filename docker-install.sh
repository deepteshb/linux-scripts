#!/bin/bash
sudo mkdir -p $HOME/installationlogs
sudo echo -e "\e[38;5;82m Hello $LOGNAME"
sudo echo -e "\e[38;5;82m you current working directory is " pwd
sudo echo -e "\e[38;5;82m =================STEP1 - CHECKING EXISTING DOCKER INSTALLATIONS IF ANY AND REMOVING THEM. ======================"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo echo -e "\e[38;5;82m =================STEP2 - UPDATING PACKAGES ======================" 
sudo apt-get update -y


sudo echo -e "\e[38;5;82m ============================STEP3 - INSTALLING HTTPS LAYER, CA CERTIFICATES, CURL, GNUPG, LSB-RELEASE Packages========================"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo echo -e "\e[38;5;82m ============================STEP4 - DOWNLOAD DOCKER GPG KEY========================"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


sudo echo -e "\e[38;5;82m ============================STEP5 - INSTALL DOCKER ENGINE========================"
sudo apt-get install -y docker.io 


sudo echo -e "\e[38;5;82m ============================STEP5 - TEST IF SUCCESFULLY INSTALLED========================"
sudo docker --version

if [ $? -eq 0 ]
then
  sudo echo -e "\e[38;5;82m The docker installation is successful. You can start using docker now."
  exit 0
else
  sudo echo -e "\e[38;5;198m There is an error in the docker installation script failed"
fi
