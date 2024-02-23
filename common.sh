THREADS=4
OPT=3
PANDA_VERSION=1.11.0
CXXFLAGS+=" -Wno-int-in-bool-context -Wno-ignored-attributes"

COUNT=`git rev-list --count v1.10.0..HEAD`
SHORT=`git rev-parse --short HEAD`
VERSION="${PANDA_VERSION}.dev${COUNT}+fp64"
VERSION_SHORT="${PANDA_VERSION}.dev${COUNT}"

if [[ "$OPT" == "4" ]]; then
    VERSION="${VERSION}+opt"
fi
