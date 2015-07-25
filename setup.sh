#!/bin/bash

HAS_APT=`which apt-get`;

#If we are in the dotfiles project file
if [ -d ./lib  ]; then
	#Remove previous link	
	if [ -d ~/.dotfiles ]; then
		rm -rf ~/.dotfiles
	fi 
	#Link this folder to the home/.dotfiles	
	ln -s `pwd` ~/.dotfiles	

#If we are using curl
else
	if [ $HAS_APT ]; then
		sudo spt-get install git-core;
	fi
	git clone git@github.com:cutandpastey/dotfiles.git ~/.dotfiles;
fi

#Move into the dotfiles directory
pushd ~/.dotfiles

. ./lib/backup.sh
. ./lib/nvm.sh
. ./lib/rbenv.sh
. ./lib/tmux.sh
. ./lib/zsh.sh
. ./lib/vim.sh
