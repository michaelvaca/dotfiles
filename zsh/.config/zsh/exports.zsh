eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=1
export EDITOR=nvim
export MANPAGER="nvim +Man!"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH=$HOME/.elixir-install/installs/otp/28.1/erts-16.1/bin:$PATH
export PATH=$HOME/.elixir-install/installs/elixir/1.19.0-otp-28/bin:$PATH
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(/opt/homebrew/bin/mise activate zsh)"
eval "$(zoxide init zsh)"

