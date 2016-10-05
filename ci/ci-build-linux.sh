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
cp CmWidget1 AppDir/
wget https://github.com/probonopd/linuxdeployqt/releases/download/1/linuxdeployqt-1-x86_64.AppImage -O linuxdeployqt
chmod +x linuxdeployqt

# Work around a bug in linuxdeployqt not being able to bundle system Qt's plugins
sudo ln -s /usr/lib/x86_64-linux-gnu/qt5/plugins /usr/lib/plugins

# Have linuxdeployqt create the AppImage
./linuxdeployqt CmWidget1 -appimage -bundle-non-qt-libs -verbose=3
