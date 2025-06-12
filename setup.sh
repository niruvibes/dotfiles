#!/bin/bash

# adding repos
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# update list and install packages
sudo apt update
sudo apt install -y fastfetch
sudo apt install -y tree tldr btop git

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 20

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

# git settings
git config --global --add --bool push.autoSetupRemote true

# done
echo "Done!"
echo "Run 'source ~/.bashrc' or restart your terminal to apply changes"

