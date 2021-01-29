#!/bin/bash
# For info about MAME compilation see http://docs.mamedev.org/
# It is safe to call this script multiple times (build is not cleaned).
# If mame source code is updated/pulled with git then the build is cleaned.
# https://docs.mamedev.org/initialsetup/compilingmame.html#useful-options
# https://github.com/mamedev/mame/issues/5161
# https://github.com/mamedev/mame/issues/4953

# Include configuration variables
source configuration.sh

# Go to MAME source directory
current_dir=`pwd`
echo "Current directory $current_dir"
cd $MAME_SOURCE_DIR

# Compile MAME. Detect number of available CPU cores.
num_proc=`nproc`
echo "Compile using $num_proc processors"
echo "Regenerating MAME configuration"
make -j$num_proc REGENIE=1 PTR64=1 OPTIMIZE=3 SYMBOLS=1 SYMLEVEL=1 STRIP_SYMBOLS=1 TOOLS=1 ARCHOPTS=-U_FORTIFY_SOURCE

# Return to scripts directory
cd $current_dir
