#!/bin/bash

set -x
echo "Inside build-linux.sh"

qmake -project
qmake CmWidget1.pro
make
strip CmWidget1
ldd CmWidget1

# Now try to build an AppImage
mkdir CmWidget
cp CmWidget1 CmWidget/
wget https://github.com/probonopd/linuxdeployqt/releases/download/1/linuxdeployqt-1-x86_64.AppImage -O linuxdeployqt
chmod +x linuxdeployqt

# Work around https://github.com/probonopd/linuxdeployqt/issues/28
sudo ln -s /usr/lib/x86_64-linux-gnu/qt5/plugins /usr/lib/plugins

# Have linuxdeployqt create the AppImage
./linuxdeployqt CmWidget/CmWidget1 -appimage -bundle-non-qt-libs -verbose=3

find CmWidget/
ls
