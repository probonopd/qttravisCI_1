#!/bin/bash

set -x
echo "Inside build-osx.sh"
export QMAKESPEC=macx-clang
mkdir -p "$TRAVIS_BUILD_DIR-build"
pushd "$TRAVIS_BUILD_DIR-build"
QMAKE=`find /usr/local -name "qmake" | head -n 1`
$QMAKE -v
echo "compile release version only"
$QMAKE -r -Wall -Wlogic -Wparser CONFIG+=release "$TRAVIS_BUILD_DIR"
#- $QMAKE -r -Wall -Wlogic -Wparser CONFIG+=debug_and_release "$TRAVIS_BUILD_DIR"
popd
make -C "$TRAVIS_BUILD_DIR-build" -j2 all
pushd "$TRAVIS_BUILD_DIR-build"
pwd
ls -la
DEPLOY=`find /usr/local -name "macdeployqt" | head -n 1`
$DEPLOY CmWidget1.app -dmg -verbose=3
du -s -h CmWidget1.dmg
