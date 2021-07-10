#!/usr/bin/env bash

setup_kubernetes {
    echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
    echo "[[ $commands[kubectl]  ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell
    # echo "[[ $commands[kubectl]  ]] && source <(kubectl completion zsh)" >> ~/.init.sh # add autocomplete permanently to your zsh shell
}

setup_kubernetes
