---
type: slide
---
#linux 
<!-- 注意上面三行 -->

# 淺談 awk
真的很淺很淺

---

## 所以 awk 是什麼 ?

---

- 作者 Alfred V. `A`ho, Peter J. `W`einberger, Brian W. `K`ernighan 
- 處理文字的程式語言
- 某些方面跟 shell script 類似
- 開源！(GNU licence) 
- 掃描整個檔案，找到匹配的東西後，執行一串指令


---

## 我們為什麼要用 awk

---

假設你現在要印出某個檔案的第十列（row）
![](https://i.imgur.com/Fsjj3EH.png)

---

你可能會這樣做（我當時是這樣寫）
```bash=
i=0
while read line; do
    ((i=i+1));
    if [ "$i" = "10" ]; then
        echo $line;
        fi;
done < file.txt

```

---

如果用 awk 

```bash=
awk 'NR==10' file.txt
```
好像有點方便？

---

當然有其他方法
```bash=
sed -n 10p file.txt
```
但我們今天先聚焦在 awk

---

### 要怎麼用？

---


內建參數有很多
Linux manual page 列出的是這些：

`ARGC`, `ARGV`, `CONVFMT`, 
`ENVIRON`, `FILENAME`, `FNR`, `FS`,
`NF`, `NR`, `OFMT`, `OFS`, `ORS`, 
`RLENGTH`, `RS`, `RSTART`, `SUBSEP`

---

接下來會討論幾個比較常用的：
`FS`, `OFS`, `RS`, `ORS`,
`NR`, `NF`, `FILENAME`, `FNR`


---

### `FS` (input) Field Separator
- 決定把什麼視為輸入資料field（類似column）的分隔
- setting
    - default `<space>`
    - `awk -F 'FS'`
    - `awk -v FS='FS'`
    - `awk 'BEGIN{FS="FS";}'`


---

```bash=
cat FS_test.txt
> www:3 ww:2 wwwwww:5
> w:1 wwww:4 wwwwww:6

awk '{print $1}' FS_test.txt

# expect to see what?
```

---

```bash=
cat FS_test.txt
# www:3 ww:2 wwwwww:5
# w:1 wwww:4 wwwwww:6

awk '{print $1}' FS_test.txt
# www:3
# w:1

```

---

```bash=
cat FS_test.txt
# www:3 ww:2 wwwwww:5
# w:1 wwww:4 wwwwww:6

awk -F ':' '{print $1}' FS_test.txt
# expect to see what?
```

---

```bash=
cat FS_test.txt
# www:3 ww:2 wwwwww:5
# w:1 wwww:4 wwwwww:6

awk -F ':' '{print $1}' FS_test.txt
# www
# W

```

---

```bash=
cat FS_test.txt
# www:3 ww:2 wwwwww:5
# w:1 wwww:4 wwwwww:6

awk -F ':' '{print $1}' FS_test.txt
# www
# W

awk 'BEGIN{FS=":";} {print $1;}' FS_test.txt
# www
# W
```

---

### `OFS` Output Field Separator
- 決定以什麼做為輸出資料 field（類似column）的分隔
- setting
    - default `<space>`
    - `awk -F 'OFS'`
    - `awk -v OFS='OFS'`
    - `awk 'BEGIN{FS="OFS";}'`


---

```bash=
cat FS_test.txt
# www:3 ww:2 wwwwww:5
# w:1 wwww:4 wwwwww:6

awk 'BEGIN{OFS="===";} {print $1,$2;}' FS_test.txt
# www:3===ww:2
# w:1===wwww:4
```

---

```bash=
cat FS_test.txt
# www:3 ww:2 wwwwww:5
# w:1 wwww:4 wwwwww:6

awk -v OFS='===' '{print $1,$2;}' FS_test.txt
# www:3===ww:2
# w:1===wwww:4
```

---


### `RS` Record Separator variable
- 決定把什麼視為輸入資料 record（類似 row）的分隔
- setting
    - default `"\n"`
    - `awk -v RS='RS'`
    - `awk 'BEGIN{RS="RS";}'`


---

```bash=
cat RS_test.txt
# biology
# A-
# 12
#
# calculus
# A+
# 1
#
# chemistry
# C
# 67

```

---

```bash=
awk 'BEGIN{RS="\n\n"}{print $1, $2}' RS_test.txt

# biology A-
# calculus A+
# chemistry C

```

---

### `ORS` Output Record Separator variable
- 決定以什麼做為輸出資料 record 的分隔
- setting
    - default `"\n"`
    - `awk -v ORS='ORS'`
    - `awk 'BEGIN{ORS="ORS";}'`

---


```bash=
cat RS_test.txt
# biology
# A-
# 12
#
# calculus
# A+
# 1
#
# chemistry
# C
# 67

```

---

```bash=
awk 'BEGIN{RS="\n\n"; ORS="~~(.u.)~~"}{print $1, $2}' RS_test.txt
# biology A-~~(.u.)~~calculus A+~~(.u.)~~chemistry C~~(.u.)~~

```

---

### `NR` Number of Records Variable
- 記錄目前累計讀到的 record
- ~~setting~~

---

```bash=
cat RS_test.txt
# biology
# A-
# 12
#
# calculus
# A+
# 1
#
# chemistry
# C
# 67

```

---

```bash=
awk 'BEGIN{RS="\n\n"; }{print "current record",NR}' RS_test.txt
# current record 1
# current record 2
# current record 3
```

---

```bash=
awk 'BEGIN{RS="\n"; }{print "current record", NR, $0}' RS_test.txt
# current record 1 biology
# current record 2 A-
# current record 3 12
# current record 4
# current record 5 calculus
# current record 6 A+
# current record 7 1
# current record 8
# current record 9 chemistry
# current record 10 C
# current record 11 67


```

---

### `NF` Number of Fields in a record
- 記錄當前 record 有幾個 field
- ~~setting~~

---

```bash=
cat student-marks
# Jones 2143 78 84 77
# Gondrol 2321 56 58 45
# RinRao 2122 38 37
# Edwin 2537 78 67 45
# Dayan 2415 30 47
```

---

```bash=
awk '{print NR,"->",NF}' student-marks
# 1 -> 5
# 2 -> 5
# 3 -> 4
# 4 -> 5
# 5 -> 4
```

---

### `FILENAME` Name of the current input file
- 記錄當前輸入資料檔名
- 當我們要 loop 很多檔案時可能會有用
- ~~setting~~

---

```bash=
awk '{print FILENAME}' student-marks
# student-marks
# student-marks
# student-marks
# student-marks
# student-marks
```

---

### `FNR` Number of Records relative to the current input file
- FILENAME 加上 NR
- ~~setting~~

---

```bash=
awk '{print FILENAME, FNR;}' student-marks bookdetails
# student-marks 1
# student-marks 2
# student-marks 3
# student-marks 4
# student-marks 5
# bookdetails 1
# bookdetails 2
# bookdetails 3
# bookdetails 4
# bookdetails 5
```

---

## 有貼近我們的例子嗎？

---

![](https://i.imgur.com/nSOCFRl.png)

---

![](https://i.imgur.com/AFCwNEl.png)

---

我原先的做法，單一 run 測試
```bash=
grep Read fastq-dump.o227860 | cut -d " " -f 5 | cut -c 1-2 --complement > paste1.tsv

grep Read fastq-dump.o227860 | cut -d " " -f 2 > paste2.tsv

grep Written fastq-dump.o227860 | cut -d " " -f 2 > paste3.tsv

paste -d  " " paste1.tsv paste2.tsv paste3.tsv > pasted.tsv
```

---

處理所有run
```bash=
cat $(find . -name fastq-dump.o*) | grep Read | cut -d " " -f 5 | cut -c 1-2 --complement > paste1.tsv

cat $(find . -name fastq-dump.o*) | grep Read | cut -d " " -f 2 > paste2.tsv

cat $(find . -name fastq-dump.o*) | grep Written |cut -d " " -f 2 > paste3.tsv

paste -d  " " paste1.tsv paste2.tsv paste3.tsv | sort -u > pasted_2.tsv

```

---

awk 單一 run 測試
```bash=
awk 'BEGIN{RS="\n\n"} {print $5, $2, $7}' fastq-dump.o228247 | awk -F './' '{print$2}'
```
處理所有 run
```bash=
cat $(find . -name fastq-dump.o*) | awk 'BEGIN{RS="\n\n"} {print $5, $2, $7}' | awk -F './' '{print$2}'
```

---

以上兩種做法的輸出都是這樣

```bash=
DRR106422 3249209 3249209
DRR106423 3990947 3990947
DRR106424 3785596 3785596
DRR106425 3019484 3019484
DRR106426 3590038 3590038
DRR106427 4085254 4085254
DRR106428 3382899 3382899
DRR106429 3832505 3832505
```
~~你心動了ㄇ~~

---

好，讓我們再複習一次ㄅ

---

**可設定參數**
- `FS` (input) Field Separator，決定把什麼視為輸入資料field（類似column）的分隔，預設是`<space>`
- `OFS` Output Field Separator，決定以什麼做為輸出資料 field（類似column）的分隔，預設是`<space>`
- `RS` Record Separator variable，決定把什麼視為輸入資料 record（類似 row）的分隔，預設是`"\n"`
- `ORS` Output Record Separator variable，決定以什麼做為輸出資料 record 的分隔，預設是`"\n"`

---

**不可設定參數**
- `NR` Number of Records Variable，記錄目前累計讀到的 record
- `NF` Number of Fields in a record，記錄當前 record 有幾個 field
- `FILENAME` Name of the current input file，記錄當前輸入資料檔名
- `FNR` Number of Records relative to the current input file，FILENAME 加上 NR

---

擔心等等就忘了？
這份簡報是以 HackMD 製作
在實驗室共筆中可以翻到
後面還有參考資料可以利用噢❤


---


- https://www.cs.unibo.it/~renzo/doc/awk/nawkA4.pdf
- https://www.itread01.com/p/159648.html
- https://codertw.com/%E4%BC%BA%E6%9C%8D%E5%99%A8/376358/ 這裡面的可能是錯的
- https://blog.gtwang.org/linux/linux-cp-command-copy-files-and-directories-tutorial/
- https://man7.org/linux/man-pages/man1/awk.1p.html
- https://www.thegeekstuff.com/2010/01/8-powerful-awk-built-in-variables-fs-ofs-rs-ors-nr-nf-filename-fnr/　好東西，這份大部分抄他的
