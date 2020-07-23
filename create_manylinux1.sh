#!/bin/bash

set -ex

./buildbot-panda3d/build_scripts/prepare_manylinux.sh

cp ./buildbot-panda3d/dockerfiles/manylinux1-x86_64 manylinux/docker/Dockerfile

cd manylinux/

docker build -t cosmoniumeldee/panda3d-manylinux1 docker/

docker push cosmoniumeldee/panda3d-manylinux1
