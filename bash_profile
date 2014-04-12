if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#        . $(brew --prefix)/etc/bash_completion
# fi

alias ctags-bbedit='/opt/boxen/homebrew/bin/ctags --excmd=number --tag-relative=no --fields=+a+m+n+S -R `pwd`'

alias divshot='/opt/boxen/nodenv/versions/v0.10.25/bin/divshot'

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
