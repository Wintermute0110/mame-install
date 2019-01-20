#!/bin/bash
#

# Check root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Install build dependencies
apt-get install git build-essential libsdl2-dev libsdl2-ttf-dev libfontconfig-dev qt5-default
