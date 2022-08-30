#!/bin/bash

set -x

git config --global --add safe.directory /build

source `dirname $0`/common.sh

PLATFORM=x86_64

PYTHON=python3

#TODO: Should update the docker image
apt-get install -y patchelf

$PYTHON makepanda/makepanda.py \
--everything \
--no-gles --no-gles2 --no-egl \
--nocolor \
--use-sse2 \
--distributor=cosmonium \
--git-commit=`git rev-parse HEAD` \
--threads=$THREADS \
--optimize=$OPT \
--override STDFLOAT_DOUBLE=1 \
--version $VERSION \
--wheel \
--installer \
--lzma

mv panda3d1.11_1.11.0_amd64.deb panda3d1.11_${VERSION_SHORT}_amd64.deb
