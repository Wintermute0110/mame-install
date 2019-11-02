#!/bin/bash
# For info about MAME compilation see http://docs.mamedev.org/
# It is safe to call this script multiple times (build is not cleaned).
# If mame source code is updated/pulled with git then the build is cleaned.
# https://docs.mamedev.org/initialsetup/compilingmame.html#useful-options
# https://github.com/mamedev/mame/issues/5161

# Go to MAME source directory
current_dir=`pwd`
echo "Current directory $current_dir"
cd /home/kodi/mame-source/

# Compile MAME. Detect number of available CPU cores.
num_proc=`nproc`
echo "Compile using $num_proc processors"
echo "Regenerating MAME configuration"
make REGENIE=1 PTR64=1 OPTIMIZE=3 SYMBOLS=1 SYMLEVEL=1 STRIP_SYMBOLS=1 -j$num_proc

# Return to scripts directory
cd $current_dir
