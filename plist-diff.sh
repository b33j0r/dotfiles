#!/bin/bash

## @file
## Shows CLI diff between two plist files.
##
## Normally, Mac plist files are binary, so diffs do not display. However,
## there are cases where seeing diffs is important. For example, when tracking
## changes via Mackup's git storage option.
##
## Note this option allows seeing plist diffs without fully installing Xcode
## tools (otherwise, Xcode tools enables opendiff, which may be a better
## alternative).
##
## Note I prefer to emulate the look and feel of git's default diff, so this
## script uses the '+/-' diff option, less for vi-like viewing, and supports
## the colordiff binary if installed.
##
## To install colordiff:
## @code
## // On Mac:
## brew install colordiff
## // On Debian or Ubuntu:
## sudo apt-get install colordiff
## @endcode
##
## @see https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man5/plist.5.html
## @see http://stackoverflow.com/questions/9485713/editor-or-way-to-print-plist-in-a-clean-way-without-xcode
## @see http://stackoverflow.com/questions/13437104/compare-content-of-two-variables-in-bash
## @see http://stackoverflow.com/questions/4857310/how-to-get-diff-working-like-git-diff
##
## Example:
## @code
## ./plistDiff PATH/TO/a.plist PATH/TO/b.plist <ARGS>
## @endcode
## Where <ARGS> are any additional diff args.

a=$(plutil -convert xml1 -o - "$1")
b=$(plutil -convert xml1 -o - "$2")

# The -u flag displays line numbers with "+" and "-" (rather than ">" and "<").
# The optional colordiff binary defaults to green/red.
# Less -R is used to emulate vi.
which colordiff &> /dev/null
if [ $? == 0 ]; then
  diff -u <(echo "$a") <(echo "$b") "${@:3}" | colordiff | less -R
else
  diff -u <(echo "$a") <(echo "$b") "${@:3}" | less -R
fi
