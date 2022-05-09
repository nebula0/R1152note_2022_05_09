#R 

在開始下載一堆套件前，如果是python，會習慣先建立虛擬環境(參見[[python虛擬環境]])，讓別人可以用幾行指令把環境複製出來，減少移植project時出錯的可能
想知道R有沒有類似的東西，找到了這個:[python - Virtual environment in R? - Stack Overflow](https://stackoverflow.com/questions/24283171/virtual-environment-in-r)
裡面說[Packrat](http://rstudio.github.io/packrat/)這個套件可以做到類似的功能

所以我嘗試下載Packrat，得到以下錯誤訊息:
```
> install.packages("packrat")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing package into ‘C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)

  There is a binary version available but the source
  version is later:
        binary source needs_compilation
packrat  0.6.0  0.7.0             FALSE

installing the source package ‘packrat’

嘗試 URL 'https://cran.rstudio.com/src/contrib/packrat_0.7.0.tar.gz'
Content type 'application/x-gzip' length 129888 bytes (126 KB)
downloaded 126 KB

* installing *source* package 'packrat' ...
** package 'packrat' successfully unpacked and MD5 sums checked
** using staged installation
Warning in file(file, if (append) "a" else "w") :
  cannot open file 'C:/Users/USER/Dropbox/'Z*:9q8# (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/00LOCK-packrat/00new/packrat/DESCRIPTION': Invalid argument
Warning in strsplit(conditionMessage(e), "\n") :
  輸入的字串 1 不適用於此語言環境
Error in file(file, if (append) "a" else "w") : ?⊥??????
ERROR: installing package DESCRIPTION failed for package 'packrat'
* removing 'C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/packrat'
Warning in install.packages :
  installation of package ‘packrat’ had non-zero exit status

The downloaded source packages are in
	‘C:\Users\USER\AppData\Local\Temp\RtmpoJ5Q1m\downloaded_packages’
```
不確定是不是路徑中有中文(`輸入的字串 1 不適用於此語言環境`)導致這種錯誤，另外很奇怪的是載其他套件，像是matrixStats就沒有大問題(但還是有WARNING):
```
> install.packages("matrixStats")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing package into ‘C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)

  There is a binary version available but the source
  version is later:
            binary source needs_compilation
matrixStats 0.58.0 0.61.0              TRUE

  Binaries will be installed
嘗試 URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/matrixStats_0.58.0.zip'
Content type 'application/zip' length 1742442 bytes (1.7 MB)
downloaded 1.7 MB

package ‘matrixStats’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\USER\AppData\Local\Temp\RtmpoJ5Q1m\downloaded_packages
```
最詭異的是上面出現兩個路徑`C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6`跟`C:\Users\USER\AppData\Local\Temp\RtmpoJ5Q1m\downloaded_packages`
第一個跟上面的路徑是一樣的，所以並不是因為那個路徑有中文出問題
`cannot open file 'C:/Users/USER/Dropbox/'Z*:9q8# (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/00LOCK-packrat/00new/packrat/DESCRIPTION': Invalid argument`到底是哪裡來的完全不理解

另一件奇怪的事情是 ，直接打開Dropbox資料夾，裡面是空的
![[Pasted image 20220312135030.png]]
按內容卻顯示有很多東西
![[Pasted image 20220312135130.png]]

猜測會不會是Dropbox把本機路徑搞得一團亂，嘗試完全刪除R、RStudio全部重來，發現沒辦法刪除RStudio
![[Pasted image 20220312135304.png]]
網路上取得權限方法好像不適用

到這邊我開始覺得停損點到了，所以虛擬環境的計畫就先放一邊吧


---更新---

看起來不解決那個問題不能跑WGCNA
```
> install.packages(c("matrixStats", "Hmisc", "splines", "foreach", "doParallel", "fastcluster", "dynamicTreeCut", "survival", "BiocManager"))
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
Installing packages into ‘C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6’
(as ‘lib’ is unspecified)
Warning in install.packages :
  package ‘splines’ is not available (for R version 3.6.1)
Warning in install.packages :
  package ‘splines’ is a base package, and should not be updated
also installing the dependencies ‘ggplot2’, ‘iterators’


  There are binary versions available but the source
  versions are later:
             binary  source needs_compilation
ggplot2       3.3.3   3.3.5             FALSE
iterators    1.0.13  1.0.14             FALSE
matrixStats  0.58.0  0.61.0              TRUE
Hmisc         4.5-0   4.6-0              TRUE
foreach       1.5.1   1.5.2             FALSE
doParallel   1.0.16  1.0.17             FALSE
fastcluster  1.1.25   1.2.3              TRUE
survival     3.2-11   3.3-1              TRUE
BiocManager 1.30.15 1.30.16             FALSE

  Binaries will be installed
嘗試 URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/matrixStats_0.58.0.zip'
Content type 'application/zip' length 1742442 bytes (1.7 MB)
downloaded 1.7 MB

嘗試 URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/Hmisc_4.5-0.zip'
Content type 'application/zip' length 3260035 bytes (3.1 MB)
downloaded 3.1 MB

嘗試 URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/fastcluster_1.1.25.zip'
Content type 'application/zip' length 327604 bytes (319 KB)
downloaded 319 KB

嘗試 URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/dynamicTreeCut_1.63-1.zip'
Content type 'application/zip' length 92621 bytes (90 KB)
downloaded 90 KB

嘗試 URL 'https://cran.rstudio.com/bin/windows/contrib/3.6/survival_3.2-11.zip'
Content type 'application/zip' length 6731295 bytes (6.4 MB)
downloaded 6.4 MB

package ‘matrixStats’ successfully unpacked and MD5 sums checked
package ‘Hmisc’ successfully unpacked and MD5 sums checked
package ‘fastcluster’ successfully unpacked and MD5 sums checked
package ‘dynamicTreeCut’ successfully unpacked and MD5 sums checked
package ‘survival’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
	C:\Users\USER\AppData\Local\Temp\RtmpoJ5Q1m\downloaded_packages
installing the source packages ‘ggplot2’, ‘iterators’, ‘foreach’, ‘doParallel’, ‘BiocManager’

嘗試 URL 'https://cran.rstudio.com/src/contrib/ggplot2_3.3.5.tar.gz'
Content type 'application/x-gzip' length 3063309 bytes (2.9 MB)
downloaded 2.9 MB

嘗試 URL 'https://cran.rstudio.com/src/contrib/iterators_1.0.14.tar.gz'
Content type 'application/x-gzip' length 300266 bytes (293 KB)
downloaded 293 KB

嘗試 URL 'https://cran.rstudio.com/src/contrib/foreach_1.5.2.tar.gz'
Content type 'application/x-gzip' length 89758 bytes (87 KB)
downloaded 87 KB

嘗試 URL 'https://cran.rstudio.com/src/contrib/doParallel_1.0.17.tar.gz'
Content type 'application/x-gzip' length 164254 bytes (160 KB)
downloaded 160 KB

嘗試 URL 'https://cran.rstudio.com/src/contrib/BiocManager_1.30.16.tar.gz'
Content type 'application/x-gzip' length 262502 bytes (256 KB)
downloaded 256 KB

ERROR: dependencies 'digest', 'glue', 'gtable', 'isoband', 'rlang', 'scales', 'tibble', 'withr' are not available for package 'ggplot2'
* removing 'C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/ggplot2'
Warning in install.packages :
  installation of package ‘ggplot2’ had non-zero exit status
* installing *source* package 'iterators' ...
** package 'iterators' successfully unpacked and MD5 sums checked
** using staged installation
Warning in file(file, if (append) "a" else "w") :
  cannot open file 'C:/Users/USER/Dropbox/'Z*:9q8# (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/00LOCK-iterators/00new/iterators/DESCRIPTION': Invalid argument
Warning in strsplit(conditionMessage(e), "\n") :
  輸入的字串 1 不適用於此語言環境
Error in file(file, if (append) "a" else "w") : ?⊥??????
ERROR: installing package DESCRIPTION failed for package 'iterators'
* removing 'C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/iterators'
Warning in install.packages :
  installation of package ‘iterators’ had non-zero exit status
* installing *source* package 'BiocManager' ...
** package 'BiocManager' successfully unpacked and MD5 sums checked
** using staged installation
Warning in file(file, if (append) "a" else "w") :
  cannot open file 'C:/Users/USER/Dropbox/'Z*:9q8# (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/00LOCK-BiocManager/00new/BiocManager/DESCRIPTION': Invalid argument
Warning in strsplit(conditionMessage(e), "\n") :
  輸入的字串 1 不適用於此語言環境
Error in file(file, if (append) "a" else "w") : ?⊥??????
ERROR: installing package DESCRIPTION failed for package 'BiocManager'
* removing 'C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/BiocManager'
Warning in install.packages :
  installation of package ‘BiocManager’ had non-zero exit status
ERROR: dependency 'iterators' is not available for package 'foreach'
* removing 'C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/foreach'
Warning in install.packages :
  installation of package ‘foreach’ had non-zero exit status
ERROR: dependencies 'foreach', 'iterators' are not available for package 'doParallel'
* removing 'C:/Users/USER/Dropbox/我的電腦 (LAPTOP-9VO9AEC5)/Documents/R/win-library/3.6/doParallel'
Warning in install.packages :
  installation of package ‘doParallel’ had non-zero exit status

The downloaded source packages are in
	‘C:\Users\USER\AppData\Local\Temp\RtmpoJ5Q1m\downloaded_packages’
```
出大事了
有種電腦真的可能要重灌的預感 問題太多了
