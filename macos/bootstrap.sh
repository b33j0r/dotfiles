#!/usr/bin/env bash

echo "BOOTSTRAP macos"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

brew bundle

# source ${BOOTSTRAP_HOME}/macos-defaults.sh
source ${BOOTSTRAP_HOME}/macos-mathias.sh

popd
