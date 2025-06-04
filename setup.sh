#!/bin/bash

# adding repos
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch

# update list and install packages
sudo apt update
sudo apt install -y fastfetch
sudo apt install -y tree tldr btop

# backing up dotfiles
if [ -f ~/.bashrc ]; then
    read -p "Do you want to back up your existing .bashrc? [y/N]: " backup_choice
    case "$backup_choice" in
        [yY][eE][sS]|[yY])
            mv ~/.bashrc ~/.bashrc.bak
            echo "Backup created at ~/.bashrc.bak"
            ;;
        *)
            echo "Skipping backup."
            ;;
    esac
fi

# symlinking dotfiles
ln -sf ~/dotfiles/bashrc ~/.bashrc

# done
echo "Done!"
echo "Run 'source ~/.bashrc' or restart your terminal to apply changes"

