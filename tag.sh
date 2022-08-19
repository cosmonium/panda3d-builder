#!/bin/bash

PANDA_VERSION=1.11.0

COUNT=`git rev-list --count v1.10.0..HEAD`
SHORT=`git rev-parse --short HEAD`
VERSION="${PANDA_VERSION}.dev${COUNT}-g${SHORT}"

echo "v${VERSION}"

git tag -m "Panda3D baseline for cosmonium dedicated builds" v${VERSION}

git push cosmonium v${VERSION}
