#!/bin/bash
# Everytime branches are switched with checkout mame does a clean of the project. Be aware!
source configuration.sh
current_dir=`pwd`
echo "Current directory $current_dir"
echo "MAME source directory $MAME_SOURCE_DIR"
echo "Setting MAME source code to tag $MAME_GIT_TAG"
git -C $MAME_SOURCE_DIR checkout $MAME_GIT_TAG
