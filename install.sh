#!/bin/bash

#
# Replace current Vim settings with config from this repository.
# Attempts to keep backups of existing Vim config.
# Step 1: Clone $GIT_URL into $HOME.
# Step 2: Run this script.
#

GIT_URL="https://github.com/ajfabbri/vim-config.git"
VIM_INSTALL_DIR=Vim

die() {
    printf >&2 -- '%s' "$1"
    exit ${2:-1}
}

cd $HOME || die chdir

if [ ! -d "$VIM_INSTALL_DIR" ]
then
	echo "Didn't find new Vim config.  Try running this in your home dir:"
	echo "  git clone $GIT_URL $VIM_INSTALL_DIR"
	echo "Exiting."
	exit
fi

echo "Moving existing .vim/ and .vimrc into .vimbackup/."
echo "Feel free to manually copy old stuff into the new .vim*"
mkdir .vimbackup || die mkdir
mv .vim .vimbackup || die 
mv .vimrc .vimbackup || die

echo "Symlinking to new goodness in $VIM_INSTALL_DIR."
ln -s Vim .vim || die ln
ln -s Vim/.vimrc .vimrc || die ln


