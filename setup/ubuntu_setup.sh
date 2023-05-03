#!/bin/bash

source './setup/includes/utils.sh'

# --- [ ADDING PPAs ]
sudo add-apt-repository ppa:ondrej/php

# --- [ UPDATING SYSTEM ]
sudo apt update -y && sudo apt upgrade -y && sudo apt autoclean -y
xargs -a setup/packages/ubuntu_packages.txt sudo apt-get install -y

# --- [ INSTALLING COMPOSER ]
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# --- [ INSTALLING NODEJS ]
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.profile 
nvm install node

# --- [ INSTALLING VSCODE ]
wget https://az764295.vo.msecnd.net/stable/b7886d7461186a5eac768481578c1d7ca80e2d21/code_1.77.1-1680651665_amd64.deb -O vscode.deb
sudo dpkg -i ./vscode.deb

# --- [ INSTALLING OH MY ZSH ]
echo "[+] Istalling Oh My Zsh"
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
last_task_status