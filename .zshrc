ulimit -n 4096
eval "$(direnv hook zsh)"

alias ll="ls -al"
alias ta="tmux attach"
alias vim="nvim"

export DITTO_LICENSE="$(cat $HOME/.ditto/af.sec)"
