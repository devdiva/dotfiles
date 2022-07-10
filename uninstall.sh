#!/bin/sh
#
# Uninstall dotfiles and apps
#
echo "Uninstalling your apps and dotfiles"

# -- Constants
script_dir="$(dirname "$0")"

dotfiles_dir=~$HOME/.my/dotfiles

# -- Context Sanity Check

context_dir=$(pwd -P)

#if [[ $context_dir == $dotfiles_dir ]] ; then
#  echo "In the expected location"
#else
#  echo "Keep it tidy please. Execute from $dotfiles_dir"
#  exit
#fi

# -- Helper Methods
print_help()
{
  echo "Usage: uninstall.sh"
}


echo "TODO"


