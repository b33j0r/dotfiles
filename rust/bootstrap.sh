#!/usr/bin/env bash

echo "BOOTSTRAP rust"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

# brew bundle


SRC_PREFIX="$HOME/.src"
RUST_VERSION="$(rustc --version | cut -c 7-)"
RUST_SRC_PATH="$SRC_PREFIX/rust-${RUST_VERSION}"

mkdir -p $SRC_PREFIX

if [ ! -e "$RUST_SRC_PATH" ]; then
  echo "Cloning rust source code from github"

  git clone -b "${RUST_VERSION}" --single-branch --depth 1 https://github.com/rust-lang/rust.git "$RUST_SRC_PATH"
  ln -s -f $RUST_SRC_PATH "$SRC_PREFIX/rust"
else
  echo "Rust source already cloned for version ${RUST_VERSION}"
fi

cargo install racer

popd
