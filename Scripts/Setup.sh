#!/bin/bash


# Setup Manjaro Script
echo "Manjaro Setup"
sudo pacman -Syu
sudo pacman -S --needed base-devel
sudo pacman -S yay llvm clang lldb php gcc
sudo pacman -S jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src
sudo cp assets/openinvscode.desktop /usr/share/kservices5/ServiceMenus/
yay -S lldb-mi-git
yay -S teamviewer
yay -S google-chrome
git config --global user.name "Garvit Joshi"
git config --global user.email "garvitjoshi9@gmail.com"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo snap refresh
sudo snap install telegram-desktop
sudo snap install code --classic
echo "Done"
