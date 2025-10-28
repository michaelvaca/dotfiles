source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/binds.zsh

autoload -Uz compinit add-zsh-hook vcs_info
compinit -d ~/.config/zsh/.zcompdump

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history
setopt extended_history	

# setopt prompt_subst
# 
# add-zsh-hook precmd vcs_info
# 
# zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*' formats '%b%u%c'
# zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
# zstyle ':vcs_info:git*' unstagedstr '*'
# zstyle ':vcs_info:git*' stagedstr '+'
# zstyle ':vcs_info:*:*' check-for-changes true
# # Set the prompt.
# PROMPT='%(?.%F{14}🐩.%F{9}⏺)%f %2 %~ '
# RPROMPT='⎇ ${vcs_info_msg_0_}'

# Vi mode
# ANSI cursor escape codes:
# \e[0 q: Reset to the default cursor style.
# \e[1 q: Blinking block cursor.
# \e[2 q: Steady block cursor (non-blinking).
# \e[3 q: Blinking underline cursor.
# \e[4 q: Steady underline cursor (non-blinking).
# \e[5 q: Blinking bar cursor.
# \e[6 q: Steady bar cursor (non-blinking).
bindkey -v # Enable vi keybindings
export KEYTIMEOUT=1 # Makes switching modes quicker
export VI_MODE_SET_CURSOR=true # trigger cursor shape changes when switching modes

# Gets called every time the keymap changes (insert <-> normal mode)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[2 q' # block
  else
    echo -ne '\e[6 q' # beam
  fi
}
# Register this function as a ZLE (Zsh Line Editor) widget
zle -N zle-keymap-select

# Runs once when a new ZLE session starts (e.g. when a prompt appears)
zle-line-init() {
  zle -K viins # initiate 'vi insert' as keymap (can be removed if 'binkey -V has been set elsewhere')
  echo -ne '\e[6 q'
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup

# Yank to the system clipboard
function vi-yank-xclip {
  zle vi-yank
  echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Press 'v' in normal mode to launch Vim with current line
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
