#!/usr/bin/env bash

echo "BOOTSTRAP python"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


brew install readline xz
brew install python3
brew install pyenv

###

pyenv install -s 2.7.13
pyenv install -s 3.6.3
pyenv install -s $(pyenv install --list | grep -v - | grep -v b | tail -1)


popd
