#!/bin/sh

APP_PATH="$HOME/.dev-env"
git clone https://github.com/Alexoner/dev-env.git "$APP_PATH"

cd $APP_PATH || exit 1


#### main entry

function link_files() {
    #rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        #--exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
	echo "creating symbol links of home files"
	for f in \
		.babelrc \
		.bashrc \
		.curlrc \
		.esformatter \
		.eslintrc* \
		.gemrc \
		.gitconfig \
		.gitignore \
		.gitmodules \
		.init.sh \
		.pylintrc \
		.tern-project \
		.tmux.conf \
		.zshrc \
		.pip \
		.tmux \
		bin
	do
		ln -sfv "$APP_PATH/$f" "$HOME/"
	done

}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    link_files;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        link_files;
    fi;
fi;
