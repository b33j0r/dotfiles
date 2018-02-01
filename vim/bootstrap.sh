#!/usr/bin/env bash

echo "BOOTSTRAP vim"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

brew install vim

if [ ! -e "$HOME/vimified" ]; then
  echo "Installing vimified"
  curl -L https://raw.github.com/zaiste/vimified/master/install.sh | sh
else
  echo "Vimified already installed!"
fi

ln -s -f ${BOOTSTRAP_HOME}/.vim/local.vimrc ${HOME}/.vim/local.vimrc

popd
