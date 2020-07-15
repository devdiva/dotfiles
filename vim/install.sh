#!/bin/sh
#
# vim/neovim
#
# This runs install stuff for vim and neovim
# Note: vim is system installed, neovim is installed from brew
#

# Add vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


