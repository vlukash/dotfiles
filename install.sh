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

echo -e "\nInstalling xclip..."
sudo apt-get install xclip

echo -e "\nInstalling git and bash-completion..."
sudo apt-get install git bash-completion -y

echo -e "\nInstalling z..."
git clone https://github.com/rupa/z.git ~/.zi

echo -e "\nInstalling FZF..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "\nInstalling tmux 2.6..."
sudo apt-get install build-essential curl git python-setuptools ruby;
sudo apt-get install build-essential libevent-dev libncurses-dev;
wget -O tmux-2.6.tar.gz https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz;
tar -zvxf tmux-2.6.tar.gz;
cd tmux-2.6/

./configure;
make;
sudo make install;
tmux -V;

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
git clone https://github.com/denysdovhan/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
ln -sf ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme

echo -e "\nInstalling dircolors..."
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors

echo -e "\nInstalling OneDark terminal theme..."
git clone https://github.com/benniemosher/the-one-theme/ ~/.oh-my-zsh/custom/themes/OneDark 
ln -sf ~/.oh-my-zsh/custom/themes/OneDark/zsh/TheOne.zsh-theme ~/.oh-my-zsh/custom/themes/TheOne.zsh-theme

wget https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh && . one-dark.sh

echo -e "\nInstalling vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\nCreating vim directories"
mkdir -p ~/.vim-tmp
mkdir -p ~/.vim/undodir

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    echo "Creating symlink for $file"
    ln -sf $file $target
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
