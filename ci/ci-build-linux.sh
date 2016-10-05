#!/bin/bash

set -x
echo "Inside build-linux.sh"
source /opt/qt57/bin/qt57-env.sh
/opt/qt57/bin/qmake -project
/opt/qt57/bin/qmake CmWidget1.pro
make

# Binary must be inside a directory to be bundled
mkdir CmWidget
cp CmWidget1 CmWidget/

# Get linuxdeployqt tool
wget https://github.com/probonopd/linuxdeployqt/releases/download/1/linuxdeployqt-1-x86_64.AppImage -O linuxdeployqt
chmod +x linuxdeployqt

# Work around https://github.com/probonopd/linuxdeployqt/issues/28
sudo ln -s /usr/lib/x86_64-linux-gnu/qt5/plugins /usr/lib/plugins

# Have linuxdeployqt create the AppImage
./linuxdeployqt CmWidget/CmWidget1 -appimage -bundle-non-qt-libs -verbose=2

# Upload (replace this with your deployment mechanism)
curl --upload-file ./CmWidget.AppImage https://transfer.sh/CmWidget.AppImage
