#!/usr/bin/env bash

LOCAL_HOME=$HOME/.local

SRC_HOME=$LOCAL_HOME/src

SRC_DIR=$SRC_HOME/openscad

# ------------------------------------------

mkdir -p $SRC_HOME
git clone https://github.com/openscad/openscad.git $SRC_DIR

# ------------------------------------------

set -e

# ------------------------------------------

pushd $SRC_DIR

    source setenv_mac.sh
    ./scripts/macosx-build-dependencies.sh
    ./scripts/macosx-build-homebrew.sh
    qmake openscad.pro
    make

popd

# ------------------------------------------

pushd $SRC_DIR

    ls -al
    cp -R OpenSCAD.app ~/Applications

popd

# ------------------------------------------
