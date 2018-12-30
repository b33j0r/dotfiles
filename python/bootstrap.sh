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
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

# Install latest 2.x.y
LATEST_PYTHON2="$(pyenv install --list | grep -Eo "^\*?\s*2\.\d+\.\d+\b" | cut -c 3- | tail -1)"
pyenv install -s $LATEST_PYTHON2
pyenv global $LATEST_PYTHON2
pip install -U setuptools pip tox bowler flake8
pip install -U virtualenv

# Workaround for tools that expect `python2`
ln -sf $HOME/.pyenv/versions/$LATEST_PYTHON2/bin/python $HOME/bin/python2

# Install latest 3.x.y (excluding alphas and betas)
LATEST_PYTHON3="$(pyenv install --list | grep -Eo "^\*?\s*3\.\d+\.\d+\b" | cut -c 3- | tail -1)"
pyenv install -s $LATEST_PYTHON3
pyenv global $LATEST_PYTHON3
pip install -U setuptools pip tox bowler flake8


popd
