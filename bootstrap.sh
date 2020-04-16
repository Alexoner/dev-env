#!/bin/bash

APP_PATH="$HOME/.dev-env"
git clone --recurse-submodules -j8 https://github.com/Alexoner/dev-env.git "$APP_PATH"

#DEFAULT_MODULES='shell brew tmux python vim node'
DEFAULT_MODULES='shell tmux python vim node' # shell tmux python must come first!

cd $APP_PATH || exit 1
git submodule update --init --recursive # clone recursive submodules


#### main entry

link_files() {
    #rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        #--exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
	echo "creating symbol links of home files"
	for f in \
		.tmux \
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
		.tmux.conf \
		.pip \
		.clang-format \
		.config \
		bin
	do
		ln -sfv "$APP_PATH/$f" "$HOME/"
	done

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
bash lib/initialize.sh --force ${@:-${DEFAULT_MODULES}}
