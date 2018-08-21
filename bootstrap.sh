#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

export DOTFILES_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source ${DOTFILES_HOME}/brew/bootstrap.sh
source ${DOTFILES_HOME}/common/bootstrap.sh
source ${DOTFILES_HOME}/fish/bootstrap.sh
source ${DOTFILES_HOME}/tmux/bootstrap.sh
# source ${DOTFILES_HOME}/vim/bootstrap.sh
source ${DOTFILES_HOME}/python/bootstrap.sh
source ${DOTFILES_HOME}/nvim/bootstrap.sh
source ${DOTFILES_HOME}/node/bootstrap.sh
source ${DOTFILES_HOME}/rust/bootstrap.sh
source ${DOTFILES_HOME}/misc/bootstrap.sh

if [ -e "${DOTFILES_HOME}/private/bootstrap.sh" ]; then
  source ${DOTFILES_HOME}/private/bootstrap.sh
fi

# source ${DOTFILES_HOME}/macos/bootstrap.sh

brew cleanup

