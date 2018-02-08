#!/usr/bin/env bash

echo "BOOTSTRAP fish"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

mkdir -p ${HOME}/bin

mkdir -p ${HOME}/.config/fish
mkdir -p ${HOME}/.config/fish/completions
mkdir -p ${HOME}/.config/fish/conf.d
mkdir -p ${HOME}/.config/fish/functions


brew install fish

if [ ! -e "$HOME/.local/share/omf" ]; then
  echo "Installing Oh My Fish"
  curl -L https://get.oh-my.fish | fish
  mv ${HOME}/.config/fish/conf.d/omf.fish ${HOME}/.config/fish/conf.d/omf.fish.installer
else
  echo "Oh My Fish already installed!"
fi

ln -s -f ${BOOTSTRAP_HOME}/config.fish ${HOME}/.config/fish/config.fish
# ln -s -f ${BOOTSTRAP_HOME}/.config/fish/completions/* ${HOME}/.config/fish/completions/
ln -s -f ${BOOTSTRAP_HOME}/functions/* ${HOME}/.config/fish/functions/
ln -s -f ${BOOTSTRAP_HOME}/conf.d/* ${HOME}/.config/fish/conf.d/


popd
