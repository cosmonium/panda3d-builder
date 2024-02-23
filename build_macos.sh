#!/bin/bash

set -x

source `dirname $0`/common.sh

PYTHON_VERSION=3.9
PYTHON=python${PYTHON_VERSION}

$PYTHON makepanda/makepanda.py \
--osxtarget=10.9 \
--everything \
--no-gles --no-gles2 --no-egl \
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
