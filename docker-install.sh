#!/bin/bash
echo "Hello $LOGNAME" >> $HOME/installationlogs/dockerinstalllogs.txt

sudo mkdir $HOME/installationlogs

echo $? >> $HOME/installationlogs/dockerinstalllogs.txt
echo "you current working directory is " pwd
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt
$env_base = uname -a

echo "=================STEP1 - CHECKING EXISTING DOCKER INSTALLATIONS IF ANY AND REMOVING THEM. ======================" >> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get remove docker docker-engine docker.io containerd runc
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

echo "=================STEP2 - UPDATING PACKAGES ======================" >> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get update
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

echo "============================STEP3 - INSTALLING HTTPS LAYER, CA CERTIFICATES, CURL, GNUPG, LSB-RELEASE Packages========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

echo "============================STEP4 - DOWNLOAD DOCKER GPG KEY========================">> $HOME/installationlogs/dockerinstalllogs.txt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

echo "============================STEP5 - INSTALL DOCKER ENGINE========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

echo "============================STEP5 - TEST IF SUCCESFULLY INSTALLED========================">> $HOME/installationlogs/dockerinstalllogs.txt
sudo docker --version
echo $? >> $HOME/installationlogs/dockerinstalllogs.txt

if [ $? -eq 0 ]
then
  echo "The docker installation is successful. You can start using docker now."
  exit 0
else
  echo "There is an error in the docker installation script failed" >&2 >> $HOME/installationlogs/dockerinstalllogs.txt
  exit 1
fi