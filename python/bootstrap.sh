#!/usr/bin/env bash

echo "BOOTSTRAP python"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

brew bundle

if [ ! -e "$HOME/.pyenv" ]; then
  echo "Cloning pyenv into $HOME/.pyenv"
  git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
else
  echo "Updating pyenv in $HOME/.pyenv"
  pushd $HOME/.pyenv
  git pull
  popd
fi



PATH=$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH

# pyenv install -s 2.7.14
pyenv install -s $(pyenv install --list | grep -v - | grep -v 3 | tail -1)

# pyenv install -s 3.6.3
pyenv install -s $(pyenv install --list | grep -v - | grep -v b | tail -1)

popd
