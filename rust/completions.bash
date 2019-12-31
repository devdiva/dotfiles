# uses rust completions for bash

completion=~/.local/share/bash-completion/completions

if test -f $completion ; then
  source $completion
fi

