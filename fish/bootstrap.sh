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

ln -s -f ${BOOTSTRAP_HOME}/config.fish ${HOME}/.config/fish/config.fish
ln -s -f ${BOOTSTRAP_HOME}/interactive.fish ${HOME}/.config/fish/interactive.fish
ln -s -f ${BOOTSTRAP_HOME}/keybindings.fish ${HOME}/.config/fish/keybindings.fish
ln -s -f ${BOOTSTRAP_HOME}/abbreviations.fish ${HOME}/.config/fish/abbreviations.fish
ln -s -f ${BOOTSTRAP_HOME}/functions/* ${HOME}/.config/fish/functions/

popd
