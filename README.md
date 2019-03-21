# Compile and install MAME on Debian/Ubuntu distributions #

Scripts to compile and install MAME in Linux Debian/Ubuntu distributions.

## Table of Contents

* **[Readme me first](#readme-me-first)**
* **[Cloning this repository](#cloning-this-repository)**
* **[Clone and prepare MAME source code](#clone-and-prepare-MAME-source-code)**
* **[Update MAME](#update-mame)**
* **[Notes](#notes)**

## Readme me first ##

These scripts assume that the user running MAME is named `kodi` and the following path configuration.

| Name                         | Path                        |
|------------------------------|-----------------------------|
| Home folder                  | `/home/kodi/`               |
| MAME source directory        | `/home/kodi/mame-source/`   |
| MAME installation directory  | `/home/kodi/bin-mame/`      |
| MAME executable              | `/home/kodi/bin/mame64`     |
| MAME config/data directory   | `/home/kodi/.mame/`         |
| MAME main configuration file | `/home/kodi/.mame/mame.ini` |
| MAME Software List hash path | `/home/kodi/bin-mame/hash/` |

Defaults can be edited in the file `configuration`:
```
# File /home/kodi/MAME-Install/configuration
#
MAME_USER=kodi
MAME_SOURCE_DIR=/home/kodi/mame-source/
MAME_INSTALL_DIR=/home/kodi/bin-mame/
MAME_CONFIG_DIR=/home/kodi/.mame/
MAME_EXEC_PATH=/home/kodi/bin/
```

Once compiled and installed, the MAME executable is located in `/home/kodi/bin/mame64`.

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

The MAME compilation tools will be cloned into the directory 
`/home/kodi/MAME-Install/`.

## Clone and prepare MAME source code ##

As the `kodi` user clone the MAME source code. This will take a while:
```
$ cd /home/kodi/
$ git clone https://github.com/mamedev/mame.git mame-source
```

Alternatively, you may clone the MAME source code with this commands:
```
$ cd /home/kodi/MAME-Install/
$ ./clone-mame.sh
```

If you want to compile a particular version of MAME first have a look at the
tags in the repository:
```
$ cd /home/kodi/mame-source/
$ git tag
mame0121
mame0121u1
...
mame0205
mame0206
mame0207
...
$ 
```

Each tag corresponds to a released version of MAME. Now, tell `git` to set the
MAME source code to the version you want:
```
$ cd /home/kodi/mame-source/
$ git checkout mame0207
```

The MAME source code is now ready for compilation.

## Compile and installing Kodi for the first time ##

First you need to install the build dependencies required to compile Kodi.
As `root` execute:
```
# cd /home/kodi/MAME-Install/
# ./install-build-deps.sh.sh
```

Before compilation, you may want to verify if the MAME source is set to the version you want:
```
$ cd /home/kodi/MAME-Install/
$ ./display-mame-source-version.sh
Current directory /home/kodi/MAME-Install
HEAD detached at mame0207
nothing to commit, working tree clean
```

In this example, the MAME source code is set to version `0.207`.

Now it's time to compile MAME. This will take a while (between 1 and 2 hours on a fast computer):
```
$ cd /home/kodi/MAME-Install/
$ ./compile-mame-regenie.sh
```

Finally, to install the MAME executable and the MAME runtime files execute:
```
$ cd /home/kodi/MAME-Install/
$ ./install-mame.sh
```

This script will create a default configuration file ...

## Update MAME ##

Update the MAME source code:
```
$ cd /home/kodi-source/
$ git checkout master
$ git pull
```

If you wish to set a specific version (remember to use `git tag` to see a list of the 
available MAME releases):
```
$ git checkout mame-0207
```

Then configure, compile and install MAME again:
```
$ cd /home/kodi/MAME-Install/
$ ./display-mame-source-version.sh
$ ./install-mame.sh
$ ./install-mame.sh
```

## Notes ##

