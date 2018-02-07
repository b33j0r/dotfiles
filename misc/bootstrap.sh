#!/usr/bin/env bash

echo "BOOTSTRAP misc"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


brew bundle

###
### iTerm2
###

ITERM2_PROFILE_DIR_REL="Library/Application Support/iTerm2/DynamicProfiles"
ITERM2_PROFILE_DIR_HOME=$HOME/$ITERM2_PROFILE_DIR_REL
ITERM2_PROFILE_DIR_DOTFILES=$BOOTSTRAP_HOME/$ITERM2_PROFILE_DIR_REL

mkdir -p "${ITERM2_PROFILE_DIR_HOME}"
ln -s -f "${ITERM2_PROFILE_DIR_DOTFILES}"/* "${ITERM2_PROFILE_DIR_HOME}"/

defaults write com.googlecode.iterm2 "Default Bookmark Guid" '4A44A8BC-9562-477E-B459-314793700D63'

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


popd
