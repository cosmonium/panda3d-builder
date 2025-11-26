#!/bin/bash

set -x

source `dirname $0`/common.sh

PYTHON_VERSION=3.10
PYTHON=python${PYTHON_VERSION}

$PYTHON makepanda/makepanda.py \
--python-incdir=$(ls -d /usr/local/Cellar/python@${PYTHON_VERSION}/*/Frameworks/Python.framework/Versions/*/include) \
--python-libdir=$(ls -d /usr/local/Cellar/python@${PYTHON_VERSION}/*/Frameworks/Python.framework/Versions/*/lib) \
--everything \
--no-gles --no-gles2 --no-egl \
--no-fftw \
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
