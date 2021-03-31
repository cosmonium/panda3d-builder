#!/bin/bash

set -x

PYTHON_VERSION=3.8
PLATFORM=amd64
THREADS=4
OPT=3
PANDA_VERSION=1.10.9

#TODO: extract version from git
COUNT=`git rev-list --count v${PANDA_VERSION}..HEAD`
VERSION="${PANDA_VERSION}.dev${COUNT}+fp64"


PYTHON=thirdparty/win-python3.7-x64/python.exe

$PYTHON makepanda/makepanda.py \
--everything \
--arch=$PLATFORM \
 --msvc-version=14 \
 --windows-sdk=7.1 \
 --no-eigen \
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
