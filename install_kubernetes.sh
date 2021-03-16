#!/bin/bash

sudo echo -e "\e[38;5;82m Hello $LOGNAME \e[0m"

sudo echo -e "\e[38;5;82m ================STEP1 - INSTALLING HTTPS LAYER, CA CERTIFICATES, CURL, GNUPG, LSB-RELEASE Packages======================== \e[0m"
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo echo -e "\e[38;5;82m =================STEP2 - CHECKING IF EXISTING KUBECTL INSTALLATION EXISTS, IF FOUND ANY THEN WILL REMOVE IT. ====================== \e[0m"
sudo apt-get remove kubectl

sudo echo -e "\e[38;5;82m =================STEP3 - DOWNLOAD GOOGLE GPG KEY======================== \e[0m"
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

sudo echo -e "\e[38;5;82m =================STEP4 - UPDATING PACKAGES AND ADDING KUBERNETES REPO ====================== \e[0m" 
sudo apt-get update -y
sudo echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo echo -e "\e[38;5;82m ============================STEP5 - INSTALL KUBERNETES ======================== \e[0m"
sudo apt-get install -y kubectl

sudo echo -e "\e[38;5;82m ============================STEP5 - TEST IF SUCCESFULLY INSTALLED======================== \e[0m"
sudo kubectl version --client

if [ $? -eq 0 ]
then
  sudo echo -e "\e[38;5;82m The docker installation is successful. You can start using docker now. \e[0m"
  exit 0
else
  sudo snap install kubectl --classic
fi