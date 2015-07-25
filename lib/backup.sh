#!/bin/bash

BASE_BACKUP_DIR=~/backup
HASH=`date | sed 's/ \+/\-/g'`
BACKUP_DIR="${BASE_BACKUP_DIR}/${HASH}"

echo 'Backing up old dotfiles';

if [ ! -d $BACKUP_DIR ]; then
	echo "Creating backup dir ->  ${BACKUP_DIR}"
	mkdir -p $BACKUP_DIR
fi

#ZSH config
if [ -L ~/.zshrc ]; then 
	echo 'Backing up ~/.zshrc';
	mv ~/.zshrc $BACKUP_DIR/.zshrc;
fi

#TMUX conf
if [ -L ~/.tmux.conf ]; then 
	echo 'Backing up tmux.conf';
	mv ~/.tmux.conf $BACKUP_DIR/.tmux.conf;	
fi

#GEM conf
if [ -L ~/.gemrc ]; then
	echo 'Backing up .gemrc';
	mv ~/.gemrc $BACKUP_DIR/.gemrc;
fi
