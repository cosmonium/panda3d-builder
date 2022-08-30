#!/bin/bash

set -x

git config --global --add safe.directory /build

source `dirname $0`/common.sh

PLATFORM=x86_64

ABI=cp37-cp37m
PYTHON=/opt/python/$ABI/bin/python

#TODO: Should update the docker image
yum install -y rpm-build fakeroot zip

# Link Python binary and libraries so that makepanda detects them and includes Python.
ln -s /opt/python/$ABI/bin/python /usr/bin/python3
ln -s /opt/python/$ABI/lib /usr/lib/python3.7

$PYTHON makepanda/makepanda.py \
--everything \
--no-gles --no-gles2 --no-egl \
--python-incdir=/opt/python/$ABI/include --python-libdir=/opt/python/$ABI/lib \
--nocolor \
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

mv panda3d-${PANDA_VERSION}-1.x86_64.rpm panda3d-${VERSION_SHORT}.x86_64.rpm

cd /root/thirdparty/linux-libs-x64/eigen/include
zip -r extra-includes.${VERSION_SHORT}.zip Eigen/
mv extra-includes.${VERSION_SHORT}.zip /build
