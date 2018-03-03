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

# Install latest 2.x.y
pyenv install -s $(pyenv install --list | grep -v - | grep -v 3 | tail -1)

# Install latest 3.x.y (excluding alphas and betas)
pyenv install -s $(pyenv install --list | grep -v - | grep -v a | grep -v b | tail -1)

# Install latest 3.x.y (INCLUDING alphas and betas)
pyenv install -s $(pyenv install --list | grep -v - | tail -1)

# NOTE: pyenv doesn't always source alphas, but... defensive coding

popd
