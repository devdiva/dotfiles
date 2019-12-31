#!/bin/sh
#
# Node
#
# This runs install stuff for the node toolchain
# Note: brew and nvm are being used to manage node
#


brew ls --versions nvm > /dev/null
if [[ $? == 0 ]] ; then
  echo "nvm already installed"	   
else
  brew install nvm
fi
