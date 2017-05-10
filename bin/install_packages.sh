#!/bin/sh


install_packages() {
    # Ask for the administrator password upfront
    #sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run sections based on command line arguments
    for ARG in "$@"
    do
        if [ $ARG == "bootstrap" ] || [ $ARG == "all" ]; then
            echo ""
            echo "------------------------------"
            echo "Syncing the dev-setup repo to your local machine."
            echo "------------------------------"
            echo ""
            cd ~ && curl -#L https://github.com/donnemartin/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        fi
        if [ $ARG == "pydata" ] || [ $ARG == "all" ]; then
            # Run the pydata.sh Script
            echo "------------------------------"
            echo "Setting up Python data development environment."
            echo "------------------------------"
            echo ""
            ./pydata.sh
        fi
        if [ $ARG == "datastores" ] || [ $ARG == "all" ]; then
            # Run the datastores.sh Script
            echo "------------------------------"
            echo "Setting up data stores."
            echo "------------------------------"
            echo ""
            ./datastores.sh
        fi
        if [ $ARG == "web" ] || [ $ARG == "all" ]; then
            # Run the web.sh Script
            echo "------------------------------"
            echo "Setting up JavaScript web development environment."
            echo "------------------------------"
            echo ""
            ./web.sh
        fi
    done

    echo "------------------------------"
    echo "Completed running .dots, restart your computer to ensure all updates take effect"
    echo "------------------------------"
}

read -p "This script may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    install_packages $@
fi;

unset install_packages;


