#!/usr/bin/env bash

show_help() {
    echo "Usage: ./INSTALL.sh [OPTION]"
    echo "Installateur de l'environnement Epitech et Hyprland."
    echo ""
    echo "Options:"
    echo "  -h, --help    Afficher cette aide"
    echo "  --hyprland    Installer uniquement Hyprland"
}

pause(){
   read -p "Appuyez sur [Entrée] pour continuer..."
}

ask_hyprland() {
    while true; do
        read -p "Voulez-vous installer Hyprland ? (y/n) : " choice
        case "$choice" in 
            [Yy]* ) 
                return 0 # 0 signifie "Vrai/Oui" en Bash
                ;;
            [Nn]* ) 
                return 1 # 1 signifie "Faux/Non"
                ;;
            * ) 
                echo "Veuillez répondre par 'y' (yes) ou 'n' (no).";;
        esac
    done
}

install_hyprland_logic() {
    echo "Lancement de l'installation de Hyprland..."
    git clone -b 25.10 --depth=1 https://github.com/JaKooLit/Ubuntu-Hyprland.git ~/Ubuntu-Hyprland-25.10
    cd ~/Ubuntu-Hyprland-25.10
    chmod +x install.sh
    ./install.sh
}

# Check for flags
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi
if [[ "$1" == "--hyprland" ]]; then
    install_hyprland_logic
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

apt upgrade

#Installing vscode
apt update
sudo snap install --classic code

#Installing chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

#Installing discord
snap install -y discord

#Installing EPITECH_DUMP
echo "INSTALLING TOOLS AND PACKAGES FOR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
add-apt-repository -y -s ppa:epitech/ppa
add-apt-repository -y -s universe
apt update
echo "postfix postfix/mailname string epitech.eu" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
apt install -y wget
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/llvm.asc
echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/llvm.asc] https://apt.llvm.org/noble/ llvm-toolchain-noble-20 main" | tee /etc/apt/sources.list.d/llvm.list
apt update
apt install -y clang-20
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-20 100 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-20 100
apt install -y epitech-cpool
apt install -y epitech-emacs
apt install -y epitech-vim
apt purge -y postfix
snap install teams-for-linux
apt install -y docker.io
apt update

#GitHub Configuration
read -p "Entrez votre email Epitech (ex: prenom.nom@epitech.eu) : " user_email
ssh-keygen -t ed25519 -C "$user_email"
read -p "Entrez votre nom : " user_name
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
clear
cat ~/.ssh/id_ed25519.pub
pause
git config --global user.email "$user_email"
git config --global user.name  "$user_name"

#Setting emacs configuration
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

#Installing Hypland
if ask_hyprland; then
    install_hyprland_logic
else
    echo "Installation de Hyprland annulée. Fin du script."
fi
