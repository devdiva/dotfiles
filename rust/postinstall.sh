#!/bin/sh
#
# Rust
#
# This runs postinstall stuff for the rust toolchain

# -- constants

bash_completions_path=~/.local/share/bash-completion/completions 
bash_completions_file=~/.local/share/bash-completion/completions/rustup 

zsh_completions_path=~/.zfunc
zsh_completions_file=~/.zfunc/_rustup


# -- postinstall
rustup -V
if [[ $? != 0 ]] ; then
  echo "rustup not found. check install, then re-run rust/postinstall.sh"
else

  # add completions for bash (system, not brew bash)
  mkdir -p $bash_completions_path
  rustup completions bash > $bash_completions_file

  # add completions for zsh
  mkdir $zsh_completions_path

  #  Then add the following lines to your `.zshrc` just before
  #  `compinit`:

  #     fpath+=~/.zfunc

  rustup completions zsh > $zsh_completions_file

fi
