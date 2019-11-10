#!/bin/sh

#
setup_shell () {
    echo "=====================setting up zsh=====================$(whoami)"
    echo "REMEMBER: EXIT ZSH AFTER INSTALLING oh-my-zsh to proceed..."
    # install oh-my-zsh
    export ZSH=""
    cd "$HOME"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # configure general init script
    echo 'PROMPT="[\$(date +%H:%M:%S)] %{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"' >> ~/.zshrc

    # source a separate init script
    touch $HOME/.init.sh
    cat <<-\EOF >> $HOME/.init.sh
    # source customized initailization script
    if [ -f $HOME/.init.local.sh ]
    then
        . $HOME/.init.local.sh
    fi

    # locale
    export LANG=en_US.UTF-8

    export PATH=$PATH:$HOME/bin

    ################################# SHELL PROMPT configuration ########################
    if [ $SHELL = "/bin/zsh" ]
    then
        if [[ $PROMPT =~ '^.+date.+$' ]] # regular expression comparison
        then
            #echo "prompt is already set"
        else
            export PROMPT="[\$(date +%H:%M:%S)] %{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
        fi
    fi

    ################################### Tmux ############################################
    export tmux_conf_new_window_retain_current_path=true


    ################################### alias ############################################
    alias sl=ls

EOF

    cat <<-\EOF >> ~/.zshrc

    ############################# custom initialization script #########################
    if [ -f $HOME/.init.sh ]
    then
        . $HOME/.init.sh
    fi
EOF

    cat <<-\EOF >> ~/.bashrc

    ############################# custom initialization script #########################
    if [ -f $HOME/.init.sh ]
    then
        . $HOME/.init.sh
    fi
EOF

    . ~/.init.sh
}

setup_shell
