#!/bin/bash


# Setup Manjaro Script
echo "Manjaro Setup"
sudo pacman-mirrors --api --set-branch unstable
sudo pacman-mirrors --fasttrack && sudo pacman -Syyu
sudo pacman -S --needed base-devel
sudo pacman -S llvm clang lldb qt6-base libsecret seahorse cmake postgresql redis
# Latest Java
sudo pacman -S jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src
# Java 8
sudo pacman -S jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src
sudo pacman -S noto-fonts-emoji
yay -S lldb-mi-git spring-tool-suite google-chrome visual-studio-code-bin neovim-nightly-bin remmina-git kafka dbeaver postman-bin slack-desktop
sudo cp assets/openinvscode.desktop /usr/share/kservices5/ServiceMenus/

# git configuration
git config --global user.name "Garvit Joshi"
git config --global user.email "garvitjoshi9@gmail.com"
git config --global core.editor "nano"

# omz, powerline
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

# Nerd Font
echo "Nerd Font: https://www.nerdfonts.com/font-downloads"

# snap
sudo snap refresh
sudo snap install telegram-desktop
echo "Done"
