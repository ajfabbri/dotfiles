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
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

if [ -f ~/.cargo/env ]; then
    . "$HOME/.cargo/env"
fi

eval "$(direnv hook zsh)"
bindkey -e

# brew-installed python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# brew-installed git, etc.
export PATH="/usr/local/bin:$PATH"

# wezterm on mac with tmux seemed to need this?
stty icrnl
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# CLDR
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
source "$(brew --prefix)/lib/cloudera-cloud-users.sh"
# to speedup mow wrapper
export MOW_AUTH_TOOL=none

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit
. ~/.asdf/plugins/java/set-java-home.zsh
export PATH="$GOPATH/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

export TFENV_ARCH=amd64
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
