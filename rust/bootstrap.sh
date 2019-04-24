#!/usr/bin/env bash

echo "BOOTSTRAP rust"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup update

## Use nightly as default
rustup install nightly
rustup default nightly

## Install fish completions
rustup completions fish > ~/.config/fish/completions/rustup.fish
