#!/usr/bin/env bash

echo "BOOTSTRAP fish"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

mv ${HOME}/.config/fish ${HOME}/.config/fish.backup
mkdir -p ${HOME}/.config

ln -s -f ${BOOTSTRAP_HOME}/.config/fish ${HOME}/.config/fish


brew install fish

if [ ! -e "$HOME/.local/share/omf" ]; then
  echo "Installing Oh My Fish"
  curl -L https://get.oh-my.fish | fish
else
  echo "Oh My Fish already installed!"
fi

popd
