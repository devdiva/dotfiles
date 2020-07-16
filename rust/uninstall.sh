#!/bin/sh
#
# Rust
#
# This uninstalls the rust toolchain

# uninstall rust with rustup
rustup self uninstall

# remove generated completions files
rm ~/.local/share/bash-completion/completions/rustup
rm ~/.zfunc/_rustup
