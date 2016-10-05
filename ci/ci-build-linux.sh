#!/bin/bash

set -x
echo "Inside build-linux.sh"

qmake -project
qmake CmWidget1.pro
make
strip CmWidget1
ldd CmWidget1

# Now try to build an AppImage
mkdir AppDir
cp cpCmWidget1  AppDir/
wget https://github.com/probonopd/linuxdeployqt/releases/download/1/linuxdeployqt-1-x86_64.AppImage -O linuxdeployqt
chmod +x linuxdeployqt

sudo apt-get -y install realpath
./linuxdeployqt $(realpath AppDir/CmWidget1) -appimage -bundle-non-qt-libs -verbose=3
