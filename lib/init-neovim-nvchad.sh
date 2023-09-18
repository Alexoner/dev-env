brew install neovim || echo "'brew install neovim' failed!"

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# synchronize custom files
pushd ~/.config/nvim/lua/
mv custom custom.0
ln -sfv ~/.dev-env/NvChad_custom custom
popd
