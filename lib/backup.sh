#!/bin/bash

BASE_BACKUP_DIR=~/backup
HASH=`date | sed 's/ \+/\-/g'`
BACKUP_DIR="${BASE_BACKUP_DIR}/${HASH}"


if [ ! -d $BACKUP_DIR ]; then
	mkdir -p $BACKUP_DIR
fi

#ZSH config
if [ -L ~/.zshrc ]; then 
	mv ~/.zshrc $BACKUP_DIR/.zshrc;
fi

#TMUX conf
if [ -L ~/.tmux.conf ]; then 
	mv ~/.tmux.conf $BACKUP_DIR/.tmux.conf;	
fi

#GEM conf
if [ -L ~/.gemrc ]; then
	mv ~/.gemrc $BACKUP_DIR/.gemrc;
fi

#Vim 
if [ -L ~/.vimrc ]; then
	mv ~/.vimrc $BACKUP_DIR/.vimrc;
fi	

if [ -d ~/.vim ]; then
	mv  ~/.vim $BACKUP_DIR/.vim;
fi
