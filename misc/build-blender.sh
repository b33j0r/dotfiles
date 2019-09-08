#!/usr/bin/env bash

BLENDER_BUILD="${HOME}/src/blender-build"
BLENDER_CLONE="${BLENDER_BUILD}/blender"
APP_BUILD="${BLENDER_BUILD}/build_darwin/bin/Blender.app"
APP_INSTALL="${HOME}/Applications/"

set -e

mkdir -p "${BLENDER_BUILD}"

if [ -d "${BLENDER_CLONE}/.git" ]; then
    pushd "${BLENDER_CLONE}"
        git pull
    popd
else
    git clone http://git.blender.org/blender.git ${BLENDER_CLONE}
fi

pushd "${BLENDER_CLONE}"

    make update
    make

popd

# cp -R ${APP_BUILD} ${APP_INSTALL}
open ${APP_BUILD}/..