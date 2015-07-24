#!/bin/bash
HAS_APT=`which apt-get`
RUBY_VERSION='2.0.0-p645';

#Check if rbrnv is installed
if [ ! -d ~/.rbenv  ];then 
	echo 'Installing RBENV';
	if [ $HAS_APT ]; then
		sudo apt-get install git-core;
	fi
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	source ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc
else
	echo 'RBENV Already Installed'
fi

#Install ruby-build
if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

#Install specific ruby version
rbenv install $RUBY_VERSION
echo 'RBENV_VERSION=${RUBY_VERSION}' >> ~/.bashrc
source ~/.bashrc
echo `ruby -v`