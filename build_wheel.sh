#!/bin/bash

#TODO: extract version from git
VERSION="1.10.6.fp64+opt"

ABI=cp37-cp37m
PLATFORM=x86_64
WHEEL=%s-$ABI-$PLATFORM.whl

docker run -t --rm=true -v `pwd`/build/:/build/:rw -w /build/ cosmoniumeldee/panda3d-manylinux1 /opt/python/$ABI/bin/python makepanda/makepanda.py \
--everything \
--no-gles --no-gles2 --no-egl \
--python-incdir=/opt/python/$ABI/include --python-libdir=/opt/python/$ABI/lib \
--no-physx \
--nocolor \
--use-sse2 \
--distributor=cosmonium \
--git-commit=`cd build && git rev-parse HEAD` \
--threads=4 \
--optimize=4 \
--override STDFLOAT_DOUBLE=1 \
--wheel --version $VERSION
