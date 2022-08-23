#!/bin/bash

#
# Replace current settings with config from this repository.
# Attempts to keep backups of existing Vim config, etc..
# Step 1: Clone $GIT_URL into $HOME.
# Step 2: Run this script.
#

GIT_URL="https://github.com/ajfabbri/dotfiles.git"
DOT_INSTALL_DIR=dotfiles

die() {
    printf >&2 -- '%s\n' "$1"
    exit ${2:-1}
}

warn () {
    printf >&2 -- '%s\n' "$1"
}

do_backup() {
    mv $1 $2 2> /dev/null || warn "No existing $1, ignoring."
}

do_link() {
    ln -s ${DOT_INSTALL_DIR}/$1 || die "error linking $1"
}


pushd $HOME || die chdir

if [ ! -d "$DOT_INSTALL_DIR" ]
then
	echo "Didn't find new Vim config.  Try running this in your home dir:"
	echo "  git clone $GIT_URL $DOT_INSTALL_DIR"
	echo "Exiting."
	exit
fi

echo "Moving existing dot files to .dotfilesbackup"
echo "(Feel free to manually copy old stuff back in after.)"
mkdir .dotfilesbackup || \
	die "mkdir: move existing backup dir .dotfilesbackup and try again"

VIMFILES=".vim .vimrc"
RCFILES=".gitconfig .ideavimrc .tmux.conf .screenrc"
ALL="$VIMFILES $RCFILES"

for f in $ALL
do
    do_backup $f .dotfilesbackup
done

echo "Symlinking to new goodness in $DOT_INSTALL_DIR."
for f in $ALL
do
    do_link $f
done

if [ ! -f ~/.config/nvim/init.vim ]
then
    mkdir -p ~/.config/nvim 2>&1 > /dev/null
    ln -s $HOME/$DOT_INSTALL_DIR/.config/nvim/init.vim .config/nvim/init.vim
fi

popd
