#!/bin/bash

HAS_APT=`which apt-get`

if [ $HAS_APT ]; then 
	sudo apt-get install tmux;
fi 

ln -srf ./config/tmux.conf ~/.tmux.conf
