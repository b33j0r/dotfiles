#!/usr/bin/env bash

export DOTFILES_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "BOOTSTRAP uncomment stuff if nothing is happening!"

# source ${DOTFILES_HOME}/brew/bootstrap.sh
# source ${DOTFILES_HOME}/common/bootstrap.sh
# source ${DOTFILES_HOME}/macos/bootstrap.sh
source ${DOTFILES_HOME}/fish/bootstrap.sh
source ${DOTFILES_HOME}/tmux/bootstrap.sh
# source ${DOTFILES_HOME}/vim/bootstrap.sh
source ${DOTFILES_HOME}/python/bootstrap.sh
# source ${DOTFILES_HOME}/node/bootstrap.sh
source ${DOTFILES_HOME}/misc/bootstrap.sh
if [ ! -e "${DOTFILES_HOME}/private/bootstrap.sh" ]; then
  source ${DOTFILES_HOME}/private/bootstrap.sh
fi

# echo "Displaying config tree:"
# tree -a ~/.config
