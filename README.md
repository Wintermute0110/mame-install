# Compile and install MAME on Debian/Ubuntu distributions #

Scripts to compile and install MAME in Linux Debian/Ubuntu distributions in a way as easy as
possible.

## Table of Contents

* **[Readme me first](#readme-me-first)**
* **[Cloning this repository](#cloning-this-repository)**
* **[Clone and prepare MAME source code](#clone-and-prepare-MAME-source-code)**
* **[Update MAME](#update-mame)**
* **[Notes](#notes)**

## Readme me first ##

The default configuration assumes that the UNIX user running MAME is named `kodi` and hence the home directory is `/home/kodi/`. The default paths can be edited in the file `configuration.sh`. For the time being do not use spaces in the directory names. You can change the defaults to suit your needs. If you do so, remember to change all directory names from `/home/kodi/` to `/home/$USERNAME/` through this guide.
```
# File /home/kodi/mame-install/configuration.sh

MAME_GIT_TAG=mame0228
MAME_SOURCE_DIR=/home/kodi/mame-source/
MAME_INSTALL_DIR=/home/kodi/mame-bin/
MAME_BIN_DIR=/home/kodi/bin/
MAME_CONFIG_DIR=/home/kodi/.mame/
```

`MAME_SOURCE_DIR` is the directory where the MAME source code will be cloned. `MAME_INSTALL_DIR` is the directory where the MAME runtime files will be installed. `MAME_BIN_DIR` is the directory to place the MAME executable. Finally, `MAME_CONFIG_DIR` is the directory to store the MAME configuration. Do not change `MAME_CONFIG_DIR` unless you know what is doing. Once compiled and installed, the MAME executable is located in `/home/kodi/bin/mame64`.

## Cloning this repository ##

If you don't have `git` installed then execute as `root` user:
```
# apt-get install git
```

To clone this repository:
```
$ cd /home/kodi/
$ git clone https://github.com/Wintermute0110/MAME-Install.git
```

The MAME compilation tools will be cloned into the directory `/home/kodi/MAME-Install/`. To update the MAME compilation tools execute `git pull`.

## Clone and prepare MAME source code ##

As the `kodi` user clone the MAME source code. This will take a while:
```
$ cd /home/kodi/
$ git clone https://github.com/mamedev/mame.git mame-source
```

Alternatively, you may clone the MAME source code like this:
```
$ cd /home/kodi/MAME-Install/
$ ./clone-mame.sh
```

If you want to compile a particular version of MAME first have a look at the tags in the repository:
```
$ cd /home/kodi/MAME-Install/
$ ./display-mame-source-git-tags.sh
mame0121
...
mame0206
mame0228
```

Each tag corresponds to a released version of MAME. Now, edit `configuration.sh` and change the `MAME_GIT_TAG`:
```
MAME_GIT_TAG=mame0228
```

If you want to compile to most up-to-date development version use the tag `master`. Now, set the MAME source code to the tag configured:
```
$ cd /home/kodi/MAME-Install/
$ ./set-mame-source-version.sh
```

At any moment you can check the status of the MAME source code with:
```
$ cd /home/kodi/MAME-Install/
$ ./display-mame-source-status.sh
Current directory /home/kodi/mame-install
MAME source directory /home/kodi/mame-source/
HEAD detached at mame0228
nothing to commit, working tree clean
```

In this example git is telling that the MAME source code is set to tag `mame0228`. The MAME source code is now ready for compilation.

## Compile and installing MAME for the first time ##

First you need to install the build dependencies required to compile MAME. As user `root` execute:
```
# cd /home/kodi/MAME-Install/
# ./setup-build-deps.sh
```

Before compilation, you may want to verify if the MAME source is set to the version you want:
```
$ cd /home/kodi/MAME-Install/
$ ./display-mame-source-status.sh
Current directory /home/kodi/MAME-Install
HEAD detached at mame0228
nothing to commit, working tree clean
```

In this example, the MAME source code is set to version `0.228`. Now it's time to compile MAME. This will take a while (between 1 and 2 hours on a fast computer):
```
$ cd /home/kodi/MAME-Install/
$ ./compile-mame-regenie.sh
```

Finally, to install the MAME executable and the MAME runtime files execute:
```
$ cd /home/kodi/MAME-Install/
$ ./install-mame.sh
```

This script will create a default configuration files in `$MAME_CONFIG_DIR/mame.ini` and `$MAME_CONFIG_DIR/ui.ini`. If you change the default paths in `configuration.sh` do not forget to edit `mame.ini` and `ui.ini` to reflect those changes, otherwise MAME won't work.

## Update MAME ##

First update the MAME source code:
```
$ cd /home/kodi/MAME-Install/
$ ./update-mame-source-code.sh
```

If you wish to set a specific version have a look at the tags with `display-mame-source-git-tags.sh`, then edit `configuration.sh` to the tag you wish to compile. Finally, compile MAME and install:
```
$ cd /home/kodi/MAME-Install/
$ ./set-mame-source-version.sh
$ ./display-mame-source-version.sh
$ ./compile-mame-regenie.sh
$ ./install-mame.sh
```

## Notes ##

If you experience any kind of problem with MAME, for example MAME freezes when loading ROMs at the beginning, the reason could be that the shipped configuration files `mame.ini` and `ui.ini` are old (or new if you are compiling an old version or MAME). Follow these steps to update the configuration files:

**Step 1** Delete the installed configuration files.
```
$ rm /home/kodi/.mame/mame.ini
$ rm /home/kodi/.mame/ui.ini
```

**Step 2** Create new configuration files `/home/kodi/.mame/mame.ini` and `/home/kodi/.mame/ui.ini` for the current version of MAME.
```
$ mame64 -createconfig
```

**Step 3** Customize the configuration files `mame.ini` and `ui.ini` to set the directories for your ROMs, etc. You can see the changes of the shipped configuration files with respect to the original or vanilla files using the following commands.
```
$ cd /home/kodi/MAME-Install/
$ diff -u --color mame.ini.vanilla mame.ini
$ diff -u --color ui.ini.vanilla ui.ini
```

If you want to make these changes permanent then copy your customized files to directory `/home/kodi/mame-install`. Otherwise `mame.ini` and `ui.ini` in `/home/kodi/.mame/` will be overwritten when you execute `install-mame.sh`.
