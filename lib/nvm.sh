#!/bin/bash

HAS_APT=`which apt-get`

if [ ! -d ~/.nvm ]; then

	if [ $HAS_APT ]; then 
		echo 'Installing NVM dependencies';
		sudo apt-get install -y build-essential libssl-dev git-core curl;
	fi

	echo 'Installing NVM'
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

	echo 'Sourcing Bash Profile'
	source ~/.bashrc
	echo 'Installing and updating Node & NPM'
	nvm install iojs
	nvm use iojs
	npm update -g npm
else
	echo 'NVM already installed';
fi
