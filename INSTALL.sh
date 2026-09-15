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

#Installing better shell
sudo apt install -y fish

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

#Install userful features
sudo apt install -y tcsh
sudo apt install valgrind -y
sudo apt install libcsfml-dev
sudo apt install banana-coding-style-checker
sudo apt install npm
sudo apt install curl
sudo apt install python3.12-venv

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
