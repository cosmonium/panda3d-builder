#!/bin/bash

set -ex

umask 002

mkdir ubuntu_22_04

cp ./buildbot-panda3d/dockerfiles/jammy-amd64 ubuntu_22_04/Dockerfile

cd ubuntu_22_04/

docker build --build-arg THIRDPARTY_BRANCH=main -t cosmoniumeldee/panda3d-ubuntu_22_04 .

docker push cosmoniumeldee/panda3d-ubuntu_22_04
