#!/bin/bash

set -x
echo "Inside build-linux.sh"

qmake -project
qmake CmWidget1.pro
make
