#!/usr/bin/env bash

brew install ispell

brew tap daviderestivo/emacs-head

brew install emacs-head --HEAD --with-cocoa --with-librsvg --with-imagemagick@7 --with-jansson --with-multicolor-fonts --with-no-frame-refocus --with-mailutils --with-dbus --with-modules

osascript -e 'tell application "Finder" to make alias file to POSIX file "/usr/local/Cellar/emacs-head/HEAD-1828e9a_1/Emacs.app" at POSIX file "/Applications"'
