#!/bin/bash

#AWS EC2 UserData: Bots Instance
sudo mkdir /etc/sysconfig
sudo ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
sudo echo "ZONE=\"Asia/Kolkata\"" > /etc/sysconfig/clock
sudo apt update
sudo apt upgrade -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.10-full git screen python3.10-venv -y
curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.10 get-pip.py
rm get-pip.py
pip install --user -U virtualenv
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
git clone https://github.com/AWS-Cloud-Community-LPU/Discord-Bot.git
cd Discord-Bot
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
sudo reboot


# Download files from AWS EC2
scp -i "MyAWSKey.pem" -r ubuntu@IP:/home/ubuntu/Aster_TelegramBot /home/garvit-joshi/Projects
scp -i "MyAWSKey.pem" -r ubuntu@IP:/home/ubuntu/Ada_TelegramBot /home/garvit-joshi/Projects
scp -i "MyAWSKey.pem" -r ubuntu@IP:/home/ubuntu/Twitter-Bot /home/garvit-joshi/Projects
scp -i "MyAWSKey.pem" -r ubuntu@IP:/home/ubuntu/Discord-Bot /home/garvit-joshi/Projects


## Configuring Bots after System Restart
# Before Restart
pip install -U pip wheel
pip install --user -U virtualenv
# After Restart
cd Aster_TelegramBot/
rm -r env/
git pull
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..
cd Ada_TelegramBot/
rm -r env/
git pull
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..
cd Twitter-Bot/
rm -r env/
git pull
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..
cd Discord-Bot/
rm -r env/
git pull
virtualenv env
source env/bin/activate
pip install -U pip wheel
pip install -r requirements.txt
deactivate
cd ..

