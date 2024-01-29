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

# typescript
export NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
. "$HOME/.cargo/env"

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
