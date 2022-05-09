#R #WGCNA

這個筆記是針對[Tutorials for WGCNA R package (ucla.edu)](https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/Rpackages/WGCNA/Tutorials/)做的學習記錄
`##` means unsolved problem.  

[WGCNA background and glossary](https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/Rpackages/WGCNA/Tutorials/Simulated-00-Background.pdf)有跟多重要的名詞解釋，大部分沒有看懂，之後要回來看
## 00 install package
After I open R Studio, it asked me to use renv or not, and i chose yes.
So packages needs to be download again(so 麻煩)

the code 
```r
source("http://bioconductor.org/biocLite.R")  
biocLite(c("GO.db", "preprocessCore", "impute"))
```
on [WGCNA tutorial](https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/Rpackages/WGCNA/InstallationInstructions.html) did not work, thus i use
```r
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.14")

BiocManager::install(c("GO.db", "preprocessCore", "impute"));
```
instead, [ref](https://bioconductor.org/install/)

it works, but renv.lock didn't show the packages i just download. that is really strange, but i decided to ignore it temporarily.##
renv.lock content:
```json

{
  "R": {
    "Version": "4.1.2",
    "Repositories": [
      {
        "Name": "CRAN",
        "URL": "https://cran.rstudio.com"
      }
    ]
  },
  "Packages": {
    "renv": {
      "Package": "renv",
      "Version": "0.15.4",
      "Source": "Repository",
      "Repository": "CRAN",
      "Hash": "c1078316e1d4f70275fc1ea60c0bc431",
      "Requirements": []
    }
  }
}
```
## 01
```R
getwd()
# [1] "C:/R_CJY/WGCNA_test"
```
return current directory
```R
workingDir = ".";
```
`.`set workspace to current folder, we can replace`.` by directory, notice that window$ use`/` other use`\`. 

```R
options(stringsAsFactors = FALSE);
```
[this article](https://simplystatistics.org/posts/2015-07-24-stringsasfactors-an-unauthorized-biography/)has some explanation, but i still not understand.
```r
library(WGCNA);
femData = read.csv("LiverFemale3600.csv");
dim(femData); names(femData);
```
`dim()` seems corresponding to `shape()` in python, i should check what type of object has attribute `dim()` later. ## 


