#git_github


## 建立新repo，把locoal的東西弄上去

![[Pasted image 20220306101318.png]]
在create new repository時如果勾選建立README.md，就不會跳出這個畫面

---

### create a new repository on the command line
目的:把原先還沒有任何git措施的資料夾init後，推到main上
流程:
- 建立`README.md`檔案
- `git init` `git add` `git commit`應該都沒問題
- `git branch -M main` M 是指 `--move --force`^[[Git - git-branch Documentation (git-scm.com)](https://git-scm.com/docs/git-branch#Documentation/git-branch.txt--M)]
- `git remote add origin <url>` ，`git remote` 跟遠端有關的操作，`add` 加結點，`origin` 是後面`<url>` 的代名詞，好像可以用別的字代替，現在設定或之後改都可以。^[[Push 上傳到 GitHub - 為你自己學 Git | 高見龍 (gitbook.tw)](https://gitbook.tw/chapters/github/push-to-github)]
- `git push -u origin main` `-u`是說把`origin`設為j我們剛才在local創的`main`的上游，下次可以直接下`git push` 不用`git push origin master` ^[[Push 上傳到 GitHub - 為你自己學 Git | 高見龍 (gitbook.tw)](https://gitbook.tw/chapters/github/push-to-github)]
```
echo "# R1152note" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/nebula0/R1152note.git
git push -u origin main

```

### push an existing repository from the command line
應該就是已經init過了 要push上去
```
git remote add origin https://github.com/nebula0/R1152note.git
git branch -M main
git push -u origin main
```

### push 時403的解決方法
修改.git/config檔案，上面改成下面，可行 [ref]([關於git push報403的問題 - IT閱讀 (itread01.com)](https://www.itread01.com/p/139636.html))
```
[remote "origin"]      url = https://github.com/youname/example.git  
[remote "origin"]      url = https://youname@github.com/youname/example.git
```
有其它方法，但我用了這個。
![http cat必須出現吧](https://http.cat/403)

### merge conflict解決方法
試了這個[github - Git merge with force overwrite - Stack Overflow](https://stackoverflow.com/questions/40517129/git-merge-with-force-overwrite)沒有用
正規的做法應該是比較兩個檔案手動解決
但還不會把兩個檔案並排比較的方法(vs code好像有 之後會在實驗室電腦裝)
總之最後我很龜的把conflict的檔案都加到.gitignore
![](https://static.wikia.nocookie.net/meme/images/e/ee/Imbad_001.jpg/revision/latest/scale-to-width-down/250?cb=20200129070247&path-prefix=zh-tw)

### fetch 與 pull
fetch是把它拿過來可以比較但還沒merge，pull是fetch加merge^[[git fetch與git pull的區別 - IT閱讀 (itread01.com)](https://www.itread01.com/content/1545176737.html)]

### 筆電初次設定 Git
其實這次是要改 user name 跟 email，目前用實驗室筆電，在這邊 push 出去會顯示是前一個的帳號。也就是說等我把筆電還回去，可能要把 `.gitconfig` 改掉，不然會發生一樣的事情
```console
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```
下完這些指令之後，`.gitconfig`會變，也可以下`git config --global user.name`，會回傳 user name，email 也可以。
[ref](https://git-scm.com/book/zh-tw/v2/%E9%96%8B%E5%A7%8B-%E5%88%9D%E6%AC%A1%E8%A8%AD%E5%AE%9A-Git)

