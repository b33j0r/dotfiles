#!/usr/bin/env bash

echo "BOOTSTRAP misc/quicksilver"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


brew bundle

# Spotlight > Show Spotlight search : Shift+Control+Option+S
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 64 "
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>32</integer>
        <integer>49</integer>
        <integer>1310720</integer>
      </array>
    </dict>
  </dict>
"

QS_PREF_DIR="$HOME/Library/Preferences"
QS_PREF_FILENAME="com.blacktree.Quicksilver.plist"

rm -rf "${QS_PREF_DIR}/${QS_PREF_FILENAME}"
cp "${BOOTSTRAP_HOME}/${QS_PREF_FILENAME}" "${QS_PREF_DIR}/${QS_PREF_FILENAME}"

popd

echo "BOOTSTRAP misc/quicksilver -- Complete!"
