#!/usr/bin/env bash

show_help() {
    echo "Usage: ./INSTALL.sh [OPTION]"
    echo "Installer for the Epitech environment"
    echo ""
    echo "Options:"
    echo "  -h, --help    Show this help"
}

pause(){
   read -p "Press [Enter] to continue..."
}

# Check for flags
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

echo ""
echo "░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████████████▓▒░░▒▓███████▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░"
echo "░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░"
echo ""

# System updates
sudo apt update && sudo apt upgrade -y
sudo apt install curl

#Installing looks utils
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)
sudo apt install gnome-shell-extension-manager

# Installing vscode
sudo snap install --classic code

# Installing chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Installing discord
sudo snap install discord

# Installing EPITECH_DUMP
echo "INSTALLING TOOLS AND PACKAGES FOR EPITECH'S DUMP"
wget -q -O- https://raw.githubusercontent.com/Epitech/dump/refs/heads/master/dump.sh | sudo bash
sudo update-alternatives --set clang /usr/bin/clang-21
sudo update-alternatives --set clang++ /usr/bin/clang++-21
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
mkdir TEK1

#Install userful features
sudo apt install -y micro
sudo apt install -y tcsh
sudo apt install valgrind -y
sudo apt install libcsfml-dev
sudo apt install npm

# GitHub Configuration (Standard User)
read -p "Enter your Epitech email (ex: firstname.lastname@epitech.eu): " user_email
ssh-keygen -t ed25519 -C "$user_email"
read -p "Enter your name: " user_name
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
clear
cat ~/.ssh/id_ed25519.pub
pause
git config --global user.email "$user_email"
git config --global user.name  "$user_name"
