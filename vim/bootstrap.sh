#!/usr/bin/env bash

echo "BOOTSTRAP vim"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

rm -rf $HOME/vimified $HOME/.vim $HOME/.vimrc $HOME/.config/vimified

brew install vim

if [ ! -e "$HOME/vimified" ]; then
  echo "Installing vimified"

  curl -L https://raw.github.com/zaiste/vimified/master/install.sh | sh
else
  echo "Vimified already installed!"
fi

mv ${HOME}/.vim/local.vimrc ${HOME}/.vim/local.vimrc.backup
ln -s -f ${BOOTSTRAP_HOME}/.vim/local.vimrc ${HOME}/.vim/local.vimrc

popd
