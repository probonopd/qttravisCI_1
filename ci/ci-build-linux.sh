#!/bin/bash

set -x
echo "Inside build-linux.sh"

qmake -project
qmake CmWidget1.pro
make

# Now try to build an AppImage
pwd
wget https://github.com/probonopd/linuxdeployqt/releases/download/1/linuxdeployqt-1-x86_64.AppImage -O linuxdeployqt.AppImage
ls -la
chmod +x linuxdeployqt.AppImage

export LD_LIBRARY_PATH=/usr/local/lib
./linuxdeployqt CmWidget1 -appimage

ls -la
du -sch CmWidget1.AppImage
