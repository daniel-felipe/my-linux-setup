#!/bin/bash

source './setup/includes/utils.sh'

# --- [ UPDATING SYSTEM ]
echo "[+] Updaing System"
sudo pacman -Syyuu --noconfirm

# --- [ INSTALLING PACKAGES WITH PACMAN ]
echo "[+] Installing Packages"
sudo pacman -S - < setup/packages/arch_packages.txt --needed

# --- [ INSTALLING OH MY ZSH ]
echo "[+] Istalling Oh My Zsh"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
last_task_status
