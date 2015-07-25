#!/bin/bash

HAS_APT=`which apt-get`

#Install dependencies
if [ $HAS_APT ]; then
	sudo apt-get install -y vim git-core build-essential  cmake python-dev
fi

#Install vim config
ln -srf ./config/vimrc ~/.vimrc

#Install vim deps
mkdir -p ~/.vim
ln -srf ./config/vim/* ~/.vim/

#Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	mkdir -p ~/.vim/bundle;
  	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#Vim plugins
vim +PluginInstall +qall

#YouCompleteMe
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer;

#Tern
cd ~/.dotfiles/vim/bundle/tern_for_vim/;
npm install;

echo "colorscheme monokai" >> ~/.vimrc
