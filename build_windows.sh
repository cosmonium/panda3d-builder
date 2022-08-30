#!/bin/bash

set -x

source `dirname $0`/common.sh

PLATFORM=amd64

PYTHON_VERSION=3.8
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
--version $VERSION \
--wheel \
--installer \
--lzma
