# [Data Science for High-Throughput Sequencing](http://data-science-sequencing.github.io/)

## Lecture 1: Introduction
### coverage depth
To get a sense of the scale of the data, consider the human genome GG which consists of 3 billion bases {A,C,T,G}{A,C,T,G}. Suppose each read has a length LL of 100 bases. The _coverage depth_ is the average number of reads that cover a given base in the genome. To achieve a coverage depth CC of 30x, we would need N=900,000,000N=900,000,000 reads since C=NL/GC=NL/G.

### Sequencing methods 
illumina 
	- 100-200 bp
	- 1-2% error rate
	- substitution errors

PacBio
	- over 10000 bp
	- 10-15% error rate
![](../attachment/Pasted%20image%2020220617131240.png)