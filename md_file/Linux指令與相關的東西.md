#課堂筆記  #linux

# 筆記
### check file exist or not
```bash
# ckeck if directory (-d) exist, ckeck file (-f), check anything (-e) 
 [ ! -d output.bam ] && echo "$FILE does not exist."
```
### find
重新命名檔案 沒試過但看起來很好用
`find . -name *.txt -exec sed -i 's/2020/2070/g' {} \;`
很多重新命名檔案的方式[How to Find and Replace Text in a File](https://www.baeldung.com/linux/find-replace-text-in-file)
### pwd
現在路徑
`dir=$(pwd)` 將現在路徑存入變數
### date
```bash
start=`date +%s`
stuff
end=`date +%s`

runtime=$((end-start))
```
```
man date

%a     locale's abbreviated weekday name (e.g., Sun)
%A     locale's full weekday name (e.g., Sunday)
%b     locale's abbreviated month name (e.g., Jan)
%B     locale's full month name (e.g., January)
%c     locale's date and time (e.g., Thu Mar  3 23:05:25 2005)
%C     century; like %Y, except omit last two digits (e.g., 20)
%d     day of month (e.g., 01)
%D     date; same as %m/%d/%y
%e     day of month, space padded; same as %_d
%F     full date; same as %Y-%m-%d
%g     last two digits of year of ISO week number (see %G)
%G     year of ISO week number (see %V); normally useful only with %V
%h     same as %b
%H     hour (00..23)
%I     hour (01..12)
%j     day of year (001..366)
%k     hour, space padded ( 0..23); same as %_H
%l     hour, space padded ( 1..12); same as %_I
%m     month (01..12)
%M     minute (00..59)
%n     a newline
%N     nanoseconds (000000000..999999999)
%p     locale's equivalent of either AM or PM; blank if not known
%P     like %p, but lower case
%r     locale's 12-hour clock time (e.g., 11:11:04 PM)
%R     24-hour hour and minute; same as %H:%M
%s     seconds since 1970-01-01 00:00:00 UTC
%S     second (00..60)
%t     a tab
%T     time; same as %H:%M:%S
%u     day of week (1..7); 1 is Monday
%U     week number of year, with Sunday as first day of week (00..53)
%V     ISO week number, with Monday as first day of week (01..53)
%w     day of week (0..6); 0 is Sunday
%W     week number of year, with Monday as first day of week (00..53)
%x     locale's date representation (e.g., 12/31/99)
%X     locale's time representation (e.g., 23:13:48)
%y     last two digits of year (00..99)
%Y     year
%z     +hhmm numeric time zone (e.g., -0400)
%:z    +hh:mm numeric time zone (e.g., -04:00)
%::z   +hh:mm:ss numeric time zone (e.g., -04:00:00)
%:::z  numeric time zone with : to necessary precision (e.g., -04, +05:30)
%Z     alphabetic time zone abbreviation (e.g., EDT)

```

### loop through array
`$@` 跟`$*` 的差別


```bash
#!bin/bash

INPUT=(aaa bbb ccc ddd)
for i in "${INPUT[*]}"; do
echo $i www;
done

# aaa bbb ccc ddd www

# 他會把那個list視為一個字串印出來

```

```bash
#!bin/bash

INPUT=(aaa bbb ccc ddd)
for i in "${INPUT[@]}"; do
echo $i;
done

# aaa www
# bbb www
# ccc www
# ddd www

# 他會把那個list的元素(?)一個一個拆出來印出來

```

### tar
[ref](https://project.zhps.tp.edu.tw/ethan/2009/09/compress/)
.tar  
打包：tar cvf FileName.tar DirName  
解包： tar xvf FileName.tar  
  
.gz  
壓縮：gzip FileName  
解壓1：gunzip FileName.gz  
解壓2：gzip -d FileName.gz  
  
.tar.gz  
壓縮：tar zcvf FileName.tar.gz DirName  
解壓：tar zxvf FileName.tar.gz  
  
.bz2  
壓縮： bzip2 -z FileName  
解壓1：bzip2 -d FileName.bz2  
解壓2：bunzip2 FileName.bz2  
  
.tar.bz2  
壓縮：tar jcvf FileName.tar.bz2 DirName  
解壓：tar jxvf FileName.tar.bz2  
  
.bz  
壓縮：unkown  
解壓1：bzip2 -d FileName.bz  
解壓2：bunzip2 FileName.bz  
  
.tar.bz  
壓縮：unkown  
解壓：tar jxvf FileName.tar.bz  
  
.Z  
壓縮：compress FileName  
解壓：uncompress FileName.Z  
  
.tar.Z  
壓縮：tar Zcvf FileName.tar.Z DirName  
解壓：tar Zxvf FileName.tar.Z  
  
.tgz  
壓縮：unkown  
解壓：tar zxvf FileName.tgz  
  
  
.tar.tgz  
壓縮：tar zcvf FileName.tar.tgz FileName  
解壓：tar zxvf FileName.tar.tgz  
  
.zip  
壓縮：zip FileName.zip DirName  
解壓：unzip FileName.zip  
  
.rar  
壓縮：rar e FileName.rar  
解壓：rar a FileName.rar  
  
.lha  
壓縮：lha -a FileName.lha FileName  
解壓：lha -e FileName.lha
### qsub 提交工作
```bash
qsub -l select=1:ncpus=1 -l walltime=1:00:00 -N "fastq-dump" -m abe -M "harewhite0@gmail.com"
```

### awk
https://www.tutorialspoint.com/awk/awk_quick_guide.htm
### wc -l
數輸出行數
example:`ls -1 | wc -l`

### df
`df` 顯示可用空間 以kB計
`df -h` 顯示可用空間 以好閱讀的單位計算
可參考[這裡](https://blog.gtwang.org/linux/linux-df-command-check-disk-space-usage-tutorial-script-example/)
### cat
`cat file` print file content on terminal

### ls
`ls -1` 只列出檔名
`ls --help` 列出所有help
`ls --help | less` 一行一行跳出來help項目
`ls --help | more` 
`ls --help | head -n 3` 印出前三行
`ls --help | tail -n 3` 印出後三行

`ls -lh` human read
`ls -l` 沒有指定humanread
`ls -a` 列出設定檔
`ls -rt` reverse time(由新到舊) 
	`ls -lhrt` human read + 由新到舊 reverse time
	`ls -lhart` human read，列出設定檔，reverse time

### vi
\*vim相容所有vi的指令
`vi <filename>` 進入檔案，若無建立檔案並進入
`i` 編輯
`esc` 跳出編輯
`shift 兩次z`儲存並離開
`:q` 不儲存離開
`:wq`儲存並離開


### mv
`mv <source > <directory>` 如果是檔名，改檔名，如果是路徑，改路徑
舉例`mv file_1.txt /home/pungki/office` [來源](https://codertw.com/%E4%BC%BA%E6%9C%8D%E5%99%A8/379172/)

### cut
`cut -f1 <file_name>`
印出第一個colume 好像沒辦法印row
如果檔案不是用tab分隔可能要看看help怎麼做
```
# 擷取第 2 個字元至第 10 個字元
ls -l | tail -n 5 | cut -c 2-10

# 擷取第 2-3 個、第 5-6 個與第 8-9 個字元
ls -l | tail -n 5 | cut -c 2-3,5-6,8-9

# 排除第 2 個字元至第 10 個字元
ls -l | tail -n 5 | cut -c 2-10 --complement

# 擷取 /etc/passwd 的第 1 個與第 7 個欄位 指定冒號為分隔字元
head -n 5 /etc/passwd | cut -d : -f 1,7

# 指定輸出欄位分隔字元
head -n 5 /etc/passwd | cut -d : -f 1,7 --output-delimiter="^_^"
```
[ref](https://blog.gtwang.org/linux/linux-cut-command-tutorial-and-examples/)

`cut -f1 <file_name> | sort`


### grep
`grep -P '要找的字' <檔名>`
'要找的字' 裡面可以用跳脫字元 比如`\t`是tab，可以用regex找東西

`grep .` 刪掉空白行
#### regex
舉例
`^` 開頭
``
`cat filename | grep \^a` 找出該檔案中a開頭的字

### mkdir
`mkdir foldername`


### cut
`ls -l | tail -n 5 | cut -c 2-10`，`-c` 擷取字元 從1開始算
`cut -d , -f 2 data.csv`，`-d`指定分隔字元是`,`，`-f 1,2`抓第一、二欄

### sed
- `sed 1d` 刪掉第一row
- `-e`  -e script,想用多個sed就加`-e`連接
#### 's/pattern/replacement/'
- `sed ‘s/foo/bar/’` 將foo換成bar，僅置換一次 [來源](https://ithelp.ithome.com.tw/articles/10102024)
- `sed ‘s/The/Wow!/g’`檔案中`THe`全部置換成`Wow!`
-  `cat my_file.txt | sed '4,5 s/Google/Yahoo/g' > new.txt` 把改完的結果存到`new.txt`
-  `sed -i` 更改檔案
-  `sed -e` 打印結果
#### "S ?"
-  `sed "s/.....$//g"` 有幾個`.`就是刪除幾個最後的字元 [來源](https://shazi.info/從-bash-中刪除最後-n-個字元/)

### sort 
`sort -u` 把重複的刪掉

還有很多，參見[這個](https://blog.gtwang.org/linux/linux-sort-command-tutorial-and-examples/)


### wc
`wc -l` 計算行數

### awk
`awk '{print$0"\t""conserved"}'`跟`awk '{print$0"\tconserved"}'` 的結果 一樣 
在每一行末`$0` ptint出tab，中間的引號可以不打
如果換成`"awk '{print$0"\tconserved"}'"`會出現一堆0，單引雙引不可以互換

---
.gtf 一種生資的附檔名 colum有固定的標題但不會寫出來

bashrc
開始時會run的檔案
包含設定顏色那些 細節不知道
`__git_ps1: command not found`原因:bashre的第121行好像有衝突但不確定為什麼

解決方法，老師檔案有放[macos - (Mac) -bash: __git_ps1: command not found - Stack Overflow](https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found)
輸入`curl -o ~/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh`
	按enter再輸入`source ~/.git-prompt.sh`
	

### for and while
```bash
for ((init; check; step)); do
    body
done
```
```bash
init
while check; do
    body
    step
done
```

### if
[ref](https://www.thegeekdiary.com/bash-if-loop-examples-if-then-fi-if-then-elif-fi-if-then-else-fi/)
```bash
for i in {1..30}; do if [ $i != 10 ]; then echo "hello $i"; fi; done
```

```bash
if [ -f "/home/phpini/testfile" ]
then
    echo "/home/phpini/testfile is a file"
else
    echo "/home/phpini/testfile is not a file"
fi
```
注意中括號旁的空格一定要空

```bash
a="1";
b="2";
if [[ a == "1" || b == "3" ]]; then
echo www;
fi
```
不知道為什麼中括號要用兩層 一層會跳錯 `||`是 or
**`==`旁邊一定要空格!!!!!!!!!**

elif
```bash=
if [ conditions ]; then
   # Things
elif [ other_conditions ]; then
   # Other things
else
   # In case none of the above occurs
fi
```
### for

```bash
for (( i=0; i<${#numbers[@]}; i++ )); do echo ${numbers[i]}; done
echo
printf "%s\n" "${lines[@]}"
```
https://www.cyberciti.biz/faq/bash-for-loop/
#### for two item
```bash
P1=($(ls | grep _1))
P2=($(ls | grep _2))

for ((i=0;i<=${#P1[@]};i++)); do
        echo "${P1[i]}" === "${P2[i]}";
done

```
[ref](https://stackoverflow.com/questions/11215088/bash-shell-script-two-variables-in-for-loop)

#### for range
```bash
 for i in {1..5}; do echo $i; done


```
#### loop through array
宣告array
```bash
array = (A B C D)
array = (A, B, C, D)
```

loop through array
```bash
for i in "${array[@]}"; 
do
	echo $i
done

# A
# B
# C
# D

```
'''
[ref](https://gary840227.medium.com/linux-bash-array-%E4%BB%8B%E7%B4%B9-6e30ffe87978)
#### loop through command output
這個方法會切開所有字 而非個別 command，所以其實要用 `while` + `read`因為`read`處理行 [ref](https://stackoverflow.com/questions/35927760/how-can-i-loop-over-the-output-of-a-shell-command)

your file
```bash
foo bar
hello world
```

code
```bash
for i in $(cat file); do
    echo "$i"
done

```

output
```bash
foo
bar
hello
world
```

### while
loop 檔案裡的東西
```bash
while read line; do echo $line done < lorem-ipsum.txt
```

loop command output [ref](https://stackoverflow.com/questions/35927760/how-can-i-loop-over-the-output-of-a-shell-command)

批次命名檔案 第一個欄位原檔名 第二個欄位新檔名
```bash=
while read a b; do mv "$a" "$b"; done < names.txt
```


--
# Applied Genomics Week 02(老師的檔案)

## Environment

Configure local environment using dot files.

-   .bash_profile
    
    code
    
    ``` 
    # .bash_profile
    # Get the aliases and functions
    if [ -f ~/.bashrc ]; then
    . ~/.bashrc
    fi
    
    # User specific environment and startup programs
    source ~/.git-prompt.sh          
    PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/package/sratoolkit.3.0.0-centos_linux64/bin/
    export PATH
    ``` 
-   .bash_aliases
    
    code
    
    ```
     # enable color support of ls and also add handy aliases
     if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
      #eval "`dircolors -b`"
      alias ls='ls --color=auto'
      alias dir='ls --color=auto --format=vertical'
      alias vdir='ls --color=auto --format=long'
     fi
    
     # some more ls aliases
     alias ll='ls -l'
     alias la='ls -A'
     alias l='ls -CF'
     alias d='ls -d */'
     alias sl='ls'   # typo!
    
     # Misc aliases
     alias ..='cd ..'
     alias cls='clear; ls -lh'
     alias remove='rm -rfv'
     alias hist='history | less'
     alias vless='vim -u /usr/share/vim/vim70/macros/less.vim'
     alias les='less'    # typo!
     alias lses='less'    # typo!
     alias calc='bc'
     alias list='~/bin/list'
     alias grep='grep --color=auto'
     alias vim='vim -p'
     alias vi='vim -p'
     alias topv='top -c -u vkrishna'
     alias exot='exit'   # typo!
     alias xit='exit'   # typo!
     alias mkexec='chmod +x *.pl *.py *.sh'
     alias py='python'
     alias today='echo `date +"%Y%m%d"`'
     alias now='echo `date +"%Y%m%d_%H%M"`'
    ``` 
-   .bashrc
    裡面有一些酷酷的設定 比如hist指令可以跑出今天輸過的指令，方便筆記 當然還有更多
    code
    
    ```
     ## # .bashrc
     ## # User specific environment and startup programs
     #-------------------------#
     # SHELL - CHECK TYPE      #
     #-------------------------#
     [[ $- != *i* ]] && return
     
     # Add bash aliases.
     if [ -f "${HOME}/.bash_aliases" ]; then
       . ${HOME}/.bash_aliases
     fi
     
     # User specific aliases and functions
     if [ -f "${HOME}/.bash_functions" ]; then
       . ${HOME}/.bash_functions
     fi
     
     # set terminal colors
     export TERM="xterm-256color"
     
     # check window size
     shopt -s checkwinsize
     
     # ignore small spelling mistakes in directory names
     shopt -s cdspell
     # multiple line commands stay together in the history
     shopt -s cmdhist
     # auto correct the case
     shopt -s nocaseglob
     shopt -s extglob
     shopt -s dotglob
     shopt -s checkhash
     shopt -s cdable_vars
     shopt -s no_empty_cmd_completion
     
     # don't allow shell to exit if there are running jobs
     shopt -s checkjobs
     
     # make bash autocomplete with up arrow
     bind '"\e[A"':history-search-backward
     bind '"\e[B"':history-search-forward
     bind Space:magic-space
     
     # alt+r -- search history based on a mask (augments Arrow up):
     # method 1
     #cmd_mhist="\"\C-k\C-ahistory | grep '^ *[0-9]* *\C-e.'\C-m\""
     # method 2
     cmd_mhist="\"\C-k\C-uhistory | grep \\\"^ *[0-9]* *\C-y\\\" \C-m\""
     bind '"\M-r"':"$cmd_mhist"
     
     # alt+k -- paste current command line into history and begin new line
     cmd_hist="\"\C-ahistory -s '\C-e'\C-m\""
     bind '"\M-k"':"$cmd_hist"
     
     # ctrl+xPgUp: show last 25 entries of the history
     # (erase the line first)
     bind '"\C-x\e[5~"':"\"\C-k\C-uhistory | tail -25\C-m\""
     
     # Now map xterm's alternative keybindings to existing functionality
     # Some are simple translations to correspontend M- combinations
     # ctrl+left/right arrows:
     bind '"\e\x5b\x31\x3b\x35\x44"':backward-word
     bind '"\e\x5b\x31\x3b\x35\x43"':forward-word
     # alt+b/f: the usual word navigation but in xterm terms
     bind '"\xe2"':backward-word
     bind '"\xe6"':forward-word
     # atl+backspace:
     bind '"\xff"':backward-kill-word
     # alt+'.':
     bind '"\xae"':yank-last-arg
     # alt+k:
     bind '"\xeb"':"$cmd_hist"
     # alt+r:
     bind '"\xf2"':"$cmd_mhist"
     
     # verify command before running it
     shopt -s histverify
     
     # If a history expansion fails, let the user re-edit the command
     shopt -s histreedit
     
     # don't put duplicate lines in the history
     export HISTCONTROL=ignorespace:erasedups    # ignore space and erase duplicate entries
     
     # big big history
     export     HISTSIZE="NOTHING"
     export HISTFILESIZE="NOTHING"
     #export HISTTIMEFORMAT="%Y%m%d %H:%M:%S "
     
     # make bash append the history rather than overwrite it
     shopt -s histappend       # append to history, don't overwrite it
     
     # ignore some of the common commands
     export HISTIGNORE="&:ls:[bf]g:exit:ll:la:l:cd:pwd:su:df:clear:cd ..:history"
     
     # Set the prompt command
     PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} - ${PWD/#$HOME/~}"; echo -ne "\007"'
     
     ## set up the PS1 via powershell
     #PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
     
     # Save and reload the history after each command finishes
     export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a; history -c; history -r"
     # Set the prompt PS1 variable
     colors="${HOME}/.colors.bash"
     if [[ -a $colors ]] ; then source $colors ; fi
     
     # prompt and colors
     if [ "$PS1" ] ; then
         # Add colors to grep
         export GREP_OPTIONS='--color=auto'
         export GREP_COLOR='1;32'
     
         # MySQL prompt
         export MYSQL_PS1='\u@\h \d \c> '
     
         # git branch dirty state
         export GIT_PS1_SHOWDIRTYSTATE="true"
     
         export GIT_STATE='$(
         if [[ $(__git_ps1) =~ \*\)$ ]]
             then echo "'$BYellow'"$(__git_ps1 " (%s) ")
         elif [[ $(__git_ps1) =~ \+\)$ ]]
             then echo "'$BPurple'"$(__git_ps1 " (%s) ")
         else
             echo "'$BCyan'"$(__git_ps1 " (%s) ")
         fi)'
     
         prompt="
         status=\$?
         timestamp='\[[$Magenta\]\d \t]\[$Reset\]'
         user='\[$BIBlue\]\u\[$Reset\]'
         host='\[$Yellow\]\h\[$Reset\]'
         cwd='\[$Cyan\]\w\[$Reset\]'
         prompt=\"\n\${timestamp}\n\${user}@\${host}${GIT_STATE} \${cwd}\n\$ \"
         echo -e \"\${prompt}\"
         "
         export PS1="\$(${prompt})"
     fi
     ####################################################################
     # Bash Completion.
     ####################################################################
     complete -A hostname   rsh rcp telnet rlogin r ftp ping disk
     complete -A export     printenv
     complete -A variable   export local readonly unset
     complete -A enabled    builtin
     complete -A alias      alias unalias
     complete -A function   function
     complete -A user       su mail finger
     complete -A signal     kill killall
     complete -A user       su userdel passwd
     complete -A group      groupdel groupmod newgrp
     complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e "s/,.*//g" | uniq | grep -v "\["`;)" ssh
     
     complete -A helptopic  help     # Currently,  same as builtins.
     complete -A shopt      shopt
     complete -A stopped -P '%' bg
     complete -A job -P '%'     fg jobs disown
     
     complete -A directory  mkdir rmdir
     complete -A directory   -o default cd
     
     # Compression
     complete -f -o default -X '*.+(zip|ZIP)'  zip
     complete -f -o default -X '!*.+(zip|ZIP)' unzip
     complete -f -o default -X '*.+(z|Z)'      compress
     complete -f -o default -X '!*.+(z|Z)'     uncompress
     complete -f -o default -X '*.+(gz|GZ)'    gzip
     complete -f -o default -X '!*.+(gz|GZ)'   gunzip
     complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
     complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
     complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract
     
     # Documents - Postscript, pdf, dvi.....
     complete -f -o default -X '!*.+(ps|PS)'  gs ghostview ps2pdf ps2ascii
     complete -f -o default -X '!*.+(dvi|DVI)' dvips dvipdf xdvi dviselect dvitype
     complete -f -o default -X '!*.+(pdf|PDF)' acroread pdf2ps
     complete -f -o default -X \
     '!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?(.gz|.GZ|.bz2|.BZ2|.Z))' gv ggv
     complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
     complete -f -o default -X '!*.tex' tex latex slitex
     complete -f -o default -X '!*.lyx' lyx
     complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps
     complete -f -o default -X \
     '!*.+(doc|DOC|xls|XLS|ppt|PPT|sx?|SX?|csv|CSV|od?|OD?|ott|OTT)' soffice
     
     # Multimedia
     complete -f -o default -X \
     '!*.+(gif|GIF|jp*g|JP*G|bmp|BMP|xpm|XPM|png|PNG)' xv gimp ee gqview
     complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
     complete -f -o default -X '!*.+(ogg|OGG)' ogg123
     complete -f -o default -X \
     '!*.@(mp[23]|MP[23]|ogg|OGG|wav|WAV|pls|m3u|xm|mod|s[3t]m|it|mtm|ult|flac)' xmms
     complete -f -o default -X \
     '!*.@(mp?(e)g|MP?(E)G|wma|avi|AVI|asf|vob|VOB|bin|dat|vcd|\
     ps|pes|fli|viv|rm|ram|yuv|mov|MOV|qt|QT|wmv|mp3|MP3|ogg|OGG|\
     ogm|OGM|mp4|MP4|wav|WAV|asx|ASX)' xine
     
     # Misc
     complete -f -o default -X '!*.pl'  perl perl5
     
     # set up some bash completions for sam/bam/bedtools, bwa
     # source: https://github.com/arq5x/bash_completion
     #source ${HOME}/git/arq5x_bash_completion/!(README.rst|.*)
     
     ## LS_COLORS
     #eval $(dircolors -b /home/vkrishna/git/LS_COLORS/LS_COLORS)
     export LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91'
    ``` command not found?
    
    [Troubleshooting](https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found)
    
-   .colors.bash
    
    code
    
    ```
    # Reset
    Reset='\e[0m'           # Text Reset
    
    # Regular Colors
    Black='\e[0;30m'        # Black
    Red='\e[0;31m'          # Red
    Green='\e[0;32m'        # Green
    Yellow='\e[0;33m'       # Yellow
    Blue='\e[0;34m'         # Blue
    Magenta='\e[0;35m'      # Magenta
    Cyan='\e[0;36m'         # Cyan
    White='\e[0;37m'        # White
    
    # Bold
    BBlack='\e[1;30m'       # Black
    BRed='\e[1;31m'         # Red
    BGreen='\e[1;32m'       # Green
    BYellow='\e[1;33m'      # Yellow
    BBlue='\e[1;34m'        # Blue
    BPurple='\e[1;35m'      # Purple
    BCyan='\e[1;36m'        # Cyan
    BWhite='\e[1;37m'       # White
    
    # Underline
    UBlack='\e[4;30m'       # Black
    URed='\e[4;31m'         # Red
    UGreen='\e[4;32m'       # Green
    UYellow='\e[4;33m'      # Yellow
    UBlue='\e[4;34m'        # Blue
    UPurple='\e[4;35m'      # Purple
    UCyan='\e[4;36m'        # Cyan
    UWhite='\e[4;37m'       # White
    
    # Background
    On_Black='\e[40m'       # Black
    On_Red='\e[41m'         # Red
    On_Green='\e[42m'       # Green
    On_Yellow='\e[43m'      # Yellow
    On_Blue='\e[44m'        # Blue
    On_Purple='\e[45m'      # Purple
    On_Cyan='\e[46m'        # Cyan
    On_White='\e[47m'       # White
    
    # High Intensity
    IBlack='\e[0;90m'       # Black
    IRed='\e[0;91m'         # Red
    IGreen='\e[0;92m'       # Green
    IYellow='\e[0;93m'      # Yellow
    IBlue='\e[0;94m'        # Blue
    IPurple='\e[0;95m'      # Purple
    ICyan='\e[0;96m'        # Cyan
    IWhite='\e[0;97m'       # White
    
    # Bold High Intensity
    BIBlack='\e[1;90m'      # Black
    BIRed='\e[1;91m'        # Red
    BIGreen='\e[1;92m'      # Green
    BIYellow='\e[1;93m'     # Yellow
    BIBlue='\e[1;94m'       # Blue
    BIPurple='\e[1;95m'     # Purple
    BICyan='\e[1;96m'       # Cyan
    BIWhite='\e[1;97m'      # White
    
    # High Intensity backgrounds
    On_IBlack='\e[0;100m'   # Black
    On_IRed='\e[0;101m'     # Red
    On_IGreen='\e[0;102m'   # Green
    On_IYellow='\e[0;103m'  # Yellow
    On_IBlue='\e[0;104m'    # Blue
    On_IPurple='\e[0;105m'  # Purple
    On_ICyan='\e[0;106m'    # Cyan
    On_IWhite='\e[0;107m'   # White
    ``` 
-   create a custom login banner [How to](https://www.putorius.net/custom-motd-login-screen-linux.html)
    

## Shell command

_sample file_

-   `mkdir`、`cd`、`ls`
-   `cp`、`mv`、`rm`
-   `cut`、`head`、`tail`、`sort`、`uniq`
-   `grep`
-   `sed`
-   `awk`
-   `wget`

 留言

Regular expression: `^`、`$`、`*`、`\`

## Download and install SRA Toolkit

-   Under home dir, create two dir `package` and `bin`
-   Under `package`, download and install SRA Toolkit [How to](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc)

---

**[](https://hackmd.io/)**

 45

_sample file_

-   `mkdir`、`cd`、`ls`
-   `cp`、`mv`、`rm`
-   `cut`、`head`、`tail`、`sort`、`uniq`
-   `grep`
-   `sed`
-   `awk`
-   `wget`

Regular expression: `^`、`$`、`*`、`\`

## [](https://hackmd.io/@chiayic/H16iMjbb5#Download-and-install-SRA-Toolkit "Download-and-install-SRA-Toolkit")Download and install SRA Toolkit

-   Under home dir, create two dir `package` and `bin`
-   Under `package`, download and install SRA Toolkit [How to](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc)

---

發表於  **[HackMD](https://hackmd.io/)**

 43

讚賞 收藏 

訂閱

