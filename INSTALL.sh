#!/usr/bin/env bash

show_help() {
    echo "Usage: ./INSTALL.sh [OPTION]"
    echo "Installer for the Epitech environment and Hyprland."
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
sudo add-apt-repository -y -s ppa:epitech/ppa
sudo add-apt-repository -y -s universe
sudo apt update

echo "postfix postfix/mailname string epitech.eu" | sudo debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | sudo debconf-set-selections

export DEBIAN_FRONTEND=noninteractive
sudo apt install -y wget
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo tee /etc/apt/trusted.gpg.d/llvm.asc
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/llvm.asc] https://apt.llvm.org/noble/ llvm-toolchain-noble-20 main" | sudo tee /etc/apt/sources.list.d/llvm.list
sudo apt update
sudo apt install -y clang-20
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-20 100 && sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-20 100
sudo apt install -y epitech-cpool
sudo apt install -y epitech-emacs
sudo apt install -y epitech-vim
sudo apt purge -y postfix
sudo snap install teams-for-linux
sudo apt install -y docker.io
sudo apt update

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

# Setting emacs configuration (Standard User)
echo "Writing Epitech Emacs configuration to ~/.emacs..."

cat <<EOF > ~/.emacs
;; Epitech configuration

(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(load "site-start.d/epitech-init.el")

;; Display the current line and column numbers in the mode line
(setq line-number-mode t)
(setq column-number-mode t)
(setq mode-line-position-column-line-format '("%l:%C"))

;; Display of line numbers in the buffer:
(setq-default display-line-numbers-type 'absolute)
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook #'display-line-numbers-mode))

;; better mouse integration
(unless (display-graphic-p)
  (xterm-mouse-mode 1))
(defun scroll-down-slightly () (interactive) (scroll-down 2))
(defun scroll-up-slightly () (interactive) (scroll-up 2))
(global-set-key (kbd "<mouse-4>") 'scroll-down-slightly)
(global-set-key (kbd "<mouse-5>") 'scroll-up-slightly)
(global-set-key (kbd "<wheel-down>") 'scroll-up-slightly)
(global-set-key (kbd "<wheel-up>") 'scroll-down-slightly)

;; turn on standard copy/paste behaviour
(cua-mode t)

;; Don't tabify after rectangle commands
(setq cua-auto-tabify-rectangles nil)

;; No region when it is not highlighted
(transient-mark-mode t)

;; Standard Windows behaviour
(setq cua-keep-region-after-copy t)

;; turn off mouse mode that interfere
(setq mouse-yank-at-point nil)
(setq mouse-drag-copy-region nil)
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq select-active-regions t)

;; autocomplete parenthesis, brackets, quotes, ...
(electric-pair-mode 1)
EOF

echo "Emacs configuration complete."
