#linux_script 

批次命名檔案
把DSC刪掉加上nebula
原檔名範例 `DSC_2637.jpg`
重新命名後範例`nebula_2637.jpg`
```bash
ls | grep "^DSC | "cut -c 1-3 --complement > minusDSC.txt # 切除以DSC開頭的檔案 檔名前三個字元 存入minusDSC.txt
for i in $(cat minusDSC.txt); do mv "DSC_$i" "nebula_$i"; done # 重新命名檔案

```

一行解
```bash
ls | grep "^DSC" | cut -c 1-3 --complement > minusDSC.txt && for i in $(cat minusDSC.txt); do mv "DSC$i" "nebula$i"; done

```


BBDuk.sh ?
```bash
for f in `ls -1 ./input/S*_1*fastq`
do
    name=($(basename $f| cut -f1 -d '_'))
    in1=($(ls ./input/"$name"_1.fastq))
    in2=($(ls ./input/"$name"_2.fastq))
    echo "Processing $in1 $in2"
    bbduk.sh -Xmx28g in1=$in1 in2=$in2 out1="$name"_1.BBDuk-trimmed.fq.gz out2="$name"_2.BBDuk-trimmed.fq.gz \
    overwrite=t ref=~/package/bbmap/resources/adapters.fa ordered=t ktrim=r k=25 mink=11 minlength=35
    echo "Finishing $name"
done
```