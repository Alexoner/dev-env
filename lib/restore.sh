#!/bin/sh

BASEDIR=$(dirname "$0")
APP_PATH="$HOME/.synccf"

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew install python, python3, node
# brew install git

# download synccf repository
git clone https://github.com/Alexoner/synccf.git "$APP_PATH"
cd "$HOME/.synccf" || exit 0

#install neovim
brew tap neovim
brew install neovim/neovim/neovim

#install my vim conf
curl https://raw.githubusercontent.com/Alexoner/spf13-vim/3.0/bootstrap.sh -L > spf13-vim.sh && sh spf13-vim.sh

#install shadowsocks-heroku
SOFT_DIR="$HOME/Documents/soft"
mkdir "$SOFT_DIR"
git clone https://github.com/mrluanma/shadowsocks-heroku.git "$SOFT_DIR"
cd "$SOFT_DIR/shadowsocks-heroku" && npm install
echo '#!/bin/sh' > run.sh
echo 'node local.js -s xxx-island.herokuapp.com -l 1081 -m rc4 -k xxx11yy -r 80 1>> ss.log  2> ss.log' >> run.sh
chmod +x run.sh

#install brew packages
"$BASEDIR../data/homebrew/restore-homebrew.sh" &
#install python packages
python2 -m easy_install pip
python3 -m easy_install pip
install_python2_packages() {
    sudo python2 -m pip install -r "$BASEDIR/../data/python/requirement2.txt" 
}

install_python3_packages() {
    sudo python3 -m pip install -r "$BASEDIR/../data/python/requirement3.txt" 
}

install_python2_packages &
install_python3_packages &

#################### CREATE SYMBOL LINK ######################
echo "source $APP_PATH/home/.bashrc" >> "$HOME/.bashrc"
echo "source $APP_PATH/home/.zshrc" >> "$HOME/.zsshrc"

ln -sv "$APP_PATH/home/*" "$HOME/"
wait
