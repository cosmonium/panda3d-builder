#!/bin/bash

set -x

source `dirname $0`/common.sh

PYTHON_VERSION=3.8
PYTHON=python${PYTHON_VERSION}

$PYTHON makepanda/makepanda.py \
--everything \
--no-gles --no-gles2 --no-egl \
--no-physx \
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
