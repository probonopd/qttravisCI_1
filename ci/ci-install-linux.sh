#!/bin/bash

set -x
echo "Inside install-linux.sh"
# use ppa from beineri, see https://github.com/probonopd/linuxdeployqt/blob/master/.travis.yml
sudo add-apt-repository --yes ppa:beineri/opt-qt57-trusty
sudo apt-get update -qq
sudo apt-get -y install qt57base binutils
