有沒有辦法弄一個 shell script 呢
```bash
#!/bin/bash
#===version, install prefix

# exit on error

set -e

# download source file for git, libevent, ncurses, and tmux

wget http://ftp.ntu.edu.tw/software/scm/git/git-2.9.4.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz
wget https://invisible-island.net/datafiles/release/ncurses.tar.gz
git clone https://github.com/tmux/tmux.git

############
#   git    #
############
tar -zxf git-2.9.4.tar.gz
cd git-2.9.4
./configure --prefix=$HOME
cd ..

############
# libevent #
############
tar zxvf libevent-2.1.11-stable.tar.gz
cd libevent-2.1.11-stable
./configure --prefix=$HOME
make
make install
cd ..

############
# ncurses #
############
cd ncurses-6.3/
./configure --prefix=$HOME
make
make install

############
#   tmux   #
############
sh autogen.sh
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"

CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
ln -sf ~/tmux/tmux ~/bin 




```