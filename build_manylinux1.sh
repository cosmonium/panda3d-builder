#!/bin/bash

set -x

#TODO: extract version from git
COUNT=`git rev-list --count v1.10.7..HEAD`
VERSION="1.10.7.dev${COUNT}+fp64+opt"
VERSION_SHORT="1.10.7.dev${COUNT}"

ABI=cp37-cp37m
PLATFORM=x86_64

#TODO: Should update the docker image
sed -i 's/\(mirrorlist=.*\)/\1\&protocol=http/g' /etc/yum.repos.d/epel*.repo

yum install -y rpm-build fakeroot zip

ln -s /opt/python/$ABI/bin/python /usr/bin/python3

/opt/python/$ABI/bin/python makepanda/makepanda.py \
--everything \
--no-gles --no-gles2 --no-egl \
--python-incdir=/opt/python/$ABI/include --python-libdir=/opt/python/$ABI/lib \
--no-physx \
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

cd /root/thirdparty/linux-libs-x64/eigen/include
zip -r extra-includes.${VERSION_SHORT}.zip Eigen/
mv extra-includes.${VERSION_SHORT}.zip /build
