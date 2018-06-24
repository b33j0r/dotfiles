#!/usr/bin/env bash

echo "BOOTSTRAP misc/mongodb"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


brew bundle

ln -s -f "${BOOTSTRAP_HOME}/mongorc.js" "${HOME}/.mongorc.js"

popd

echo "BOOTSTRAP misc/mongodb -- Complete!"
