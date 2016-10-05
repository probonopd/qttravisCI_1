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
ldd CmWidget1
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
./linuxdeployqt.AppImage CmWidget1 -appimage

ls -la
mv ..AppImage CmWidget1.AppImage
du -sch CmWidget1.AppImage
