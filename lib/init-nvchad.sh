#!/bin/bash -x

# https://nvchad.com/docs/quickstart/install
setup_nvchad() {
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
  ln -sfv ~/.dev-env/NvChad_custom ~/.config/nvim/lua/custom
}
