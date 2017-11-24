#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\nAdding ppa:pi-rho/dev repository..."
sudo add-apt-repository -y ppa:pi-rho/dev

echo -e "\nUpdating package lists..."
sudo apt-get update

echo -e "\nInstalling curl..."
sudo apt-get install curl -y

echo -e "\nInstalling vim..."
sudo apt-get install vim-nox -y

echo -e "\nInstalling zsh..."
sudo apt-get install zsh -y

echo -e "\nInstalling tmux..."
sudo apt-get install tmux -y

echo -e "\nInstalling git and bash-completion..."
sudo apt-get install git bash-completion -y

echo -e "\nConfiguring git-completion..."
GIT_VERSION=`git --version | awk '{print $3}'`
URL="https://raw.github.com/git/git/v$GIT_VERSION/contrib/completion/git-completion.bash"
echo "Downloading git-completion for git version: $GIT_VERSION..."
if ! curl "$URL" --silent --output "$HOME/.git-completion.bash"; then
	echo "ERROR: Couldn't download completion script. Make sure you have a working internet connection." && exit 1
fi

echo -e "\nInstalling oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo -e "\nInstalling oh-my-zsh plugins..."
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

echo -e "\nInstalling spaceship-zsh-theme..."
curl -e - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh

echo -e "\nInstalling vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\nCreating vim directories"
mkdir -p ~/.vim-tmp

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

if ! hash zsh 2>/dev/null; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
else
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

echo -e "\nMapping CapsLock -> Ctrl..."
setxkbmap -layout us -option ctrl:nocaps

echo -e "\nDone. Reload your terminal."
