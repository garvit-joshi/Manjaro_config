#!/bin/bash


# Setup Manjaro Script
echo "Manjaro Setup"
sudo pacman-mirrors --api --set-branch unstable
sudo pacman -Syu
sudo pacman -S --needed base-devel
sudo pacman -S yay llvm clang lldb php gcc qt6-base libsecret seahorse
sudo pacman -S jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src
yay -S lldb-mi-git
yay -S teamviewer
yay -S google-chrome
yay -S visual-studio-code-bin
sudo cp assets/openinvscode.desktop /usr/share/kservices5/ServiceMenus/

# git confiigure
git config --global user.name "Garvit Joshi"
git config --global user.email "garvitjoshi9@gmail.com"

# omz, powerline and nvm
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash


# Pyenv: Python Environment
echo "Set Pyenv: https://github.com/pyenv/pyenv" 
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src

# Nerd Font
echo "Nerd Font: https://www.nerdfonts.com/font-downloads"

# snap
sudo snap refresh
sudo snap install telegram-desktop
echo "Done"
