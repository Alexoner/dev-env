#!/bin/sh

APP_PATH="$HOME/.synccf"

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew install python, python3, git

# download synccf repository
git clone https://github.com/Alexoner/synccf.git "$APP_PATH"
cd "$HOME/.synccf" || exit 0

#install neovim
brew tap neovim
brew install neovim/neovim/neovim

#install my vim conf
curl https://raw.githubusercontent.com/Alexoner/spf13-vim/3.0/bootstrap.sh -L > spf13-vim.sh && sh spf13-vim.sh

#install brew packages
./restore-homebrew.sh

#################### CREATE SYMBOL LINK ######################
echo "source $APP_PATH/home/.bashrc" >> "$HOME/.bashrc"
echo "source $APP_PATH/home/.zshrc" >> "$HOME/.zsshrc"

ln -sv "$APP_PATH/home/*" "$HOME/"
