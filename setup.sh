#!/bin/bash
SHOULD_INSTALL=false;
SHOULD_BACKUP=false;

if [[ $* == *-i* ]]; then
  SHOULD_INSTALL=true;
fi

if [[ $* == *-b* ]]; then
  SHOULD_BACKUP=true;
fi


if [ ! -d ~/.dotfiles ]; then
  git clone git@github.com:cutandpastey/dotfiles.git ~/.dotfiles;
fi

if [ ! -d ~/.oh-my-zsh ]; then
  curl -L http://install.ohmyz.sh | sh;
fi

# BACKUP AND COPY ACCROSS .ZSHRC
# ------------------------------
if [ -f ~/.zshrc ] && [ "$SHOULD_BACKUP"=true ] ; then
  echo '-------------------'
  echo 'Backing up current .zshrc'
  echo '-------------------'
  mv ~/.zshrc ~/.backup.zshrc;
fi

echo '-------------------'
echo 'Copy .zshrc'
echo '-------------------'
ln -s ~/.dotfiles/.zshrc ~/.zshrc;

# SETUP NVM
# ------------------------------
if [ ! -d ~/.nvm ]; then

  echo '-------------------';
  echo 'Installing NVM';
  echo '-------------------';
  
  git clone https://github.com/creationix/nvm.git $HOME/.nvm;
  cd $HOME/.nvm;
  git checkout `git describe --abbrev=0 --tags`;
  source nvm.sh;
fi


# SETUP RVM
# ------------------------------
if [ ! -d ~/.rvm ]; then

  echo '-------------------';
  echo 'Installing RVM';
  echo '-------------------';  

  curl -sSL https://get.rvm.io | bash -s stable;
  export PATH="$PATH:$HOME/.rvm/bin";
fi


# SETUP Node
# ------------------------------
if [ ! -d ~/.nvm/v0.10.* ]; then 
  
  echo '-------------------';
  echo 'Installing nodejs >= v0.10';
  echo '-------------------';

  nvm install v0.10;
fi

# install global npm deps
# ------------------------------


if [ "$SHOULD_INSTALL" = true ]; then 
  
  echo '-------------------';
  echo 'Installing global npm deps';
  echo '-------------------';

  ~/.dotfiles/npm/install.sh; 
fi


# SETUP Ruby
# ------------------------------
if [ ! -d ~/.rvm/rubies/ruby-2.* ]; then 
  
  echo '-------------------';
  echo 'Installing ruby >= 2.1.1';
  echo '-------------------';

  rvm install 2.1.1;
fi

if [ -f ~/.gemrc ] && [ "$SHOULD_BACKUP"=true ]; then
  mv ~/.gemrc ~/.backup.gemrc;
fi

# install global gem deps
# ------------------------------
ln -s ~/.dotfiles/gem/.gemrc ~/.gemrc;


# install global gem deps
# ------------------------------


if [ "$SHOULD_INSTALL" = true ]; then
  
  echo '-------------------';
  echo 'Installing global gem deps';
  echo '-------------------';

  ~/.dotfiles/gem/install.sh; 
fi


if [ -d ~/.vim ]; then 
  rm -rf ~/.vim
fi

if [ -f ~/.vimrc ] && [ "$SHOULD_BACKUP"=true ]; then

  echo '-------------------';
  echo 'Backing up local ~/.vimrc';
  echo '-------------------';
  
  rm -f ~/.backup.vimrc;
  mv ~/.vimrc ~/.backup.vimrc;
  rm -f ~/.vimrc;
fi

ln -s ~/.dotfiles/vim ~/.vim;
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc;

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  
  echo '-------------------';
  echo 'Installing vundle';
  echo '-------------------';

  mkdir -p ~/.vim/bundle;
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fi

if [ ! -f /usr/local/bin/macvim ]; then
  ln -s ~/.dotfiles/vim/mvim /usr/local/bin/mvim;
fi

vim +PluginInstall +qall

# YouCompleteMe -----
~/.vim/bundle/YouCompleteMe/install.sh;

# tern ------
cd ~/.dotfiles/vim/bundle/tern_for_vim/;
npm install;

# UtliSnip ------
ln -s ~/.vim/ultisnips/ftdetect ~/.vim/ftdetect;


if [ -f ~/.tmux.conf ] && [ "$SHOULD_BACKUP"=true ]; then
  mv ~/.tmux.com ~/.backup.tmux.conf;
fi

ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

if [ -f ~/.gitconfig ]; then
  mv ~/.gitconfig ~/.backup.gitconfig;
  ln -s ~/.dotfiles/gitconfig ~/.gitconfig;
fi


echo '-------------------';
echo 'Finished installing everything';
echo '-------------------';
