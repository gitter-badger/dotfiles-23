#!/bin/bash

BASE_BACKUP_DIR=~/backup
HASH=`date | sed 's/ \+/\-/g'`
BACKUP_DIR="${BASE_BACKUP_DIR}/${HASH}"


echo 'Backing up old dotfiles';

if [ ! -d $BACKUP_DIR ]; then
	echo "Creating backup dir ->  ${BACKUP_DIR}"
	mkdir -p $BACKUP_DIR
fi

if [ -f ~/.zshrc ]; then 
	echo 'Backing up ~/.zshrc';
	mv ~/.zshrc $BACKUP_DIR/.zshrc;
fi
