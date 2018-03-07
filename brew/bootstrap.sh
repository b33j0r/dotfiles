#!/usr/bin/env bash

echo "BOOTSTRAP brew"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}


xcode-select --install


###
### Homebrew
###

if [ ! -e "/usr/local/bin/tree" ]; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed!"
fi

echo "Updating brew"
brew update

# Install essentials
echo "Running brew bundle"
brew bundle


popd
