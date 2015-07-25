#!/bin/bash

HAS_APT=`which apt-get`;

if [ HAS_APT ]; then
  apt-get install -y silversearcher-ag;
fi

ln -srf ./config/agignore ~/.agignore;
