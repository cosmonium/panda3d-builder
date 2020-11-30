#!/bin/bash

set -x

PYTHON_VERSION=3.7

#TODO: extract version from git
COUNT=`git rev-list --count v1.10.7..HEAD`
VERSION="1.10.7.dev${COUNT}+fp64+opt"

PYTHON=python${PYTHON_VERSION}

$PYTHON makepanda/makepanda.py \
--osxtarget=10.9 \
--everything \
--no-gles --no-gles2 --no-egl \
--nocolor \
--use-sse2 \
--distributor=cosmonium \
--git-commit=`git rev-parse HEAD` \
--threads=4 \
--optimize=4 \
--override STDFLOAT_DOUBLE=1 \
--wheel --version $VERSION \
--installer

