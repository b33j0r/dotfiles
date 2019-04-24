#!/usr/bin/env bash

echo "BOOTSTRAP emacs"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

source install-emacs-head.sh
source install-spacemacs.sh

popd
