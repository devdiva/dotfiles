#!/bin/sh
#
# Node
#
# This runs postinstall stuff for the node toolchain
# Note: nvm is being used to manage node
#

mkdir ~/.nvm

# TODO -- add in a system node version
(cd ~/.nvm && source $(brew --prefix nvm)/nvm.sh && nvm install node && nvm use node)
