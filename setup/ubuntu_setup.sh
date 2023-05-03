#!/bin/bash

source './setup/includes/utils.sh'

# --- [ ADDING PPAs ]
sudo add-apt-repository ppa:ondrej/php

# --- [ UPDATING SYSTEM ]
sudo apt update -y && sudo apt upgrade -y && sudo apt autoclean -y
xargs -a setup/packages/ubuntu_packages.txt sudo apt-get install -y

# --- [ INSTALLING COMPOSER ]
composer --version &> /dev/null
if [ $? -ne 0 ]; then
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    sudo mv composer.phar /usr/local/bin/composer
fi

# --- [ INSTALLING NODEJS ]
node --version &> /dev/null
if [ $? -ne 0 ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.profile 
    nvm install node
fi

# --- [ INSTALLING VSCODE ]
code --version &> /dev/null
if [ $? -ne 0 ]; then
    wget https://az764295.vo.msecnd.net/stable/b7886d7461186a5eac768481578c1d7ca80e2d21/code_1.77.1-1680651665_amd64.deb -O vscode.deb
    sudo dpkg -i ./vscode.deb
fi

# -- [ INSTALLING TABLEPLUS ]
echo "[+] Installing TablePlus"
wget -qO - https://deb.tableplus.com/apt.tableplus.com.gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/tableplus-archive.gpg > /dev/null
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian/22 tableplus main"
sudo apt update -y && sudo apt install tableplus -y

# -- [ INSTALLING DOCKER ]
docker --version &> /dev/null
if [ $? -ne 0 ]; then
    echo "[+] Istalling Docker"
    sudo apt-get update -y && apt-get install ca-certificates curl gnupg -y
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker
    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
fi
# --- [ INSTALLING OH MY ZSH ]
zsh --version &> /dev/null
if [ $? -ne 0 ]; then
    echo "[+] Istalling Oh My Zsh"
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- [ INSTALLING STARTSHIP ]
starship --version &> /dev/null
if [ $? -ne 0 ]; then
    curl -sS https://starship.rs/install.sh | sh
fi