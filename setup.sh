#!/bin/bash

# adding repos
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch

# update list and install packages
sudo apt update
sudo apt install fastfetch

# backingup dotfiles
mv ~/.bashrc ~/.bashrc.bak

# symlinking dot files
ln -sf ~/dotfiles/basrc ~/.bashrc
