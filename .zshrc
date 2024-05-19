alias ll="ls -al"
alias ta="tmux attach"
alias vim="nvim"
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias treeg='tree --gitignore'
alias treed='tree -d --gitignore'

export EDITOR=vim

#gpg
export GPG_TTY=$(tty)

# work
ulimit -n 4096

# typescript
export NPM_PACKAGES="$HOME/.npm-packages"
export PATH=$HOME/bin:$PATH
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
. "$HOME/.cargo/env"

eval "$(direnv hook zsh)"
bindkey -e

# brew-installed python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# wezterm on mac with tmux seemed to need this?
stty icrnl
