#!/usr/bin/env bash

echo "BOOTSTRAP node"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

brew install node
brew upgrade node

# function install_package_if_needed() {
#     local p=${1:-Package required}
#     local v=${2:-Version required}
#     shift 2
#     local i=$(node -p "require('$p/package.json').version" 2>/dev/null)
#     [ "$i" == "$v" ] || npm "$@" install "$p@$v"
# }

npm install -g npm
npm install -g webpack webpack-dev-server less raw-loader express


popd
