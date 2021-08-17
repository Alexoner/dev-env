#!/bin/bash


# init_dev() is more portable than function init_dev() {}
init_env() {
    # Ask for the administrator password upfront
    #sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    #while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ "$ARG" == "bootstrap" ] || [ "$ARG" == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing the dev-setup repo to your local machine."
            echo "------------------------------"
            echo ""
            #cd ~ && curl -#L https://github.com/donnemartin/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        elif [ "$ARG" == 'shell' ] || [ "$ARG" == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Configuring Shell environment."
            echo "------------------------------"
            echo ""
            lib/init-shell.sh
        elif [ "$ARG" == 'python' ] || [ "$ARG" == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Installing Python environment."
            echo "------------------------------"
            echo ""
            lib/init-python.sh
        elif [ "$ARG" == 'vim' ] || [ "$ARG" == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Installing Python environment."
            echo "------------------------------"
            echo ""
            lib/init-vim.sh
        elif [ "$ARG" == 'ml' ] || [ "$ARG" == 'all' ]; then
            echo ""
            echo "------------------------------"
            echo "Installing machine learning environment."
            echo "------------------------------"
            echo ""
            lib/init-ml.sh
        elif [ "$ARG" == "osx" ] || [ "$ARG" == "all" ]; then
            # Run the osxprep.sh Script
            echo ""
            echo "------------------------------"
            echo "Updating OSX and installing Xcode command line tools"
            echo "------------------------------"
            echo ""
            lib/init-osx.sh
        elif [ "$ARG" == "brew" ] || [ "$ARG" == "all" ]; then
            # Run the brew.sh Script
            # For a full listing of installed formulae and apps, refer to
            # the commented brew.sh source file directly and tweak it to
            # suit your needs.
            echo ""
            echo "------------------------------"
            echo "Installing Homebrew along with some common formulae and apps."
            echo "This might awhile to complete, as some formulae need to be installed from source."
            echo "------------------------------"
            echo ""
            lib/init-brew.sh
        else
            # general initialize script
            echo ""
            echo "------------------------------"
            echo "Installing $ARG software stack"
            echo "------------------------------"
            bash lib/init-"${ARG}".sh
            echo "------------------------------"
        fi
    done

    echo "------------------------------"
    echo "Completed running!"
    echo "------------------------------"
}


if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then 
    init_env $@
else
    read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then 
        init_env $@
    fi;
fi

unset init_env;
