#!/bin/bash

#
# Replace current settings with config from this repository.
# Attempts to keep backups of existing Vim config, etc..
# Step 1: Clone $GIT_URL into $HOME.
# Step 2: Run this script.
#

GIT_URL="https://github.com/ajfabbri/dotfiles.git"
DOT_INSTALL_DIR=dotfiles
NVIM_SITE="$HOME/.local/share/nvim/site"
NVIM_UNDO_DIR="$HOME/.vim/undodir"


die() {
    printf >&2 -- '%s\n' "$1"
    exit ${2:-1}
}

warn () {
    printf >&2 -- '%s\n' "$1"
}

info () {
     echo "==> $1"
}

do_link() {
	ln -s $(pwd)/${DOT_INSTALL_DIR}/$1 "$(pwd)/$1" || die "error linking $1"
}

print_hints() {
    info "Finished install."
    echo "You should also make sure you have a recent version of neovim."
    echo "And install apt packages for fd-find ripgrep clangd clang"
    # if running on Mac print extra hints
    if [ "$(uname)" == "Darwin" ]; then
        echo "On mac, consider adding this to ~/.asdfrc:"
        echo "  java_macos_integration_enable=yes"
    fi
}

pushd $HOME || die chdir

if [ ! -d "$DOT_INSTALL_DIR" ]
then
	echo "Missing dotfiles dir.  Try running this in $HOME"
	echo "  git clone $GIT_URL $DOT_INSTALL_DIR"
	echo "Exiting."
	exit
fi


# general config
ALL=".gitconfig .ideavimrc .tmux.conf .config/nvim .zshrc .bashrc .profile .editorconfig"

info "Backing up existing stuff to .dotfilesbackup"
rsync -abL $ALL .dotfilesbackup/ || info "Ignoring missing files; new install"
rm -r $ALL || info "Ignoring missing files; new install"

mv -f .vimrc .dotfilesbackup

info "Symlinking to new goodness in $DOT_INSTALL_DIR."
mkdir $HOME/.config || info "Ignoring existing .config dir"
for f in $ALL
do
    do_link $f
done


print_hints
popd

# optional AI taking over my job
if [ "$2" == "copilot" ] ; then
	echo "*** You need to install node.js: https://nodejs.org/en/download ***"
fi
