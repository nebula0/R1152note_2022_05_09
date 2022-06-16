
#linux 

### for and while
```
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
```bash
for i in {1..30}; do if [ $i != 10 ]; then echo "hello $i"; fi; done
```
注意大括號旁的空格一定要空
### for
https://www.cyberciti.biz/faq/bash-for-loop/

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
####  through command output
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
read -r 的意義不太清楚，[這裡](https://unix.stackexchange.com/questions/192786/what-is-the-meaning-of-read-r)是說不把 Backslash 當成 escape character，但我查不到。
```bash
"ls" | grep ^s | while read i; do echo www$i; done

# wwwsample_input.txt
# wwwscratch

```


## 自產物 可能未整理
這段的前提是在每個SRP的00_fastq資料夾下已經建立了叫做run_all.txt的檔案，裡面有所有的run，換行分隔。
```bash
# SRP_all.txt
# run_all.txt
cd ~/project/meta-analysis.nutrient/Arabidopsis
while read SRP; do

#	mkdir $SRP
#	cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP
	
#	for f in 00_fastq 01_BBDuk-trim 02_BBMap 03_featureCounts 04_edgeR
#		do
#			mkdir $f
#		done
	cd  ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fastq
	touch download.sh
	while read SRR; do
		echo prefetch -X 25G $SRR >> download.sh
		echo fastq-dump ./$SRR >> download.sh
	done < run_all.txt
		
	cd ..
	

done < SRP_all.txt



```

```bash

while read SRP; do
	echo $SRP
	echo dfghjkl
done < SRP_all.txt

```

```bash
while read line; do 
	echo $line 
done < lorem-ipsum.txt

```


```bash
cd ~/project/meta-analysis.nutrient/Arabidopsis
while read SRP; do
	cd  ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fastq
	touch download.sh
	while read SRR; do
		echo prefetch -X 25G $SRR >> download.sh
		echo fastq-dump ./$SRR >> download.sh
	done < run_all.txt
		
	cd ..
	

done < ~/project/meta-analysis.nutrient/Arabidopsis/SRP_all.txt

```

```bash
while read SRP; do 
cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP
mkdir 00_fastq
done < SRP_all.txt
```

```bash
while read SRP; do
cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fastq
qsub -l select=1:ncpus=1 -l walltime=00:20:00 -N "fastq-dump" -m abe -M "harewhite0@gmail.com" download.sh
echo ----OuO----$SRP
done < ~/project/meta-analysis.nutrient/Arabidopsis/SRP_all.txt




```
![[Pasted image 20220408232118.png]]


---

實際上輸進去的
```bash

cd ~/project/meta-analysis.nutrient/Arabidopsis  
while read SRP; do  
cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fastq  
touch download.sh 
while read SRR; do  
echo prefetch -X 25G $SRR >> [download.sh](http://download.sh/)  
echo fastq-dump ./$SRR >> [download.sh](http://download.sh/)  
done < run_all.txt  
  
cd ..  
  
  
done < ~/project/meta-analysis.nutrient/Arabidopsis/SRP_all.txt
```


```bash
while read SRP; do  
cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fastq  
qsub -l select=1:ncpus=1 -l walltime=1:00:00 -N "fastq-dump" -m abe -M "YOUREMAIL@gmail.com" download.sh 
done < ~/project/meta-analysis.nutrient/Arabidopsis/SRP_all.txt

```
---
修改過後，在`download.sh`裡加上資料夾路徑，就可以讓PBD把東西做在裡面
所以`SRR*.fastq`會做在家目錄是因為`while`外面沒有加路徑，預設就會建在家目錄，但是`while`裡面有指定路徑，所以`fastq-dump.e*`之類的就會在正確的目錄，至於為什麼會這樣就不知道了。
```bash
# this script is to creat each download.sh for all SRP listed in SRP.all. 
cd ~/project/meta-analysis.nutrient/Arabidopsis  
while read SRP; do  
cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fas*tq  
touch download_new.sh 
while read SRR; do  
echo \cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fas*tq >> download_new.sh 
echo prefetch -X 25G $SRR >> download_new.sh  
echo fastq-dump ./$SRR >> download_new.sh  


done < run_all.txt  
echo ...
echo ...download.sh in $SRP has been made ~\(owo\)~...
echo ...
cd ..  
  
  
done < ~/project/meta-analysis.nutrient/Arabidopsis/SRP_all.txt
```

這邊加上在terminal傳現在在跑什麼的功能，以及一開始先進入/Arbidopsis
```bash
# this script is to run all download.sh in each $SRP/00_fas*tq

cd ~/project/meta-analysis.nutrient/Arabidopsis 
while read SRP; do  
cd ~/project/meta-analysis.nutrient/Arabidopsis/$SRP/00_fastq  
qsub -l select=1:ncpus=1 -l walltime=1:00:00 -N "fastq-dump" -m abe -M "harewhite0@gmail.com" download_new.sh 
echo ...
echo ...$SRP has been submited to HPC ...~\(OuO\)~......
echo ...
done < ~/project/meta-analysis.nutrient/Arabidopsis/SRP_all.txt

```