#!/usr/bin/env bash

echo "BOOTSTRAP tmux"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

brew install tmux
brew install reattach-to-user-namespace


# Facebook PathPicker

brew install fpp


# .tmux

brew tap caskroom/fonts
brew cask install font-source-code-pro >> /dev/null 2>&1

if [ ! -e "$HOME/.tmux" ]; then
  echo "Installing .tmux"
  git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
else
  echo ".tmux already installed!"
fi

pushd $HOME/.tmux
git pull
popd


# Link conf files

ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
ln -s -f ${BOOTSTRAP_HOME}/.tmux.conf.local $HOME/.tmux.conf.local

popd
