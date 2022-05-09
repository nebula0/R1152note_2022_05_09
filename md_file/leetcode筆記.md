---
tags: R1152筆記
---
#linux 

# leetcode筆記

[題目](https://leetcode.com/problems/tenth-line/)
我的作法
```bash=
i=0
while read line; do
    ((i=i+1));
    if [ "$i" = "10" ]; then
        echo $line;
        fi;
done < file.txt
```
結果
![](https://i.imgur.com/ndATNd7.png)
- 看起來 run time還可以但是 Memory Usage 偏大
- 有人說 awk 最快

別人的作法
```bash
awk 'NR==10 {print $0}' file.txt
```
```bash
cat file.txt | sed -n 10p
```