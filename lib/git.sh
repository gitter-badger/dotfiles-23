#!/bin/bash

HAS_APT=`which apt-get`;

if [ HAS_APT ]; then
  apt-get install -y git-core;
fi


ln -srf ./config/gitconfig ~/.gitconfig;
