#!/bin/bash

set -x

#TODO: extract version from git
COUNT=`git rev-list --count v1.10.7..HEAD`
VERSION="1.10.7.dev${COUNT}+fp64+opt"

PLATFORM=amd64

PYTHON=thirdparty/win-python3.7-x64/python.exe

$PYTHON makepanda/makepanda.py \
--everything \
--arch=$PLATFORM \
 --msvc-version=14 \
 --windows-sdk=7.1 \
 --no-eigen \
--nocolor \
--use-sse2 \
--distributor=cosmonium \
--git-commit=`git rev-parse HEAD` \
--threads=4 \
--optimize=4 \
--override STDFLOAT_DOUBLE=1 \
--wheel --version $VERSION \
--installer \
--lzma