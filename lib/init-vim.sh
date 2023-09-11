#!/bin/bash


setup_vim () {
    echo "===================== configuring vim =====================$(whoami)"
    . "$HOME/.init.sh"
    #brew install neovim
    # pip install pynvim # neovim
    pip install neovim || echo "'pip install neovim failed', you may try manually later."
    curl https://raw.githubusercontent.com/Alexoner/vimde/master/bootstrap.sh -L |sh -s
    ln -sfv $HOME/.dev-env/.config/nvim/coc-settings.json ~/.config/nvim/
    #exit
    cat <<- \EOF >> ~/.init.sh


    ################################### vim ###################################################
    export EDITOR=nvim
    alias vi="vim"
    alias vim="nvim"
    alias vimdiff="nvim -d"

EOF
}

if [ "$(uname -s)" == "Linux" ]
then
    sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git cmake neovim
fi


setup_vim
