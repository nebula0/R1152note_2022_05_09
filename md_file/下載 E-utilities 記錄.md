#linux_script 

https://www.ncbi.nlm.nih.gov/books/NBK179288/

```bash
sh -c "$(wget -q ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh -O -)"
```

```

Entrez Direct has been successfully downloaded and installed.

In order to complete the configuration process, please execute the following:

  echo "export PATH=\${PATH}:/home/hpc/ls7046-5/edirect" >> ${HOME}/.bashrc

or manually edit the PATH variable assignment in your .bashrc file.

Would you like to do that automatically now? [y/N]
y
OK, done.

To activate EDirect for this terminal session, please execute the following:

export PATH=${PATH}:${HOME}/edirect



```
```bash
export PATH=${PATH}:${HOME}/edirect
```
然後就載好環境變數設好了
樹環境變數的指令之後可以注意一下 好方便