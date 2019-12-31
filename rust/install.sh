#!/bin/sh
#
# Rust
#
# This installs the rust toolchain

rustc --version 
if [[ $? != 0 ]] ; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  
  # load rust into current terminal
  source $HOME/.cargo/env

else
  echo "Rust already installed."
  rustup update
fi
