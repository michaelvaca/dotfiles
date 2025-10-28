#!/bin/sh

alias mv="mv -iv"
alias cp="cp -riv"
alias rm="rm -iv"
alias mkdir="mkdir -vp"
# alias ls="eza --color=auto --icons=auto -F -l --group-directories-first"
alias ls="lsd -alh"

alias df="df -h"
alias du="du -h"
alias free="free -m"

alias cd="z"
alias f="zi"

alias grep="rg --color=auto"
alias egrep="rg --color=auto --ignore-case"
alias fgrep="rg --color=auto --fixed-strings"

alias grep-files="rg --files --color=auto"
alias egrep-files="rg --files --color=auto --ignore-case"
alias fgrep-files="rg --files --color=auto --fixed-strings"

alias grep-files-recurse="rg --files --recurse --color=auto"
alias egrep-files-recurse="rg --files --recurse --color=auto --ignore-case"
alias fgrep-files-recurse="rg --files --recurse --color=auto --fixed-strings"

alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

# alias vim="nvim"
