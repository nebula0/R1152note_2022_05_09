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





### G elata
BBDuk.sh 
```bash
#!/bin/bash
cd  ~/project/meta-analysis.symbiosys/G_elata/not_release/01_BBDuk-trim
for f in `ls -1 ./input/*_R1.fastq`
do
    name=($(basename $f|cut -f1-3 -d '_'))
    in1=($(ls ./input/"$name"_R1.fastq))
    in2=($(ls ./input/"$name"_R2.fastq))
    echo "Processing $in1 $in2"
    bbduk.sh -Xmx28g in1=$in1 in2=$in2 out1="$name"_R1.BBDuk-trimmed.fq.gz out2="$name"_R2.BBDuk-trimmed.fq.gz \
    overwrite=t ref=~/package/bbmap/resources/adapters.fa ordered=t ktrim=r k=25 mink=11 minlength=35
    echo "Finishing $name"
done

```

BBMap.sh
```bash
#!/bin/bash
cd ~/project/meta-analysis.symbiosys/G_elata/not_release/02_BBMap
[ ! -d unmapped ] && mkdir unmapped
[ ! -d output.bam ] && mkdir output.bam
[ ! -d input ] && ln -sf ../01_BBDuk-trim ./input
[ ! -d GWHBDNU00000000.genome.fasta ] && ln -sf /home/hpc/ls7046-0/genome.fasta/Gastrodia/GWHBDNU00000000.genome.fasta
bbmap.sh ref=GWHBDNU00000000.genome.fasta

for i in `ls ./input/*R1.BBDuk-trimmed*gz`; do
RUN=($(basename $i | cut -d "_" -f 1-3 ))
INPUT1=./input/"$RUN"_R1.BBDuk-trimmed.fq.gz
INPUT2=./input/"$RUN"_R2.BBDuk-trimmed.fq.gz

echo processing $RUN
bbmap.sh -Xmx32g in=$INPUT1 in2=$INPUT2 ordered=t maxindel=2000 overwrite=t outm=$RUN.sam outu=unmapped/$RUN.unmapped.sam
samtools view -b $RUN.sam| samtools sort -o output.bam/$RUN.sorted.bam -
samtools index output.bam/$RUN.sorted.bam

done
```

BBmap result summary
first row in name, second row is mapped  pct reads , third row is unambiguous
```bash
cat bbmap01.e244540  | grep ^mapped | cut -f2 > mapped_rate_column2.tsv
cat bbmap01.e244540  | grep ^unam | cut -f2 > unambiguous_rate_column2.tsv
cat bbmap01.e244540 | grep java | awk -v FS="/" -v OFS="\n" '{print $10, $12}' | cut -f1 -d "." | grep . > name.tsv

paste -d "\t"  name.tsv mapped_rate_column2.tsv unambiguous_rate_column2.tsv > mapp_sumarry.tsv
```

featureCounts.sh
```bash
#!/bin/bash
#Paird End
subfol="03_featureCounts"

[ ! -d input ] && ln -sf ../02_BBMap/output.bam/ ./input;
[ ! -d GWHBDNU00000000.gff ] && ln -sf /home/hpc/ls7046-0/genome.fasta/Gastrodia/GWHBDNU00000000.gff
[ ! -d output ] && mkdir output;
INPUT=($(ls ./input/*bam ));
for INPUT in ${INPUT[@]}; do
  OUTPUT=($(basename $INPUT| cut -f1-3 -d '_'));
  featureCounts -g ID -p --countReadPair -C -T 1 -s 0 -O -a GWHBDNU00000000.gff -o output/$OUTPUT.featureCounts $INPUT;
done

#-T:thread;
#-R:output alignment result for each read, this is useful when you need to troubleshoot why were some reads not assigned;
#-s:Perform strand-specific read counting. Acceptable values:0 (unstranded), 1 (stranded) and 2 (reversely stranded).0 by default.
#-O:allowMultiOverlap,reads will be allowed to more than one matched meta-feature/gene;
#-a:annotation reference;
#-o:output;
```



---
ERROR: no features were loaded in format GTF. The annotation format can be specified by the '-F' option, and the required feature type can be specified by the '-t' option..
記錄

 Annotation

  -F <string>         Specify format of the provided annotation file. Acceptable
                      formats include 'GTF' (or compatible GFF format) and
                      'SAF'. 'GTF' by default.  For SAF format, please refer to
                      Users Guide.
-t <string>         Specify feature type(s) in a GTF annotation. If multiple
                      types are provided, they should be separated by ',' with
                      no space in between. 'exon' by default. Rows in the
                      annotation with a matched feature will be extracted and
                      used for read mapping.

ls7046-5@h81 /home/hpc/ls7046-0/genome.fasta/Gastrodia
$ ls
GWHBDNU00000000.genome.fasta  GWHBDNU00000000.genome.fasta.fai  GWHBDNU00000000.gff

	
ls7046-5@h81 /home/hpc/ls7046-0/genome.fasta/Arabidopsis
$ ls
Araport11_GFF3_genes_transposons.May2022.gff.gz  TAIR10_Chr.all_cleaned.fasta
Araport11_GTF_genes_transposons.May2022.gtf



