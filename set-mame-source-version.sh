#!/bin/bash
# Everytime branches are switched with checkout mame does a clean of the project. Be aware!
#
mame_source_dir=/home/kodi/mame-source/
current_dir=`pwd`
echo "Current directory $current_dir"
echo "MAME source directory $mame_source_dir"
git -C $mame_source_dir checkout mame0219
