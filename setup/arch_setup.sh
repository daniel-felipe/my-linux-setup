#!/bin/bash

# --- [ UPDATING SYSTEM ]
sudo pacman -Syyuu --noconfirm

# --- [ INSTALLING PACKAGES ]
sudo pacman -S - < setup/packages/arch_packages.txt
