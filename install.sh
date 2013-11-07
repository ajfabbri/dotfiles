#!/bin/bash

#
# Replace current Vim settings with config from this repository.
# Attempts to keep backups of existing Vim config.
# Step 1: Clone $GIT_URL into $HOME.
# Step 2: Run this script.
#

# TODO
GIT_URL=""
exit
VIM_INSTALL_DIR=Vim

if [ ! -d "$GIT_REPO_BASE" ]
then
	echo "Didn't find new Vim config.  Try running this in your home dir:"
	echo "  git clone $GIT_URL $VIM_INSTALL_DIR"
	echo "Exiting."
	exit
fi

echo "Moving existing .vim/ and .vimrc into .vimbackup/."
echo "Feel free to manually copy old stuff into the new .vim*"
chdir $HOME
mkdir .vimbackup

echo "Symlinking to new goodness in $VIM_INSTALL_DIR."
mv .vim .vimbackup
mv .vimrc .vimbackup

