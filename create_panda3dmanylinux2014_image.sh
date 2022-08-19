#!/bin/bash

set -ex

umask 002

rm -rf manylinux/
git clone -b main https://github.com/panda3d/manylinux.git

cp ./buildbot-panda3d/dockerfiles/manylinux2014-x86_64 manylinux/docker/Dockerfile

cd manylinux/

docker build --build-arg THIRDPARTY_BRANCH=main -t cosmoniumeldee/panda3d-manylinux2014 docker/

docker push cosmoniumeldee/panda3d-manylinux2014
