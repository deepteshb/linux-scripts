#!/bin/bash
sudo mkdir -p $HOME/installationlogs
sudo echo "Hello $LOGNAME"
sudo echo "you current working directory is " pwd
sudo echo "=================STEP1 - CHECKING EXISTING DOCKER INSTALLATIONS IF ANY AND REMOVING THEM. ======================"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo echo "=================STEP2 - UPDATING PACKAGES ======================" 
sudo apt-get update -y | sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt


sudo echo "============================STEP3 - INSTALLING HTTPS LAYER, CA CERTIFICATES, CURL, GNUPG, LSB-RELEASE Packages========================"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo echo "============================STEP4 - DOWNLOAD DOCKER GPG KEY========================"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


sudo echo "============================STEP5 - INSTALL DOCKER ENGINE========================"
sudo apt-get install -y docker.io 


sudo echo "============================STEP5 - TEST IF SUCCESFULLY INSTALLED========================"
sudo docker --version

if [ $? -eq 0 ]
then
  sudo echo "The docker installation is successful. You can start using docker now."
  exit 0
else
  sudo echo "There is an error in the docker installation script failed"
fi
