#!/bin/bash

set -x
echo "Inside install-osx.sh"
brew update
brew install homebrew/versions/qt55
brew linkapps qt55

