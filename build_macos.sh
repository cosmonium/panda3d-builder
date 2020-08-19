#!/bin/bash

set -x

#TODO: extract version from git
COUNT=`git rev-list --count v1.10.6..HEAD`
VERSION="1.10.6.dev${COUNT}+fp64+opt"

PYTHON=/usr/local/opt/python@3.7/bin/python3

$PYTHON makepanda/makepanda.py \
--python-incdir /usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/include \
--python-libdir /usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/lib \
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

