#!/bin/sh
#
# Rust
#
# This runs postinstall stuff for the rust toolchain

rustup -V
if [[ $? != 0 ]] ; then
  echo "rustup not found. check install, then re-run rust/postinstall.sh"
else

  # add completions for bash (system, not brew bash)
  mkdir -p ~/.local/share/bash-completion/completions
  rustup completions bash >> ~/.local/share/bash-completion/completions/rustup

  # add completions for zsh
  mkdir ~/.zfunc

  #  Then add the following lines to your `.zshrc` just before
  #  `compinit`:

  #     fpath+=~/.zfunc

  rustup completions zsh > ~/.zfunc/_rustup

fi
