#!/bin/bash

source './setup/includes/utils.sh'

# --- [ UPDATING SYSTEM ]
echo "[+] Updaing System"
sudo pacman -Syyuu --noconfirm

# --- [ INSTALLING PACKAGES WITH PACMAN ]
echo "[+] Installing Packages"
sudo pacman -S - < setup/packages/arch_packages.txt --needed

# --- [ INSTALLING VSCODE ]
wget https://az764295.vo.msecnd.net/stable/252e5463d60e63238250799aef7375787f68b4ee/code-stable-x64-1683145858.tar.gz -O vscode.tar.gz
sudo tar -C /usr/local -xzf vscode.tar.gz
sudo ln -s /usr/local/VSCode-linux-x64/bin/code /usr/local/src/VSCode-linux-x64/code
wget https://gist.githubusercontent.com/infosec-intern/542d39e16f46ff472803a42bc50f3b4f/raw/a8c897aaede8eea51b8447f119cef07e41b576e2/vscode.desktop
echo "b3ec81243a09f4f6e1699f3a91b842bea2764e2f2b27900e1bead8f218723d07  vscode.desktop" | sha256sum --check
if [ $? -eq 0 ]; then
    APP_PATH=~/.local/share/applications
    [ ! -d "$APP_PATH" ] && mkdir ~/.local/share/applications

    mv vscode.desktop ~/.local/share/applications
fi
rm -rf vscode.tar.gz VSCode-linux-x64

# --- [ INSTALLING OH MY ZSH ]
echo "[+] Istalling Oh My Zsh"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --- [ INSTALLING STARTSHIP ]
curl -sS https://starship.rs/install.sh | sh
