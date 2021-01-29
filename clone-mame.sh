#!/bin/bash
source configuration.sh
echo "Cloning MAME source code into directory $MAME_SOURCE_DIR"
git clone git://github.com/mamedev/mame.git $MAME_SOURCE_DIR
