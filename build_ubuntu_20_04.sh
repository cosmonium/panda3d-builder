#!/bin/bash

set -x

git config --global --add safe.directory /build

PLATFORM=x86_64
THREADS=4
OPT=3
PANDA_VERSION=1.11.0
CXXFLAGS="-Wno-int-in-bool-context -Wno-ignored-attributes"

COUNT=`git rev-list --count v1.10.0..HEAD`
SHORT=`git rev-parse --short HEAD`
VERSION="${PANDA_VERSION}.dev${COUNT}-g${SHORT}+fp64"
VERSION_SHORT="${PANDA_VERSION}.dev${COUNT}-g${SHORT}"

if [[ "$OPT" == "4" ]]; then
    VERSION="${VERSION}+opt"
fi

#TODO: Should update the docker image
apt-get install -y patchelf

python3 makepanda/makepanda.py \
--everything \
--no-gles --no-gles2 --no-egl \
--nocolor \
--use-sse2 \
--distributor=cosmonium \
--git-commit=`git rev-parse HEAD` \
--threads=$THREADS \
--optimize=$OPT \
--override STDFLOAT_DOUBLE=1 \
--wheel \
--version $VERSION \
--installer \
--lzma

mv panda3d1.11_1.11.0_amd64.deb panda3d1.11_${VERSION_SHORT}_amd64.deb
