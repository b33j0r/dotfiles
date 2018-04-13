#!/usr/bin/env bash

echo "BOOTSTRAP rust"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

## Using rustup instead
# brew bundle

curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup update


## Install fish completions
rustup completions fish > ~/.config/fish/completions/rustup.fish

## Use nightly as default
rustup install nightly
rustup default nightly

## Install rust language server
rustup component add rls-preview rust-analysis rust-src
rustup component add rustfmt-preview

## Install racer
# cargo uninstall racer
cargo install racer

popd
