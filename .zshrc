# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#theme
ZSH_THEME="bureau"
COMPLETION_WAITING_DOTS="true"
export LANG=en_GB.UTF-8

plugins=(git npm)

source $ZSH/oh-my-zsh.sh

# NVM --------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# RVM --------------------------
export PATH="$PATH:$HOME/.rvm/bin"

# CUSTOM -----------------------
for f in ~/.dotfiles/zsh/*.zsh; do source $f; done

