#!/usr/bin/env bash

echo "BOOTSTRAP misc"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


brew bundle


${BOOTSTRAP_HOME}/mongodb/bootstrap.sh
${BOOTSTRAP_HOME}/iterm2/bootstrap.sh
${BOOTSTRAP_HOME}/arduino.sh


###
### Custom Scripts
###
ln -s -f "${BOOTSTRAP_HOME}/prettyjson.py" "${HOME}/.bin/prettyjson"

popd

echo "BOOTSTRAP misc -- Complete!"
