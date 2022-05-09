#linux_script

```bash
# ==============================================
# === Change space to tab in a file.  ==========
awk -v OFS="\t" '{print $1,$2}' prefetch.o-all.tsv > prefetch.o-all.tsv
# === Create rename.tsv ========================
# Already have metadata_cleaned.tsv, the first column is run name,
# second is TRUE or FALSE, which depends on paired end or not, third
# column is short name.
awk 'BEGIN{OFS="\t"}{if($2=="FALSE")print $1".fastq",$3; else print $1"_1.fastq",$3"\n"$1"_2.fastq",$3 }' metadata_cleaned.tsv > rename.tsv
```