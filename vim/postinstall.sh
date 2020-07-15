#!/bin/sh
#
# vim/neovim
#
# This runs postinstall stuff for vim and neovim

# Create config paths
mkdir -p ~/.config/nvim
#touch ~/.config/nvim/init.vim

ln -s ~/.my/dotfiles/vim/init.vim ~/.config/nvim/init.vim

