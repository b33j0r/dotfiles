#!/usr/bin/env bash

GODOT_SRC=${HOME}/src/godot
GODOT_INSTALL_DIR=${HOME}/Applications
GODOT_APP=${GODOT_INSTALL_DIR}/Godot.app

set -e

pushd ${GODOT_SRC}

git pull

scons platform=osx target=release_debug
cp -r ./misc/dist/osx_tools.app ${GODOT_APP}

mkdir -p ${GODOT_APP}/Contents/MacOS

cp ./bin/godot.osx.opt.tools.64 ${GODOT_APP}/Contents/MacOS/Godot
chmod +x ${GODOT_APP}/Contents/MacOS/Godot

popd
