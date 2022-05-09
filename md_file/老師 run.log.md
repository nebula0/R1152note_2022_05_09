```bash
# === Examine if all the run were downloaded successfully ===================================
# Cat all the .o files into one;
$ cat ../mia_homework_30.04/SRP*/hwe* | awk '{print$1"\t"$2}' | sort -u > prefetch.o-all.tsv
# join the prefetch .o file with the metadata, you can see if there's missing data here;
# Note: my python alias: alias join='python -m jcvi.formats.base join'
$ join prefetch.o-all.tsv metadata_cleaned.tsv |more
# Exame if Read equals Written;
$ cat ../mia_homework_30.04/SRP*/hwo* | awk '{if($2!=$3)print$0}'|wc -l
0

# === Create rename.tsv =====================================================================
# Export metadata tab 'CYC.summary' from Google sheet and save it as metadata_Googlesheet.tsv
# Clean-up the file
# First check the number of the retained runs which should match the line number in ../metadata_YOURNAME.tsv
$ grep -vP 'del' metadata_Googlesheet.tsv | sed 1d | wc -l #? what's sed 1d
164
$ wc -l ../metadata_mia.tsv
164 ../metadata_mia.tsv
#  Then clean up the file: only keep RUN, PE, Uniquie ID
$ grep -vP 'del' metadata_Googlesheet.tsv | sed 1d | cut -f2,5,7 > metadata_cleaned.tsv

# Next, convert the metadata_cleaned to a 2-col file rename.tsv;
# The 1st col is the current file name and the 2nd the NEW file name;
$ awk -v OFS='\t' '{if($2~/FALSE/)print $1".fastq",$3".fastq"; else print$1"_1.fastq",$3"_1.fastq"}' metadata_cleaned.tsv| cat metadata_cleaned.tsv - | awk -v OFS='\t' '{if($2~/TRUE/)print$1"_2.fastq",$3"_2.fastq"; else print$0}'| awk '{if(NF==2)print$0}' - > rename.tsv


```




awk 'BEGIN{OFS="\t"}{if($2~/FALSE/) print $1".fastq"}' metadata_cleaned.tsv
這邊可以


老師的rename