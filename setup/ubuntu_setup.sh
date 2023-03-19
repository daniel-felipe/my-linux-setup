#!/bin/bash

source './setup/includes/utils.sh'

# --- [ INSTALLING OH MY ZSH ]
echo "[+] Istalling Oh My Zsh"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
last_task_status