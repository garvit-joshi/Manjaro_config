#!/bin/bash

#AWS EC2 UserData: Bots Instance
sudo mkdir /etc/sysconfig
sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
sudo echo "ZONE=\"Asia/Kolkata\"" > /etc/sysconfig/clock
sudo apt update
sudo apt upgrade -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.9 git screen python3.9-venv python3-pip -y
python3.9 -m pip install --user virtualenv
sudo reboot
cd /home/ubuntu
git clone https://github.com/AWS-Cloud-Community-LPU/Twitter-Bot.git
cd Twitter-Bot
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..
git clone https://github.com/AWS-Cloud-Community-LPU/Ada_TelegramBot.git
cd Ada_TelegramBot
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..
git clone https://github.com/garvit-joshi/Aster_TelegramBot.git
cd Aster_TelegramBot
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..
sudo reboot
