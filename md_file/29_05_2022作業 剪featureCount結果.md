#linux_script #課堂筆記 
# 29_05_2022 作業
## 題目
![](https://i.imgur.com/ppKrY7e.png)

## 作法

```bash=
# ================
# run featureCount 
# ================

#!/bin/bash
#dir=$(pwd)
subfol="03_featureCounts"

for folder in DRP003836 SRP007763 SRP018404 SRP075013 SRP092325 SRP186316; do
cd ~/project/meta-analysis.nutrient/Arabidopsis/$folder/$subfol;
echo now in $(pwd);

# creat soft link, output folder
ln -sf ../02_BBMap/output.bam/ ./input;
ln -sf /home/hpc/ls7046-/genome.fasta/Arabidopsis/Araport11_GTF_genes_transposons.May2022.gtf;
mkdir output;

# run featureCount for each SRR
INPUT=($(ls ./input/*bam ));
for INPUT in ${INPUT[@]}; do
OUTPUT=($(basename $INPUT| cut -f1-3 -d '.'));
featureCounts -T 1 -s 0 -O -a Araport11_GTF_genes_transposons.May2022.gtf -o output/$OUTPUT.featureCounts $INPUT;
done

done

# featureCount parameter
#-T:thread;
#-R:output alignment result for each read, this is useful when you need to troubl eshoot why were some reads not assigned;
#-s:Perform strand-specific read counting. Acceptable values:0 (unstranded), 1 (stranded) and 2 (reversely stranded).0 by default.
#-O:allowMultiOverlap,reads will be allowed to more than one matched meta-feature/gene;
#-a:annotation reference;
#-o:output;

# Warning: recreat soft link to folder will GG. Don't know why.

# =================
# generate summary 
# =================

# collect neme
cat feature--count.e232793 | grep  Output | awk -v FS=": " '{print $2}' | awk -v FS="." '{print $1}' > feature-count-name.tsv

# collect percentage
cat feature--count.e232793 | grep % | awk -v FS="(" '{print $2}' | awk -v FS=")" '{print $1}' > feature-count-percentage.tsv


# cobine name and percentage
awk -v OFS="\t" 'FNR==NR{a[NR]=$1; next}{print a[FNR],$1}' feature-count-name.tsv feature-count-percentage.tsv > feature-count-combine1.tsv

# rename
awk -v OFS="\t" 'FNR==NR{ a[$1]=$2; next} $1 in a {print a[$1], $2}' bbmap_result_rename.tsv feature-count-combine1.tsv > CJY_featureCount.txt

# =========
# orther note
# =========

# I forgot to rename .bam file before running featureCount...  
# qsub will enter a place that is not the current directory (this can be  
# confirmed by submitting a file containing "ls"), but "~" still 
# represents our home directory. 
# because the reason above, "pwd" represent qsub running place, not submit 
# place.
```


```bash


bbmap.sh -Xmx32g in=$INPUT_1 AND in=$INPUT_2 ordered=t maxindel=2000 overwrite=t outm=$OUTPUT.sam outu=unmapped/$OUTPUT_1.unmapped.sam
samtools view -b $OUTPUT_1.sam| samtools sort -o output.bam/$OUTPUT_1.sorted.bam -
samtools index output.bam/$OUTPUT_1.sorted.bam
outu=unmapped/$OUTPUT_2.unmapped.sam
samtools view -b $OUTPUT_2.sam| samtools sort -o output.bam/$OUTPUT_2.sorted.bam -
samtools index output.bam/$OUTPUT_2.sorted.bam
```