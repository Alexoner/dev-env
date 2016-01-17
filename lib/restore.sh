#!/bin/sh

BASEDIR=$(dirname "$0")
APP_PATH="$HOME/.synccf"

program_exists() {
    local ret='0'
    command -v "$1" >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

#install necessary softwares
# install homebrew
if ! program_exists brew
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo
    # brew update
fi

brew tap caskroom/cask
PREREQUISITION="python python2 python3 node git"
for i in $PREREQUISITION
do
    if ! program_exists "$i"
    then
        brew install "$i"
    fi
done

if ! program_exists  nvim
then
    brew tap neovim/neovim
    brew install neovim/neovim/neovim
fi

# download synccf repository
cd "$HOME/.synccf" || exit 0

#install neovim
brew tap neovim
if ! program_exists "$i"
then
    brew install neovim/neovim/neovim
fi

SOFT_DIR="$HOME/Documents/soft"
if [ ! -e "$HOME/.spf13-vim-3" ]; then
    #install my vim conf
    curl https://raw.githubusercontent.com/Alexoner/spf13-vim/3.0/bootstrap.sh -L > spf13-vim.sh && sh spf13-vim.sh
    # install powerline fonts for vim
    git clone https://github.com/powerline/fonts.git "$SOFT_DIR/fonts" && sh "$SOFT_DIR/fonts/install.sh"
    cd "$HOME/.synccf" || exit 0
elif [ ! -d "$HOME/.spf13-vim-3" ]; then
    echo "$HOME/.spf13-vim-3 exists but not a directory"
fi

#install shadowsocks-heroku
if [ ! -e "$HOME/Documents/soft/shadowsocks-heroku" ]; then
    mkdir -p "$SOFT_DIR"
    git clone https://github.com/mrluanma/shadowsocks-heroku.git "$SOFT_DIR/shadowsocks-heroku"
    cd "$SOFT_DIR/shadowsocks-heroku" && npm install
    echo '#!/bin/sh' > run.sh
    echo 'node "$(dirname $0)/local.js" -s xxx-island.herokuapp.com -l 1081 -m rc4 -k xxx11yy -r 80 1>> ss.log  2> ss.log' >> run.sh
    chmod +x run.sh
    cd "$HOME/.synccf" || exit 0
fi

#install brew packages
sh "$BASEDIR../data/homebrew/restore-homebrew.sh"
#install python packages
sudo python -m easy_install pip
sudo python3 -m easy_install pip virtualenv
install_python2_packages() {
    # virtualenv "$HOME/.python2" -p python || return 1
    # source "$HOME/.python3/bin/activate"
    brew install python || return 1
    python -m pip install -r "$BASEDIR/../data/python/requirement2.txt"
    # deactivate
}

install_python3_packages() {
    # virtualenv "$HOME/.python3" -p python3 || return 1
    # source "$HOME/.python3/bin/activate"
    brew install python3 || return 1
    python3 -m pip install -r "$BASEDIR/../data/python/requirement3.txt" 
    # deactivate
}

install_python2_packages
install_python3_packages

# install on-my-zsh
if ! program_exists upgrade_oh_my_zsh
then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

#################### CREATE SYMBOL LINK ######################
if [ -f "$HOME/.bashrc" ]
then
    echo "source $APP_PATH/home/.bashrc" >> "$HOME/.bashrc"
fi

if [ -f "$HOME/.zshrc" ]
then
    echo "source $APP_PATH/home/.zshrc" >> "$HOME/.zshrc"
fi

ln -sv "$APP_PATH/data/home/*" "$HOME/"
ln -sv "$APP_PATH/data/home/.*" "$HOME"

wait
