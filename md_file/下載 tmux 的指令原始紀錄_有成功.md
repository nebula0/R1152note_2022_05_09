#linux 

### 下載git
```bash=

wget http://ftp.ntu.edu.tw/software/scm/git/git-2.9.4.tar.gz`
```console
tar -zxf git-2.9.4.tar.gz
cd git-2.9.4
make configure
cd ~
mkdir git_download_test
cd git-2.9.4
./configure --prefix=$HOME/git_download_test

```
失敗 改一下

```bash

./configure --prefix=$HOME

```
成功了!!!
### [libevent](https://github.com/libevent)
00
```
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.sh
./vcpkg integrate install
./vcpkg install libevent
```
[source](https://github.com/libevent/libevent)
失敗 

01
```bash
wget https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz

tar zxvf libevent-2.1.11-stable.tar.gz
cd libevent-2.1.11-stable
./configure --prefix=$HOME
make

mahe install

```
成功

### ncurses
```bash
cd ~
wget https://invisible-island.net/datafiles/release/ncurses.tar.gz
tar zxvf ncurses.tar.gz
cd ncurses-6.3/
./configure --prefix=$HOME
make
make install
```


### tmux
```
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"

CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
ln -sf ~/tmux/tmux ~/bin  
```
[source1](https://github.com/tmux/tmux/wiki/Installing)[ref](https://unix.stackexchange.com/questions/42567/how-to-install-program-locally-without-sudo-privileges)
https://gist.github.com/ryin/3106801

![[Pasted image 20220509192603.png]]
出現神秘 master 是 git 開起來了嗎