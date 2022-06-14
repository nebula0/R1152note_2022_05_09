#linux_script 

有沒有辦法弄一個 shell script 呢
```bash
#!/bin/bash

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

# version, install prefix
GIT_VERSION=2.9.4
LIBEVENT_VERSION=2.1.11
NCURSES_VERSION=6.3



# download source file for git, libevent, ncurses, and tmux

wget http://ftp.ntu.edu.tw/software/scm/git/git-$GIT_VERSION.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-$LIBEVENT_VERSION-stable/libevent-$LIBEVENT_VERSION-stable.tar.gz
wget https://invisible-island.net/datafiles/release/ncurses.tar.gz
git clone https://github.com/tmux/tmux.git

############
#   git    #
############
tar -zxf git-$GIT_VERSION.tar.gz
cd git-$GIT_VERSION
./configure --prefix=$HOME
cd ~

############
# libevent #
############
tar zxvf libevent-$LIBEVENT_VERSION-stable.tar.gz
cd libevent-$LIBEVENT_VERSION-stable
./configure --prefix=$HOME
make
make install
cd ~

############
# ncurses #
############
tar zxvf ncurses.tar.gz
cd ncurses-$NCURSES_VERSION/
./configure --prefix=$HOME
make
make install
cd ~
############
#   tmux   #
############
sh autogen.sh
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"

CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
ln -sf ~/tmux/tmux ~/bin 


echo ===OuO=== DONE!

```