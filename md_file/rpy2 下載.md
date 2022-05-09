#python 
#rpy2

### 關方pip下載(失敗)
聽說直接用 pip 會有很多 error，因為覺得anaconda 之類的很肥不想下載，嘗試[用 pip 下載](https://rpy2.github.io/doc/latest/html/overview.html#install-installation)，結果:
![[Pasted image 20220427215549.png]]
是真的

官方還有 docker，但是之前用 docker 的經驗真的很糟，感覺也不容易
### 非官方下載(失敗)
接著採用[他的方法](https://walkonnet.com/archives/33019)，先下載他要求的東西(MRO、Anaconda)，Anaconda在載時勾選添加環境變量，但另一個選項(好像跟 vs code 預設要不要 load 他有關)沒有勾選。

添加以下環境變數，之所以添加他要求之外的環境變數，是因為看了[這篇文章](https://stackoverflow.com/questions/17573988/r-home-error-with-rpy2)
- `C:\Program Files\R\R-4.1.2\bin\x64\R.dll`
- `C:\Program Files\R\R-4.1.2\bin\x64`
- `C:\Program Files\R\R-4.1.2\bin`
- ![[Pasted image 20220427232843.png]]

設置以下環境變量
- `R_HOME` : `C:\Program Files\R\R-4.0.2\bin\`
- `R_USER` : `Administrator`
![[Pasted image 20220427232824.png]]

執行以下程式
```python
import rpy2
import rpy2.situation

for row in rpy2.situation.iter_info():
    print(row)
```

結果
```consol
PS D:\python_all\use_R_test> & C:/Users/88695/AppData/Local/Microsoft/WindowsApps/python3.9.exe d:/python_all/use_R_test/test.py
rpy2 version:
3.5.1
Python version:
3.9.12 (tags/v3.9.12:b28265d, Mar 23 2022, 23:52:46) [MSC v.1929 64 bit (AMD64)]
Looking for R's HOME:
    Environment variable R_HOME: C:\Program Files\R\R-4.0.2\bin\
    InstallPath in the registry: C:\Program Files\Microsoft\R Open\R-4.0.2\
    Environment variable R_USER: Administrator
    Environment variable R_LIBS_USER: None
    Warning: The environment variable R_HOME differs from the default R in the PATH.
Unable to determine R library path: [WinError 2] 系統找不到指定的檔案。
R version:
    In the PATH: R version 4.1.2 (2021-11-01) -- "Bird Hippie"
    Loading R library from rpy2: cannot load library 'C:\Program Files\R\R-4.0.2\bin\bin\x64\R.dll': error 0x7e
Additional directories to load R packages from:
None
C extension compilation:
Traceback (most recent call last):
  File "d:\python_all\use_R_test\test.py", line 3, in <module>
    for row in rpy2.situation.iter_info():
  File "C:\Users\88695\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\site-packages\rpy2\situation.py", line 389, in iter_info
    c_ext.add_lib(*get_r_flags(r_home, '--ldflags'))
  File "C:\Users\88695\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\site-packages\rpy2\situation.py", line 252, in get_r_flags
    _get_r_cmd_config(r_home, flags,
  File "C:\Users\88695\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\site-packages\rpy2\situation.py", line 217, in _get_r_cmd_config
    output = subprocess.check_output(
  File "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.9_3.9.3312.0_x64__qbz5n2kfra8p0\lib\subprocess.py", line 424, in check_output
    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
  File "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.9_3.9.3312.0_x64__qbz5n2kfra8p0\lib\subprocess.py", line 505, in run
    with Popen(*popenargs, **kwargs) as process:
  File "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.9_3.9.3312.0_x64__qbz5n2kfra8p0\lib\subprocess.py", line 951, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.9_3.9.3312.0_x64__qbz5n2kfra8p0\lib\subprocess.py", line 1420, in _execute_child
    hp, ht, pid, tid = _winapi.CreateProcess(executable, args,
FileNotFoundError: [WinError 2] 系統找不到指定的檔案。
```

看起來重要的錯誤訊息
- `Warning: The environment variable R_HOME differs from the default R in the PATH.` 因為 `which R` 好像不能用，不知道怎麼確認 `default R in the PATH` 是什麼
- `Unable to determine R library path: [WinError 2] 系統找不到指定的檔案。` 感覺也可能是環境變數問題，但為什麼是在 vs code 裡面找不到，R studio 裡可以，這樣還是環境變數問題嗎，沒有 de 這種 bug 的經驗

以上的東西丟 google 後還是沒有解，然後居要 12 點了(哭)

