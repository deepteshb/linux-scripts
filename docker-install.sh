#!/bin/bash
sudo mkdir -p $HOME/installationlogs
sudo echo "Hello $LOGNAME" >> $HOME/installationlogs/dockerinstalllogs.txt



sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt
sudo echo "you current working directory is " pwd
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

sudo echo "=================STEP1 - CHECKING EXISTING DOCKER INSTALLATIONS IF ANY AND REMOVING THEM. ======================" >> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

sudo echo "=================STEP2 - UPDATING PACKAGES ======================" >> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get update
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

sudo echo "============================STEP3 - INSTALLING HTTPS LAYER, CA CERTIFICATES, CURL, GNUPG, LSB-RELEASE Packages========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

sudo echo "============================STEP4 - DOWNLOAD DOCKER GPG KEY========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

sudo echo "============================STEP5 - INSTALL DOCKER ENGINE========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get update

sudo apt-get install docker.io 
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

sudo echo "============================STEP5 - TEST IF SUCCESFULLY INSTALLED========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo docker --version
sudo echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

if [ $? -eq 0 ]
then
  sudo echo "The docker installation is successful. You can start using docker now."
  exit 0
else
  sudo echo "There is an error in the docker installation script failed" >&2 >> $HOME/installationlogs/dockerinstalllogs.txt
  exit 1
fi
