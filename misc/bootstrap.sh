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
ln -s -Fi "${BOOTSTRAP_HOME}"/iterm2/DynamicProfiles "${ITERM2_PROFILE_DIR}"

defaults write com.googlecode.iterm2 "Default Bookmark Guid" '4A44A8BC-9562-477E-B459-314793700D63'

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false


###
### Newsboat
###

# mkdir -p "${HOME}/.newsboat"
# ln -s -f "${BOOTSTRAP_HOME}/newsboat/config" "${HOME}/.newsboat/config"
# ln -s -f "${BOOTSTRAP_HOME}/newsboat/urls" "${HOME}/.newsboat/urls"


###
### Arduino
###

${BOOTSTRAP_HOME}/arduino.sh

###
### Custom Scripts
###
ln -s -f "${BOOTSTRAP_HOME}/prettyjson.py" "${HOME}/.bin/prettyjson"

popd
