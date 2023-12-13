eval "$(direnv hook zsh)"
source $HOME/.profile
bindkey -e

# wezterm on mac with tmux seemed to need this?
stty icrnl
