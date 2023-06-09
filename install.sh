#!/bin/bash

source './setup/includes/colors.sh'

BASE_DIR=$(pwd)

echo "Which is your base distro?"
echo "[1] :: Ubuntu"
echo "[2] :: Arch"
echo "[0] :: Exit"
read -p "> " distro

case $distro in
    1)
        source './setup/ubuntu_setup.sh'
	    ;;
    2)
        source './setup/arch_setup.sh'
	    ;;
    *)
        echo "Bye!"; exit;
	    ;;
esac

# [ GIT LIBSECRET ]
git config --global credential.helper libsecret

source './setup/hacking_tools.sh'
