#!/bin/bash


#sudo apt install libunwind8 libcurl3 g++ zip make libsqlite3-dev
#sudo apt install zsh tmux neovim

APP_PATH="$HOME/.dev-env"
#sudo apt install build-essential zsh tmux neovim

#if [ "$1" == "--force" -o "$1" == "-f" ]; then
    echo "Removing previous installation"
    rm -rf ~/.dev-env
#fi

git clone --recurse-submodules -j8 https://github.com/Alexoner/dev-env.git "$APP_PATH"

# shell tmux python must come first! And neovim depends on some modules
# DEFAULT_MODULES='shell brew tmux python javascript go vim ops'
DEFAULT_MODULES='shell brew tmux vim'

cd "$APP_PATH" || exit 1
git submodule update --init --recursive # clone recursive submodules


#### main entry

link_files() {
    #rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        #--exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
	echo "creating symbol links of home files"
	for f in \
		.babelrc \
		.curlrc \
		.esformatter \
		.eslintrc* \
		.gemrc \
		.gitconfig \
		.gitignore \
		.gitmodules \
		.pylintrc \
		.tern-project \
		.tmux \
		.tmux.conf \
		.tmux.sh \
		.pip \
		.clang-format \
		.config \
		bin
	do
		ln -sfv "$APP_PATH/$f" "$HOME/"
	done

	mkdir -p ~/.config/
	# ln -sfv $HOME/.dev-env/.config/* ~/.config/

}

# shell initialization skeleton should be automatically generated after
# successfully installing of corresponding software. So , no need to link
# that file

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    link_files;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        link_files;
    fi;
fi;

# use ${x:-y} syntax for logic OR operation
bash -x lib/initialize.sh --force ${@:-${DEFAULT_MODULES}}
