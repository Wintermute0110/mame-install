#!/bin/bash
# Everytime branches are switched with checkout mame does a clean of the project. Be aware!
#
current_dir=`pwd`
echo "Current directory $current_dir"
git -C /home/kodi/mame-source/ status
