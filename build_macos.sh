#!/bin/bash

set -x

PYTHON_VERSION=3.7
THREADS=4
OPT=3
PANDA_VERSION=1.10.9

#TODO: extract version from git
COUNT=`git rev-list --count v${PANDA_VERSION}..HEAD`
VERSION="${PANDA_VERSION}.dev${COUNT}+fp64"

if [[ "$OPT" == "4" ]]; then
    VERSION="${VERSION}+opt"
fi

PYTHON=python${PYTHON_VERSION}

$PYTHON makepanda/makepanda.py \
--osxtarget=10.9 \
--everything \
--no-gles --no-gles2 --no-egl \
--no-physx \
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
