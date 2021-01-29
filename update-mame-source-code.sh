#!/bin/bash
# Everytime branches are switched with checkout mame does a clean of the project. Be aware!
source configuration.sh
current_dir=`pwd`
echo "Current directory $current_dir"
echo "MAME source directory $MAME_SOURCE_DIR"
cd $MAME_SOURCE_DIR
git checkout master
git pull --all
cd $current_dir
