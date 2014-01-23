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
	
cd $HOME || die chdir

if [ ! -d "$DOT_INSTALL_DIR" ]
then
	echo "Didn't find new Vim config.  Try running this in your home dir:"
	echo "  git clone $GIT_URL $DOT_INSTALL_DIR"
	echo "Exiting."
	exit
fi

echo "Moving existing .vim/ and .vimrc into .vimbackup/."
echo "Feel free to manually copy old stuff into the new .vim*"
mkdir .vimbackup || die mkdir
mv .vim .vimbackup || warn "No existing .vim?"
mv .vimrc .vimbackup || warn "No existing .vmirc?"

echo "Symlinking to new goodness in $DOT_INSTALL_DIR."
ln -s  ${DOT_INSTALL_DIR}/.vim .vim || die ln
ln -s ${DOT_INSTALL_DIR}/.vimrc .vimrc || die ln


