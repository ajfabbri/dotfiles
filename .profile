alias ll="ls -al"
alias ta="tmux attach"
alias vim="nvim"
alias ta='tmux attach -t'
alias tn='tmux new -s'

export EDITOR=vim

#gpg
export GPG_TTY=$(tty)

# work
ulimit -n 4096
eval "$(direnv hook zsh)"
export DITTO_LICENSE="$(cat $HOME/.ditto/af.sec)"

# typescript
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# wezterm on mac with tmux seemed to need this?
stty icrnl
