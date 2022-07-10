#!/bin/sh
#
# wasm
#
# This installs tools and things for wasm dev.

# Rust wasm-pack

wasm-pack -V 
if [[ $? != 0 ]] ; then
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh 
else
    echo "wasm-pack already installed."
fi


