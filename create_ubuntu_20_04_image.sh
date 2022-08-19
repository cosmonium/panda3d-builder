#!/bin/bash

set -ex

umask 002

mkdir ubuntu_20_04

cp ./buildbot-panda3d/dockerfiles/focal-amd64 ubuntu_20_04/Dockerfile

cd ubuntu_20_04/

docker build --build-arg THIRDPARTY_BRANCH=main -t cosmoniumeldee/panda3d-ubuntu_20_04 .

docker push cosmoniumeldee/panda3d-ubuntu_20_04
