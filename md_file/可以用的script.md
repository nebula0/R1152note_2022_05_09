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