#!/usr/bin/env bash

echo "BOOTSTRAP misc"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


brew bundle

###
### iTerm2
###

ITERM2_PROFILE_DIR="$HOME/Library/Application Support/iTerm2"
ITERM2_DYNAMIC_PROFILE_DIR="${ITERM2_PROFILE_DIR}/DynamicProfiles"

rm -rf "${ITERM2_DYNAMIC_PROFILE_DIR}"
mkdir -p "${ITERM2_PROFILE_DIR}"
ln -s -f "${BOOTSTRAP_HOME}/iterm2/DynamicProfiles" "${ITERM2_PROFILE_DIR}/DynamicProfiles"

defaults write com.googlecode.iterm2 "Default Bookmark Guid" '4A44A8BC-9562-477E-B459-314793700D63'

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


popd
