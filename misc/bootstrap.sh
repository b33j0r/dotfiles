#!/usr/bin/env bash

echo "BOOTSTRAP python"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


###
### Node
###

brew install node

npm install -g webpack webpack-dev-server less raw-loader express


popd
