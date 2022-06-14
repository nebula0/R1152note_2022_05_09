#bash #E-utility 

```bash
$ esearch -db sra -query "PRJNA517527" | efetch -format runinfo | grep -v "Run" | cut -d ',' -f1
SRR8504995
SRR8505002
SRR8504977
SRR8504976
SRR8505293
SRR8505291
SRR8504989
SRR8504998
```
要再去看documentation