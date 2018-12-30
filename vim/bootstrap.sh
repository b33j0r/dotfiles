#!/usr/bin/env bash

echo "BOOTSTRAP vim"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

rm -rf $HOME/vimified $HOME/.vim $HOME/.vimrc $HOME/.config/vimified

if [ ! -e "$HOME/vimified" ]; then
  echo "Installing vimified"

  curl -L https://raw.github.com/zaiste/vimified/master/install.sh | sh
else
  echo "Vimified already installed!"
fi

ln -s -f ${BOOTSTRAP_HOME}/local.vimrc ${HOME}/.vim/local.vimrc
ln -s -f ${BOOTSTRAP_HOME}/after.vimrc ${HOME}/.vim/after.vimrc
ln -s -f ${BOOTSTRAP_HOME}/extra.vimrc ${HOME}/.vim/extra.vimrc

git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin


popd
